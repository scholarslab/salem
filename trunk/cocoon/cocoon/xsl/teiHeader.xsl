<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
	xmlns="http://www.w3.org/1999/xhtml">
	<xsl:include href="layout.xsl"/>

	<xsl:template match="TEI.2/teiHeader">
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
							<xsl:apply-templates select="fileDesc"/>
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

	<!-- ============   Header templates ==================== -->
	<xsl:template match="fileDesc">
		<center>

			<h2>
				<xsl:value-of select="//fileDesc/titleStmt/title"/>
			</h2>
			<h3>
				<xsl:value-of select="//fileDesc/titleStmt/author"/>
			</h3>

		</center>
		<hr/>
		<p>
			<i>About the electronic version</i>
		</p>
		<xsl:apply-templates select="titleStmt/respStmt | publicationStmt | notesStmt"/>
		<hr/>
		<p>
			<i>About the print version</i>
		</p>
		<xsl:apply-templates select="sourceDesc"/>
		<hr/>
		<p>
			<i>Revisions to the electronic version </i>
		</p>

		<xsl:apply-templates select="/TEI.2/teiHeader/revisionDesc"/>

	</xsl:template>

	<xsl:template match="respStmt">
		<xsl:for-each select="resp">
			<p>
				<xsl:if test="not(normalize-space(following-sibling::name)='')">
					<xsl:value-of select="."/>
					<xsl:value-of select="following-sibling::name"/>
				</xsl:if>
			</p>
		</xsl:for-each>
	</xsl:template>

	<xsl:template match="publicationStmt">
		<xsl:text>This version available from: </xsl:text>
		<xsl:value-of select="publisher"/>
		<xsl:if test="pubPlace">
			<xsl:text>, </xsl:text>
			<xsl:value-of select="pubPlace"/>
			<xsl:if test="date">(<xsl:value-of select="normalize-space(date)"/>)</xsl:if>
		</xsl:if>
	</xsl:template>

	<xsl:template match="notesStmt">
		<xsl:if test="not(normalize-space(note[1])='')">

			<xsl:choose>
				<xsl:when test="normalize-space(note[2])=''">
					<xsl:if test="ancestor::fileDesc and not(ancestor::sourceDesc)">
						<p>File Description Note:</p>
					</xsl:if>
					<xsl:if test="ancestor::sourceDesc">
						<p>Source Description Note:</p>
					</xsl:if>
				</xsl:when>
				<xsl:otherwise>
					<xsl:if test="ancestor::fileDesc and not(ancestor::sourceDesc)">
						<p>File Description Notes:</p>
					</xsl:if>
					<xsl:if test="ancestor::sourceDesc">
						<p>Source Description Notes:</p>
					</xsl:if>
				</xsl:otherwise>
			</xsl:choose>

			<ul>
				<xsl:for-each select="note">
					<xsl:if test="not(normalize-space(.)='')">
						<li class="header_notes">
							<xsl:value-of select="."/>
						</li>
					</xsl:if>
				</xsl:for-each>
			</ul>
		</xsl:if>
	</xsl:template>

	<xsl:template match="sourceDesc">
		<p>
			<b>
				<i>
					<xsl:value-of select="biblFull/titleStmt/title"/>
				</i>
			</b>
			<br/>
			<b>
				<xsl:value-of select="biblFull/titleStmt/author"/>
			</b>
		</p>
		<p>
			<xsl:value-of select="biblFull/publicationStmt/publisher"/>
			<br/>
			<xsl:value-of select="biblFull/publicationStmt/pubPlace"/>
			<br/>
			<xsl:value-of select="biblFull/publicationStmt/date"/>
		</p>
		
		<xsl:if test="biblFull/publicationStmt/idno">
			<p>
				<xsl:value-of select="normalize-space(biblFull/publicationStmt/idno)"/>
			</p>
		</xsl:if>

		<xsl:if test="not(normalize-space(biblFull/seriesStmt/p[1])='')">
			<xsl:apply-templates select="biblFull/seriesStmt"/>
		</xsl:if>



		<xsl:apply-templates select="notesStmt | biblFull/notesStmt"/>
	</xsl:template>

	<xsl:template match="seriesStmt">
		<p>
			<xsl:for-each select="p">
				<xsl:value-of select="."/>
				<br/>
			</xsl:for-each>
		</p>
	</xsl:template>

	<xsl:template match="revisionDesc">
		<xsl:for-each select="change">
			<p>
				<xsl:if test="not(normalize-space(date)='')">
					<b>
						<xsl:value-of select="date"/>
					</b>
					<br/>
				</xsl:if>
				<xsl:value-of select="respStmt/name"/>
				<xsl:if test="not(normalize-space(item)='')">
					<xsl:text> - </xsl:text>
					<xsl:value-of select="item"/>
				</xsl:if>
			</p>
		</xsl:for-each>
	</xsl:template>

	<xsl:template match="//text"/>

</xsl:stylesheet>
