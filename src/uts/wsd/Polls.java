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
	
	public int getActivePolls(){
		int count =0;
		for(Poll poll: list){
			if(poll.getStatus().equals("Open")){
				count++;
			}
		}
		return count;
	}
	
	public Poll getPoll(int id){
		for(Poll poll: list){
			if(poll.getId() == id){
				return poll;
			}
		}
		return null;
	}
	
	
}
