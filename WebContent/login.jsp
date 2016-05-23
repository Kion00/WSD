<%@page contentType="application/xml"%><?xml version="1.0" encoding="UTF-8"?>
<%@page import="uts.wsd.*" %>
<?xml-stylesheet type="text/xsl" href="login.xsl"?>

<page>
	<heading>Login</heading>
	<myform action="loggedIn.jsp" method="POST">
		<field name="email">Email</field>
		<field name="password">Password</field>
		<button>Login</button>
	</myform>
</page>