<%@page contentType="application/xml"%><?xml version="1.0" encoding="UTF-8"?>
<%@page import="uts.wsd.*" %>
<?xml-stylesheet type="text/xsl" href="xsl/create.xsl"?>
<%
PollApplication pollApp = (PollApplication)session.getAttribute("pollApp");
if(pollApp == null){
	System.out.println("pollApp was null, redirecting");
	%><jsp:forward page="/index.jsp"/><%
}

User user = (User)session.getAttribute("user");

String name = request.getParameter("name");
String creator = request.getParameter("creator");
String date = request.getParameter("date");
String location = request.getParameter("location");
String description = request.getParameter("description");
int first = Integer.parseInt(request.getParameter("first"));
int last = Integer.parseInt(request.getParameter("last"));
String register = request.getParameter("register");

if(first > last){
	
}else{
	if(user != null){
		pollApp.addPoll(name, user.getFullName(), user.getUUID(), "Open", location, description, date, first, last);
	}else{
		if(register != null){
			
		}else{
			pollApp.addPoll(name, creator, "00000", "Open", location, description, date, first, last);
		}
	}
}



%>