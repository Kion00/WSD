<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0"
	xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
	<xsl:template match="/page">
		<html>
			<head>
				<title>
					<xsl:value-of select="@title" />
				</title>

			</head>
			<body>
				<xsl:apply-templates />
			</body>
		</html>
	</xsl:template>

	<xsl:template match="heading">
		<h1 align="center">
			<xsl:apply-templates />
		</h1>
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
		<center>
			<xsl:apply-templates />
		</center>
	</xsl:template>

	<xsl:template match="time">
		<center>
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
		</center>
	</xsl:template>

	<xsl:template match="button">
		<center>
			<button type="button">submit</button>
		</center>
	</xsl:template>

</xsl:stylesheet>