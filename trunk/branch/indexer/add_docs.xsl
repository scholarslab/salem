<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="2.0">
	<xsl:output method="xml" encoding="UTF-8"/>

	<xsl:template match="/">
		<add>
			<xsl:apply-templates select="//div1[@type='case']/div2"/>
			<!--<xsl:apply-templates select="//div1[@type='addendum']//div3"/>-->
		</add>
	</xsl:template>

	<xsl:template match="div2">
		<doc>
			<field name="id">
				<xsl:value-of select="@id"/>
			</field>
			<field name="source">
				<xsl:text>tei</xsl:text>
			</field>
			<field name="chapter_id">
				<xsl:value-of select="parent::node()/@id"/>
			</field>
			<field name="doc_id">
				<xsl:value-of select="ancestor::TEI.2/@id"/>
			</field>
			<field name="title">
				<xsl:value-of select="normalize-space(head)"/>
			</field>
			<field name="case_title">
				<xsl:value-of select="normalize-space(parent::div1[@type='case']/head)"/>
			</field>			
			
			<xsl:for-each select="descendant::date">
				<xsl:variable name="year" select="substring-before(@value, '-')"/>
				<xsl:variable name="month" select="substring-before(substring-after(@value, '-'), '-')"/>
				<xsl:variable name="day" select="substring-after(substring-after(@value, '-'), '-')"/>
				
				<field name="date">
					<xsl:value-of select="concat('y', $year, 'm', $month, 'd', $day)"/>
				</field>
			</xsl:for-each>
			

			<xsl:for-each select="descendant::name[@type='person']">
				<xsl:variable name="id" select="@key"/>
				<field name="name_facet">
					<xsl:value-of select="$id"/>
					<xsl:text>|</xsl:text>
					<xsl:value-of select="//normalize-space(term[@id = $id])"/>
				</field>
				<field name="name_text">
					<xsl:value-of select="$id"/>
					<xsl:text>|</xsl:text>
					<xsl:value-of select="//normalize-space(term[@id = $id])"/>
				</field>
			</xsl:for-each>
			<field name="fulltext">
				<xsl:value-of select="descendant-or-self::text()"/>
			</field>
		</doc>
	</xsl:template>

	<!--<xsl:template match="date">
		<xsl:variable name="year" select="substring-before(@value, '-')"/>
		<xsl:variable name="month" select="substring-before(substring-after(@value, '-'), '-')"/>
		<xsl:variable name="day" select="substring-after(substring-after(@value, '-'), '-')"/>

		<field name="date">
			<xsl:value-of select="concat($year, $month, $day)"/>
		</field>
	</xsl:template>-->
	
	<!-- 
	<xsl:template match="div3">
		<doc>
			<field name="id">
				<xsl:value-of select="@id"/>
			</field>
			<field name="source">
				<xsl:text>tei</xsl:text>
			</field>
			<field name="chapter_id">
				<xsl:value-of select="parent::node()/@id"/>
			</field>
			<field name="doc_id">
				<xsl:value-of select="ancestor::TEI.2/@id"/>
			</field>
			<field name="title">
				<xsl:value-of select="normalize-space(head)"/>
			</field>
			<field name="case_title">
				<xsl:value-of select="normalize-space(parent::div2/head)"/>
			</field>			
			
			<xsl:for-each select="descendant::date">
				<xsl:variable name="year" select="substring-before(@value, '-')"/>
				<xsl:variable name="month" select="substring-before(substring-after(@value, '-'), '-')"/>
				<xsl:variable name="day" select="substring-after(substring-after(@value, '-'), '-')"/>
				<field name="date">
					<xsl:value-of select="concat('y', $year, 'm', $month, 'd', $day)"/>
				</field>
			</xsl:for-each>
			
			
			<xsl:for-each select="descendant::name[@type='person']">
				<xsl:variable name="id" select="@key"/>
				<field name="name_facet">
					<xsl:value-of select="$id"/>
					<xsl:text>|</xsl:text>
					<xsl:value-of select="//normalize-space(term[@id = $id])"/>
				</field>
				<field name="name_text">
					<xsl:value-of select="$id"/>
					<xsl:text>|</xsl:text>
					<xsl:value-of select="//normalize-space(term[@id = $id])"/>
				</field>
			</xsl:for-each>
			<field name="fulltext">
				<xsl:value-of select="descendant-or-self::text()"/>
			</field>
		</doc>
	</xsl:template>
	-->

</xsl:stylesheet>
