<%@page contentType="application/xml"%><?xml version="1.0" encoding="UTF-8"?>
<%@page import="uts.wsd.*" %>
<?xml-stylesheet type="text/xsl" href="loginAction.xsl"?> 

<%
String email = request.getParameter("email");
String password = request.getParameter("password");

PollApplication pollApp = (PollApplication)session.getAttribute("pollApp");

if(pollApp.login(email, password) != null){
	User user = pollApp.login(email, password);
	session.setAttribute("user", user);
%>
<message>success</message>
<%}else{%>
<message>failed</message>
<%} %>
