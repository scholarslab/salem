<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="2.0">
	<xsl:param name="institution" select="/ead/@id"/>
	<xsl:param name="filter"/>

	<xsl:variable name="thumb_url">
		<xsl:choose>
			<xsl:when test="$institution = 'BPL'">
				<xsl:text>archives/BPL/gifs</xsl:text>
			</xsl:when>
			<xsl:when test="$institution = 'MassHist'">
				<xsl:text>archives/MassHist/gifs</xsl:text>
			</xsl:when>
			<xsl:when test="$institution = 'Suffolk'">
				<xsl:text>archives/Suffolk/gifs</xsl:text>
			</xsl:when>
			<xsl:when test="$institution = 'MA135'">
				<xsl:text>archives/MA135/gifs</xsl:text>
			</xsl:when>
			<xsl:when test="$institution = 'JudVol'">
				<xsl:text>archives/JudVol/gifs</xsl:text>
			</xsl:when>
			<xsl:when test="$institution = 'MidSex'">
				<xsl:text>archives/MidSex/gifs</xsl:text>
			</xsl:when>
			<xsl:when test="$institution = 'SCJ'">
				<xsl:text>archives/SCJ/gifs</xsl:text>
			</xsl:when>
			<xsl:when test="$institution = 'MEHS'">
				<xsl:text>archives/MEHS/gifs</xsl:text>
			</xsl:when>
			<xsl:when test="$institution = 'eia'">
				<xsl:text>archives/essex/eia/gifs</xsl:text>
			</xsl:when>
		</xsl:choose>
	</xsl:variable>

	<xsl:variable name="medium_url">
		<xsl:choose>
			<xsl:when test="$institution = 'BPL'">
				<xsl:text>archives/BPL/SMALL</xsl:text>
			</xsl:when>
			<xsl:when test="$institution = 'MassHist'">
				<xsl:text>archives/MassHist/medium</xsl:text>
			</xsl:when>
			<xsl:when test="$institution = 'Suffolk'">
				<xsl:text>archives/Suffolk/small</xsl:text>
			</xsl:when>
			<xsl:when test="$institution = 'MA135'">
				<xsl:text>archives/MA135/small</xsl:text>
			</xsl:when>
			<xsl:when test="$institution = 'JudVol'">
				<xsl:text>archives/JudVol/small</xsl:text>
			</xsl:when>
			<xsl:when test="$institution = 'MidSex'">
				<xsl:text>archives/MidSex/small</xsl:text>
			</xsl:when>
			<xsl:when test="$institution = 'SCJ'">
				<xsl:text>archives/SCJ/small</xsl:text>
			</xsl:when>
			<xsl:when test="$institution = 'MEHS'">
				<xsl:text>archives/MEHS/small</xsl:text>
			</xsl:when>
			<xsl:when test="$institution = 'eia'">
				<xsl:text>archives/essex/eia/small</xsl:text>
			</xsl:when>
		</xsl:choose>
	</xsl:variable>

	<xsl:variable name="large_url">
		<xsl:choose>
			<xsl:when test="$institution = 'BPL'">
				<xsl:text>archives/BPL/LARGE</xsl:text>
			</xsl:when>
			<xsl:when test="$institution = 'MassHist'">
				<xsl:text>archives/MassHist/large</xsl:text>
			</xsl:when>
			<xsl:when test="$institution = 'Suffolk'">
				<xsl:text>archives/Suffolk/large</xsl:text>
			</xsl:when>
			<xsl:when test="$institution = 'MA135'">
				<xsl:text>archives/MA135/large</xsl:text>
			</xsl:when>
			<xsl:when test="$institution = 'JudVol'">
				<xsl:text>archives/JudVol/large</xsl:text>
			</xsl:when>
			<xsl:when test="$institution = 'MidSex'">
				<xsl:text>archives/MidSex/large</xsl:text>
			</xsl:when>
			<xsl:when test="$institution = 'SCJ'">
				<xsl:text>archives/SCJ/large</xsl:text>
			</xsl:when>
			<xsl:when test="$institution = 'MEHS'">
				<xsl:text>archives/MEHS/large</xsl:text>
			</xsl:when>
			<xsl:when test="$institution = 'eia'">
				<xsl:text>archives/essex/eia/large</xsl:text>
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
				<link type="text/css" href="../style.css" rel="stylesheet"/>
				<script type="text/javascript" src="../javascript/jquery-1.2.6.min.js"/>
				<script type="text/javascript" src="../javascript/jquery.lightbox-0.5.min.js"/>
				<script type="text/javascript" src="../javascript/salem-archives-lightbox.js"/>
			</head>
		</html>
		<body>
			<div class="header">
				<img src="../images/startylw2.jpg" width="621" height="90" border="1"/>
				<ul class="menu">
					<li class="menu_item menu_home" style="width:13%;">
						<a href="../home.html">Home</a>
					</li>
					<li class="menu_item menu_archives" style="width:15%">
						<a href="../archive2.html">Archives</a>
					</li>
					<li class="menu_item menu_books" style="width:24%;">
						<a href="../books.html">Books &amp; Letters</a>
					</li>
					<li class="menu_item menu_documents" style="width:20%;">
						<a href="../17docs.html">Documents</a>
					</li>
					<li class="menu_item menu_maps" style="width:13%;">
						<a href="../maps.html">Maps</a>
					</li>
					<li class="menu_item menu_people" style="width:15%;">
						<a
							href="../saxon-salem/servlet/SaxonServlet?source=salem/texts/names.xml&amp;style=salem/xsl/dynaxml.xsl&amp;group.num=all&amp;clear-stylesheet-cache=yes"
							>People</a>
					</li>
				</ul>
			</div>
			<div class="archive_content">
				<h1>
					<xsl:value-of select="//eadid"/>
				</h1>

				<xsl:apply-templates select="/ead/archdesc"/>

				<p>
					<xsl:value-of select="//author"/>
				</p>
				<xsl:choose>
					<xsl:when test="$institution = 'ecca'">
						<div style="text-align:center">
							<a href="?filter=A-B">A - B</a>
							<xsl:text> | </xsl:text>
							<a href="?filter=C-E">C - E</a>
							<xsl:text> | </xsl:text>
							<a href="?filter=C-E">F - H</a>
							<xsl:text> | </xsl:text>
							<a href="?filter=I-O">I - O</a>
							<xsl:text> | </xsl:text>
							<a href="?filter=P-R">P - R</a>
							<xsl:text> | </xsl:text>
							<a href="?filter=S-W">S - W</a>
						</div>
						<xsl:if test="string($filter)">
							<xsl:apply-templates select="//c01"/>
						</xsl:if>
					</xsl:when>
					<xsl:otherwise>
						<xsl:apply-templates select="//c01"/>
					</xsl:otherwise>
				</xsl:choose>


				<hr style="width:50%;margin:auto;"/>
				<center>
					<p><a href="../home.html">Salem Home</a> | <a href="../17docs.html">17th Century
							Documents</a> | <a href="../archive2.html">Archive Holdings</a><br/></p>
				</center>
				<br/>
				<br/>
				<div align="center">
					<font face="Verdana,Trebuchet MS" size="2" color="#000000">&#169;</font>
					<font face="Verdana,Trebuchet MS" size="1"><a
							href="http://www.virginia.edu/copyright.html" target="blank"
							>Copyright</a> 2002 by <a href="mailto:bcr@virginia.edu">Benjamin
							Ray</a> and <a href="http://www.virginia.edu/" target="_blank">The
							Rector and Visitors of the University of Virginia</a></font>
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
		<xsl:choose>
			<xsl:when test="$institution = 'ecca' and $filter = 'A-B'">
				<xsl:apply-templates
					select="c02[@level='item'][substring(did/unittitle/persname, 1, 1) = 'A'] | c02[@level='item'][substring(did/unittitle/persname, 1, 1) = 'B']"
				/>
			</xsl:when>
			<xsl:when test="$institution = 'ecca' and $filter = 'C-E'">
				<xsl:apply-templates
					select="c02[@level='item'][substring(did/unittitle/persname, 1, 1) = 'C'] | c02[@level='item'][substring(did/unittitle/persname, 1, 1) = 'D'] | c02[@level='item'][substring(did/unittitle/persname, 1, 1) = 'E']"
				/>
			</xsl:when>
			<xsl:when test="$institution = 'ecca' and $filter = 'F-H'">
				<xsl:apply-templates
					select="c02[@level='item'][substring(did/unittitle/persname, 1, 1) = 'F'] | c02[@level='item'][substring(did/unittitle/persname, 1, 1) = 'G'] | c02[@level='item'][substring(did/unittitle/persname, 1, 1) = 'H']"
				/>
			</xsl:when>
			<xsl:when test="$institution = 'ecca' and $filter = 'I-O'">
				<xsl:apply-templates
					select="c02[@level='item'][substring(did/unittitle/persname, 1, 1) = 'I'] | c02[@level='item'][substring(did/unittitle/persname, 1, 1) = 'J'] | c02[@level='item'][substring(did/unittitle/persname, 1, 1) = 'K'] | c02[@level='item'][substring(did/unittitle/persname, 1, 1) = 'L'] | c02[@level='item'][substring(did/unittitle/persname, 1, 1) = 'M'] | c02[@level='item'][substring(did/unittitle/persname, 1, 1) = 'N'] | c02[@level='item'][substring(did/unittitle/persname, 1, 1) = 'O']"
				/>
			</xsl:when>
			<xsl:when test="$institution = 'ecca' and $filter = 'P-R'">
				<xsl:apply-templates
					select="c02[@level='item'][substring(did/unittitle/persname, 1, 1) = 'P'] | c02[@level='item'][substring(did/unittitle/persname, 1, 1) = 'Q'] | c02[@level='item'][substring(did/unittitle/persname, 1, 1) = 'R']"
				/>
			</xsl:when>
			<xsl:when test="$institution = 'ecca' and $filter = 'S-W'">
				<xsl:apply-templates
					select="c02[@level='item'][substring(did/unittitle/persname, 1, 1) = 'S'] | c02[@level='item'][substring(did/unittitle/persname, 1, 1) = 'T'] | c02[@level='item'][substring(did/unittitle/persname, 1, 1) = 'U'] | c02[@level='item'][substring(did/unittitle/persname, 1, 1) = 'V'] | c02[@level='item'][substring(did/unittitle/persname, 1, 1) = 'W']"
				/>
			</xsl:when>
			<xsl:when test="not($institution = 'ecca')">
				<xsl:apply-templates select="c02[@level='item']"/>
			</xsl:when>
		</xsl:choose>

	</xsl:template>

	<xsl:template match="c02[@level='item']">
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
						<xsl:choose>
							<xsl:when test="$institution = 'ecca'">
								<xsl:variable name="volume">
									<xsl:choose>
										<xsl:when
											test="contains(ancestor::c01/did/unittitle, 'Volume 1')">
											<xsl:text>vol1</xsl:text>
										</xsl:when>
										<xsl:when
											test="contains(ancestor::c01/did/unittitle, 'Volume 2')">
											<xsl:text>vol2</xsl:text>
										</xsl:when>
									</xsl:choose>
								</xsl:variable>
								<a href="../archives/essex/ecca/{$volume}/small/{@id}.jpg"
									class="jqueryLightbox" title="{$caption}">
									<img src="../archives/essex/ecca/{$volume}/gifs/{@id}.gif"
										title="{$caption}"/>
								</a>
								<br/>
								<a href="../archives/essex/ecca/{$volume}/large/{@id}.jpg"
									target="_blank">Enlarge<br/>Manuscript</a>
							</xsl:when>
							<xsl:when test="not($institution = 'MA135')">
								<a href="../{$medium_url}/{@id}.jpg" class="jqueryLightbox"
									title="{$caption}">
									<img src="../{$thumb_url}/{@id}.gif" title="{$caption}"/>
								</a>
							</xsl:when>
							<xsl:otherwise>
								<img src="../{$thumb_url}/{@id}.gif" title="{$caption}"
									style="max-height:60px;max-width:60px;"/>
							</xsl:otherwise>
						</xsl:choose>
						<br/>
						<xsl:if test="not($institution = 'ecca')">
							<xsl:if test="@label">(<xsl:value-of select="@label"/>)<br/></xsl:if>
							<a href="../{$large_url}/{@id}.jpg" target="_blank"
								>Enlarge<br/>Manuscript</a>
						</xsl:if>
					</div>
				</xsl:for-each>
			</div>
			<div class="description">
				<xsl:if test="string(did/unittitle/persname)">
					<xsl:choose>
						<xsl:when test="did/unittitle/persname[2]">
							<b>Names: </b>
						</xsl:when>
						<xsl:otherwise>
							<b>Name: </b>
						</xsl:otherwise>
					</xsl:choose>
					<xsl:for-each select="did/unittitle/persname">
						<xsl:value-of select="."/>
						<xsl:if test="not(position() = last())">
							<xsl:text>, </xsl:text>
						</xsl:if>
					</xsl:for-each>
					<br/>
				</xsl:if>

				<xsl:if test="string(normalize-space(did/unittitle/text()))">
					<b>Document: </b>
					<xsl:value-of select="did/unittitle/text()"/>
					<br/>
				</xsl:if>

				<xsl:if test="string(did/unitid)">
					<b>ID Number: </b>
					<xsl:value-of select="did/unitid"/>
					<br/>
				</xsl:if>

				<xsl:apply-templates select="did/container"/>

				<xsl:if test="string(did/unitdate)">
					<b>Date: </b>
					<xsl:value-of select="did/unitdate"/>
					<br/>
				</xsl:if>
				<xsl:if test="string(did/materialspec)">
					<xsl:apply-templates select="did/materialspec"/>
					<br/>
				</xsl:if>
				<xsl:if test="bibliography">
					<xsl:apply-templates select="bibliography/bibref"/>
					<br/>
				</xsl:if>
			</div>
		</div>
	</xsl:template>

	<xsl:template match="container">
		<b>Container: </b>
		<xsl:if test="@type">
			<xsl:value-of select="@type"/>
			<xsl:text>: </xsl:text>
		</xsl:if>
		<xsl:value-of select="."/>
		<br/>
	</xsl:template>

	<xsl:template match="materialspec">
		<xsl:if test="@label">
			<b><xsl:value-of select="@label"/>: </b>
			<xsl:value-of select="."/>
		</xsl:if>
	</xsl:template>

	<xsl:template match="bibref">
		<b>Reference: </b>
		<xsl:apply-templates/>
	</xsl:template>

	<xsl:template match="archdesc">
		<xsl:apply-templates select="scopecontent | abstract | userestrict | accessrestrict"/>
	</xsl:template>

	<xsl:template match="userestrict | accessrestrict">
		<div>
			<b>Restrictions:</b>
			<xsl:apply-templates/>
		</div>
	</xsl:template>

	<xsl:template match="scopecontent/head">
		<h3>
			<xsl:value-of select="."/>
		</h3>
	</xsl:template>

	<xsl:template match="p">
		<p>
			<xsl:apply-templates/>
		</p>
	</xsl:template>

	<xsl:template match="ref">
		<a href="{@href}">
			<xsl:apply-templates/>
		</a>
	</xsl:template>

</xsl:stylesheet>
