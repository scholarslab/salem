<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
	xmlns:xs="http://www.w3.org/2001/XMLSchema" exclude-result-prefixes="xs" version="2.0"
	xmlns:table="urn:oasis:names:tc:opendocument:xmlns:table:1.0"
	xmlns:text="urn:oasis:names:tc:opendocument:xmlns:text:1.0">
	<xsl:template match="/">
		<dsc type="combined">
			<xsl:apply-templates select="//table:table-row"/>
		</dsc>
	</xsl:template>

	<xsl:template match="table:table-row">
		<xsl:if test="contains(descendant::text:p[1], 'ecca')">
			<c02 level="item">
				<did>
					<unitid>
						<xsl:value-of select="table:table-cell[1]/text:p"/>
					</unitid>
					<unittitle>
						<xsl:value-of select="table:table-cell[3]/text:p"/>
					</unittitle>
					<daogrp>
						<daoloc id="{table:table-cell[1]/text:p}r"/>
						<daoloc id="{table:table-cell[1]/text:p}v"/>
					</daogrp>
				</did>
				<bibliography>
					<bibref>
						<xsl:value-of select="table:table-cell[2]/text:p"/>
					</bibref>
				</bibliography>				
			</c02>
		</xsl:if>
	</xsl:template>
</xsl:stylesheet>
