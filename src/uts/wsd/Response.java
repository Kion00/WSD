package uts.wsd;

import java.util.ArrayList;

import javax.xml.bind.annotation.XmlAccessType;
import javax.xml.bind.annotation.XmlAccessorType;
import javax.xml.bind.annotation.XmlElement;
import javax.xml.bind.annotation.XmlRootElement;

@XmlRootElement
@XmlAccessorType(XmlAccessType.FIELD)
public class Response {
	
	@XmlElement(name="value")
	private int value;
	@XmlElement(name="count")
	private int count;
	@XmlElement(name = "name")
	private ArrayList<String> name = new ArrayList<String>();
	@XmlElement(name = "uuid")
	private ArrayList<String> uuid = new ArrayList<String>();
	
	public Response(){
		
	}
	
	public Response(int value){
		this.value = value;
		this.count = 0;
	}
	
	public void update(String name, String uuid){
		count+= 1;
		this.name.add(name);
		this.uuid.add(uuid);
	}
	
	public int getValue() {
		return value;
	}
	public void setValue(int value) {
		this.value = value;
	}
	public int getCount() {
		return count;
	}
	public void setCount(int count) {
		this.count = count;
	}
	public String getName(int id) {
		return name.get(id);
	}
	public void setName(ArrayList<String> name) {
		this.name = name;
	}
	public ArrayList<String> getUuid() {
		return uuid;
	}
	public void setUuid(ArrayList<String> uuid) {
		this.uuid = uuid;
	}
	
	public void print(){
		System.out.println("Value: " + value);
		System.out.println("Count: " + count);
	}
}
