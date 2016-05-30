package uts.wsd;

import java.io.FileInputStream;
import java.io.FileOutputStream;
import java.util.ArrayList;
import java.util.Random;

import javax.xml.bind.JAXBContext;
import javax.xml.bind.Marshaller;
import javax.xml.bind.Unmarshaller;

public class PollApplication {
	
	private String filepath;
	private Polls polls;
	private Users users;
	private Users users1;
	
	public void setFilePath(String filepath){
		this.filepath = filepath;
		
		populatePolls();
		populateUsers();
		
		loadPolls(this.filepath + "/polls.xml");
		loadUsers(this.filepath + "/users.xml");
		
		//users.print(); //To debug users.xml
		//polls.print();
	}
	
	public void populatePolls(){
		polls = new Polls();
		polls.addPoll(new Poll(generatePollUID(), "Poll1", "Creator", "GDQZD", "Open", "B10.B1.403", "Group Meeting", "1/1/1", 800, 2000, createResponses(800, 2000)));
		polls.addPoll(new Poll(generatePollUID(), "Poll2", "Creator", "GDQZD", "Open", "B10.B1.403", "Group Meeting", "1/1/1", 1200, 1600, createResponses(1200, 1600)));
		polls.addPoll(new Poll(generatePollUID(), "Poll3", "Creator", "GDQZD", "Closed", "B10.B1.403", "Group Meeting", "1/1/1", 1200, 1600, createResponses(1200, 1600)));
		polls.addPoll(new Poll(generatePollUID(), "Poll4", "Creator", "GDQZD", "Open", "B10.B1.403", "Group Meeting", "1/1/1", 1200, 1600, createResponses(1200, 1600)));
		//polls.print();
		
		exportPolls();
	}
	
	public void populateUsers(){
		users = new Users();
		users.addUser(new User("email@email.com", "first", "last", "password", "12345678", "male", "GDQZD"));
		users.addUser(new User("mail@gmail.com", "first", "last", "password", "87654321", "male", generateUUID()));
		exportUsers();
	}
	
	public void loadPolls(String filepath){
		try{
			JAXBContext jc = JAXBContext.newInstance(Polls.class);
			Unmarshaller u = jc.createUnmarshaller();
			 
			// Now unmarshal the object from the file
			FileInputStream fin = new FileInputStream(filepath);
			this.polls = (Polls)u.unmarshal(fin);
			fin.close();
			System.out.println("Successfully imported polls");
		}catch(Exception e){System.out.println("Failed to load polls.xml");}
	}
	
	public void loadUsers(String filepath){
		try{
			JAXBContext jc = JAXBContext.newInstance(Users.class);
			Unmarshaller u = jc.createUnmarshaller();
			 
			// Now unmarshal the object from the file
			FileInputStream fin = new FileInputStream(filepath);
			this.users = (Users)u.unmarshal(fin);
			fin.close();
			System.out.println("Successfully imported users");
		}catch(Exception e){System.out.println("Failed to load users.xml");}
	}
	
	public Polls getPolls(){
		return polls;
	}
	
	public Users getUsers(){
		return users;
	}
	
	public User login(String email, String password){
		return users.login(email, password);
	}
	
	public void addUser(User user){
		users.addUser(user);
		exportUsers();
	}
	
	public void exportPolls(){
		try{
			JAXBContext jc = JAXBContext.newInstance(Polls.class);
			Marshaller m = jc.createMarshaller();
			m.setProperty(Marshaller.JAXB_FORMATTED_OUTPUT, true);
			FileOutputStream os = new FileOutputStream(filepath + "/polls.xml");
			m.marshal(polls, os);
			//m.marshal(polls, System.out);
			System.out.println("Successfully exported polls");
		}catch(Exception e){System.out.println("Export polls failed");e.printStackTrace();}
	}
	
	public void exportUsers(){
		try{
			JAXBContext jc = JAXBContext.newInstance(Users.class);
			Marshaller m = jc.createMarshaller();
			m.setProperty(Marshaller.JAXB_FORMATTED_OUTPUT, true);
			FileOutputStream os = new FileOutputStream(filepath + "/users.xml");
			m.marshal(users, os);
			//m.marshal(users, System.out);
			System.out.println("Successfully exported users");
		}catch(Exception e){System.out.println("Users export failed");}
	}
	
	public String formatTime(int in){
		String hour;
		String minute = "00";
		
		if(in % 100 != 0){
			in-=30;
			minute="30";
		}
		int o = (in / 100);
		hour = Integer.toString(o);
		
		
		return hour + ":" + minute;
	}
	
	public void addPoll(String name, String creator, String creatorid, String status, String location, String description, String date, int firstTime, int lastTime){
		getPolls().addPoll(new Poll(generatePollUID(), name, creator, creatorid, status, location, description, date, firstTime, lastTime, createResponses(firstTime, lastTime)));
		exportPolls();
	}
	
	public String generatePollUID(){
		String str;
		String charset = "abcdefghijklmnopqrstuvwxyzABCEDFGHIJKLMNOPQRSTUVWXYZ0123456789";
		Random r = new Random();
		do{
			str = "";
			for(int i=0; i<5; i++){
				str += charset.charAt(r.nextInt(charset.length()));
			}
		}while(str.equals("00000") || !polls.checkPollUID(str));
		//To implement checking for duplicate uuid
		return str;
	}
	
	public String generateUUID(){
		String str;
		String charset = "abcdefghijklmnopqrstuvwxyzABCEDFGHIJKLMNOPQRSTUVWXYZ0123456789";
		Random r = new Random();
		do{
			str = "";
			for(int i=0; i<5; i++){
				str += charset.charAt(r.nextInt(charset.length()));
			}
		}while(str.equals("00000") || !users.checkUUID(str));
		//To implement checking for duplicate uuid
		
		return str;
	}
	
	public ArrayList<Response> createResponses(int first, int last){
		ArrayList<Response> list = new ArrayList<Response>();
		
		int num = (last-first) / 50;
		
		int value = first;
		for(int i=0; i < num+1; i++){
			list.add(new Response(value));
			value+=30;
			if(i % 2 != 0){
				value+= 40;
			}
		}
		
		return list;
	}
}
