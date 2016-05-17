package uts.wsd;

import java.io.Serializable;
import java.util.ArrayList;

import javax.xml.bind.annotation.*;


@XmlRootElement
@XmlAccessorType(XmlAccessType.FIELD)
public class Poll implements Serializable{
	
	@XmlElement
	private String name;
	@XmlElement
	private String creator;
	@XmlElement
	private String status;
	@XmlElement(name = "option")
	private ArrayList<Option> list = new ArrayList<Option>();
	
	public Poll(){
		
	}
	
	public Poll(String name, String creator, String status, ArrayList<Option> list){
		this.name = name;
		this.creator = creator;
		this.status = status;
		this.list = list;
	}
	
	public void addOption(Option option){
		list.add(option);
	}
	
	public void removeOption(Option option){
		list.remove(option);
	}
	
	public Option getOption(int id){
		for(Option option: list){
			if(option.getId() == id){
				return option;
			}
		}
		return null;
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
	
	public String getStatus(){
		return status;
	}
	
	public void setStatus(String status){
		this.status = status;
	}
}
