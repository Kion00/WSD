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
	
	<xsl:template match="heading">
		<h1><xsl:apply-templates/></h1>
	</xsl:template>
	
	<xsl:template match="polls">
		<br/>
		<xsl:apply-templates/>
	</xsl:template>
	
	<xsl:template match="poll">
		<div class="poll">
			<xsl:apply-templates/>
		</div>
	</xsl:template>
	
	<xsl:template match="info">
		<div class="info"><xsl:apply-templates/></div>
	</xsl:template>
	
	<xsl:template match="name">
		<div class="attr"><b>Name: </b><xsl:value-of select="."/></div>
	</xsl:template>
	
	<xsl:template match="creator">
		<div class="attr"><b>Creator: </b> <xsl:value-of select="."/></div>
	</xsl:template>

	<xsl:template match="buttons">
		<div class="buttons">
			<xsl:apply-templates/>
		</div>
	</xsl:template>
	
	<xsl:template match="openPoll">
		<div class="open-poll">
			<form action="poll.jsp" method="GET">
				<button type="submit" name="id" value="{.}">Open Poll</button>
			</form>
		</div>
	</xsl:template>
	
	<xsl:template match="editPoll">
		<div class="edit-poll">
			<form action="edit.jsp" method="POST">
				<button type="submit" name="id" value="{.}">Edit Poll</button>
			</form>
		</div>
	</xsl:template>
	
	<xsl:template match="closePoll">
		<div class="close-poll">
			<form action="close.jsp" method="POST">
				<button type="submit" name="close" value="{.}">Close Poll</button>
			</form>
		</div>
	</xsl:template>
	
	<xsl:template match="createPoll">
		<div class="links">
			<a href="new.jsp">Create Poll</a>
		</div>
	</xsl:template>
	
	<xsl:template match="results">
		<div class="results">
			<form action="results.jsp" method="GET">
				<button type="submit" name="id" value="{.}">View Results</button>
			</form>
		</div>
	</xsl:template>
	
	
	<xsl:template match="status">
		<xsl:choose>
			<xsl:when test="@s = 'Open'">
				<div class="attr"><b>Status: </b> <span class="statusOpen"><xsl:value-of select="@s"/></span></div>
			</xsl:when>
			<xsl:otherwise>
				<div class="attr"><b>Status: </b> <span class="statusClosed"><xsl:value-of select="@s"/></span></div>
			</xsl:otherwise>
		</xsl:choose>
	</xsl:template>
	
</xsl:stylesheet>