<%@page contentType="application/xml"%><?xml version="1.0" encoding="UTF-8"?>
<%@page import="uts.wsd.*" %>
<?xml-stylesheet type="text/xsl" href="xsl/poll404.xsl"?>


<%
User user = (User)session.getAttribute("user");
%>
<page>
	<menu>
		<navigation></navigation>
		<createPoll></createPoll>
		<%if(user==null){%>
			<usercontrol type="login"></usercontrol>
		<%}else{%>
			<usercontrol type="loggedIn"><%=user.getFullName()%></usercontrol>
		<%}%>
	</menu>
	<message></message>
</page>