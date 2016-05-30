<%@page contentType="application/xml"%><?xml version="1.0" encoding="UTF-8"?>
<%@page import="uts.wsd.*" import="java.util.ArrayList"%>
<?xml-stylesheet type="text/xsl" href="xsl/index.xsl"?>
 
<% String filePath = application.getRealPath("WEB-INF/"); %>
<jsp:useBean id="pollApp" class="uts.wsd.PollApplication" scope="application">
    <jsp:setProperty name="pollApp" property="filePath" value="<%=filePath%>"/>
</jsp:useBean>
<%
if(session.getAttribute("pollApp") == null){
	pollApp.setFilePath(filePath);
	session.setAttribute("pollApp", pollApp);
}
//pollApp.getUsers().print();
User user = (User)session.getAttribute("user");

%>

<page title="Polls">
	<menu>
		<navigation></navigation>
		<createPoll></createPoll>
		<%if(user==null){%>
			<usercontrol type="login"></usercontrol>
		<%}else{%>
			<usercontrol type="loggedIn"><%=user.getFullName()%></usercontrol>
		<%}%>
	</menu>
	<heading>Open Polls</heading>
	<polls>
		<!--If user is not logged in show only open polls-->
	
		<%
		ArrayList<String> list = pollApp.getPolls().getOpenPolls();
		for(int i=0; i < list.size(); i++){
			Poll poll = pollApp.getPolls().getPoll(list.get(i));
		%>
			<poll>
				<info>
					<name><%=poll.getName()%></name>
					<creator><%=poll.getCreator()%></creator>
					<status s='<%=poll.getStatus()%>'></status>
				</info>
				<buttons>
					<%if(user != null){
						if(user.getUUID().equals(poll.getCreatorID())){
					%>
							<closePoll><%=poll.getId()%></closePoll>
					<%
						}
					}
					%>
					<results><%=poll.getId()%></results>
					<%if(poll.getStatus().equals("Open")){%>
						<openPoll><%=poll.getId()%></openPoll>
					<%}%>
				</buttons>
			</poll>
		<%}
		%>
	</polls>
	<%if(user !=null){%>
	<heading>Your Polls</heading>
	<polls>
		<!--If user is not logged in show only open polls-->
	
		<%
		ArrayList<String> userlist = pollApp.getPolls().getIdsByCreator(user.getUUID());
		for(int i=0; i < userlist.size(); i++){
			Poll userpoll = pollApp.getPolls().getPoll(userlist.get(i));
		%>
			<poll>
				<info>
					<name><%=userpoll.getName()%></name>
					<creator><%=userpoll.getCreator()%></creator>
					<status s='<%=userpoll.getStatus()%>'></status>
				</info>
				<buttons>
					<%if(userpoll.getStatus().equals("Open")){%><closePoll><%=userpoll.getId()%></closePoll><%}%>
					<results><%=userpoll.getId()%></results>
					<%if(userpoll.getStatus().equals("Open")){%>
						<openPoll><%=userpoll.getId()%></openPoll>
					<%}%>
				</buttons>
			</poll>
		<%}
		%>
	</polls>
	<%}%>
</page>

