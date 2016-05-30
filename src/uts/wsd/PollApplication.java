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
		
		//users = new Users();
		//users.addUser(new User("email@email.com", "first", "last", "password", "12345678", "male"));
		//users.addUser(new User("mail@gmail.com", "first", "last", "password", "87654321", "male"));
		//exportUsers();
		
		/*
		polls = new Polls();
		ArrayList<Option> al = new ArrayList<Option>();
		al.add(new Option(0, "name", 1.0));
		polls.addPoll(new Poll(0, "Poll1", "Creator", "GDQZD", "Open", "B10.B1.403", "Group Meeting", "1/1/1", 800, 2000, al));
		polls.addPoll(new Poll(1, "Poll2", "Creator", "GDQZD", "Open", "B10.B1.403", "Group Meeting", "1/1/1", 1200, 1600, al));
		polls.addPoll(new Poll(2, "Poll3", "Creator", "GDQZD", "Closed", "B10.B1.403", "Group Meeting", "1/1/1", 1200, 1600,al));
		polls.addPoll(new Poll(3, "Poll4", "Creator", "GDQZD", "Open", "B10.B1.403", "Group Meeting", "1/1/1", 1200, 1600,al));

		
		exportPolls();
		*/
	
		
		
		loadPolls(this.filepath + "/polls.xml");
		loadUsers(this.filepath + "/users.xml");
		
		users.print(); //To debug users.xml
		polls.print();
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
			System.out.println("Successfully exported polls");
		}catch(Exception e){System.out.println("Export polls failed");}
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
	
	public void addPoll(int id, String name, String creator, String creatorid, String status, String location, String description, String date, int firstTime, int lastTime, ArrayList<Option> list){
		getPolls().addPoll(new Poll(id, name, creator, creatorid, status, location, description, date, firstTime, lastTime, list));
		exportPolls();
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
		}while(str != "00000" || !users.checkUUID(str));
		//To implement checking for duplicate uuid
		
		return str;
	}
}
