<?xml version="1.0"?> 
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
	<xsl:template match="/page">
		<html>
			<head>
				<title><xsl:value-of select="@title"/></title>
				<link rel="stylesheet" type="text/css" href="style/index.css"/>
			</head>
			<body>
				<div id="container">
					<xsl:apply-templates/>
				</div>
			</body>
		</html>
	</xsl:template>
	
	<xsl:template match="navigation">
		<div id="nav">
			<img onclick="goBack()" src="Images/Back arrow.png" style="width:40px; height:40px;"/>
			<a href="index.jsp"><img src="Images/home-icon.png" style="width:40px; height:40px;"/></a>
			<img onclick="goForward()" src="Images/right arrow.jpg" style="width:40px; height:40px;"/>
			
			<script>
				function goBack() {
				    window.history.back();
				}
				
				function goForward(){
					window.history.forward();
				}
			</script>
		</div>	
	</xsl:template>
	
	<xsl:template match="menu">
		<div id="links">
			<xsl:apply-templates/>
		</div>
		<br/>
	</xsl:template>
	
	<xsl:template match="usercontrol">
		<div id="user">
			<xsl:choose>
				<xsl:when test="@type = 'login'">
					<div id="login"><a href="login.jsp">Login</a> | <a href="register.jsp">Create Account</a></div>
				</xsl:when>
				<xsl:otherwise>
					<div id="loggedIn">Logged in as <xsl:value-of select="."/> | <a href="index.jsp">View Account</a> | <a href="logout.jsp">Logout</a></div>
				</xsl:otherwise>
			</xsl:choose>
		</div>
	</xsl:template>
	
	<xsl:template match="message">
		<br/>
		<div id="notfound">
			This poll cannot be found. Please return to the homepage.
		</div>
	</xsl:template>
</xsl:stylesheet>