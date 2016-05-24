<%@page contentType="application/xml"%><?xml version="1.0" encoding="UTF-8"?>
<%@page import="uts.wsd.*" %>
<?xml-stylesheet type="text/xsl" href="xsl/register.xsl"?>
<page>
	<heading>Register</heading>
	<myform action="registered.jsp" method="POST">
	    <gender name="gender">Title:</gender>
	    <field name="id">Student number:</field>
	    <field name="firstname">First name:</field>
	    <field name="lastname">Last name:</field>
		<field name="email">Email:</field>
		<field name="password">Password:</field>
		<button>Register</button>
	</myform>
</page>