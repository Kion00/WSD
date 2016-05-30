package uts.wsd.soap;

import java.io.FileOutputStream;
import java.io.IOException;

import javax.annotation.Resource;
import javax.jws.WebMethod;
import javax.jws.WebService;
import javax.servlet.ServletContext;
import javax.xml.bind.JAXBContext;
import javax.xml.bind.JAXBException;
import javax.xml.bind.Marshaller;
import javax.xml.ws.WebServiceContext;
import javax.xml.ws.handler.MessageContext;

import uts.wsd.PollApplication;
import uts.wsd.Polls;

@WebService
public class PollService {
	
	@Resource
	private WebServiceContext context;
	
	private PollApplication getPollApp() throws JAXBException, IOException{
		
		ServletContext application = (ServletContext)context.getMessageContext().get(MessageContext.SERVLET_CONTEXT);
		
		synchronized(application){
			PollApplication pollApp = (PollApplication)application.getAttribute("pollApp");
			if(pollApp == null){
				pollApp = new PollApplication();
			    pollApp.setFilePath(application.getRealPath("WEB-INF/"));
			    application.setAttribute("pollApp", pollApp);
			}
			return pollApp;
		}
	}
	
	@WebMethod
	public void createPoll(String name, String creator, String creatorid, String location, String description, String date, int first, int last){
		try {
			PollApplication pollApp = getPollApp();
			pollApp.addPoll(name, creator, creatorid, "Open", location, description, date, first, last);
		} catch (Exception e) {}
	}
	
	@WebMethod
	public Polls getPolls(String creatorid, String status, int minResponses){
		try {
			Polls polls;
			PollApplication pollApp = getPollApp();
			if(creatorid == null && status == null && minResponses == 0){
				polls = new Polls(pollApp.getPolls().getPollsByStatus("Open"));
			}else{
				polls = pollApp.getPolls();
			}
			if(creatorid != null) {
				polls = new Polls(polls.getPollsByCreator(creatorid));
			}
			if(status != null) {
				polls = new Polls(polls.getPollsByStatus(status));
			}
			if(minResponses > 0) {
				polls = new Polls(polls.getPollsByResponses(minResponses));
			}
			
			return polls;
		} catch (Exception e) {}
		return null;
	}
}
