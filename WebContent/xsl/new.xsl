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
			<td><input type="{@type}" name="{@name}"/></td>
		</tr>
	</xsl:template>
	
	<xsl:template match="dropbox">
		<tr>
			<td><xsl:value-of select="@text"/></td>
			<td>
				<select name="{@name}">
					<xsl:apply-templates/>
				</select>
			</td>
		</tr>
	</xsl:template>
	
	<xsl:template match="option">
		<option value="{@val}"><xsl:apply-templates/></option>
	</xsl:template>
	
	<xsl:template match="register">
		<tr><td colspan="2"><br/></td></tr>
		<tr>
			<td>Would you like to register?<br/></td>
			<td><input type="checkbox" name="register"/></td>
		</tr>
	</xsl:template>
		
	<xsl:template match="button">
		<tr>
			<td><input type="submit" value="{.}"/></td>
		</tr>
	</xsl:template>
	<xsl:template match="nouser">
		<p>Only registered users can create polls. Please <a href="login.jsp">login</a> or <a href="register.jsp">create an account</a> to be able to create a poll.</p>
	</xsl:template>
</xsl:stylesheet>