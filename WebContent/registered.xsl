<?xml version="1.0"?> 
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
	<xsl:template match="/">
		<html>
			<head>
				<title><xsl:value-of select="@title"/></title>
				<link rel="stylesheet" type="text/css" href="style/loginAction.css"/>
			</head>
			<body>
				<div id="container">
					<xsl:apply-templates/>
				</div>
			</body>
		</html>
	</xsl:template>
	
	<xsl:template match="message">
		<div class="center">
		<xsl:choose>
				<xsl:when test=". = 'success'">
					Login successful. Click <a href="index.jsp">here</a> to go to the main page.
				</xsl:when>
				<xsl:otherwise>
					<div>Login failed. Click <a href="index.jsp">here</a> to go to the main page.</div>
					<div>or click <a href="login.jsp">here</a> to go to try again.</div>
				</xsl:otherwise>
			</xsl:choose>
		</div>
	</xsl:template>
</xsl:stylesheet>