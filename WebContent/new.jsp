<%@page contentType="application/xml"%><?xml version="1.0" encoding="UTF-8"?>
<%@page import="uts.wsd.*" %>
<?xml-stylesheet type="text/xsl" href="xsl/new.xsl"?>
<%
PollApplication pollApp = (PollApplication)session.getAttribute("pollApp");
if(pollApp == null){
	System.out.println("pollApp was null, redirecting");
	%><jsp:forward page="/index.jsp"/><%
}
User user = (User)session.getAttribute("user");

String vals[] = (String[])session.getAttribute("failed");

if(user != null){
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
	<heading>Create a Poll</heading>
	<myform action="create.jsp" method="POST">
		<field name="name" type="text">Name:</field>
		<field name="date" type="text">Date:</field>
		<field name="location" type="text">Location:</field>
		<field name="description" type="text">Description:</field>
		<dropbox name="first" text="First Available Time">
			<%
			int range = (2000 - 800) / 50;
			int time = 800;
			for(int i=0; i < range+1; i++){
			%>
				<option val="<%=time%>">
				<%=pollApp.formatTime(time)%>
				<%
				time+=30;
				if(i % 2 != 0){
					time+= 40;
				}
				%>
				</option>
			<%}%>
		</dropbox>
		<dropbox name="last" text="Last Available Time">
			<%
			range = (2000 - 800) / 50;
			time = 800;
			for(int i=0; i < range+1; i++){
			%>
				<option val="<%=time%>">
				<%=pollApp.formatTime(time)%>
				<%
				time+=30;
				if(i % 2 != 0){
					time+= 40;
				}
				%>
				</option>
			<%}%>
		</dropbox>
		<button>Create Poll</button>
	</myform>
</page>
<%}else{%>
<page>
	<navigation></navigation>
	<heading>Create a Poll</heading>
	<nouser></nouser>
</page>
<%}%>