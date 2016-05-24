<?xml version="1.0"?> 
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">

<xsl:template match="/page">
		<html>
			<head>
				<title><xsl:value-of select="@title"/></title>
				<link rel="stylesheet" type="text/css" href="style/register.css"/>
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
	
	<xsl:template match="myform">
		<div id="form">
			<form action="{@action}" method="{@method}">
				<table width="100%">
					<xsl:apply-templates/>
				</table>
			</form>
		</div>
	</xsl:template>
	
	<xsl:template match="field">
		<tr>
			<td><xsl:value-of select="."/> </td>
			<td><input type="text" name="{@name}"/></td>
		</tr>
	</xsl:template>
		
	<xsl:template match="button">
		<tr>
			<td><input type="submit" value="{.}"/></td>
		</tr>
	</xsl:template>
	
	<xsl:template match="gender">
		<tr>
			<td><xsl:value-of select="."/></td>
			<td>
				<input type="radio" name="{@name}" value="male"/>Mr
				<input type="radio" name="{@name}" value="femle"/>Ms
			</td>
		</tr>
	</xsl:template>

</xsl:stylesheet>