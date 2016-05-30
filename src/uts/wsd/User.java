package uts.wsd;

import java.io.Serializable;
import java.util.Random;

import javax.xml.bind.annotation.XmlAccessType;
import javax.xml.bind.annotation.XmlAccessorType;
import javax.xml.bind.annotation.XmlElement;
import javax.xml.bind.annotation.XmlRootElement;

@XmlRootElement
@XmlAccessorType(XmlAccessType.FIELD)
public class User implements Serializable{
	
	@XmlElement(name="email")
	private String email;
	@XmlElement(name="firstname")
	private String firstName;
	@XmlElement(name="lastname")
	private String lastName;
	@XmlElement(name="password")
	private String password;
	@XmlElement(name="studentnumber")
	private String studentNumber;
	@XmlElement(name="gender")
	private String gender;
	@XmlElement(name="uuid")
	private String uuid;
	
	public User(){
		
	}
	
	public User(String email, String firstName, String lastName, String password, String studentNumber, String gender, String uuid) {
		this.email = email;
		this.firstName = firstName;
		this.lastName = lastName;
		this.password = password;
		this.studentNumber = studentNumber;
		this.gender = gender;
		this.uuid = uuid;
	}
	
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public String getFirstName() {
		return firstName;
	}
	public void setFirstName(String firstName) {
		this.firstName = firstName;
	}
	public String getLastName() {
		return lastName;
	}
	public void setLastName(String lastName) {
		this.lastName = lastName;
	}
	public String getFullName(){
		return firstName + " " + lastName;
	}
	public String getPassword() {
		return password;
	}
	public void setPassword(String password) {
		this.password = password;
	}
	public String getStudentNumber() {
		return studentNumber;
	}
	public void setStudentNumber(String studentNumber) {
		this.studentNumber = studentNumber;
	}
	public String getGender() {
		return gender;
	}
	public void setGender(String gender) {
		this.gender = gender;
	}
	
	public String getUUID(){
		return uuid;
	}
	
	public void setUUID(String uuid){
		this.uuid = uuid;
	}
	
	
}
