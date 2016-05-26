<%@page contentType="application/xml"%><?xml version="1.0" encoding="UTF-8"?>
<%@page import="uts.wsd.*" %>
<?xml-stylesheet type="text/xsl" href="xsl/index.xsl"?>
 
<% String filePath = application.getRealPath("WEB-INF/"); %>
<jsp:useBean id="pollApp" class="uts.wsd.PollApplication" scope="application">
    <jsp:setProperty name="pollApp" property="filePath" value="<%=filePath%>"/>
</jsp:useBean>
<%
pollApp.setFilePath(filePath);
session.setAttribute("pollApp", pollApp);
//pollApp.getUsers().print();
User user = (User)session.getAttribute("user");
%>

<page title="Welcome">
	<heading>Polls</heading>
	<polls>
		<%for(int i=0; i < pollApp.getPolls().getPollCount(); i++){%>
			<poll>
				<name><%=pollApp.getPolls().getPoll(i).getName()%></name>
				<creator><%=pollApp.getPolls().getPoll(i).getCreator()%></creator>
				<status s='<%=pollApp.getPolls().getPoll(i).getStatus()%>'></status>
				<openPoll><%=i%></openPoll>
			</poll>
		<%}%>
	</polls>
	<%if(user==null){%>
		<usercontrol type="login"></usercontrol>
	<%}else{%>
		<usercontrol type="loggedIn"><%=user.getFullName()%></usercontrol>
	<%}%>
</page>

