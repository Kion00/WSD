<%@page contentType="application/xml"%><?xml version="1.0" encoding="UTF-8"?>
<%@page import="uts.wsd.*" %>

<%
String id = request.getParameter("close");

PollApplication pollApp = (PollApplication)session.getAttribute("pollApp");
if(pollApp == null){
	System.out.println("pollApp was null, redirecting");
	response.sendRedirect("index.jsp");
}

pollApp.closePoll(id);

response.sendRedirect("results.jsp?id="+id);

%>