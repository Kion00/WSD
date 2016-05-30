<%@page contentType="application/xml"%><?xml version="1.0" encoding="UTF-8"?>
<%@page import="uts.wsd.*" %>
<?xml-stylesheet type="text/xsl" href="xsl/registered.xsl"?>
<%
	PollApplication pollApp = (PollApplication)session.getAttribute("pollApp");
	if(pollApp == null){
		System.out.println("pollApp was null, redirecting");
		%><jsp:forward page="/index.jsp"/><%
	}

	String gender = request.getParameter("gender");
	String id = request.getParameter("id");
	String firstname = request.getParameter("firstname");
	String lastname = request.getParameter("lastname");
	String email = request.getParameter("email");
	String password=request.getParameter("password");

	User user = new User(email, firstname,lastname, password, id, gender, pollApp.generateUUID());
	pollApp.addUser(user);
	session.setAttribute("user", user);
%>

<message>success</message>
