<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="2.0">
	<!-- this stylesheet reduces the LCSH name list to the names that appear only in that volume-->
	<xsl:template match="@*|node()">
		<xsl:copy>
			<xsl:apply-templates select="@*|node()"/>
		</xsl:copy>
	</xsl:template>

	<xsl:template match="keywords[@scheme='LCSH']">
		<keywords scheme="LCSH">
			<xsl:apply-templates select="term" mode="lcsh"/>
		</keywords>
	</xsl:template>

	<xsl:template match="term" mode="lcsh">
		<xsl:variable name="id" select="@id"/>
		<xsl:variable name="value">
			<xsl:value-of select="."/>
		</xsl:variable>

		<xsl:if test="$id = //body//name/@key">
			<term id="{$id}">
				<xsl:value-of select="$value"/>
			</term>
		</xsl:if>
	</xsl:template>

</xsl:stylesheet>
