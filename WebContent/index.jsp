<%@page contentType="application/xml"%><?xml version="1.0" encoding="UTF-8"?>
<%@page import="uts.wsd.*" %>
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
	<navigation></navigation>
	<heading>Polls</heading>
	<createPoll></createPoll>
	<polls>
		<!--If user is not logged in show only open polls-->
	
		<%
		for(int i=0; i < pollApp.getPolls().getPollCount(); i++){
		Poll poll = pollApp.getPolls().getPoll(i);
		%>
			<poll>
				<name><%=poll.getName()%></name>
				<creator><%=poll.getCreator()%></creator>
				<status s='<%=poll.getStatus()%>'></status>
				<%if(user != null){
					if(user.getUUID().equals(poll.getCreatorID())){
				%>
						<closePoll><%=i%></closePoll>
						<editPoll><%=i%></editPoll>
				<%
					}
				}
				%>
				<results><%=i%></results>
				<%if(poll.getStatus().equals("Open")){%>
					<openPoll><%=i%></openPoll>
				<%}%>
			</poll>
		<%}
		%>
	</polls>
	<%if(user==null){%>
		<usercontrol type="login"></usercontrol>
	<%}else{%>
		<usercontrol type="loggedIn"><%=user.getFullName()%></usercontrol>
	<%}%>
</page>

