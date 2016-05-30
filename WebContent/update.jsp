<%@page contentType="application/xml"%><?xml version="1.0" encoding="UTF-8"?>
<%@page import="uts.wsd.*" %>

<%
PollApplication pollApp = (PollApplication)session.getAttribute("pollApp");
if(pollApp == null){
	System.out.println("pollApp was null, redirecting");
	%><jsp:forward page="/index.jsp"/><%
}
User user = (User)session.getAttribute("user");

String id = request.getParameter("id");
int pollID = Integer.parseInt(request.getParameter("id"));
Poll poll = pollApp.getPolls().getPoll(pollID);

if(request.getParameter("submission")!= null){
	String val[] = request.getParameterValues("time");
	String name = request.getParameter("name");
	if(val != null){
		for(int i=0; i <val.length; i++){
			if(user != null){
				poll.getResponse(Integer.parseInt(val[i])).update(user.getFullName(), user.getUUID());
			}else{
				poll.getResponse(Integer.parseInt(val[i])).update(name, "00000");
			}
		}
	}
	
}
pollApp.exportPolls();

response.sendRedirect("results.jsp?id=" + pollID);
%>