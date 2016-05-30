package uts.wsd;

import java.io.Serializable;
import java.util.ArrayList;

import javax.xml.bind.annotation.*;


@XmlRootElement
@XmlAccessorType(XmlAccessType.FIELD)
public class Poll implements Serializable{
	
	@XmlElement(name = "id")
	private int id;
	@XmlElement(name = "name")
	private String name;
	@XmlElement(name = "creator")
	private String creator;
	@XmlElement(name = "creatorid")
	private String creatorid;
	@XmlElement(name = "status")
	private String status;
	@XmlElement(name = "location")
	private String location;
	@XmlElement(name = "descrption")
	private String description;
	@XmlElement(name = "date")
	private String date;
	@XmlElement(name = "firsttime")
	private int firstTime;
	@XmlElement(name = "lasttime")
	private int lastTime;
	@XmlElement(name = "option")
	private ArrayList<Option> list = new ArrayList<Option>();
	
	public Poll(){
		
	}
	
	/*
	 * Creates a new poll
	 * 
	 * @param id PollID
	 * @param name Poll name
	 * @param creator Poll creator
	 * @param creatorid Poll creator id
	 * @param staus Poll status
	 * @param location Location
	 * @param description Description
	 * @param date Date
	 * @param list option list
	 */
	public Poll(int id, String name, String creator, String creatorid, String status, String location, String description, String date, int firstTime, int lastTime, ArrayList<Option> list){
		this.id = id;
		this.name = name;
		this.creator = creator;
		this.creatorid = creatorid;
		this.status = status;
		this.location = location;
		this.description = description;
		this.date = date;
		this.firstTime = firstTime;
		this.lastTime = lastTime;
		this.list = list;
	}
	
	/*
	 * Creates a new poll option
	 * 
	 * @param text Option
	 */
	
	public void addOption(Option option){
		list.add(option);
	}
	
	public void removeOption(Option option){
		list.remove(option);
	}
	
	public int getOptionCount(){
		return list.size();
	}
	
	public Option getOption(int id){
		for(Option option: list){
			if(option.getId() == id){
				return option;
			}
		}
		return null;
	}
	
	public int getId(){
		return id;
	}
	
	public void setId(int id){
		this.id = id;
	}
	
	public String getName(){
		return name;
	}
	
	public void setName(String name){
		this.name = name;
	}
	
	public String getCreator(){
		return creator;
	}
	
	public void setCreator(String creator){
		this.creator = creator;
	}
	
	public String getCreatorID(){
		return creatorid;
	}
	
	public void setCreatorID(String creatorid){
		this.creatorid = creatorid;
	}
	
	public String getStatus(){
		return status;
	}
	
	public void setStatus(String status){
		this.status = status;
	}

	public String getLocation() {
		return location;
	}

	public void setLocation(String location) {
		this.location = location;
	}

	public String getDescription() {
		return description;
	}

	public void setDescription(String description) {
		this.description = description;
	}

	public String getDate() {
		return date;
	}

	public void setDate(String date) {
		this.date = date;
	}

	public int getFirstTime() {
		return firstTime;
	}

	public void setFirstTime(int firstTime) {
		this.firstTime = firstTime;
	}

	public int getLastTime() {
		return lastTime;
	}

	public void setLastTime(int lastTime) {
		this.lastTime = lastTime;
	}
}
