<%@page contentType="application/xml"%><?xml version="1.0" encoding="UTF-8"?>
<%@page import="uts.wsd.*" %>
<?xml-stylesheet type="text/xsl" href="xsl/login.xsl"?>

<%
String email = request.getParameter("email");
String password = request.getParameter("password");

PollApplication pollApp = (PollApplication)session.getAttribute("pollApp");
if(pollApp == null){
	System.out.println("pollApp was null, redirecting");
	response.sendRedirect("index.jsp");
}

if(email != null){
	if(pollApp.login(email, password) != null){
		User user = pollApp.login(email, password);
		session.setAttribute("user", user);
		response.sendRedirect("index.jsp");
	}else{%>
		<page>
			<navigation></navigation>
			<heading>Login</heading>
			<failed></failed>
			<myform action="login.jsp" method="POST">
				<field name="email" type="text" value="<%=email%>">Email</field>
				<field name="password" type="password" value="<%=password%>">Password</field>
				<button>Login</button>
			</myform>
		</page>

<%}%>
<%}else{%>
<page>
	<navigation></navigation>
	<heading>Login</heading>
	<myform action="login.jsp" method="POST">
		<field name="email" type="text">Email</field>
		<field name="password" type="password">Password</field>
		<button>Login</button>
	</myform>
</page>
<%}%>