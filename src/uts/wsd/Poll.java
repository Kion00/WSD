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
	@XmlElement(name = "option")
	private ArrayList<Option> list = new ArrayList<Option>();
	
	public Poll(){
		
	}
	
	/*
	 * Creates a new poll
	 * 
	 * @param text PollID
	 */
	public Poll(int id, String name, String creator, String creatorid, String status, ArrayList<Option> list){
		this.id = id;
		this.name = name;
		this.creator = creator;
		this.creatorid = creatorid;
		this.status = status;
		this.list = list;
	}
	
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
		return creator;
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
}
