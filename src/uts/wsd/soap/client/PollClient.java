package uts.wsd.soap.client;

import java.util.Scanner;

import javax.xml.bind.JAXBContext;
import javax.xml.bind.Marshaller;

import uts.wsd.Polls;

public class PollClient {
	public static void main(String args[]){
		try{
			PollServiceServiceLocator locator = new PollServiceServiceLocator();
			PollService pollApp = locator.getPollServicePort();
			
			Scanner in = new Scanner(System.in);
			boolean cont = true;
			
			while(cont){
				System.out.println("Type 1 to Create a poll");
				System.out.println("Type 2 to Close a poll");
				System.out.println("Type 3 to list polls");
				System.out.println("Type exit to exit");
				
				String option = in.next();
				
				switch(option){
				case "1":
					System.out.print("Enter poll name: ");
					String name = in.next();
					System.out.print("Enter poll creator name: ");
					String creator = in.next();
					System.out.print("Enter poll creator id: ");
					String creatorid = in.next();
					System.out.print("Enter poll location: ");
					String location = in.next();
					System.out.print("Enter poll description: ");
					String description = in.next();
					System.out.print("Enter poll date: ");
					String date = in.next();
					System.out.print("Enter frist available time (24hr time between 800-2000): ");
					int first = Integer.parseInt(in.next());
					System.out.print("Enter last available time (24hr time between 800-2000): ");
					int last = Integer.parseInt(in.next());
					pollApp.createPoll(name, creator, creatorid, location, description, date, first, last);
					break;
				case "2":
					System.out.print("Enter poll id: ");
					String pollID = in.next();
					//System.out.println(pollApp.closePoll(pollID));
					break;
				case "3":
					Polls polls = pollApp.getPolls(null, null, 0);
					JAXBContext jc = JAXBContext.newInstance(Polls.class);
					Marshaller m = jc.createMarshaller();
					m.setProperty(Marshaller.JAXB_FORMATTED_OUTPUT, true);
					m.marshal(polls, System.out);
					break;
				case "exit":
					cont = false;
					break;
				}
				
			}
			
		}catch(Exception e){e.printStackTrace();}
	}
}
