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
		// Create the unmarshaller
		loadPolls(this.filepath + "polls.xml");
		loadPolls(this.filepath + "users.xml");
	}
	
	public void loadPolls(String filepath){
		try{
			JAXBContext jc = JAXBContext.newInstance(Polls.class);
			Unmarshaller u = jc.createUnmarshaller();
			 
			// Now unmarshal the object from the file
			FileInputStream fin = new FileInputStream(filepath);
			this.polls = (Polls)u.unmarshal(fin); // This loads the "shop" object
			fin.close();
		}catch(Exception e){}
	}
	
	public void loadUsers(String filepath){
		try{
			JAXBContext jc = JAXBContext.newInstance(Users.class);
			Unmarshaller u = jc.createUnmarshaller();
			 
			// Now unmarshal the object from the file
			FileInputStream fin = new FileInputStream(filepath);
			this.users = (Users)u.unmarshal(fin); // This loads the "shop" object
			fin.close();
		}catch(Exception e){}
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
	
	public void exportPolls(){
		try{
			JAXBContext jc = JAXBContext.newInstance(Polls.class);
			Marshaller m = jc.createMarshaller();
			m.setProperty(Marshaller.JAXB_FORMATTED_OUTPUT, true);
			FileOutputStream os = new FileOutputStream(filepath + "polls.xml");
			m.marshal(polls, System.out);
		}catch(Exception e){}
	}
	
	public void exportUsers(){
		try{
			JAXBContext jc = JAXBContext.newInstance(Users.class);
			Marshaller m = jc.createMarshaller();
			m.setProperty(Marshaller.JAXB_FORMATTED_OUTPUT, true);
			FileOutputStream os = new FileOutputStream(filepath + "users.xml");
			m.marshal(users, System.out);
		}catch(Exception e){}
	}
}
