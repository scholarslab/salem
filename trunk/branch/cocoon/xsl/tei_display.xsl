<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="2.0"
	xmlns:cinclude="http://apache.org/cocoon/include/1.0">
	<xsl:output method="xhtml" encoding="UTF-8"/>
	<xsl:param name="div_id"/>
	<xsl:param name="print"/>
	<xsl:param name="q"/>
	<xsl:param name="doc_id" select="//TEI.2/@id"/>
	<xsl:param name="name"/>
	<xsl:param name="chapter_id"/>

	<xsl:template match="/">
		<html>
			<head>
				<title>
					<xsl:value-of select="/TEI.2/teiHeader/fileDesc/titleStmt/title[@type='245']"/>
				</title>
				<link type="text/css" href="style.css" rel="stylesheet"/>
				<script type="text/javascript" src="javascript/jquery-1.2.6.min.js"/>
				<script type="text/javascript" src="javascript/jquery.lightbox-0.5.min.js"/>
				<script type="text/javascript" src="javascript/salem-lightbox.js"/>
				<script type="text/javascript" src="javascript/searchhi.js"/>
			</head>
		</html>
		<body onLoad="JavaScript:SearchHighlight();">
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
					<div class="header nosearchhi">
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
							<a href="texts/transcripts.html">Return to The Salem Witchcraft Papers</a>
							<xsl:text> | </xsl:text>
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
									<xsl:apply-templates select="descendant::titlePage"/>
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
		<div class="toc nosearchhi">
			<xsl:variable name="volume">
				<xsl:choose>
					<xsl:when test="/TEI.2/@id = 'BoySal1R'">
						<xsl:text>1</xsl:text>
					</xsl:when>
					<xsl:when test="/TEI.2/@id = 'BoySal2R'">
						<xsl:text>2</xsl:text>
					</xsl:when>
					<xsl:when test="/TEI.2/@id = 'BoySal3R'">
						<xsl:text>3</xsl:text>
					</xsl:when>
					<xsl:when test="/TEI.2/@id = 'BoySal4R'">
						<xsl:text>4</xsl:text>
					</xsl:when>
				</xsl:choose>
			</xsl:variable>
			<h3> The Salem witchcraft papers, Volume <xsl:value-of select="$volume"/>: edited by
				Paul Boyer and Stephen Nissenbaum (1977) / revised, corrected, and augmented by
				Benjamin C. Ray and Tara S. Wood (2010)</h3>
			<ul>
				<!--<li>Table of Contents: <a href="?div_id={//div1[@type='contents']/@id}">Volume
				<xsl:value-of select="$volume"/></a></li>-->
				<li>Title Page: <a href="{/TEI.2/@id}.xml">Volume <xsl:value-of select="$volume"
					/></a></li>
			</ul>
			<xsl:apply-templates select="descendant::TEI.2/text/body" mode="toc"/>
		</div>
	</xsl:template>

	<!--<xsl:template match="front" mode="toc">
		<ul>
			<h4>
				<a href="?div_id={generate-id(.)}">Front Matter</a>
			</h4>
			<xsl:for-each select="div1 | titlePage">
				<li>
					<xsl:choose>
						<xsl:when test="name() = 'div1'">
							<xsl:choose>
								<xsl:when test="@type='case'">
									<xsl:text>Case File</xsl:text>
								</xsl:when>
								<xsl:otherwise>
									<xsl:value-of select="@type"/>
								</xsl:otherwise>
							</xsl:choose>
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
		</xsl:template>-->

	<xsl:template match="body" mode="toc">
		<ul>
			<xsl:for-each select="div1">
				<li>
					<xsl:choose>
						<xsl:when test="name() = 'div1'">
							<xsl:choose>
								<xsl:when test="@id = $div_id or @id = $chapter_id">
									<b>Case File: </b>
								</xsl:when>
								<xsl:otherwise>
									<xsl:text>Case File: </xsl:text>
								</xsl:otherwise>
							</xsl:choose>
						</xsl:when>
						<xsl:otherwise>
							<xsl:choose>
								<xsl:when test="@id = $div_id or @id = $chapter_id">
									<b>Title Page: </b>
								</xsl:when>
								<xsl:otherwise>
									<xsl:text>Title Page: </xsl:text>
								</xsl:otherwise>
							</xsl:choose>
						</xsl:otherwise>
					</xsl:choose>

					<xsl:choose>
						<xsl:when test="@id">
							<xsl:choose>
								<xsl:when test="head">
									<xsl:choose>
										<xsl:when test="@id = $div_id or @id = $chapter_id">
											<b>
												<xsl:value-of select="normalize-space(head)"/>
											</b>
										</xsl:when>
										<xsl:otherwise>
											<a href="?div_id={@id}">
												<xsl:value-of select="normalize-space(head)"/>
											</a>
										</xsl:otherwise>
									</xsl:choose>
								</xsl:when>
								<xsl:otherwise>
									<xsl:choose>
										<xsl:when test="@id = $div_id or @id = $chapter_id">
											<b>
												<xsl:value-of select="normalize-space(head)"/>
											</b>
										</xsl:when>
										<xsl:otherwise>
											<a href="?div_id={@id}"> [No title] </a>
										</xsl:otherwise>
									</xsl:choose>

								</xsl:otherwise>
							</xsl:choose>
						</xsl:when>
						<xsl:otherwise>
							<xsl:choose>
								<xsl:when test="head">
									<xsl:choose>
										<xsl:when test="@id = $div_id or @id = $chapter_id">
											<b>
												<xsl:value-of select="normalize-space(head)"/>
											</b>
										</xsl:when>
										<xsl:otherwise>
											<a href="?div_id={generate-id(.)}">
												<xsl:value-of select="normalize-space(head)"/>
											</a>
										</xsl:otherwise>
									</xsl:choose>
								</xsl:when>
								<xsl:otherwise>
									<xsl:choose>
										<xsl:when test="@id = $div_id or @id = $chapter_id">
											<b>
												<xsl:value-of select="normalize-space(head)"/>
											</b>
										</xsl:when>
										<xsl:otherwise>
											<a href="?div_id={generate-id(.)}"> [No title] </a>
										</xsl:otherwise>
									</xsl:choose>
								</xsl:otherwise>
							</xsl:choose>
						</xsl:otherwise>
					</xsl:choose>
				</li>
			</xsl:for-each>
		</ul>
	</xsl:template>

	<xsl:template match="titlePage">
		<xsl:apply-templates/>
	</xsl:template>

	<xsl:template match="docTitle">
		<xsl:apply-templates/>
	</xsl:template>

	<xsl:template match="docImprint">
		<h4>
			<xsl:apply-templates/>
		</h4>
	</xsl:template>

	<xsl:template match="byline">
		<h4>
			<i>
				<xsl:apply-templates/>
			</i>
		</h4>
	</xsl:template>

	<xsl:template match="titlePart">
		<xsl:choose>
			<xsl:when test="@type='main'">
				<h1 style="padding-bottom:20px;">
					<xsl:apply-templates/>
				</h1>
			</xsl:when>
			<xsl:when test="@type='sub'">
				<h2 style="padding-bottom:20px;">
					<xsl:apply-templates/>
				</h2>
			</xsl:when>
		</xsl:choose>
	</xsl:template>

	<xsl:template match="div1">
		<xsl:choose>
			<xsl:when test="@type='contents'">
				<xsl:choose>
					<xsl:when test="string($q)">
						<h2>Results for <xsl:value-of select="$name"/></h2>
						<cinclude:include
							src="cocoon:/search_results?q={$q}&amp;mode=teidoc&amp;name={$name}"
						/>
					</xsl:when>
					<!-- names list-->
					<!--<xsl:otherwise>
						<h1>List of Names</h1>
						<ul class="names_list">
							<li class="names_column">
								<ul>
									<xsl:apply-templates mode="contents_terms"
										select="//keywords[@scheme='LCSH']/term[substring(@id, 1, 1)= 'a' ]"/>
									<xsl:apply-templates mode="contents_terms"
										select="//keywords[@scheme='LCSH']/term[substring(@id, 1, 1)= 'b' ]"/>
									<xsl:apply-templates mode="contents_terms"
										select="//keywords[@scheme='LCSH']/term[substring(@id, 1, 1)= 'c' ]"
									/>
								</ul>

							</li>
							<li class="names_column">
								<ul>
									<xsl:apply-templates mode="contents_terms"
										select="//keywords[@scheme='LCSH']/term[substring(@id, 1, 1)= 'd' ]"/>
									<xsl:apply-templates mode="contents_terms"
										select="//keywords[@scheme='LCSH']/term[substring(@id, 1, 1)= 'e' ]"/>
									<xsl:apply-templates mode="contents_terms"
										select="//keywords[@scheme='LCSH']/term[substring(@id, 1, 1)= 'f' ]"/>
									<xsl:apply-templates mode="contents_terms"
										select="//keywords[@scheme='LCSH']/term[substring(@id, 1, 1)= 'g' ]"/>
									<xsl:apply-templates mode="contents_terms"
										select="//keywords[@scheme='LCSH']/term[substring(@id, 1, 1)= 'h' ]"
									/>
								</ul>
							</li>
							<li class="names_column">
								<ul>
									<xsl:apply-templates mode="contents_terms"
										select="//keywords[@scheme='LCSH']/term[substring(@id, 1, 1)= 'i' ]"/>
									<xsl:apply-templates mode="contents_terms"
										select="//keywords[@scheme='LCSH']/term[substring(@id, 1, 1)= 'j' ]"/>
									<xsl:apply-templates mode="contents_terms"
										select="//keywords[@scheme='LCSH']/term[substring(@id, 1, 1)= 'k' ]"/>
									<xsl:apply-templates mode="contents_terms"
										select="//keywords[@scheme='LCSH']/term[substring(@id, 1, 1)= 'l' ]"/>
									<xsl:apply-templates mode="contents_terms"
										select="//keywords[@scheme='LCSH']/term[substring(@id, 1, 1)= 'm' ]"/>
									<xsl:apply-templates mode="contents_terms"
										select="//keywords[@scheme='LCSH']/term[substring(@id, 1, 1)= 'n' ]"/>
									<xsl:apply-templates mode="contents_terms"
										select="//keywords[@scheme='LCSH']/term[substring(@id, 1, 1)= 'o' ]"/>
									<xsl:apply-templates mode="contents_terms"
										select="//keywords[@scheme='LCSH']/term[substring(@id, 1, 1)= 'p' ]"/>
									<xsl:apply-templates mode="contents_terms"
										select="//keywords[@scheme='LCSH']/term[substring(@id, 1, 1)= 'q' ]"
									/>
								</ul>
							</li>
							<li class="names_column">
								<ul>
									<xsl:apply-templates mode="contents_terms"
										select="//keywords[@scheme='LCSH']/term[substring(@id, 1, 1)= 'r' ]"/>
									<xsl:apply-templates mode="contents_terms"
										select="//keywords[@scheme='LCSH']/term[substring(@id, 1, 1)= 's' ]"/>
									<xsl:apply-templates mode="contents_terms"
										select="//keywords[@scheme='LCSH']/term[substring(@id, 1, 1)= 't' ]"/>
									<xsl:apply-templates mode="contents_terms"
										select="//keywords[@scheme='LCSH']/term[substring(@id, 1, 1)= 'u' ]"/>
									<xsl:apply-templates mode="contents_terms"
										select="//keywords[@scheme='LCSH']/term[substring(@id, 1, 1)= 'v' ]"/>
									<xsl:apply-templates mode="contents_terms"
										select="//keywords[@scheme='LCSH']/term[substring(@id, 1, 1)= 'w' ]"/>
									<xsl:apply-templates mode="contents_terms"
										select="//keywords[@scheme='LCSH']/term[substring(@id, 1, 1)= 'x' ]"/>
									<xsl:apply-templates mode="contents_terms"
										select="//keywords[@scheme='LCSH']/term[substring(@id, 1, 1)= 'y' ]"/>
									<xsl:apply-templates mode="contents_terms"
										select="//keywords[@scheme='LCSH']/term[substring(@id, 1, 1)= 'z' ]"
									/>
								</ul>
							</li>
						</ul>
					</xsl:otherwise>-->
				</xsl:choose>
			</xsl:when>
			<xsl:otherwise>
				<xsl:apply-templates/>
			</xsl:otherwise>
		</xsl:choose>
	</xsl:template>

	<xsl:template match="div2">
		<div class="div2">
			<xsl:choose>
				<xsl:when test="descendant::figure[substring(@n, 1, 1) = 'H']">
					<div class="figures">
						<xsl:apply-templates select="descendant::figure[substring(@n, 1, 1) = 'H']"
							mode="MassHistImages"/>
					</div>
					<xsl:apply-templates/>
				</xsl:when>
				<xsl:otherwise>
					<xsl:apply-templates/>
				</xsl:otherwise>
			</xsl:choose>
			<hr style="width:80%;margin-left:auto;margin-right:auto;margin-top:20px;"/>
		</div>
	</xsl:template>

	<xsl:template match="figure" mode="MassHistImages">
		<xsl:variable name="filename">
			<xsl:choose>
				<xsl:when test="contains(@n, 'r')">
					<xsl:value-of select="concat(substring-before(@n, 'r'), 'A')"/>
				</xsl:when>
				<xsl:when test="contains(@n, 'v')">
					<xsl:value-of select="concat(substring-before(@n, 'v'), 'B')"/>
				</xsl:when>
			</xsl:choose>
		</xsl:variable>

		<div class="figure">
			<a href="archives/MassHist/medium/{$filename}.jpg" class="jqueryLightbox">
				<img src="archives/MassHist/gifs/{$filename}.gif"/>
			</a>
			<br/>
			<a href="archives/MassHist/large/{$filename}.jpg" target="_blank"
			>Enlarge<br/>Manuscript</a>
		</div>
	</xsl:template>

	<xsl:template match="term" mode="contents_terms">
		<xsl:if test="position() = 1">
			<li>
				<h3 style="text-align:left;margin-left:20px;">
					<xsl:value-of
						select="translate(substring(@id, 1, 1), 'abcdefghijklmnopqrstuvwxy', 'ABCDEFGHIJKLMNOPQRSTUVWXYZ')"
					/>
				</h3>
			</li>
		</xsl:if>
		<li>
			<a href="?q=name_text:{@id} AND doc_id:{$doc_id}&amp;name={.}">
				<xsl:value-of select="."/>
			</a>
		</li>
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

	<!-- removed pb milestones, no longer necessary since content has been changed versus printed edition -->
	<!--<xsl:template match="pb">
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
		</div>
	</xsl:template>-->

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
					<!-- for salem: view entire case if viewing a div2 from a search result -->
					<xsl:if test="string($chapter_id)">
						<div style="width:100%;text-align:center;margin-bottom:20px;">
							<a href="?div_id={$chapter_id}">View Entire Case File</a>
						</div>
					</xsl:if>
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
		<div class="closer">
			<xsl:apply-templates/>
		</div>
	</xsl:template>

	<xsl:template match="opener">
		<div class="opener">
			<xsl:apply-templates/>
		</div>
	</xsl:template>

	<xsl:template match="salute">
		<xsl:apply-templates/>
		<br/>
	</xsl:template>

	<xsl:template match="signed">
		<i>
			<xsl:apply-templates/>
		</i>
		<br/>
	</xsl:template>

	<xsl:template match="dateline">
		<xsl:apply-templates/>
		<br/>
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

	<xsl:template match="seg">
		<xsl:apply-templates/>
		<br/>
	</xsl:template>

	<!--<xsl:template match="ref">

		<a href="#{@target}">
			<xsl:value-of select="."/>
		</a>

	</xsl:template>-->

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

	<!--<xsl:template match="xref">
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
	</xsl:template>-->

	<!-- link to names -->
	<!--<xsl:template match="name">
		<a href="texts/salemSearch.htm?q=name_text:{@key}&amp;rows=20&amp;start=0">
			<xsl:value-of select="."/>
		</a>
		</xsl:template>-->

	<xsl:template match="name">
		<xsl:choose>
			<xsl:when test="@key = $name">
				<span class="searchword">
					<xsl:value-of select="."/>
				</span>
			</xsl:when>
			<xsl:otherwise>
				<xsl:value-of select="."/>
			</xsl:otherwise>
		</xsl:choose>
	</xsl:template>

</xsl:stylesheet>
