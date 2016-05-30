package uts.wsd.rest;

import java.io.IOException;

import javax.servlet.ServletContext;
import javax.ws.rs.GET;
import javax.ws.rs.Path;
import javax.ws.rs.PathParam;
import javax.ws.rs.Produces;
import javax.ws.rs.QueryParam;
import javax.ws.rs.core.Context;
import javax.ws.rs.core.MediaType;
import javax.xml.bind.JAXBException;

import uts.wsd.PollApplication;
import uts.wsd.Polls;

@Path("/pollApp")
public class PollService {
	@Context
	private ServletContext application;
	
	private PollApplication getPollApp() throws JAXBException, IOException{
		
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
	
	@Path("polls")
	@GET
	@Produces(MediaType.APPLICATION_XML)
	public Polls getPolls(@QueryParam("creator") String creator, @QueryParam("status") String status, @QueryParam("minResponses") int minResponses) {
		Polls polls;
		try{
			PollApplication pollApp = getPollApp();
			if(creator == null && status == null && minResponses == 0){
				polls = new Polls(pollApp.getPolls().getPollsByStatus("Open"));
			}else{
				polls = pollApp.getPolls();
			}
			if(creator != null) {
				polls = new Polls(polls.getPollsByCreator(creator));
			}
			if(status != null) {
				polls = new Polls(polls.getPollsByStatus(status));
			}
			if(minResponses > 0) {
				polls = new Polls(polls.getPollsByResponses(minResponses));
			}
			return polls;
		}catch(Exception e){return null;}
	}
}
