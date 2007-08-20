<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">
	<xsl:include href="layout.xsl"/>
	<xsl:template match="/">
		<html>
			<head>
				<link type="text/css" href="style.css" rel="stylesheet"/>
				<title> The Modern English Collection</title>
			</head>
			<body>
				<table id="wrap">
					<tr>
						<td class="header">
							<xsl:call-template name="layout"/>
						</td>
					</tr>
					<tr>
						<td class="content">
							<p>The Modern English Collection.</p>
						</td>
					</tr>
				</table>

			</body>
		</html>
	</xsl:template>
</xsl:stylesheet>
