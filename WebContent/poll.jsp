<%@page contentType="application/xml"%><?xml version="1.0" encoding="UTF-8"?>
<%@page import="uts.wsd.*" %>
<?xml-stylesheet type="text/xsl" href="xsl/poll.xsl"?>

<%
PollApplication pollApp = (PollApplication)session.getAttribute("pollApp");
if(pollApp == null){
	System.out.println("pollApp was null, redirecting");
	%><jsp:forward page="/index.jsp"/><%
}
User user = (User)session.getAttribute("user");

String id = request.getParameter("id");
Poll poll = null;


if(id == null){
	%><jsp:forward page="/poll404.jsp"/><%
}else{
	if(pollApp.getPolls().getPoll(id) == null){
		%><jsp:forward page="/poll404.jsp"/><% 
	}else{
		poll = pollApp.getPolls().getPoll(id);
	}
}
%>

<page title="Poll">
	<navigation></navigation>
	<info>
		<heading><%=poll.getName()%></heading>
		<creator><%=poll.getCreator()%></creator>
		<date><%=poll.getDate()%></date>
		<location><%=poll.getLocation()%></location>
		<description><%=poll.getDescription()%></description>
	</info>
	<myform action="update.jsp" method="POST">
		<times>
		<%
		int range = (poll.getLastTime() - poll.getFirstTime()) / 50;
		int time = poll.getFirstTime();
		for(int i=0; i < range+1; i++){
		%>
			<time val="<%=time%>">
			<%=pollApp.formatTime(time)%>
			<%
			time+=30;
			if(i % 2 != 0){
				time+= 40;
			}
			%>
			</time>
		<%}%>
		</times>
		<%if(user == null){%>
		<field name="name" type="text">Your name: </field>
		<%}%>
		<button id="<%=id%>">Submit Times</button>
	</myform>
</page>