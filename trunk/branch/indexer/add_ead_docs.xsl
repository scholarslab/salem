<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
	xmlns:xs="http://www.w3.org/2001/XMLSchema" exclude-result-prefixes="xs" version="2.0">
	<xsl:output method="xml" encoding="UTF-8"/>

	<xsl:template match="/">
		<add>
			<xsl:apply-templates select="descendant::c[@level='item']"/>
		</add>
	</xsl:template>

	<xsl:template match="c[@level='item']">
		<doc>
			<field name="id">
				<xsl:value-of select="@id"/>
			</field>
			<field name="source">
				<xsl:text>ead</xsl:text>
			</field>
			<field name="doc_id">
				<xsl:value-of select="//ead/@id"/>
			</field>
			<field name="title">
				<xsl:value-of select="did/unittitle"/>
			</field>
			<xsl:for-each select="descendant::persname[string(@id)]">
				<field name="name_facet">
					<xsl:value-of select="@id"/>
					<xsl:text>|</xsl:text>
					<xsl:value-of select="."/>
				</field>
				<field name="name_text">
					<xsl:value-of select="@id"/>
					<xsl:text>|</xsl:text>
					<xsl:value-of select="."/>
				</field>
			</xsl:for-each>
			<xsl:for-each select="descendant::daoloc | descendant::dao">
				<field name="thumb">
					<xsl:value-of select="@id"/>
				</field>
				<field name="medium">
					<xsl:value-of select="@id"/>
				</field>
				<field name="large">
					<xsl:value-of select="@id"/>
				</field>
			</xsl:for-each>
			<field name="fulltext">
				<xsl:value-of select="descendant-or-self::text()"/>
			</field>
		</doc>
	</xsl:template>

</xsl:stylesheet>
