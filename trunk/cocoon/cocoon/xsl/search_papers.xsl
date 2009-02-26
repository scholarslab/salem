<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="2.0"
	xmlns:cinclude="http://apache.org/cocoon/include/1.0">

	<xsl:param name="q"/>
	<xsl:param name="rows"/>
	<xsl:param name="start"/>

	<xsl:template match="/">
		<html>
			<head>
				<title>
					<xsl:text>Browse the Salem Witchcraft Papers Names Index</xsl:text>
				</title>
				<link type="text/css" href="../style.css" rel="stylesheet"/>
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
				<div class="search_content">
					<h1>Search the Salem Witchcraft Papers</h1>
					<form id="search_form" method="GET">
						<input type="hidden" name="rows" value="10"/>
						<input type="hidden" name="start" value="0"/>
						<input type="text" name="q" value="{$q}"/>
						<input type="submit" value="Submit"/>
						<input type="reset" value="Clear"/>
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
