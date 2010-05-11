<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="2.0">
	<xsl:param name="institution" select="/ead/@id"/>
	<xsl:param name="filter"/>
	<xsl:param name="id"/>

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
			<xsl:when test="$institution = 'ecca'">
				<xsl:text>archives/ecca/thumb</xsl:text>
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
			<xsl:when test="$institution = 'ecca'">
				<xsl:text>archives/ecca/medium</xsl:text>
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
			<xsl:when test="$institution = 'ecca'">
				<xsl:text>archives/ecca/large</xsl:text>
			</xsl:when>
		</xsl:choose>
	</xsl:variable>

	<xsl:template match="/">
		<html>
			<head>
				<title>
					<xsl:value-of select="//titleproper"/>
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
						<a href="../people?group.num=all">People</a>
					</li>
				</ul>
			</div>
			<div class="archive_content">
				<h1>
					<xsl:value-of select="//titleproper"/>
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
							<a href="?filter=F-H">F - H</a>
							<xsl:text> | </xsl:text>
							<a href="?filter=I-O">I - O</a>
							<xsl:text> | </xsl:text>
							<a href="?filter=P-R">P - R</a>
							<xsl:text> | </xsl:text>
							<a href="?filter=S-W">S - W</a>
							<xsl:text> | </xsl:text>
							<a href="?filter=ALL">ALL</a>
						</div>
						<xsl:if test="string($filter)">
							<xsl:choose>
								<xsl:when test="$institution = 'ecca' and $filter = 'A-B'">
									<xsl:apply-templates
										select="//c[@level='item'][substring(did/unittitle//persname/@id, 1, 1) = 'a'] | //c[@level='item'][substring(did/unittitle//persname/@id, 1, 1) = 'b']"
									/>
								</xsl:when>
								<xsl:when test="$institution = 'ecca' and $filter = 'C-E'">
									<xsl:apply-templates
										select="//c[@level='item'][substring(did/unittitle//persname/@id, 1, 1) = 'c'] | //c[@level='item'][substring(did/unittitle//persname/@id, 1, 1) = 'd'] | //c[@level='item'][substring(did/unittitle//persname/@id, 1, 1) = 'e']"
									/>
								</xsl:when>
								<xsl:when test="$institution = 'ecca' and $filter = 'F-H'">
									<xsl:apply-templates
										select="//c[@level='item'][substring(did/unittitle//persname/@id, 1, 1) = 'f'] | //c[@level='item'][substring(did/unittitle//persname/@id, 1, 1) = 'g'] | //c[@level='item'][substring(did/unittitle//persname/@id, 1, 1) = 'h']"
									/>
								</xsl:when>
								<xsl:when test="$institution = 'ecca' and $filter = 'I-O'">
									<xsl:apply-templates
										select="//c[@level='item'][substring(did/unittitle//persname/@id, 1, 1) = 'i'] | //c[@level='item'][substring(did/unittitle//persname/@id, 1, 1) = 'j'] | //c[@level='item'][substring(did/unittitle//persname/@id, 1, 1) = 'k'] | //c[@level='item'][substring(did/unittitle//persname/@id, 1, 1) = 'l'] | //c[@level='item'][substring(did/unittitle//persname/@id, 1, 1) = 'm'] | //c[@level='item'][substring(did/unittitle//persname/@id, 1, 1) = 'n'] | //c[@level='item'][substring(did/unittitle//persname/@id, 1, 1) = 'o']"
									/>
								</xsl:when>
								<xsl:when test="$institution = 'ecca' and $filter = 'P-R'">
									<xsl:apply-templates
										select="//c[@level='item'][substring(did/unittitle//persname/@id, 1, 1) = 'p'] | //c[@level='item'][substring(did/unittitle//persname/@id, 1, 1) = 'q'] | //c[@level='item'][substring(did/unittitle//persname/@id, 1, 1) = 'r']"
									/>
								</xsl:when>
								<xsl:when test="$institution = 'ecca' and $filter = 'S-W'">
									<xsl:apply-templates
										select="//c[@level='item'][substring(did/unittitle//persname/@id, 1, 1) = 's'] | //c[@level='item'][substring(did/unittitle//persname/@id, 1, 1) = 't'] | //c[@level='item'][substring(did/unittitle//persname/@id, 1, 1) = 'u'] | //c[@level='item'][substring(did/unittitle//persname/@id, 1, 1) = 'v'] | //c[@level='item'][substring(did/unittitle//persname/@id, 1, 1) = 'w']"
									/>
								</xsl:when>
								<xsl:when test="$institution = 'ecca' and $filter = 'ALL'">
									<xsl:apply-templates select="//c[@level='series']"/>
								</xsl:when>
							</xsl:choose>
						</xsl:if>
					</xsl:when>
					<xsl:otherwise>
						<xsl:choose>
							<xsl:when test="//c[@level='series']">
								<xsl:apply-templates select="//c[@level='series']"/>
							</xsl:when>
							<xsl:otherwise>
								<xsl:apply-templates select="//c[@level='item']"/>
							</xsl:otherwise>
						</xsl:choose>
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



	<xsl:template match="c[@level='series']">
		<h2>
			<xsl:value-of select="did/unittitle"/>
		</h2>
		<xsl:apply-templates select="descendant::c[@level='item']"/>
	</xsl:template>

	<xsl:template match="c[@level='item']">
		<xsl:variable name="caption">
			<xsl:value-of select="did/unittitle"/>
			<xsl:if test="string(did/unitid)">
				<xsl:text>, </xsl:text>
				<xsl:value-of select="did/unitid"/>
			</xsl:if>
		</xsl:variable>

		<div class="document">
			<a name="{@id}"/>
			<div class="thumbnail_container">
				<xsl:for-each select="did/daogrp/daoloc">
					<div class="thumb">
						<xsl:choose>
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
						<xsl:if test="@label">(<xsl:value-of select="@label"/>)<br/></xsl:if>
						<a href="../{$large_url}/{@id}.jpg" target="_blank"
							>Enlarge<br/>Manuscript</a>
					</div>
				</xsl:for-each>
			</div>
			<div class="description">
				<xsl:if test="did/unittitle">
					<b>Document: </b>
					<xsl:apply-templates select="did/unittitle"/>
					<br/>
				</xsl:if>

				<xsl:if test="string(did/unitid)">
					<b>ID Number: </b>
					<xsl:for-each select="did/unitid">
						<xsl:value-of select="."/>
						<xsl:if test="not(position()=last())">
							<xsl:text>, </xsl:text>
						</xsl:if>
					</xsl:for-each>
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
				<xsl:if test="$institution = 'ecca'">
					<b>Volume: </b>
					<xsl:choose>
						<xsl:when
							test="contains(parent::c[@level='series']/did/unittitle, 'Volume 1')">
							<xsl:text>1</xsl:text>
						</xsl:when>
						<xsl:when
							test="contains(parent::c[@level='series']/did/unittitle, 'Volume 2')">
							<xsl:text>2</xsl:text>
						</xsl:when>
					</xsl:choose>
				</xsl:if>
			</div>
		</div>
	</xsl:template>

	<xsl:template match="persname">
		<xsl:choose>
			<xsl:when test="string(@id)">
				<a
					href="../texts/salemSearch.htm?q=name_text:{@id}&amp;rows=20&amp;start=0&amp;name={.}">
					<xsl:value-of select="."/>
				</a>
			</xsl:when>
			<xsl:otherwise>
				<xsl:value-of select="."/>
			</xsl:otherwise>
		</xsl:choose>
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
