package uts.wsd.rest;
import java.io.IOException;

import javax.servlet.ServletContext;
import javax.ws.rs.*;
import javax.ws.rs.core.*;
import javax.xml.bind.JAXBException;

import uts.wsd.*;
import uts.wsd.PollApplication;
import uts.wsd.Polls;
import uts.wsd.Users;
@Path("/poll")
public class PollService {
	@Context
	 private ServletContext application;
	 
	 private PollApplication getpollApp() throws JAXBException, IOException {
	  // The web server can handle requests from different clients in parallel.
	  // These are called "threads".
	  //
	  // We do NOT want other threads to manipulate the application object at the same
	  // time that we are manipulating it, otherwise bad things could happen.
	  //
	  // The "synchronized" keyword is used to lock the application object while
	  // we're manpulating it.
	  synchronized (application) {
	   PollApplication pollApp = (PollApplication)application.getAttribute("pollApp");
	   if (pollApp == null) {
	    pollApp = new PollApplication();
	    pollApp.setFilePath(application.getRealPath("WEB-INF/polls.xml"));
	    application.setAttribute("pollApp", pollApp);
	   }
	   return pollApp;
	  }
	 }
	 @Path("polls")
	 @GET
	 @Produces(MediaType.APPLICATION_XML)
	 public Polls getPolls() throws JAXBException, IOException {
		 
		 return getpollApp().getPolls();
	 }
}
