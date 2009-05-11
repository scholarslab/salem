<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="2.0"
	xmlns:cinclude="http://apache.org/cocoon/include/1.0">

	<xsl:param name="q"/>
	<xsl:param name="rows"/>
	<xsl:param name="start"/>
	<xsl:param name="query">
		<xsl:choose>
			<xsl:when test="contains(substring-before($q, 'date:'), 'AND')">
				<xsl:value-of select="substring-before($q, ' AND')"/>
			</xsl:when>
			<xsl:when test="contains($q, 'name_text')"/>
			<xsl:when test="contains($q, 'date:') and not(contains($q, 'AND'))"/>
			<xsl:otherwise>
				<xsl:value-of select="$q"/>
			</xsl:otherwise>
		</xsl:choose>
	</xsl:param>

	<xsl:template match="/">
		<html>
			<head>
				<title>
					<xsl:text>Browse the Salem Witchcraft Papers Names Index</xsl:text>
				</title>
				<link type="text/css" href="../style.css" rel="stylesheet"/>
				<script type="text/javascript" src="../javascript/jquery-1.2.6.min.js"/>
				<script type="text/javascript" src="../javascript/search_form.js"/>
			</head>
		</html>
		<body>
			<div class="header">
				<img src="../images/startdoc2.jpg" width="621" height="90" border="1"/>
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
							href="/saxon-salem/servlet/SaxonServlet?source=salem/texts/names.xml&amp;style=salem/xsl/dynaxml.xsl&amp;group.num=all&amp;clear-stylesheet-cache=yes"
							>People</a>
					</li>
				</ul>
			</div>
			<div class="content_container">
				<div class="options">
					<a href="transcripts.html">Return to The Salem Witchcraft Papers</a>
				</div>
				<div class="search_content">
					<h1>Search the Salem Witchcraft Papers</h1>
					<form id="search_form" method="GET">
						<xsl:text>Search for word or phrase: </xsl:text>
						<input type="hidden" name="rows" value="10"/>
						<input type="hidden" name="start" value="0"/>
						<xsl:choose>
							<xsl:when test="contains($q, 'name_text')">
								<input type="text" name="q" id="q"/>
							</xsl:when>
							<xsl:otherwise>
								<input type="text" name="q" value="{$query}" id="q"/>
							</xsl:otherwise>
						</xsl:choose>
						<br/>
						<xsl:text>and/or documents dated
						(1692/1693, excluding some undated items):</xsl:text>
						<br/>
						<xsl:text>year: </xsl:text>
						<select id="range">
							<option value="select">Select...</option>
							<option value="exactly">Exactly</option>
							<option value="after">After</option>
							<option value="before">Before</option>
							<option value="from">From...</option>
						</select>
						<select id="year">
							<option>1692</option>
							<option>1693</option>
						</select>
						<xsl:text>month: </xsl:text>
						<select id="month">
							<option value="01">Jan. </option>
							<option value="02">Feb. </option>
							<option value="03">Mar. </option>
							<option value="04">Apr. </option>
							<option value="05">May </option>
							<option value="06">Jun. </option>
							<option value="07">Jul. </option>
							<option value="08">Aug. </option>
							<option value="09">Sep. </option>
							<option value="10">Oct. </option>
							<option value="11">Nov. </option>
							<option value="12">Dec. </option>
						</select>
						<xsl:text>day: </xsl:text>
						<select id="day">
							<option>01 </option>
							<option>02 </option>
							<option>03 </option>
							<option>04 </option>
							<option>05 </option>
							<option>06 </option>
							<option>07 </option>
							<option>08 </option>
							<option>09 </option>
							<option>10 </option>
							<option>11 </option>
							<option>12 </option>
							<option>13 </option>
							<option>14 </option>
							<option>15 </option>
							<option>16 </option>
							<option>17 </option>
							<option>18 </option>
							<option>19 </option>
							<option>20 </option>
							<option>21 </option>
							<option>22 </option>
							<option>23 </option>
							<option>24 </option>
							<option>25 </option>
							<option>26 </option>
							<option>27 </option>
							<option>28 </option>
							<option>29 </option>
							<option>30 </option>
							<option>31 </option>
						</select>
						<div class="toDate_hidden">
							<xsl:text>To: </xsl:text>
							<select id="year2">
								<option>1692</option>
								<option>1693</option>
							</select>
							<xsl:text>month: </xsl:text>
							<select id="month2">
								<option value="01">Jan. </option>
								<option value="02">Feb. </option>
								<option value="03">Mar. </option>
								<option value="04">Apr. </option>
								<option value="05">May </option>
								<option value="06">Jun. </option>
								<option value="07">Jul. </option>
								<option value="08">Aug. </option>
								<option value="09">Sep. </option>
								<option value="10">Oct. </option>
								<option value="11">Nov. </option>
								<option value="12">Dec. </option>
							</select>
							<xsl:text>day: </xsl:text>
							<select id="day2">
								<option>01 </option>
								<option>02 </option>
								<option>03 </option>
								<option>04 </option>
								<option>05 </option>
								<option>06 </option>
								<option>07 </option>
								<option>08 </option>
								<option>09 </option>
								<option>10 </option>
								<option>11 </option>
								<option>12 </option>
								<option>13 </option>
								<option>14 </option>
								<option>15 </option>
								<option>16 </option>
								<option>17 </option>
								<option>18 </option>
								<option>19 </option>
								<option>20 </option>
								<option>21 </option>
								<option>22 </option>
								<option>23 </option>
								<option>24 </option>
								<option>25 </option>
								<option>26 </option>
								<option>27 </option>
								<option>28 </option>
								<option>29 </option>
								<option>30 </option>
								<option>31 </option>
							</select>
						</div>
						<br/>
						<br/>
						<input type="submit" value="Search" id="search_button"/>
						<input type="button" value="Clear Results" onclick="window.location.href='salemSearch.htm'"/>
					</form>
					<div id="search">
						<xsl:if test="$q">							
							<cinclude:include src="cocoon:/search_results?q={$q}"/>
						</xsl:if>
					</div>
				</div>
			</div>
			<div class="footer">© Copyright 2002 by Benjamin Ray and The Rector and Visitors of the
				University of Virginia</div>
		</body>
	</xsl:template>
</xsl:stylesheet>
