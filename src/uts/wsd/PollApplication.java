package uts.wsd;

import java.io.FileInputStream;
import java.io.FileOutputStream;

import javax.xml.bind.JAXBContext;
import javax.xml.bind.Marshaller;
import javax.xml.bind.Unmarshaller;

public class PollApplication {
	
	private String filepath;
	private Polls polls;
	private Users users;
	
	public void setFilePath(String filepath){
		this.filepath = filepath;

		
		loadPolls(this.filepath + "/polls.xml");
		loadUsers(this.filepath + "/users.xml");
		//users.print(); //To debug users.xml
	}
	
	public void loadPolls(String filepath){
		try{
			JAXBContext jc = JAXBContext.newInstance(Polls.class);
			Unmarshaller u = jc.createUnmarshaller();
			 
			// Now unmarshal the object from the file
			FileInputStream fin = new FileInputStream(filepath);
			this.polls = (Polls)u.unmarshal(fin); // This loads the "shop" object
			fin.close();
		}catch(Exception e){System.out.println("Failed to load polls.xml");}
	}
	
	public void loadUsers(String filepath){
		try{
			JAXBContext jc = JAXBContext.newInstance(Users.class);
			Unmarshaller u = jc.createUnmarshaller();
			 
			// Now unmarshal the object from the file
			FileInputStream fin = new FileInputStream(filepath);
			this.users = (Users)u.unmarshal(fin); // This loads the "shop" object
			fin.close();
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
}