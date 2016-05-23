<%@page contentType="application/xml"%><?xml version="1.0" encoding="UTF-8"?>
<%@page import="uts.wsd.*" %>
<?xml-stylesheet type="text/xsl" href="loginAction.xsl"?> 

<%
String email = request.getParameter("email");
String password = request.getParameter("password");

PollApplication pollApp = session.getAttribute("pollApp");

if()
%>