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
	
	public ArrayList<User> getList(){
		return list;
	}
	
	public void addUser(User user){
		list.add(user);
	}
	
	public void removeUser(User user){
		list.remove(user);
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
