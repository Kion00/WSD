<%@page contentType="application/xml"%><?xml version="1.0" encoding="UTF-8"?>
<%@page import="uts.wsd.*" %>
<?xml-stylesheet type="text/xsl" href="register.xsl"?>
<page>
	<heading>Register</heading>
	<myform action="registered.jsp" method="POST">
	    <gender name="gender">Title:</gender>
	    <field name="id">Student number:</field>
	    <field name="firstname">First name:</field>
	    <field name="lastname">Last name:</field>
<<<<<<< HEAD
		<field name="email">Enter your email:</field>
		<field name="password1">Set your password:</field>
		<field name="password2">Confirm your password:</field>
=======
		<field name="email">Email:</field>
		<field name="password">password:</field>
>>>>>>> origin/master
		<button>Register</button>
	</myform>
</page>