<%@page contentType="application/xml"%><?xml version="1.0" encoding="UTF-8"?>
<%@page import="uts.wsd.*" %>
<?xml-stylesheet type="text/xsl" href="xsl/login.xsl"?>

<page>
	<heading>Login</heading>
	<myform action="loginAction.jsp" method="POST">
		<field name="email" type="text">Email</field>
		<field name="password" type="password">Password</field>
		<button>Login</button>
	</myform>
</page>