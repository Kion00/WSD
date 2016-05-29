<%@page contentType="application/xml"%><?xml version="1.0" encoding="UTF-8"?>
<%@page import="uts.wsd.*" %>
<?xml-stylesheet type="text/xsl" href="xsl/poll.xsl"?>

<%
User user = (User)session.getAttribute("user");
PollApplication pollApp = (PollApplication)session.getAttribute("pollApp");

int pollID = Integer.parseInt(request.getParameter("id"));
Poll poll = pollApp.getPolls().getPoll(pollID);
%>

<page title="">
	<navigation></navigation>
	<heading><%=poll.getName()%></heading>
	<creator><%=poll.getCreator()%></creator>
	<date>21/05/2016</date>
	<location>UTS B11.00.405</location>
	<description>1st Group meeting</description>
	
	<%
	for(int i=0; i < poll.getOptionCount(); i++){
	%>
	
		<time><%=poll.getOption(i).getName()%></time>
	<%}%>
	<button></button>
</page>