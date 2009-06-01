<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="2.0">
	<xsl:param name="institution" select="//eadid/@mainagencycode"/>

	<xsl:variable name="thumb_url">
		<xsl:choose>
			<xsl:when test="$institution = 'BPL'">
				<xsl:text>archives/BPL/gifs</xsl:text>
			</xsl:when>
		</xsl:choose>
	</xsl:variable>

	<xsl:variable name="medium_url">
		<xsl:choose>
			<xsl:when test="$institution = 'BPL'">
				<xsl:text>archives/BPL/SMALL</xsl:text>
			</xsl:when>
		</xsl:choose>
	</xsl:variable>
	
	<xsl:variable name="large_url">
		<xsl:choose>
			<xsl:when test="$institution = 'BPL'">
				<xsl:text>archives/BPL/LARGE</xsl:text>
			</xsl:when>
		</xsl:choose>
	</xsl:variable>

	<xsl:template match="/">
		<html>
			<head>
				<title>
					<xsl:value-of select="//eadid"/>
					<xsl:text> List of Documents</xsl:text>
				</title>
				<link type="text/css" href="../../style.css" rel="stylesheet"/>
				<script type="text/javascript" src="../../javascript/jquery-1.2.6.min.js"/>
				<script type="text/javascript" src="../../javascript/jquery.lightbox-0.5.min.js"/>
				<script type="text/javascript" src="../../javascript/salem-archives-lightbox.js"/>
			</head>
		</html>
		<body>
			<div class="header">
				<img src="images/startdoc2.jpg" width="621" height="90" border="1"/>
				<ul class="menu">
					<li class="menu_item menu_home" style="width:13%;">
						<a href="../../home.html">Home</a>
					</li>
					<li class="menu_item menu_archives" style="width:15%">
						<a href="../../archive2.html">Archives</a>
					</li>
					<li class="menu_item menu_books" style="width:24%;">
						<a href="../../books.html">Books &amp; Letters</a>
					</li>
					<li class="menu_item menu_documents" style="width:20%;">
						<a href="../../17docs.html">Documents</a>
					</li>
					<li class="menu_item menu_maps" style="width:13%;">
						<a href="../../maps.html">Maps</a>
					</li>
					<li class="menu_item menu_people" style="width:15%;">
						<a
							href="../../saxon-salem/servlet/SaxonServlet?source=salem/texts/names.xml&amp;style=salem/xsl/dynaxml.xsl&amp;group.num=all&amp;clear-stylesheet-cache=yes"
							>People</a>
					</li>
				</ul>
			</div>
			<div class="archive_content">
				<h1>
					<xsl:value-of select="//eadid"/>
				</h1>
				<xsl:apply-templates select="//c01"/>

				<hr style="width:50%;margin:auto;"/>
				<center>
					<p><a href="../../home.html">Salem Home</a> | <a href="../../17docs.html">17th
							Century Documents</a> | <a href="../../archive2.html">Archive
						Holdings</a><br/></p>
				</center>
				<br/>
				<br/>
				<div align="center">
					<font face="Verdana,Trebuchet MS" size="2" color="#000000">&#169;</font>
					<font face="Verdana,Trebuchet MS" size="1"><a
							href="http://www.virginia.edu/copyright.html" target="blank"
						>Copyright</a> 2002 by <a href="mailto:bcr@virginia.edu">Benjamin Ray</a>
						and <a href="http://www.virginia.edu/" target="_blank">The Rector and
							Visitors of the University of Virginia</a></font>
					<font face="Verdana,Trebuchet MS" size="2" color="#000000">
						<br/>
					</font>
				</div>
			</div>
		</body>
	</xsl:template>

	<xsl:template match="c01">
		<h2>
			<xsl:value-of select="did/unittitle"/>
		</h2>
		<xsl:for-each select="c02[@level='item']">
			<xsl:variable name="caption">
				<xsl:value-of select="did/unittitle"/>
				<xsl:if test="string(did/unitid)">
					<xsl:text>, </xsl:text>
					<xsl:value-of select="did/unitid"/>
				</xsl:if>
			</xsl:variable>

			<div class="document">
				<div class="thumbnail_container">
					<xsl:for-each select="did/daogrp/daoloc">
						<div class="thumb">
							<a href="../../{$medium_url}/{@id}.jpg" class="jqueryLightbox"
								title="{$caption}">
								<img src="../../{$thumb_url}/{@id}.gif" title="{$caption}"/>
							</a>
							<br/>
							<a href="../../{$large_url}/{@id}.jpg" target="_blank"
								>Enlarge<br/>Manuscript</a>
						</div>
					</xsl:for-each>
				</div>
				<div class="description">
					<b>Name: </b>
					<xsl:value-of select="did/unittitle/persname"/>
					<br/>
					<b>Document: </b>
					<xsl:value-of select="did/unittitle/text()"/>
					<br/>
					<xsl:if test="string(did/unitid)">
						<b>Number: </b>
						<xsl:value-of select="did/unitid"/>
						<br/>

					</xsl:if>
					<xsl:if test="string(did/unitdate)">
						<b>Date: </b>
						<xsl:value-of select="did/unitdate"/>
					</xsl:if>

				</div>

			</div>

			<!-- old table -->
			<!--<td>
					<xsl:value-of select="did/unittitle/persname"/>
					</td>
					<td>
					<xsl:value-of select="did/unittitle/text()"/>
					</td>
					<xsl:if test="string(did/unitid)">
					<td>
					<xsl:value-of select="did/unitid"/>
					</td>
					</xsl:if>
					<xsl:if test="string(did/unitdate)">
					<td>
					<xsl:value-of select="did/unitdate"/>
					</td>
					</xsl:if>
					<td>
					<xsl:for-each select="daogrp/daoloc">
					<img src=""/>
					</xsl:for-each>
					</td>-->

		</xsl:for-each>

	</xsl:template>
</xsl:stylesheet>
