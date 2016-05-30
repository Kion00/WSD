<%@page contentType="application/xml"%><?xml version="1.0" encoding="UTF-8"?>
<%@page import="uts.wsd.*" %>
<?xml-stylesheet type="text/xsl" href="xsl/results.xsl"?>

<%

PollApplication pollApp = (PollApplication)session.getAttribute("pollApp");
if(pollApp == null){
	System.out.println("pollApp was null, redirecting");
	%><jsp:forward page="/index.jsp"/><%
}
User user = (User)session.getAttribute("user");

String id = request.getParameter("id");
int pollID;
Poll poll = null;


if(id == null){
	%><jsp:forward page="/poll404.jsp"/><%
}else{
	pollID = Integer.parseInt(request.getParameter("id"));
	if(pollApp.getPolls().getPoll(pollID) == null){
		%><jsp:forward page="/poll404.jsp"/><% 
	}else{
		poll = pollApp.getPolls().getPoll(pollID);
	}
}
%>

<page title="">
	<navigation></navigation>
	<info>
		<heading><%=poll.getName()%></heading>
		<creator><%=poll.getCreator()%></creator>
		<date><%=poll.getDate()%></date>
		<location><%=poll.getLocation()%></location>
		<description><%=poll.getDescription()%></description>
	</info>
	<myform action="results.jsp" method="POST">
		<times>
		<%
		int range = (poll.getLastTime() - poll.getFirstTime()) / 50;
		int time = poll.getFirstTime();
		for(int i=0; i < range; i++){
		%>
			<time>
			<%
			time+=30;
			if(i % 2 != 0){
				time+= 40;
			}
			%>
			<%=pollApp.formatTime(time)%>
			</time>
		<%}%>
		</times>
		<button>Vote Time</button>
	</myform>
</page>