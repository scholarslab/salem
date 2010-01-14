<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
	xmlns:xs="http://www.w3.org/2001/XMLSchema" exclude-result-prefixes="xs" version="2.0">

	<xsl:param name="group.num"/>
	<xsl:param name="mbio.num"/>

	<xsl:template match="/">
		<html>
			<head>
				<title>Salem Witch Trials Notable Persons</title>
				<meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1"/>
				<link type="text/css" href="style.css" rel="stylesheet"/>
				<script type="text/javascript" src="javascript/jquery-1.2.6.min.js"/>
				<script type="text/javascript" src="javascript/jquery.lightbox-0.5.min.js"/>
				<script type="text/javascript" src="javascript/salem-lightbox.js"/>
				<script type="text/javascript" src="javascript/notable_people_sections.js"/>
			</head>
			<body>
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
							<a href="people?group.num=all&amp;clear-stylesheet-cache=yes"
								>People</a>
						</li>
					</ul>
				</div>
				<div class="people_content">
					<h2>Important Persons in the Salem Court Records</h2>
					<table style="width:100%">
						<tr>
							<th style="width:25%;background-color:#CC9966">Categories</th>
							<th style="width:25%;background-color:#CC9966">People and Topics</th>
							<th style="width:50%;background-color:#CC9966">Biographical Data</th>
						</tr>
						<tr>
							<td style="width:15%;vertical-align:top">
								<ul>
									<xsl:for-each select="//div2[@type='groups']/name">
										<xsl:choose>
											<xsl:when test="@id = $group.num">
												<li style="background-color:#ffffcc">
												<a href="?group.num={@id}">
												<xsl:value-of select="."/>
												</a>
												</li>
											</xsl:when>
											<xsl:otherwise>
												<li>
												<a href="?group.num={@id}">
												<xsl:value-of select="."/>
												</a>
												</li>
											</xsl:otherwise>
										</xsl:choose>

									</xsl:for-each>
									<li>
										<a href="?group.num=all">All</a>
									</li>
								</ul>
							</td>
							<td style="width:20%;vertical-align:top">
								<ul>
									<xsl:choose>
										<xsl:when
											test="not(string($group.num)) or $group.num = 'all'">
											<xsl:for-each select="//div2[@type='persons']/persname">
												<xsl:choose>
												<xsl:when test="@mbio">
												<xsl:choose>
												<xsl:when test="$mbio.num = @mbio">
												<li style="background-color:#ffffcc">
												<a
												href="?group.num={$group.num}&amp;mbio.num={@mbio}">
												<xsl:value-of select="."/>
												</a>
												</li>
												</xsl:when>
												<xsl:otherwise>
												<li>
												<a
												href="?group.num={$group.num}&amp;mbio.num={@mbio}">
												<xsl:value-of select="."/>
												</a>
												</li>
												</xsl:otherwise>
												</xsl:choose>
												</xsl:when>
												<xsl:otherwise>
												<li>
												<xsl:value-of select="."/>
												</li>
												</xsl:otherwise>
												</xsl:choose>


											</xsl:for-each>
										</xsl:when>
										<xsl:otherwise>
											<xsl:for-each
												select="//div2[@type='persons']/persname[contains(@cats, $group.num)]">
												<xsl:choose>
												<xsl:when test="@mbio">
												<xsl:choose>
												<xsl:when test="$mbio.num = @mbio">
												<li style="background-color:#ffffcc">
												<a
												href="?group.num={$group.num}&amp;mbio.num={@mbio}">
												<xsl:value-of select="."/>
												</a>
												</li>
												</xsl:when>
												<xsl:otherwise>
												<li>
												<a
												href="?group.num={$group.num}&amp;mbio.num={@mbio}">
												<xsl:value-of select="."/>
												</a>
												</li>
												</xsl:otherwise>
												</xsl:choose>
												</xsl:when>
												<xsl:otherwise>
												<li>
												<xsl:value-of select="."/>
												</li>
												</xsl:otherwise>
												</xsl:choose>
											</xsl:for-each>
										</xsl:otherwise>
									</xsl:choose>
								</ul>
							</td>
							<td style="width:65%;vertical-align:top">
								<a name="top"/>
								<xsl:if test="string($mbio.num)">
									<xsl:apply-templates
										select="descendant::persname[@mbio = $mbio.num]"/>
								</xsl:if>
							</td>
						</tr>
					</table>
				</div>
			</body>
		</html>
	</xsl:template>

	<xsl:template match="persname">
		<xsl:variable name="bio" select="@bio"/>
		<xsl:variable name="crt" select="@crt"/>
		<xsl:variable name="pics" select="@pics"/>
		<div>
			<xsl:apply-templates select="document('../xml/minibios.xml')//div2[@id=$mbio.num]"/>
		</div>
		<xsl:if test="string(@pics)">
			<div class="section">
				<b>Images</b>
				<span class="expand" id="expand_pics" title="expand">+</span>
				<div id="pics" style="display:none">
					<table>
						<xsl:apply-templates
							select="document('../xml/pics.xml')//div2[@id=$pics]/figure"/>
					</table>
					<div style="text-align:right;"><a href="#top">top</a></div>
				</div>
			</div>
		</xsl:if>
		<xsl:if test="string(@bio)">
			<div class="section">
				<b>Full Essay</b>
				<span class="expand" id="expand_bio" title="expand">+</span>
				<div id="bio" style="display:none">
					<xsl:apply-templates select="document('../xml/bios.xml')//div2[@id=$bio]"/>
					<div style="text-align:right;"><a href="#top">top</a></div>
				</div>
			</div>
		</xsl:if>
		<xsl:if test="string(@crt)">
			<div class="section">
				<b>Courtroom Exam</b>
				<span class="expand" id="expand_crt" title="expand">+</span>
				<div id="crt" style="display:none">
					<xsl:apply-templates select="document('../xml/courtexams.xml')//div2[@id=$crt]"
					/>
					<div style="text-align:right;"><a href="#top">top</a></div>
				</div>
			</div>
		</xsl:if>
	</xsl:template>

	<xsl:template match="p | text | figdesc">
		<p>
			<xsl:apply-templates/>
		</p>
	</xsl:template>

	<xsl:template match="head">
		<h4>
			<xsl:apply-templates/>
		</h4>
	</xsl:template>

	<xsl:template match="figure">
		<tr>
			<td style="width:240px;text-align:center;border:1px solid silver;padding:5px;">
				<a href="images/{@entity}" class="personsLightbox">
					<img src="images/{@thumb}"/>
				</a>
			</td>
			<td style="padding:5px;border:1px solid silver">
				<xsl:apply-templates/>
			</td>
		</tr>
	</xsl:template>

	<xsl:template match="emph">
		<xsl:choose>
			<xsl:when test="@rend = 'bold'">
				<b>
					<xsl:apply-templates/>
				</b>
			</xsl:when>
			<xsl:when test="@rend = 'italic'">
				<i>
					<xsl:apply-templates/>
				</i>
			</xsl:when>
		</xsl:choose>
	</xsl:template>

</xsl:stylesheet>
