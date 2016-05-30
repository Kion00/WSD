package uts.wsd;

import java.util.ArrayList;

import javax.xml.bind.annotation.*;

@XmlRootElement(name = "polls")
@XmlAccessorType(XmlAccessType.FIELD)
public class Polls {
	
	@XmlElement(name = "poll")
	ArrayList<Poll> list = new ArrayList<Poll>();
	
	public ArrayList<Poll> getList(){
		return list;
	}
	
	public void addPoll(Poll poll){
		list.add(poll);
	}
	
	public void removePoll(Poll poll){
		list.remove(poll);
	}
	
	public int getPollCount(){
		return list.size();
	}
	
	public ArrayList<String>  getOpenPolls(){
		ArrayList<String> ids = new ArrayList<String>();
		
		for(Poll poll: list){
			if(poll.getStatus().equals("Open")){
				ids.add(poll.getId());
			}
		}
		return ids;
	}
	
	public ArrayList<String> getPollsByCreator(String id){
		ArrayList<String> ids = new ArrayList<String>();
		
		for(Poll poll: list){
			if(poll.getCreatorID().equals(id)){
				ids.add(poll.getId());
			}
		}
		return ids;
	}
	
	public Poll getPoll(String id){
		for(Poll poll: list){
			if(poll.getId().equals(id)){
				return poll;
			}
		}
		return null;
	}
	
	public void print(){
		for(Poll poll: list){
			System.out.println("Id: " + poll.getId());
			System.out.println("Name: " + poll.getName());
			System.out.println("Creator: " + poll.getCreator());
			System.out.println("Id: " + poll.getCreatorID());
			System.out.println("Status: " + poll.getStatus());
			System.out.println("Location: " + poll.getLocation());
			System.out.println("Description: " + poll.getDescription());
			System.out.println("Date: " + poll.getDate());
			System.out.println("First Time: " + poll.getFirstTime());
			System.out.println("Last Time: " + poll.getLastTime());
			poll.print();
			System.out.println("--------------------------------");
		}
	}
	
	public boolean checkPollUID(String test){
		for(Poll poll : list){
			if(poll.getId().equals(test)){
				return false;
			}
		}

		return true;
	}
	
	
}
