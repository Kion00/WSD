package uts.wsd;

import java.io.Serializable;
import java.util.ArrayList;

import javax.xml.bind.annotation.XmlAccessType;
import javax.xml.bind.annotation.XmlAccessorType;
import javax.xml.bind.annotation.XmlElement;
import javax.xml.bind.annotation.XmlRootElement;

@XmlRootElement(name="users")
@XmlAccessorType(XmlAccessType.FIELD)
public class Users implements Serializable{
	
	@XmlElement(name= "user")
	private ArrayList<User> list = new ArrayList<User>();
	
	public Users(){
		
	}
	
	public ArrayList<User> getList(){
		return list;
	}
	
	public void addUser(User user){
		list.add(user);
	}
	
	public void removeUser(User user){
		list.remove(user);
	}
	
	public void print(){
		for(User user : list){
			System.out.println("Name: " + user.getFullName());
			System.out.println("Email: " + user.getEmail());
			System.out.println("Password: " + user.getPassword());
			System.out.println("Id: " + user.getStudentNumber());
			System.out.println("Gender: " + user.getGender());
			System.out.println("--------------------------------");
		}
	}
	
	public User getUser(String email){
		for(User user : list){
			if(user.getEmail().equals(email)){
				return user;
			}
		}
		return null;
	}
	
	public User login(String email, String password){
		for(User user : list){
			if(user.getEmail().equals(email) && user.getPassword().equals(password)){
				return user;
			}
		}
		return null;
	}
}
