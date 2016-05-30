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
Poll poll = null;


if(id == null){
	System.out.println("page not found");
	response.sendRedirect("poll404.jsp");
}else{
	if(pollApp.getPolls().getPoll(id) == null){
		response.sendRedirect("poll404.jsp"); 
	}else{
		poll = pollApp.getPolls().getPoll(id);
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
			Response r = poll.getResponse(time);
			time+=30;
			if(i % 2 != 0){
				time+= 40;
			}
			%>
			<time>
				<value><%=pollApp.formatTime(r.getValue())%></value>
				<num><%=r.getCount() %></num>
				<%
				String s = "";
				for(int n=0; n<r.getCount(); n++){
					if(n > 0) s+= ", ";
					s += r.getName(n);
				}
				%>
				<names><%=s %></names>
			</time>
		<%}%>
		</times>
	</myform>
</page>