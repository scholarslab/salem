<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">
	<xsl:include href="layout.xsl"/>
	<xsl:param name="div_id"/>


	<xsl:template match="/">
		<html>
			<head>
				<link type="text/css" href="style.css" rel="stylesheet"/>
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
					<tr>
						<td class="content">
							<xsl:apply-templates select="TEI.2"/>
							<xsl:if test="descendant::figure">
								<a href="images.{TEI.2/@id}.xml">View Figure Images</a>
							</xsl:if>
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
				<td>Table of Contents</td>
				<td>|</td>
				<td>

					<a href="tei.{//TEI.2/@id}.xml?div_id={//TEI.2/@id}">View Entire Work</a>
				</td>
			</tr>
		</table>

	</xsl:template>

	<xsl:template match="TEI.2">

		<center>
			<h2>
				<xsl:value-of select="//sourceDesc/biblFull/titleStmt/title"/>
			</h2>
			<h3>
				<xsl:value-of select="//sourceDesc/biblFull/titleStmt/author"/>
			</h3>
		</center>

		<ul>
			<li>
				<a href="header.{@id}.xml">Header</a>
			</li>

			<xsl:apply-templates select="text"/>

		</ul>
	</xsl:template>

	<xsl:template match="text">
		<xsl:if test="front">
			<li>
				<a href="tei.{//TEI.2/@id}.xml?div_id={front/@id}">Front Matter</a>
				<ul>
					<xsl:apply-templates select="front/div1"/>
				</ul>
			</li>

		</xsl:if>
		<li>
			<a href="tei.{//TEI.2/@id}.xml?div_id={body/@id}">Body</a>
			<ul>
				<xsl:apply-templates select="body/div1"/>
			</ul>
		</li>
		<xsl:if test="back">
			<li>
				<a href="tei.{//TEI.2/@id}.xml?div_id={back/@id}">Back Matter</a>
				<ul>
					<xsl:apply-templates select="back/div1"/>
				</ul>
			</li>
		</xsl:if>
	</xsl:template>

	<xsl:template match="div1">
		<li class="div1_li">

			<a href="tei.{//TEI.2/@id}.xml?div_id={@id}">
				<xsl:value-of select="@type"/>
			</a>
			<xsl:if test="not(normalize-space(head)='')">
				<xsl:text> - </xsl:text>
				<xsl:value-of select="head"/>
			</xsl:if>

		</li>
		<ul>
			<xsl:apply-templates select="div2"/>
		</ul>
	</xsl:template>

	<xsl:template match="div2">
		<li class="div2_li">
			<a href="tei.{//TEI.2/@id}.xml?div_id={@id}">
				<xsl:value-of select="@type"/>
			</a>

			<xsl:if test="not(normalize-space(head)='')">
				<xsl:text> - </xsl:text>
				<xsl:value-of select="head"/>
			</xsl:if>
		</li>
		<ul>
			<xsl:apply-templates select="div3"/>
		</ul>
	</xsl:template>

	<xsl:template match="div3">
		<li class="div3_li">
			<a href="tei.{//TEI.2/@id}.xml?div_id={@id}">
				<xsl:value-of select="@type"/>
			</a>
			<xsl:if test="not(normalize-space(head)='')">
				<xsl:text> - </xsl:text>
				<xsl:value-of select="head"/>
			</xsl:if>
		</li>
		<ul>
			<xsl:apply-templates select="div4"/>
		</ul>
	</xsl:template>

	<xsl:template match="div4">
		<li class="div4_li">
			<a href="tei.{//TEI.2/@id}.xml?div_id={@id}">
				<xsl:value-of select="@type"/>
			</a>
			<xsl:if test="not(normalize-space(head)='')">
				<xsl:text> - </xsl:text>
				<xsl:value-of select="head"/>
			</xsl:if>
		</li>
		<ul>
			<xsl:apply-templates select="div5"/>
		</ul>
	</xsl:template>

	<xsl:template match="div5">
		<li class="div5_li">
			<a href="tei.{//TEI.2/@id}.xml?div_id={@id}">
				<xsl:value-of select="@type"/>
			</a>
			<xsl:if test="not(normalize-space(head)='')">
				<xsl:text> - </xsl:text>
				<xsl:value-of select="head"/>
			</xsl:if>
		</li>
		<ul>
			<xsl:apply-templates select="div6"/>
		</ul>
	</xsl:template>

	<xsl:template match="div6">
		<li class="div6_li">
			<a href="tei.{//TEI.2/@id}.xml?div_id={@id}">
				<xsl:value-of select="@type"/>
			</a>
			<xsl:if test="not(normalize-space(head)='')">
				<xsl:text> - </xsl:text>
				<xsl:value-of select="head"/>
			</xsl:if>
		</li>
		<ul>
			<xsl:apply-templates select="div7"/>
		</ul>
	</xsl:template>

	<xsl:template match="div7">
		<li class="div7_li">
			<a href="tei.{//TEI.2/@id}.xml?div_id={@id}">
				<xsl:value-of select="@type"/>
			</a>
			<xsl:if test="not(normalize-space(head)='')">
				<xsl:text> - </xsl:text>
				<xsl:value-of select="head"/>
			</xsl:if>
		</li>
		<ul>
			<xsl:apply-templates select="div8"/>
		</ul>
	</xsl:template>

	<xsl:template match="div8">
		<li class="div8_li">
			<a href="tei.{//TEI.2/@id}.xml?div_id={@id}">
				<xsl:value-of select="@type"/>
			</a>
			<xsl:if test="not(normalize-space(head)='')">
				<xsl:text> - </xsl:text>
				<xsl:value-of select="head"/>
			</xsl:if>
		</li>
	</xsl:template>

</xsl:stylesheet>
