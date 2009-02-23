<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="2.0">
	<xsl:output method="xhtml" encoding="UTF-8"/>
	<xsl:param name="div_id"/>
	<xsl:param name="print"/>

	<xsl:template match="/">
		<html>
			<head>
				<title>
					<xsl:value-of select="/TEI.2/teiHeader/fileDesc/titleStmt/title[@type='245']"/>
				</title>
				<link type="text/css" href="style.css" rel="stylesheet"/>
			</head>
		</html>
		<body>
			<xsl:choose>
				<xsl:when test="$print='yes'">
					<xsl:choose>
						<xsl:when test="string($div_id)">
							<xsl:apply-templates select="descendant::node()[@id = $div_id]"/>
							<xsl:apply-templates
								select="descendant::node()[generate-id(.) = $div_id]"/>
						</xsl:when>
						<xsl:otherwise>
							<xsl:choose>
								<xsl:when test="descendant::titlePage">
									<xsl:apply-templates select="descendant::titlePage"/>
								</xsl:when>
								<xsl:when test="descendant::front">
									<xsl:apply-templates select="//TEI.2/text/front"/>
								</xsl:when>
								<xsl:otherwise>
									<xsl:apply-templates select="//TEI.2/text/front"/>
								</xsl:otherwise>
							</xsl:choose>
						</xsl:otherwise>
					</xsl:choose>
				</xsl:when>
				<xsl:otherwise>
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
						<div class="options">
							<a href="?div_id={$div_id}&amp;print=yes" target="_blank">Print</a>
						</div>
						<xsl:call-template name="toc"/>
						<div class="content">
							<xsl:choose>
								<xsl:when test="string($div_id)">
									<xsl:apply-templates select="descendant::node()[@id = $div_id]"/>
									<xsl:apply-templates
										select="descendant::node()[generate-id(.) = $div_id]"/>
								</xsl:when>
								<xsl:otherwise>
									<xsl:choose>
										<xsl:when test="descendant::titlePage">
											<xsl:apply-templates select="descendant::titlePage"/>
										</xsl:when>
										<xsl:when test="descendant::front">
											<xsl:apply-templates select="//TEI.2/text/front"/>
										</xsl:when>
										<xsl:otherwise>
											<xsl:apply-templates select="//TEI.2/text/front"/>
										</xsl:otherwise>
									</xsl:choose>
								</xsl:otherwise>
							</xsl:choose>
						</div>
					</div>
					<div class="footer">© Copyright 2002 by Benjamin Ray and The Rector and Visitors
						of the University of Virginia</div>
				</xsl:otherwise>
			</xsl:choose>
		</body>
	</xsl:template>

	<xsl:template name="toc">
		<div class="toc">
			<h3>
				<xsl:value-of select="/TEI.2/teiHeader/fileDesc/titleStmt/title[@type='245']"/>
			</h3>
			<xsl:apply-templates select="descendant::TEI.2/text/front" mode="toc"/>
			<xsl:apply-templates select="descendant::TEI.2/text/body" mode="toc"/>
		</div>
	</xsl:template>

	<xsl:template match="front" mode="toc">
		<ul>
			<h4>
				<a href="?div_id={generate-id(.)}">Front Matter</a>
			</h4>
			<xsl:for-each select="div1 | titlePage">
				<li>
					<xsl:choose>
						<xsl:when test="name() = 'div1'">
							<xsl:value-of select="@type"/>
						</xsl:when>
						<xsl:otherwise>
							<xsl:text>Title Page</xsl:text>
						</xsl:otherwise>
					</xsl:choose>

					<xsl:choose>
						<xsl:when test="@id">
							<xsl:choose>
								<xsl:when test="head">
									<xsl:text>: </xsl:text>
									<a href="?div_id={@id}">
										<xsl:value-of select="normalize-space(head)"/>
									</a>
								</xsl:when>
								<xsl:otherwise>
									<a href="?div_id={@id}"> [No title] </a>
								</xsl:otherwise>
							</xsl:choose>
						</xsl:when>
						<xsl:otherwise>
							<xsl:choose>
								<xsl:when test="head">
									<xsl:text>: </xsl:text>
									<a href="?div_id={generate-id(.)}">
										<xsl:value-of select="normalize-space(head)"/>
									</a>
								</xsl:when>
								<xsl:otherwise>
									<a href="?div_id={generate-id(.)}"> [No title] </a>
								</xsl:otherwise>
							</xsl:choose>
						</xsl:otherwise>
					</xsl:choose>
				</li>
			</xsl:for-each>
		</ul>
	</xsl:template>
	<xsl:template match="body" mode="toc">
		<ul>
			<h4>
				<a href="?div_id={generate-id(.)}">Body</a>
			</h4>

			<xsl:for-each select="div1">
				<li>
					<xsl:choose>
						<xsl:when test="name() = 'div1'">
							<xsl:value-of select="@type"/>
						</xsl:when>
						<xsl:otherwise>
							<xsl:text>Title Page</xsl:text>
						</xsl:otherwise>
					</xsl:choose>

					<xsl:choose>
						<xsl:when test="@id">
							<xsl:choose>
								<xsl:when test="head">
									<xsl:text>: </xsl:text>
									<a href="?div_id={@id}">
										<xsl:value-of select="normalize-space(head)"/>
									</a>
								</xsl:when>
								<xsl:otherwise>
									<a href="?div_id={@id}"> [No title] </a>
								</xsl:otherwise>
							</xsl:choose>
						</xsl:when>
						<xsl:otherwise>
							<xsl:choose>
								<xsl:when test="head">
									<xsl:text>: </xsl:text>
									<a href="?div_id={generate-id(.)}">
										<xsl:value-of select="normalize-space(head)"/>
									</a>
								</xsl:when>
								<xsl:otherwise>
									<a href="?div_id={generate-id(.)}"> [No title] </a>
								</xsl:otherwise>
							</xsl:choose>
						</xsl:otherwise>
					</xsl:choose>
				</li>
			</xsl:for-each>
		</ul>
	</xsl:template>


	<xsl:template match="text">
		<xsl:apply-templates/>
	</xsl:template>

	<xsl:template match="front">
		<xsl:apply-templates/>
	</xsl:template>

	<xsl:template match="body">
		<xsl:apply-templates/>
	</xsl:template>

	<xsl:template match="titlePage">
		<div class="titlepage">
			<xsl:apply-templates select="/TEI.2/text/front/titlePage/*" mode="titlepage"/>
		</div>
	</xsl:template>

	<xsl:template match="titlePart" mode="titlepage">
		<xsl:choose>
			<xsl:when test="@type='subtitle'">
				<h4>
					<i>
						<xsl:apply-templates/>
					</i>
				</h4>
			</xsl:when>
			<xsl:otherwise>
				<h1>
					<xsl:apply-templates/>
				</h1>
			</xsl:otherwise>
		</xsl:choose>
	</xsl:template>

	<xsl:template match="docAuthor" mode="titlepage">
		<xsl:choose>
			<xsl:when test="name">
				<xsl:apply-templates mode="titlepage"/>
			</xsl:when>
			<xsl:otherwise>
				<h4>
					<xsl:apply-templates/>
				</h4>
			</xsl:otherwise>
		</xsl:choose>
	</xsl:template>

	<xsl:template match="docAuthor/name" mode="titlepage">
		<h4>
			<xsl:apply-templates/>
		</h4>
	</xsl:template>

	<xsl:template match="docAuthor/address" mode="titlepage">
		<xsl:apply-templates/>
		<br/>
	</xsl:template>

	<xsl:template match="docImprint/publisher" mode="titlepage">
		<xsl:apply-templates/>
		<br/>
	</xsl:template>

	<xsl:template match="docImprint/pubPlace" mode="titlepage">
		<i>
			<xsl:apply-templates/>
		</i>
		<br/>
	</xsl:template>

	<xsl:template match="docImprint/docDate" mode="titlepage">
		<xsl:text>&#169; </xsl:text>
		<xsl:apply-templates/>
		<br/>
	</xsl:template>

	<xsl:template match="div1[@type='dedication']" mode="titlepage">
		<xsl:apply-templates/>
	</xsl:template>

	<xsl:template match="div1[@type='copyright']" mode="titlepage">
		<xsl:apply-templates/>
	</xsl:template>

	<xsl:template match="div1[@type='epigraph']" mode="titlepage">
		<xsl:apply-templates/>
	</xsl:template>

	<xsl:template match="seg" mode="titlepage">
		<xsl:apply-templates/>
		<br/>
	</xsl:template>

	<xsl:template match="pb" mode="display_titlepage">
		<xsl:variable name="entity" select="@entity"/>
		<!--  
			<img src="{$figure.path}{$entity}.jpg" alt="cover"/>
		-->
	</xsl:template>

	<xsl:template match="biblFull" mode="titlepage">
		<table width="100%" cellpadding="5" cellspacing="5"
			style="border-style: double; margin: 0px 0px 40px; text-align: center; background-color: rgb(255, 248, 220);">
			<tr>
				<td>
					<h2
						style="margin-top: 40px; margin-bottom: 0px; font-family: 'Times New Roman',Times,Georgia,serif; font-size: 2em; color: rgb(39, 64, 139); line-height: 46px;">
						<xsl:value-of select="titleStmt/title[@type='main']"/>
					</h2>
					<h4>
						<i>
							<xsl:value-of select="titleStmt/title[@type='sub']"/>
						</i>
					</h4>
					<h4>
						<xsl:value-of select="titleStmt/author/name[@type='first']"/>
						<xsl:text> </xsl:text>
						<xsl:value-of select="titleStmt/author/name[@type='last']"/>
					</h4>
					<xsl:value-of select="titleStmt/author/dateRange"/>

					<h6>
						<xsl:value-of select="publicationStmt/publisher"/>
					</h6>
					<h6>
						<i>
							<xsl:value-of select="publicationStmt/pubPlace"/>
						</i>
					</h6>
					<h6>
						<xsl:value-of select="publicationStmt/date"/>
					</h6>
				</td>
			</tr>
		</table>
		<hr/>
	</xsl:template>


	<xsl:template match="lb">
		<br/>
	</xsl:template>

	<xsl:template match="table">
		<table>
			<xsl:for-each select="row">
				<tr>

					<xsl:for-each select="cell">
						<td>
							<xsl:if test="@rend='left' or @rend='right' or @rend='center'">
								<xsl:attribute name="align">
									<xsl:value-of select="@rend"/>
								</xsl:attribute>
							</xsl:if>
							<xsl:value-of select="."/>
						</td>
					</xsl:for-each>

				</tr>
			</xsl:for-each>
		</table>

	</xsl:template>

	<xsl:template match="p">
		<p>
			<xsl:if test="@rend='left' or @rend='right' or @rend='center'">
				<xsl:attribute name="align">
					<xsl:value-of select="@rend"/>
				</xsl:attribute>
			</xsl:if>
			<xsl:apply-templates/>
		</p>
	</xsl:template>
	<xsl:template match="pb">
		<div class="pb">
			<xsl:choose>
				<xsl:when test="@n">
					<b>
						<a name="pg{@n}">
							<xsl:value-of select="@n"/>
						</a>
					</b>
				</xsl:when>
				<xsl:otherwise>
					<b>[No page number]</b>
				</xsl:otherwise>
			</xsl:choose>

			<xsl:apply-templates select="fw"/>
		</div>
	</xsl:template>

	<xsl:template match="cb">
		<xsl:if test="not(preceding-sibling::pb)">
			<hr align="left" width="50"/>
		</xsl:if>
	</xsl:template>


	<xsl:template match="head">
		<!-- if the head contains a bibl tag (thus probably a manuscript, it gets the value of only the bibl/title instead of the whole head -->
		<xsl:choose>
			<xsl:when test="parent::div1">
				<xsl:if test="@type='main' or not (@type)">
					<xsl:if test="string(parent::node()/@id)">
						<a name="{parent::node()/@id}"/>
					</xsl:if>
					<h1>
						<xsl:choose>
							<xsl:when test="bibl">
								<xsl:value-of select="bibl/title"/>
							</xsl:when>
							<xsl:otherwise>
								<xsl:value-of select="."/>
							</xsl:otherwise>
						</xsl:choose>
					</h1>
				</xsl:if>
				<xsl:if test="@type='sub'">
					<xsl:if test="string(parent::node()/@id)">
						<a name="{parent::node()/@id}"/>
					</xsl:if>
					<h2>
						<xsl:choose>
							<xsl:when test="bibl">
								<xsl:value-of select="bibl/title"/>
							</xsl:when>
							<xsl:otherwise>
								<xsl:value-of select="."/>
							</xsl:otherwise>
						</xsl:choose>
					</h2>
				</xsl:if>
			</xsl:when>
			<xsl:when test="parent::div2">
				<xsl:if test="@type='main' or not (@type)">
					<xsl:if test="string(parent::node()/@id)">
						<a name="{parent::node()/@id}"/>
					</xsl:if>
					<h2>
						<xsl:choose>
							<xsl:when test="bibl">
								<xsl:value-of select="bibl/title"/>
							</xsl:when>
							<xsl:otherwise>
								<xsl:value-of select="."/>
							</xsl:otherwise>
						</xsl:choose>
					</h2>
				</xsl:if>
				<xsl:if test="@type='sub'">
					<xsl:if test="string(parent::node()/@id)">
						<a name="{parent::node()/@id}"/>
					</xsl:if>
					<h3>
						<xsl:choose>
							<xsl:when test="bibl">
								<xsl:value-of select="bibl/title"/>
							</xsl:when>
							<xsl:otherwise>
								<xsl:value-of select="."/>
							</xsl:otherwise>
						</xsl:choose>
					</h3>
				</xsl:if>
			</xsl:when>
			<xsl:when test="parent::div3">
				<xsl:if test="@type='main' or not (@type)">
					<xsl:if test="string(parent::node()/@id)">
						<a name="{parent::node()/@id}"/>
					</xsl:if>
					<h3>
						<xsl:choose>
							<xsl:when test="bibl">
								<xsl:value-of select="bibl/title"/>
							</xsl:when>
							<xsl:otherwise>
								<xsl:value-of select="."/>
							</xsl:otherwise>
						</xsl:choose>
					</h3>
				</xsl:if>
				<xsl:if test="@type='sub'">
					<xsl:if test="string(parent::node()/@id)">
						<a name="{parent::node()/@id}"/>
					</xsl:if>
					<h4>
						<xsl:choose>
							<xsl:when test="bibl">
								<xsl:value-of select="bibl/title"/>
							</xsl:when>
							<xsl:otherwise>
								<xsl:value-of select="."/>
							</xsl:otherwise>
						</xsl:choose>
					</h4>
				</xsl:if>
			</xsl:when>
			<xsl:when test="parent::div4">
				<xsl:if test="@type='main' or not (@type)">
					<xsl:if test="string(parent::node()/@id)">
						<a name="{parent::node()/@id}"/>
					</xsl:if>
					<h4>
						<xsl:choose>
							<xsl:when test="bibl">
								<xsl:value-of select="bibl/title"/>
							</xsl:when>
							<xsl:otherwise>
								<xsl:value-of select="."/>
							</xsl:otherwise>
						</xsl:choose>
					</h4>
				</xsl:if>
				<xsl:if test="@type='sub'">
					<xsl:if test="string(parent::node()/@id)">
						<a name="{parent::node()/@id}"/>
					</xsl:if>
					<h5>
						<xsl:choose>
							<xsl:when test="bibl">
								<xsl:value-of select="bibl/title"/>
							</xsl:when>
							<xsl:otherwise>
								<xsl:value-of select="."/>
							</xsl:otherwise>
						</xsl:choose>
					</h5>
				</xsl:if>
			</xsl:when>
			<xsl:when test="parent::div5">
				<xsl:if test="string(parent::node()/@id)">
					<a name="{parent::node()/@id}"/>
				</xsl:if>
				<h4>
					<xsl:choose>
						<xsl:when test="bibl">
							<xsl:value-of select="bibl/title"/>
						</xsl:when>
						<xsl:otherwise>
							<xsl:value-of select="."/>
						</xsl:otherwise>
					</xsl:choose>
				</h4>
			</xsl:when>
			<xsl:when test="parent::div6 or parent::div7 or parent::div8">
				<xsl:if test="string(parent::node()/@id)">
					<a name="{parent::node()/@id}"/>
				</xsl:if>
				<h5>
					<xsl:choose>
						<xsl:when test="bibl">
							<xsl:value-of select="bibl/title"/>
						</xsl:when>
						<xsl:otherwise>
							<xsl:value-of select="."/>
						</xsl:otherwise>
					</xsl:choose>
				</h5>
			</xsl:when>
			<xsl:otherwise>
				<xsl:if test="string(parent::node()/@id)">
					<a name="{parent::node()/@id}"/>
				</xsl:if>
				<h3>
					<xsl:value-of select="."/>
				</h3>
			</xsl:otherwise>
		</xsl:choose>

	</xsl:template>

	<xsl:template match="closer">
		<xsl:apply-templates select="signed"/>
		<xsl:apply-templates select="dateline"/>

	</xsl:template>

	<xsl:template match="opener">
		<xsl:apply-templates select="dateline"/>
		<xsl:apply-templates select="salute"/>
	</xsl:template>

	<xsl:template match="salute">
		<p>
			<xsl:value-of select="."/>
		</p>
	</xsl:template>

	<xsl:template match="signed">
		<p>
			<xsl:value-of select="."/>
		</p>
	</xsl:template>

	<xsl:template match="dateline">
		<p>
			<xsl:apply-templates/>
		</p>
	</xsl:template>

	<xsl:template match="list">
		<ul>
			<xsl:apply-templates select="head | item"/>
		</ul>
	</xsl:template>

	<xsl:template match="item">
		<li>
			<xsl:apply-templates/>
		</li>
	</xsl:template>

	<xsl:template match="epigraph">

		<xsl:apply-templates/>

	</xsl:template>

	<xsl:template match="cit">
		<font size="-1">
			<xsl:apply-templates select="q"/>
			<xsl:apply-templates select="bibl"/>
		</font>
	</xsl:template>

	<xsl:template match="q">

		<xsl:apply-templates/>

	</xsl:template>

	<xsl:template match="bibl">

		<p>
			<font size="-2">
				<xsl:value-of select="."/>
			</font>
		</p>

	</xsl:template>

	<xsl:template match="lg">
		<xsl:if test="descendant::head">
			<h3>
				<xsl:value-of select="head"/>
			</h3>
		</xsl:if>

		<p>
			<xsl:apply-templates select="l"/>
		</p>
	</xsl:template>

	<xsl:template match="l">

		<xsl:apply-templates/>
		<br/>

	</xsl:template>

	<!--<xsl:template match="figure">

		<xsl:choose>
			<xsl:when test="$div_id=//TEI.2/@id or $div_id=//body/@id">
				<center>
					<a href="images/{substring(@entity, 1, 1)}/{@entity}.jpg">
						<img src="images/{substring(@entity, 1, 1)}/{@entity}.gif"/>
					</a>
				</center>
			</xsl:when>
			<xsl:otherwise>
				<center>
					<a class="thickbox" href="images/{substring(@entity, 1, 1)}/{@entity}.jpg">
						<img src="images/{substring(@entity, 1, 1)}/{@entity}.gif"/>
					</a>
				</center>
			</xsl:otherwise>
		</xsl:choose>
		<xsl:if test="head">
			<center>
				<h3>
					<xsl:value-of select="head"/>
				</h3>
			</center>
		</xsl:if>

	</xsl:template>-->

	<xsl:template match="seg">
		<xsl:choose>
			<xsl:when test="@type='postscript'">
				<p>
					<xsl:value-of select="."/>
				</p>
			</xsl:when>
			<xsl:when test="@type='note-symbol'">
				<xsl:value-of select="."/>
			</xsl:when>
			<xsl:otherwise>
				<xsl:apply-templates/>
				<br/>
			</xsl:otherwise>
		</xsl:choose>
	</xsl:template>

	<xsl:template match="ref">

		<a href="#{@target}">
			<xsl:value-of select="."/>
		</a>

	</xsl:template>

	<xsl:template match="note">

		<xsl:if test="@place='foot'">
			<font size="-1">
				<a name="{@id}">
					<table style="float: right">
						<tr>
							<td>
								<xsl:apply-templates/>
							</td>
						</tr>

					</table>
				</a>
			</font>
		</xsl:if>

		<xsl:if test="@place='end'">
			<font size="-1">
				<a name="{@id}">
					<table style="text-align: left; margin-left: auto;
margin-right: 0px;">
						<tr>
							<td>
								<xsl:apply-templates/>
							</td>
						</tr>

					</table>
				</a>
			</font>

			<xsl:if test="@place='inline'">
				<font size="-1">
					<a name="{@id}">
						<table style="float: right">
							<tr>
								<td>
									<xsl:apply-templates/>
								</td>
							</tr>

						</table>
					</a>
				</font>
			</xsl:if>

			<xsl:if test="@place='right'">
				<font size="-1">
					<a name="{@id}">
						<table style="float: right">
							<tr>
								<td>
									<xsl:apply-templates/>
								</td>
							</tr>

						</table>
					</a>
				</font>
			</xsl:if>

		</xsl:if>

	</xsl:template>

	<xsl:template match="fw">

		<p>
			<font color="gray">
				<xsl:value-of select="."/>
			</font>
		</p>

	</xsl:template>

	<xsl:template match="sp">

		<xsl:apply-templates/>

	</xsl:template>

	<xsl:template match="speaker">
		<p>
			<xsl:if test="@rend='left' or @rend='right' or @rend='center'">
				<xsl:attribute name="align">
					<xsl:value-of select="@rend"/>
				</xsl:attribute>
			</xsl:if>
			<xsl:apply-templates/>
		</p>

	</xsl:template>

	<xsl:template match="stage">

		<p>
			<xsl:if test="@rend='left' or @rend='right' or @rend='center'">
				<xsl:attribute name="align">
					<xsl:value-of select="@rend"/>
				</xsl:attribute>
			</xsl:if>
			<xsl:apply-templates/>
		</p>

	</xsl:template>

	<xsl:template match="ab">

		<p>
			<xsl:if test="@rend='left' or @rend='right' or @rend='center'">
				<xsl:attribute name="align">
					<xsl:value-of select="@rend"/>
				</xsl:attribute>
			</xsl:if>
			<xsl:apply-templates/>
		</p>

		<xsl:if test="@type='epigraph'">
			<font size="-1">
				<xsl:apply-templates/>
			</font>
		</xsl:if>


	</xsl:template>

	<xsl:template match="hi">
		<xsl:choose>
			<xsl:when test="@rend='italic'">
				<i>
					<xsl:value-of select="."/>
				</i>
			</xsl:when>
			<xsl:when test="@rend='italics'">
				<i>
					<xsl:value-of select="."/>
				</i>
			</xsl:when>
			<xsl:when test="@rend='small-caps' or @rend='smallcaps'">
				<small>
					<xsl:value-of select="."/>
				</small>
			</xsl:when>
			<xsl:when test="@rend='bold'">
				<b>
					<xsl:value-of select="."/>
				</b>
			</xsl:when>
			<xsl:when test="@rend='underline'">
				<u>
					<xsl:value-of select="."/>
				</u>
			</xsl:when>
			<xsl:when test="@rend='super' or @rend='sup' or @rend='superscript'">
				<sup>
					<xsl:value-of select="."/>
				</sup>
			</xsl:when>
			<xsl:when test="@rend='sub' or @rend='subscript'">
				<sub>
					<xsl:value-of select="."/>
				</sub>
			</xsl:when>
			<xsl:when test="@rend='center'">
				<p align="center">
					<xsl:value-of select="."/>
				</p>
			</xsl:when>
		</xsl:choose>
	</xsl:template>

	<xsl:template match="xref">
		<xsl:choose>
			<xsl:when test="parent::item">
				<a href="{@doc}">
					<xsl:value-of select="."/>
				</a>

			</xsl:when>
			<xsl:otherwise>
				<a href="{@doc}">
					<xsl:value-of select="."/>
				</a>
			</xsl:otherwise>
		</xsl:choose>
	</xsl:template>

</xsl:stylesheet>
