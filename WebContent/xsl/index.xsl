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
	
	<xsl:template match="heading">
		<h1><xsl:apply-templates/></h1>
	</xsl:template>
	
	<xsl:template match="navigation">
		
		<img onclick="goBack()" src="Images/Back arrow.png" style="width:40px; height:40px;"/>
		<a href="index.jsp">
		<img src="Images/home-icon.png" style="width:40px; height:40px;"/>
		</a>
		<img onclick="goForward()" src="Images/right arrow.jpg" style="width:40px; height:40px;"/>
		
		<script>
function goBack() {
    window.history.back();
}

function goForward(){
	window.history.forward();
}
</script>	
	</xsl:template>
	
	<xsl:template match="polls">
		<br/>
		<xsl:apply-templates/>
	</xsl:template>
	
	<xsl:template match="poll">
		<div class="poll">
			<xsl:apply-templates/>
			<xsl:choose>
				<xsl:when test="@status = 'Open'">
					<div class="attr"><b>Status: </b> <span class="statusOpen"><xsl:value-of select="@status"/></span></div>
				</xsl:when>
				<xsl:otherwise>
					<div class="attr"><b>Status: </b> <span class="statusClosed"><xsl:value-of select="@status"/></span></div>
				</xsl:otherwise>
			</xsl:choose>
		</div>
	</xsl:template>
	
	<xsl:template match="name">
		
		<div class="attr"><b>Name: </b><a href="PollDetail.jsp"> <xsl:value-of select="."/></a></div>
		
	</xsl:template>
	
	<xsl:template match="creator">
		<div class="attr"><b>Creator: </b> <xsl:value-of select="."/></div>
	</xsl:template>
	
	<xsl:template match="status">
		<xsl:choose>
			<xsl:when test="status = 'Open'">
				<div class="attr"><b>Status: </b> <span class="statusOpen"><xsl:value-of select="."/></span></div>
			</xsl:when>
			<xsl:otherwise>
				<div class="attr"><b>Status: </b> <span class="statusClosed"><xsl:value-of select="."/></span></div>
			</xsl:otherwise>
		</xsl:choose>
	</xsl:template>
	
	<xsl:template match="usercontrol">
		<xsl:choose>
			<xsl:when test="@type = 'login'">
				<div id="login"><a href="login.jsp">Login</a> | <a href="register.jsp">Create Account</a></div>
			</xsl:when>
			<xsl:otherwise>
				<div id="loggedIn">Logged in as <xsl:value-of select="."/> | <a href="">View Account</a> | <a href="logout.jsp">Logout</a></div>
			</xsl:otherwise>
		</xsl:choose>
	</xsl:template>
</xsl:stylesheet>