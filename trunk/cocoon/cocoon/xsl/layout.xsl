<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">
	<xsl:output method="xml" indent="yes"/>
	<xsl:template name="layout">
		<table>
			<tr>
				<td>
					<img src="layout_images/modern_english_logo.jpg"/>
				</td>
			</tr>
			<tr>
				<td id="nav_menu"><a class="menu" href=".">Home</a> | <a class="menu" href="search?mode=browse">Browse</a> | <a class="menu" href="search?mode=search">Search</a></td>
			</tr>
		</table>
	</xsl:template>
</xsl:stylesheet>
