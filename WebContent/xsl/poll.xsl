<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0"
	xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
	<xsl:template match="/">
		<html>
			<head>
				<title>
					<xsl:value-of select="@title" />
				</title>
				<link rel="stylesheet" type="text/css" href="style/PollDetail.css"/>

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

	<xsl:template match="date">
		<table>
			<tr>
				<td>Date: </td>
				<td>
					<xsl:apply-templates />
				</td>
			</tr>
		</table>
	</xsl:template>
	
	<xsl:template match="page/creator">
	<table>
			<tr>
				<td>Creator: </td>
				<td>
					<xsl:apply-templates />
				</td>
			</tr>
		</table>
	</xsl:template>
	
	<xsl:template match="location">
		<table>
			<tr>
				<td>Location: </td>
				<td>
					<xsl:apply-templates />
				</td>
			</tr>
		</table>
	</xsl:template>
	<xsl:template match="description">
	<p>Description: <xsl:apply-templates /></p>
		
	</xsl:template>

	<xsl:template match="time">
			<table>
				<form>
					<tr>
						<td>
							<input type="checkbox" name="1:30" value="1:30" />
						</td>
						<td>
							<xsl:apply-templates />
						</td>
					</tr>
				</form>
			</table>
	</xsl:template>

	<xsl:template match="button">
		
			<button type="button">Submit</button>
		
	</xsl:template>

</xsl:stylesheet>