<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="2.0">
	<xsl:output encoding="UTF-8" method="xhtml"/>
	<xsl:param name="letter"/>

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
					<h1>Browse the Salem Witchcraft Papers Names Index</h1>
					<div style="width:100%;text-align:center;">
						<ul class="letter_list">
							<xsl:choose>
								<xsl:when test="$letter = 'a'">
									<li class="letter_selected">A</li>
								</xsl:when>
								<xsl:otherwise>
									<li class="letter">
										<a href="?letter=a">A</a>
									</li>
								</xsl:otherwise>
							</xsl:choose>
							<xsl:choose>
								<xsl:when test="$letter = 'b'">
									<li class="letter_selected">B</li>
								</xsl:when>
								<xsl:otherwise>
									<li class="letter">
										<a href="?letter=b">B</a>
									</li>
								</xsl:otherwise>
							</xsl:choose>
							<xsl:choose>
								<xsl:when test="$letter = 'c'">
									<li class="letter_selected">C</li>
								</xsl:when>
								<xsl:otherwise>
									<li class="letter">
										<a href="?letter=c">C</a>
									</li>
								</xsl:otherwise>
							</xsl:choose>
							<xsl:choose>
								<xsl:when test="$letter = 'd'">
									<li class="letter_selected">D</li>
								</xsl:when>
								<xsl:otherwise>
									<li class="letter">
										<a href="?letter=d">D</a>
									</li>
								</xsl:otherwise>
							</xsl:choose>
							<xsl:choose>
								<xsl:when test="$letter = 'e'">
									<li class="letter_selected">E</li>
								</xsl:when>
								<xsl:otherwise>
									<li class="letter">
										<a href="?letter=e">E</a>
									</li>
								</xsl:otherwise>
							</xsl:choose>
							<xsl:choose>
								<xsl:when test="$letter = 'f'">
									<li class="letter_selected">F</li>
								</xsl:when>
								<xsl:otherwise>
									<li class="letter">
										<a href="?letter=f">F</a>
									</li>
								</xsl:otherwise>
							</xsl:choose>
							<xsl:choose>
								<xsl:when test="$letter = 'g'">
									<li class="letter_selected">G</li>
								</xsl:when>
								<xsl:otherwise>
									<li class="letter">
										<a href="?letter=g">G</a>
									</li>
								</xsl:otherwise>
							</xsl:choose>
							<xsl:choose>
								<xsl:when test="$letter = 'h'">
									<li class="letter_selected">H</li>
								</xsl:when>
								<xsl:otherwise>
									<li class="letter">
										<a href="?letter=h">H</a>
									</li>
								</xsl:otherwise>
							</xsl:choose>
							<xsl:choose>
								<xsl:when test="$letter = 'i'">
									<li class="letter_selected">I</li>
								</xsl:when>
								<xsl:otherwise>
									<li class="letter">
										<a href="?letter=i">I</a>
									</li>
								</xsl:otherwise>
							</xsl:choose>
							<xsl:choose>
								<xsl:when test="$letter = 'j'">
									<li class="letter_selected">J</li>
								</xsl:when>
								<xsl:otherwise>
									<li class="letter">
										<a href="?letter=j">J</a>
									</li>
								</xsl:otherwise>
							</xsl:choose>
							<xsl:choose>
								<xsl:when test="$letter = 'k'">
									<li class="letter_selected">K</li>
								</xsl:when>
								<xsl:otherwise>
									<li class="letter">
										<a href="?letter=k">K</a>
									</li>
								</xsl:otherwise>
							</xsl:choose>
							<xsl:choose>
								<xsl:when test="$letter = 'l'">
									<li class="letter_selected">L</li>
								</xsl:when>
								<xsl:otherwise>
									<li class="letter">
										<a href="?letter=l">L</a>
									</li>
								</xsl:otherwise>
							</xsl:choose>
							<xsl:choose>
								<xsl:when test="$letter = 'm'">
									<li class="letter_selected">M</li>
								</xsl:when>
								<xsl:otherwise>
									<li class="letter">
										<a href="?letter=m">M</a>
									</li>
								</xsl:otherwise>
							</xsl:choose>
							<xsl:choose>
								<xsl:when test="$letter = 'n'">
									<li class="letter_selected">N</li>
								</xsl:when>
								<xsl:otherwise>
									<li class="letter">
										<a href="?letter=n">N</a>
									</li>
								</xsl:otherwise>
							</xsl:choose>
							<li class="letter">
								<a href="?letter=o">O</a>
							</li>
							<li class="letter">
								<a href="?letter=p">P</a>
							</li>
							<li class="letter">
								<a href="?letter=r">R</a>
							</li>
							<li class="letter">
								<a href="?letter=s">S</a>
							</li>
							<li class="letter">
								<a href="?letter=t">T</a>
							</li>
							<li class="letter">
								<a href="?letter=v">V</a>
							</li>
							<li class="letter">
								<a href="?letter=w">W</a>
							</li>
						</ul>
					</div>
					<xsl:if test="string($letter)">
						<h1 class="letter_header">
							<xsl:value-of
								select="translate($letter, 'abcdefghijklmnopqrstuvwxyz', 'ABCDEFGHIJKLMNOPQRSTUVWXYZ')"
							/>
						</h1>
						<ul class="names_list">
							<xsl:apply-templates select="descendant::lst[@name='name_facet']"/>
						</ul>
					</xsl:if>

				</div>
			</div>
			<div class="footer">© Copyright 2002 by Benjamin Ray and The Rector and Visitors of the
				University of Virginia</div>
		</body>
	</xsl:template>

	<xsl:template match="lst[@name='name_facet']">
		<li class="names_column">
			<h3 style="text-align:left;">
				<xsl:value-of
					select="translate($letter, 'abcdefghijklmnopqrstuvwxyz', 'ABCDEFGHIJKLMNOPQRSTUVWXYZ')"/>
				<xsl:text>a - </xsl:text>
				<xsl:value-of
					select="translate($letter, 'abcdefghijklmnopqrstuvwxyz', 'ABCDEFGHIJKLMNOPQRSTUVWXYZ')"/>
				<xsl:text>g</xsl:text>
			</h3>
			<ul style="display:table;width:100%;">
				<xsl:apply-templates
					select="int[substring(@name, 1, 2) = concat($letter, 'a')] | int[substring(@name, 1, 2) = concat($letter, 'b')] | int[substring(@name, 1, 2) = concat($letter, 'c')] | int[substring(@name, 1, 2) = concat($letter, 'd')] | int[substring(@name, 1, 2) = concat($letter, 'e')] | int[substring(@name, 1, 2) = concat($letter, 'f')] | int[substring(@name, 1, 2) = concat($letter, 'g')]">
					<xsl:sort select="@name"/>
				</xsl:apply-templates>
			</ul>
		</li>
		<li class="names_column">
			<h3 style="text-align:left;">
				<xsl:value-of
					select="translate($letter, 'abcdefghijklmnopqrstuvwxyz', 'ABCDEFGHIJKLMNOPQRSTUVWXYZ')"/>
				<xsl:text>h - </xsl:text>
				<xsl:value-of
					select="translate($letter, 'abcdefghijklmnopqrstuvwxyz', 'ABCDEFGHIJKLMNOPQRSTUVWXYZ')"/>
				<xsl:text>n</xsl:text>
			</h3>
			<ul style="display:table;width:100%;">
				<xsl:apply-templates
					select="int[substring(@name, 1, 2) = concat($letter, 'h')] | int[substring(@name, 1, 2) = concat($letter, 'i')] | int[substring(@name, 1, 2) = concat($letter, 'j')] | int[substring(@name, 1, 2) = concat($letter, 'k')] | int[substring(@name, 1, 2) = concat($letter, 'l')] | int[substring(@name, 1, 2) = concat($letter, 'm')] | int[substring(@name, 1, 2) = concat($letter, 'n')]">
					<xsl:sort select="@name"/>
				</xsl:apply-templates>
			</ul>
		</li>
		<li class="names_column">
			<h3 style="text-align:left;">
				<xsl:value-of
					select="translate($letter, 'abcdefghijklmnopqrstuvwxyz', 'ABCDEFGHIJKLMNOPQRSTUVWXYZ')"/>
				<xsl:text>o - </xsl:text>
				<xsl:value-of
					select="translate($letter, 'abcdefghijklmnopqrstuvwxyz', 'ABCDEFGHIJKLMNOPQRSTUVWXYZ')"/>
				<xsl:text>t</xsl:text>
			</h3>
			<ul style="display:table;width:100%;">
				<xsl:apply-templates
					select="int[substring(@name, 1, 2) = concat($letter, 'o')] | int[substring(@name, 1, 2) = concat($letter, 'p')] | int[substring(@name, 1, 2) = concat($letter, 'q')] | int[substring(@name, 1, 2) = concat($letter, 'r')] | int[substring(@name, 1, 2) = concat($letter, 's')] | int[substring(@name, 1, 2) = concat($letter, 't')]">
					<xsl:sort select="@name"/>
				</xsl:apply-templates>
			</ul>
		</li>
		<li class="names_column">
			<h3 style="text-align:left;">
				<xsl:value-of
					select="translate($letter, 'abcdefghijklmnopqrstuvwxyz', 'ABCDEFGHIJKLMNOPQRSTUVWXYZ')"/>
				<xsl:text>u - </xsl:text>
				<xsl:value-of
					select="translate($letter, 'abcdefghijklmnopqrstuvwxyz', 'ABCDEFGHIJKLMNOPQRSTUVWXYZ')"/>
				<xsl:text>z</xsl:text>
			</h3>
			<ul style="display:table;width:100%;">
				<xsl:apply-templates
					select="int[substring(@name, 1, 2) = concat($letter, 'u')] | int[substring(@name, 1, 2) = concat($letter, 'v')] | int[substring(@name, 1, 2) = concat($letter, 'w')] | int[substring(@name, 1, 2) = concat($letter, 'x')] | int[substring(@name, 1, 2) = concat($letter, 'y')] | int[substring(@name, 1, 2) = concat($letter, 'z')]">
					<xsl:sort select="@name"/>
				</xsl:apply-templates>
			</ul>
		</li>
	</xsl:template>

	<xsl:template match="int">
		<xsl:if test="string(substring-after(@name, '|'))">
			<li class="name">
				<a href="search_results?q=name_text:{substring-before(@name, '|')}">
					<xsl:value-of select="substring-after(@name, '|')"/>
				</a>
			</li>
		</xsl:if>
	</xsl:template>

</xsl:stylesheet>
