package uts.wsd;

import java.io.FileInputStream;

import javax.xml.bind.JAXBContext;
import javax.xml.bind.Marshaller;
import javax.xml.bind.Unmarshaller;

public class PollApplication {
	
	private String filepath;
	private Polls polls;
	
	public void setFilePath(String filepath){
		this.filepath = filepath;
		// Create the unmarshaller
		try{
			JAXBContext jc = JAXBContext.newInstance(Polls.class);
			Unmarshaller u = jc.createUnmarshaller();
			 
			// Now unmarshal the object from the file
			FileInputStream fin = new FileInputStream(filepath);
			this.polls = (Polls)u.unmarshal(fin); // This loads the "shop" object
			fin.close();
		}catch(Exception e){}
	}
	
	public Polls getPolls(){
		return polls;
	}
	
	
	public void export(){
		JAXBContext jc = JAXBContext.newInstance(Polls.class);
		Marshaller m = jc.createMarshaller();
		m.setProperty(Marshaller.JAXB_FORMATTED_OUTPUT, true);
		//m.marshal(polls, System.out);
	}
}
