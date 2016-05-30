<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0"
	xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
	<xsl:template match="/">
		<html>
			<head>
				<title>
					<xsl:value-of select="@title" />
				</title>
				<link rel="stylesheet" type="text/css" href="style/poll.css"/>

			</head>
			<body>
	<div id="container">
					<xsl:apply-templates/>
				</div>
			</body>
		</html>
	</xsl:template>
	
	<xsl:template match="navigation">
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
	</xsl:template>

	<xsl:template match="heading">
	<h1><xsl:apply-templates /></h1>
	</xsl:template>
	
	<xsl:template match="info">
		<table>
			<xsl:apply-templates />
		</table>
	</xsl:template>

	<xsl:template match="date">
		<tr>
			<td>Date: </td><td><xsl:apply-templates /></td>
		</tr>
	</xsl:template>
	
	<xsl:template match="creator">
		<tr>
			<td>Creator: </td><td><xsl:apply-templates /></td>
		</tr>
	</xsl:template>
	
	<xsl:template match="location">
		<tr>
			<td>Location: </td><td><xsl:apply-templates /></td>
		</tr>
	</xsl:template>
	
	<xsl:template match="description">
		<tr>
			<td>Description: </td><td><xsl:apply-templates /></td>
		</tr>
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

	<xsl:template match="times">
		<br/>
		Available Times:
		<br/>
		<br/>
		<table>
			<xsl:apply-templates />
		</table>
		<br/>
	</xsl:template>
	
	<xsl:template match="time">
		<tr>
			<td>
				<input type="checkbox" name="time" value="{@val}" />
			</td>
			<td>
				<xsl:apply-templates />
			</td>
		</tr>
	</xsl:template>
	

	<xsl:template match="button">
		<button type="submit" name="id" value="{@id}"><xsl:apply-templates /></button>
	</xsl:template>

</xsl:stylesheet>