<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
	xmlns="http://www.w3.org/1999/xhtml" xmlns:cinclude="http://apache.org/cocoon/include/1.0">
	<xsl:include href="layout.xsl"/>
	<xsl:output method="html"/>
	<xsl:param name="div_id"/>	
	<xsl:param name="search_text"/>


	<xsl:template match="/">
		<html>
			<head>
				<link type="text/css" href="style.css" rel="stylesheet"/>
				<script type="text/javascript" language="javascript" src="javascript/jquery.js"/>
				<script type="text/javascript" language="javascript" src="javascript/jquery/plugins/Thickbox.js"/>
				<script type="text/javascript" language="javascript" src="javascript/searchhi.js"/>
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
							<xsl:choose>
								<xsl:when test="$div_id=TEI.2/@id">
									<xsl:apply-templates select="/TEI.2"/>
								</xsl:when>
								<xsl:otherwise>
									<xsl:apply-templates select="//front[@id=$div_id]"/>
									<xsl:apply-templates select="//body[@id=$div_id]"/>
									<xsl:apply-templates select="//back[@id=$div_id]"/>
									<xsl:apply-templates select="//div1[@id=$div_id]"/>
									<xsl:apply-templates select="//div2[@id=$div_id]"/>
									<xsl:apply-templates select="//div3[@id=$div_id]"/>
									<xsl:apply-templates select="//div4[@id=$div_id]"/>
									<xsl:apply-templates select="//div5[@id=$div_id]"/>
									<xsl:apply-templates select="//div6[@id=$div_id]"/>
									<xsl:apply-templates select="//div7[@id=$div_id]"/>
									<xsl:apply-templates select="//div8[@id=$div_id]"/>
								</xsl:otherwise>
							</xsl:choose>
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
					<xsl:choose>
						<xsl:when test="not($div_id = //TEI.2/@id)">
							<a href="tei.{//TEI.2/@id}.xml?div_id={//TEI.2/@id}">View Entire
							Work</a>
						</xsl:when>
						<xsl:otherwise> View Entire Work </xsl:otherwise>
					</xsl:choose>

				</td>
			</tr>
		</table>

	</xsl:template>

	<xsl:template match="teiHeader"/>

	<xsl:template match="text">
		<xsl:apply-templates/>
	</xsl:template>

	<xsl:template match="lb">
		<br/>
	</xsl:template>

	<xsl:template match="titlePage">

		<center>
			<xsl:apply-templates/>
		</center>

	</xsl:template>

	<xsl:template match="docTitle">

		<xsl:apply-templates select="titlePart"/>

	</xsl:template>

	<xsl:template match="titlePart">

		<center>
			<h1>
				<xsl:value-of select="self::text()"/>
			</h1>
		</center>
		<xsl:apply-templates select="figure"/>

	</xsl:template>



	<xsl:template match="byline">

		<center>
			<h2>
				<xsl:value-of select="."/>
			</h2>
		</center>

	</xsl:template>

	<xsl:template match="docEdition">

		<center>
			<h3>
				<xsl:value-of select="."/>
			</h3>
		</center>

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
		<center>
			<hr width="150"/>


			<b>
				<a name="pg{@n}">
					<xsl:value-of select="@n"/>
				</a>
			</b>
		</center>
		<xsl:apply-templates select="fw"/>




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
					<center>
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
					</center>
				</xsl:if>
				<xsl:if test="@type='sub'">
					<center>
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
					</center>
				</xsl:if>
			</xsl:when>
			<xsl:when test="parent::div2">
				<xsl:if test="@type='main' or not (@type)">
					<center>
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
					</center>
				</xsl:if>
				<xsl:if test="@type='sub'">
					<center>
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
					</center>
				</xsl:if>
			</xsl:when>
			<xsl:when test="parent::div3">
				<xsl:if test="@type='main' or not (@type)">
					<center>
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
					</center>
				</xsl:if>
				<xsl:if test="@type='sub'">
					<center>
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
					</center>
				</xsl:if>
			</xsl:when>
			<xsl:when test="parent::div4">
				<xsl:if test="@type='main' or not (@type)">
					<center>
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
					</center>
				</xsl:if>
				<xsl:if test="@type='sub'">
					<center>
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
					</center>
				</xsl:if>
			</xsl:when>
			<xsl:when test="parent::div5">
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
		</xsl:choose>

	</xsl:template>

	<xsl:template match="closer">

		<xsl:apply-templates select="signed"/>
		<xsl:apply-templates select="dateline"/>

	</xsl:template>

	<!--<xsl:template match="xref">
		<br/><xsl:value-of select="."/>
	</xsl:template> -->
	
	<xsl:template match="opener">

		<xsl:apply-templates select="dateline"/>
		<xsl:apply-templates select="salute"/>

	</xsl:template>

	<xsl:template match="salute">

		<p/>

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

			<xsl:for-each select="item">

				<li>
					<xsl:apply-templates/>
				</li>

			</xsl:for-each>

		</ul>

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

	<xsl:template match="figure">

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

	</xsl:template>

	<xsl:template match="seg">

		<xsl:if test="@type='postscript'">

			<p>
				<xsl:value-of select="."/>
			</p>

		</xsl:if>

		<xsl:if test="@type='note-symbol'">

			<xsl:value-of select="."/>

		</xsl:if>

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
		<xsl:if test="@rend='italic'">
			<i>
				<xsl:value-of select="."/>
			</i>
		</xsl:if>
		<xsl:if test="@rend='small-caps' or @rend='smallcaps'">
			<small>
				<xsl:value-of select="."/>
			</small>
		</xsl:if>
		<xsl:if test="@rend='bold'">
			<b>
				<xsl:value-of select="."/>
			</b>
		</xsl:if>
		<xsl:if test="@rend='underline'">
			<u>
				<xsl:value-of select="."/>
			</u>
		</xsl:if>
		<xsl:if test="@rend='super' or @rend='sup' or @rend='superscript'">
			<sup>
				<xsl:value-of select="."/>
			</sup>
		</xsl:if>
		<xsl:if test="@rend='sub' or @rend='subscript'">
			<sub>
				<xsl:value-of select="."/>
			</sub>
		</xsl:if>
		<xsl:if test="@rend='center'">
			<p align="center">
				<xsl:value-of select="."/>
			</p>
		</xsl:if>
	</xsl:template>

</xsl:stylesheet>
