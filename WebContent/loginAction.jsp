<%@page contentType="application/xml"%><?xml version="1.0" encoding="UTF-8"?>
<%@page import="uts.wsd.*" %>
<?xml-stylesheet type="text/xsl" href="xsl/loginAction.xsl"?> 

<%
String email = request.getParameter("email");
String password = request.getParameter("password");

PollApplication pollApp = (PollApplication)session.getAttribute("pollApp");
if(pollApp == null){
	System.out.println("pollApp was null, redirecting");
	%><jsp:forward page="/index.jsp"/><%
}

if(pollApp.login(email, password) != null){
	User user = pollApp.login(email, password);
	session.setAttribute("user", user);
%>
<message>success</message>
<jsp:forward page="/index.jsp"/>
<%}else{%>
<message>failed</message>
<%} %>
