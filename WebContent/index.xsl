<?xml version="1.0"?> 
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
	<xsl:template match="/page">
		<html>
			<head>
				<title><xsl:value-of select="@title"/></title>
				<style>
					.status{
						background-color:#0F0;
					}
				</style>
			</head>
			<body>
			<xsl:apply-templates/>
			</body>
		</html>
	</xsl:template>
	
	<xsl:template match="heading">
		<h1><xsl:apply-templates/></h1>
	</xsl:template>
	
	<xsl:template match="polls">
		<br/>
		<a>
			<table border="1">
				<xsl:apply-templates/>
			</table>
		</a>
	</xsl:template>
	
	<xsl:template match="poll">
		<tr><xsl:apply-templates/></tr>
	</xsl:template>
	
	<xsl:template match="name">
		<td>Name: <xsl:value-of select="."/></td>
	</xsl:template>
	
	<xsl:template match="creator">
		<td>Creator: <xsl:value-of select="."/></td>
	</xsl:template>
	
	<xsl:template match="status">
		<td class="status">Status: <xsl:value-of select="."/></td>
	</xsl:template>
	
	<xsl:template match="usercontrol">
		<div>Login</div>
	</xsl:template>
</xsl:stylesheet>