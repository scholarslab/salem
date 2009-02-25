<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="2.0">
	<xsl:output method="xml" encoding="UTF-8"/>

	<xsl:template match="/">
		<add>
			<xsl:apply-templates select="//div2[@type='section']"/>
		</add>
	</xsl:template>

	<xsl:template match="div2[@type='section']">
		<doc>
			<field name="id">
				<xsl:value-of select="@id"/>
			</field>
			<field name="chapter_id">
				<xsl:value-of select="parent::node()/@id"/>
			</field>
			<field name="doc_id">
				<xsl:value-of select="ancestor::TEI.2/@id"/>
			</field>
			<field name="title">
				<xsl:value-of select="head"/>
			</field>
			<xsl:if test="descendant::date[1]">
				<xsl:apply-templates select="descendant::date[1]"/>
			</xsl:if>

			<xsl:for-each select="descendant::name[@type='person']">
				<xsl:variable name="id" select="@key"/>
				<field name="name_facet">
					<xsl:value-of select="$id"/>
					<xsl:text>|</xsl:text>
					<xsl:value-of select="//term[@id = $id]"/>
				</field>
				<field name="name_text">
					<xsl:value-of select="$id"/>
					<xsl:text>|</xsl:text>
					<xsl:value-of select="//term[@id = $id]"/>
				</field>
			</xsl:for-each>
			<field name="fulltext">
				<xsl:value-of select="descendant-or-self::text()"/>
			</field>
		</doc>
	</xsl:template>

	<xsl:template match="date">
		<xsl:variable name="year" select="substring-before(@value, '-')"/>
		<xsl:variable name="month" select="substring-before(substring-after(@value, '-'), '-')"/>
		<xsl:variable name="day" select="substring-after(substring-after(@value, '-'), '-')"/>

		<field name="date">
			<xsl:value-of select="concat($year, $month, $day)"/>
		</field>
	</xsl:template>

</xsl:stylesheet>
