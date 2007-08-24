<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">
	<xsl:param name="div_id"/>	
	<xsl:include href="layout.xsl"/>

	<xsl:template match="/">
		<html>
			<head>
				<link type="text/css" href="style.css" rel="stylesheet"/>
				<script type="text/javascript" language="javascript" src="javascript/jquery.js"/>
				<script type="text/javascript" language="javascript" src="javascript/jquery/plugins/Thickbox.js"/>
				<title>
					<xsl:value-of select="//fileDesc/titleStmt/title"/>
				</title>
			</head>
			<body>
				<table id="wrap">
					<tr>
						<td class="header">
							<xsl:call-template name="layout"/>
						</td>
					</tr>
					<tr>
						<td align="center">
							<xsl:call-template name="volume_nav"/>
						</td>
					</tr>
					<!--top loop; for the tr tags, create tr tag on every $cols node-->
					<tr>
						<td class="content">
							<xsl:apply-templates select="//div1"/>
						</td>
					</tr>
					<tr>
						<td align="center">
							<xsl:call-template name="volume_nav"/>
						</td>
					</tr>
				</table>
			</body>
		</html>
	</xsl:template>

	<xsl:template name="volume_nav">
		<table>
			<tr>
				<td>
					<a href="contents.{//TEI.2/@id}.xml">Table of Contents</a>
				</td>
				<td>|</td>
				<td>
					<a href="tei.{//TEI.2/@id}.xml?div_id={//TEI.2/@id}">View Entire Work</a>
				</td>
			</tr>
		</table>

	</xsl:template>

	<xsl:template match="div1">
		<div class="image_sections">
			<xsl:if test="descendant-or-self::figure">
				<!-- if the section is an essay, the docauthor is displayed -->
				<h2>
					<a href="tei.{//TEI.2/@id}.xml?div_id={@id}">
						<xsl:apply-templates select="head"/>
					</a>
				</h2>

			</xsl:if>

			<!-- after the header is displayed, the page breaks are displayed whether or not they are contained in a child lg -->

			<xsl:apply-templates select="figure | p/figure"/>
		</div>
		<xsl:apply-templates select="div2"/>

	</xsl:template>
	<xsl:template match="div2">
		<div class="image_sections">
			<xsl:if test="descendant-or-self::figure">
				<!-- if the section is an essay, the docauthor is displayed -->
				<h3>
					<a href="tei.{//TEI.2/@id}.xml?div_id={@id}">
						<xsl:apply-templates select="head"/>
					</a>
				</h3>
			</xsl:if>

			<!-- after the header is displayed, the page breaks are displayed whether or not they are contained in a child lg -->

			<xsl:apply-templates select="figure | p/figure"/>
		</div>
		<xsl:apply-templates select="div3"/>

	</xsl:template>
	<xsl:template match="div3">
		<div class="image_sections">
			<xsl:if test="descendant-or-self::figure">
				<!-- if the section is an essay, the docauthor is displayed -->
				<h4>
					<a href="tei.{//TEI.2/@id}.xml?div_id={@id}">
						<xsl:apply-templates select="head"/>
					</a>
				</h4>
			</xsl:if>

			<!-- all page breaks are displayed for div3 and its child divs -->

			<xsl:apply-templates select="descendant-or-self::figure"/>
		</div>

	</xsl:template>

	<xsl:template match="figure">

		<!-- java popup window, from jquery plugin -->

		<a class="thickbox" href="images/{substring(@entity, 1, 1)}/{@entity}.jpg">
			<img src="images/{substring(@entity, 1, 1)}/{@entity}.gif"/>
		</a>

	</xsl:template>

	<xsl:template match="head">
		<xsl:apply-templates/>
	</xsl:template>

	<xsl:template match="lb">
		<br/>
	</xsl:template>

</xsl:stylesheet>
