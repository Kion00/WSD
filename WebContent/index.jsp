<%@page contentType="application/xml"%><?xml version="1.0" encoding="UTF-8"?>
<%@page import="uts.wsd.*" %>
<?xml-stylesheet type="text/xsl" href="index.xsl"?>
 
<% String filePath = application.getRealPath("WEB-INF/polls.xml"); %>
<jsp:useBean id="pollApp" class="uts.wsd.PollApplication" scope="application">
    <jsp:setProperty name="pollApp" property="filePath" value="<%=filePath%>"/>
</jsp:useBean>
<%
pollApp.setFilePath(filePath); 
User user = (User)session.getAttribute("user");
%>

<page title="Welcome">
	<heading>Polls</heading>
	<polls>
		<%for(int i=0; i < pollApp.getPolls().getPollCount(); i++){%>
			<poll status='<%=pollApp.getPolls().getPoll(i).getStatus()%>'>
				<name><%=pollApp.getPolls().getPoll(i).getName()%></name>
				<creator><%=pollApp.getPolls().getPoll(i).getCreator()%></creator>
			</poll>
		<%}%>
	</polls>
	<usercontrol type=<%if(user==null){%>"login"<%}else{%>"loggedin"<%}%>></usercontrol>
</page>

