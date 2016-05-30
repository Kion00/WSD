<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
	<xsl:template match="/page">
		<html>
			<head>
				<title><xsl:value-of select="@title"/></title>
								
			</head>
			<body>
			<center>
			<img src="Images/University_of_Technology_Sydney_logo.jpg" alt="UTS Logo"  style="width:304px;height:228px;"/>
			</center>
			<xsl:apply-templates/>
			</body>
		</html>
	</xsl:template>
	
	<xsl:template match="heading">
	<h1 align="center"><xsl:apply-templates/></h1>
	</xsl:template>
	
	<xsl:template match="polls">
	<div style="text-align:center">
	<a href = "index.jsp"> <xsl:apply-templates/> </a>
	</div>
	</xsl:template>
	
	
</xsl:stylesheet>