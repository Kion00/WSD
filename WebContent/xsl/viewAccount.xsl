<?xml version="1.0"?> 
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
	<xsl:template match="/">
		<html>
			<head>
				<title><xsl:value-of select="@title"/></title>
				<link rel="stylesheet" type="text/css" href="style/viewAccount.css"/>
			</head>
			<body>
				<div id="container">
					<xsl:apply-templates/>
				</div>
			</body>
		</html>
	</xsl:template>
</xsl:stylesheet>