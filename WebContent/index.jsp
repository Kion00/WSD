<%@page contentType="application/xml"%><?xml version="1.0" encoding="UTF-8"?>
<%@page import="uts.wsd.*" %>
<?xml-stylesheet type="text/xsl" href="index.xsl"?>
 
<% String filePath = application.getRealPath("WEB-INF/"); %>
<jsp:useBean id="pollApp" class="uts.wsd.PollApplication" scope="application">
    <jsp:setProperty name="pollApp" property="filePath" value="<%=filePath%>"/>
</jsp:useBean>
<%
pollApp.setFilePath(filePath);
session.setAttribute("pollApp", pollApp);
User user = (User)session.getAttribute("user");
System.out.println("User");
System.out.println(user);
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
	<%if(user==null){%>
		<usercontrol type="login"></usercontrol>
	<%}else{%>
		<usercontrol type="loggedIn"><%=user.getFullName()%></usercontrol>
	<%}%>
</page>

