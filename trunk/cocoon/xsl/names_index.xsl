<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="2.0">
	<xsl:output encoding="UTF-8" method="xhtml"/>
	<xsl:param name="letter"/>

	<xsl:template match="/">
		<html>
			<head>
				<title>
					test
				</title>
				<link type="text/css" href="style.css" rel="stylesheet"/>
			</head>
		</html>
		<body>
			<div class="header">
				<img src="images/startdoc2.jpg" width="621" height="90" border="1"/>
				<ul class="menu">
					<li class="menu_item menu_home" style="width:13%;">
						<a href="home.html">Home</a>
					</li>
					<li class="menu_item menu_archives" style="width:15%">
						<a href="archive2.html">Archives</a>
					</li>
					<li class="menu_item menu_books" style="width:24%;">
						<a href="books.html">Books &amp; Letters</a>
					</li>
					<li class="menu_item menu_documents" style="width:20%;">
						<a href="17docs.html">Documents</a>
					</li>
					<li class="menu_item menu_maps" style="width:13%;">
						<a href="maps.html">Maps</a>
					</li>
					<li class="menu_item menu_people" style="width:15%;">
						<a
							href="/saxon-salem/servlet/SaxonServlet?source=salem/texts/names.xml&amp;style=salem/xsl/dynaxml.xsl&amp;group.num=all&amp;clear-stylesheet-cache=yes"
							>People</a>
					</li>
				</ul>
			</div>
			<div class="content_container">
				<div class="content">
					test
				</div>
			</div>
			<div class="footer">© Copyright 2002 by Benjamin Ray and The Rector and Visitors of the
				University of Virginia</div>
		</body>
	</xsl:template>

</xsl:stylesheet>
