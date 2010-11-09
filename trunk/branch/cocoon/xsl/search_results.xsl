<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="2.0"
	xmlns:xs="http://www.w3.org/2001/XMLSchema">
	<xsl:output method="html" encoding="UTF-8"/>

	<xsl:param name="q"/>
	<xsl:param name="rows" as="xs:integer"/>
	<xsl:param name="start" as="xs:integer"/>
	<xsl:param name="mode"/>
	<xsl:param name="name"/>
	<xsl:param name="numFound" select="//result[@name='response']/@numFound" as="xs:integer"/>
	<xsl:param name="expand"/>
	<xsl:param name="case_title">
		<xsl:if test="contains($q, 'case_title:')">
			<xsl:value-of
				select="substring-before(substring-after($q, 'case_title:&#x0022;'), '&#x0022;')"/>
		</xsl:if>
	</xsl:param>
	<xsl:param name="query">
		<xsl:choose>
			<xsl:when
				test="(contains(substring-before($q, 'date:'), 'AND') or contains(substring-before($q, 'case_title:'), 'AND')) and not(substring($q, 1, 5) = 'date:')">
				<xsl:value-of select="substring-before($q, ' AND')"/>
			</xsl:when>
			<xsl:when test="contains($q, 'name_text')"/>
			<xsl:when test="substring($q, 1, 5) = 'date:'"/>
			<xsl:otherwise>
				<xsl:value-of select="$q"/>
			</xsl:otherwise>
		</xsl:choose>
	</xsl:param>
	<xsl:param name="nameid">
		<xsl:if test="contains($q, 'name_text')">
			<xsl:value-of select="substring-after($q, ':')"/>
		</xsl:if>
	</xsl:param>

	<xsl:template match="/">
		<xsl:choose>
			<xsl:when test="$mode = 'teidoc'">
				<xsl:apply-templates select="//doc" mode="teidoc"/>
			</xsl:when>
			<xsl:otherwise>
				<xsl:choose>
					<xsl:when test="$numFound = 0">
						<p>No results found. Please broaden query to find applicable terms and/or
							dates.</p>
					</xsl:when>
					<xsl:otherwise>
						<xsl:call-template name="paging"/>
						<div class="docs">
							<xsl:apply-templates select="//doc" mode="normal"/>
						</div>
						<div class="facets">
							<xsl:apply-templates select="//lst[@name='facet_fields']"/>
						</div>
						<xsl:call-template name="paging"/>
					</xsl:otherwise>
				</xsl:choose>
			</xsl:otherwise>
		</xsl:choose>

	</xsl:template>

	<xsl:template match="doc" mode="teidoc">
		<xsl:variable name="id" select="str[@name='id']"/>

		<div class="doc">
			<!-- old -->
			<!-- <a href="{str[@name='doc_id']}.xml?div_id={str[@name='chapter_id']}#{$id}">
				<xsl:value-of select="str[@name='title']"/>
				</a> -->
			<a
				href="{str[@name='doc_id']}.xml?div_id={$id}&amp;chapter_id={str[@name='chapter_id']}">
				<xsl:value-of select="str[@name='title']"/>
			</a>
			<br/>
			<xsl:text>Case: </xsl:text>
			<xsl:value-of select="str[@name='case_title']"/>
		</div>
	</xsl:template>

	<xsl:template match="doc" mode="normal">
		<xsl:variable name="id" select="str[@name='id']"/>

		<div class="doc">
			<xsl:choose>
				<xsl:when test="str[@name='source'] = 'tei'">
					<xsl:choose>
						<xsl:when test="string($nameid)">
							<xsl:text>Transcript: </xsl:text>
							<a
								href="tei/{str[@name='doc_id']}?term={$query}&amp;div_id={$id}&amp;chapter_id={str[@name='chapter_id']}&amp;name={$nameid}">
								<xsl:choose>
									<xsl:when test="string(str[@name='title'])">
										<xsl:value-of select="str[@name='title']"/>
									</xsl:when>
									<xsl:otherwise>[No title]</xsl:otherwise>
								</xsl:choose>
							</a>
						</xsl:when>
						<xsl:otherwise>
							<xsl:text>Transcript: </xsl:text>
							<a
								href="tei/{str[@name='doc_id']}?term={$query}&amp;div_id={$id}&amp;chapter_id={str[@name='chapter_id']}">
								<xsl:choose>
									<xsl:when test="string(str[@name='title'])">
										<xsl:value-of select="str[@name='title']"/>
									</xsl:when>
									<xsl:otherwise>[No title]</xsl:otherwise>
								</xsl:choose>
							</a>
						</xsl:otherwise>
					</xsl:choose>
					<br/>
					<span class="case">Case: <xsl:value-of select="str[@name='case_title']"/></span>
					<br/>
					<xsl:apply-templates select="//lst[@name=$id]/arr[@name='fulltext']/str"/>
				</xsl:when>
				<xsl:when test="str[@name='source'] = 'ead'">
					<xsl:variable name="thumb_url">
						<xsl:choose>
							<xsl:when test="str[@name='doc_id'] = 'BPL'">
								<xsl:text>archives/BPL/gifs</xsl:text>
							</xsl:when>
							<xsl:when test="str[@name='doc_id'] = 'MassHist'">
								<xsl:text>archives/MassHist/gifs</xsl:text>
							</xsl:when>
							<xsl:when test="str[@name='doc_id'] = 'Suffolk'">
								<xsl:text>archives/Suffolk/gifs</xsl:text>
							</xsl:when>
							<xsl:when test="str[@name='doc_id'] = 'MA135'">
								<xsl:text>archives/MA135/gifs</xsl:text>
							</xsl:when>
							<xsl:when test="str[@name='doc_id'] = 'JudVol'">
								<xsl:text>archives/JudVol/gifs</xsl:text>
							</xsl:when>
							<xsl:when test="str[@name='doc_id'] = 'MidSex'">
								<xsl:text>archives/MidSex/gifs</xsl:text>
							</xsl:when>
							<xsl:when test="str[@name='doc_id'] = 'SCJ'">
								<xsl:text>archives/SCJ/gifs</xsl:text>
							</xsl:when>
							<xsl:when test="str[@name='doc_id'] = 'MEHS'">
								<xsl:text>archives/MEHS/gifs</xsl:text>
							</xsl:when>
							<xsl:when test="str[@name='doc_id'] = 'eia'">
								<xsl:text>archives/essex/eia/gifs</xsl:text>
							</xsl:when>
							<xsl:when test="str[@name='doc_id'] = 'ecca'">
								<xsl:text>archives/ecca/thumb</xsl:text>
							</xsl:when>
						</xsl:choose>
					</xsl:variable>

					<xsl:variable name="medium_url">
						<xsl:choose>
							<xsl:when test="str[@name='doc_id'] = 'BPL'">
								<xsl:text>archives/BPL/SMALL</xsl:text>
							</xsl:when>
							<xsl:when test="str[@name='doc_id'] = 'MassHist'">
								<xsl:text>archives/MassHist/medium</xsl:text>
							</xsl:when>
							<xsl:when test="str[@name='doc_id'] = 'Suffolk'">
								<xsl:text>archives/Suffolk/small</xsl:text>
							</xsl:when>
							<xsl:when test="str[@name='doc_id'] = 'MA135'">
								<xsl:text>archives/MA135/small</xsl:text>
							</xsl:when>
							<xsl:when test="str[@name='doc_id'] = 'JudVol'">
								<xsl:text>archives/JudVol/small</xsl:text>
							</xsl:when>
							<xsl:when test="str[@name='doc_id'] = 'MidSex'">
								<xsl:text>archives/MidSex/small</xsl:text>
							</xsl:when>
							<xsl:when test="str[@name='doc_id'] = 'SCJ'">
								<xsl:text>archives/SCJ/small</xsl:text>
							</xsl:when>
							<xsl:when test="str[@name='doc_id'] = 'MEHS'">
								<xsl:text>archives/MEHS/small</xsl:text>
							</xsl:when>
							<xsl:when test="str[@name='doc_id'] = 'eia'">
								<xsl:text>archives/essex/eia/small</xsl:text>
							</xsl:when>
							<xsl:when test="str[@name='doc_id'] = 'ecca'">
								<xsl:text>archives/ecca/medium</xsl:text>
							</xsl:when>
						</xsl:choose>
					</xsl:variable>

					<xsl:variable name="large_url">
						<xsl:choose>
							<xsl:when test="str[@name='doc_id'] = 'BPL'">
								<xsl:text>archives/BPL/LARGE</xsl:text>
							</xsl:when>
							<xsl:when test="str[@name='doc_id'] = 'MassHist'">
								<xsl:text>archives/MassHist/large</xsl:text>
							</xsl:when>
							<xsl:when test="str[@name='doc_id'] = 'Suffolk'">
								<xsl:text>archives/Suffolk/large</xsl:text>
							</xsl:when>
							<xsl:when test="str[@name='doc_id'] = 'MA135'">
								<xsl:text>archives/MA135/large</xsl:text>
							</xsl:when>
							<xsl:when test="str[@name='doc_id'] = 'JudVol'">
								<xsl:text>archives/JudVol/large</xsl:text>
							</xsl:when>
							<xsl:when test="str[@name='doc_id'] = 'MidSex'">
								<xsl:text>archives/MidSex/large</xsl:text>
							</xsl:when>
							<xsl:when test="str[@name='doc_id'] = 'SCJ'">
								<xsl:text>archives/SCJ/large</xsl:text>
							</xsl:when>
							<xsl:when test="str[@name='doc_id'] = 'MEHS'">
								<xsl:text>archives/MEHS/large</xsl:text>
							</xsl:when>
							<xsl:when test="str[@name='doc_id'] = 'eia'">
								<xsl:text>archives/essex/eia/large</xsl:text>
							</xsl:when>
							<xsl:when test="str[@name='doc_id'] = 'ecca'">
								<xsl:text>archives/ecca/large</xsl:text>
							</xsl:when>
						</xsl:choose>
					</xsl:variable>

					<a href="../archives/{str[@name='doc_id']}#{$id}">
						<xsl:choose>
							<xsl:when test="string(str[@name='title'])">
								<xsl:value-of select="str[@name='title']"/>
							</xsl:when>
							<xsl:otherwise>[No title]</xsl:otherwise>
						</xsl:choose>
					</a>
					<div style="display:table;">
						<xsl:for-each select="arr[@name='thumb']/str">
							<div class="thumb">
								<xsl:choose>
									<xsl:when test="not(str[@name='doc_id'] = 'MA135')">
										<a href="../{$medium_url}/{.}.jpg" class="jqueryLightbox"
											title="{str[@name='title']}">
											<img src="../{$thumb_url}/{.}.gif"
												title="{str[@name='title']}"/>
										</a>
									</xsl:when>
									<xsl:otherwise>
										<img src="../{$thumb_url}/{.}.gif"
											title="{str[@name='title']}"
											style="max-height:60px;max-width:60px;"/>
									</xsl:otherwise>
								</xsl:choose>
								<br/>
								<a href="../{$large_url}/{.}.jpg" target="_blank"
									>Enlarge<br/>Manuscript</a>
							</div>
						</xsl:for-each>
					</div>
				</xsl:when>
			</xsl:choose>
		</div>
	</xsl:template>

	<xsl:template match="str">
		<xsl:if test="position() &gt; 1">
			<xsl:text> ... </xsl:text>
		</xsl:if>
		<xsl:value-of select="." disable-output-escaping="yes"/>
	</xsl:template>

	<xsl:template match="lst[@name='facet_fields']">
		<xsl:for-each select="lst">
			<div class="facet">
				<ul>
					<li class="facet_head">
						<xsl:value-of select="translate(@name, '_', ' ')"/>
					</li>

					<xsl:choose>
						<xsl:when test="$expand = 'true'">
							<xsl:for-each select="int">
								<xsl:call-template name="display_facet"/>
							</xsl:for-each>
							<li>
								<i>
									<a style="margin-left:20px"
										href="?q={$q}&amp;rows={$rows}&amp;start={$start}">Collapse
										List</a>
								</i>
							</li>
						</xsl:when>
						<xsl:otherwise>
							<xsl:for-each select="int[position() &lt; 6]">
								<xsl:call-template name="display_facet"/>
							</xsl:for-each>
							<li>
								<i>
									<a style="margin-left:20px"
										href="?q={$q}&amp;rows={$rows}&amp;start={$start}&amp;expand=true"
										>Expand List</a>
								</i>
							</li>
						</xsl:otherwise>
					</xsl:choose>
				</ul>
			</div>
		</xsl:for-each>
	</xsl:template>

	<xsl:template name="display_facet">
		<li>
			<xsl:choose>
				<xsl:when test="$case_title = @name">
					<div class="facet_text">
						<xsl:value-of select="@name"/>
					</div>
				</xsl:when>
				<xsl:otherwise>
					<div class="facet_text">
						<a
							href="?q={$q} AND case_title:&#x0022;{@name}&#x0022;&amp;start=0&amp;rows=10">
							<xsl:value-of select="@name"/>
						</a>
					</div>
				</xsl:otherwise>
			</xsl:choose>
			<xsl:choose>
				<xsl:when test="$case_title = @name">
					<xsl:variable name="removeStr">
						<xsl:value-of
							select="concat(' AND case_title:&#x0022;', $case_title, '&#x0022;')"/>
					</xsl:variable>
					<xsl:variable name="finalStr">
						<xsl:value-of
							select="concat(substring-before($q, $removeStr), substring-after($q, $removeStr))"
						/>
					</xsl:variable>
					<div class="facet_num">[<a href="?q={$finalStr}&amp;start=0&amp;rows=10"
						>X</a>]</div>
				</xsl:when>
				<xsl:otherwise>
					<div class="facet_num">
						<xsl:text> (</xsl:text>
						<xsl:value-of select="."/>
						<xsl:text>)</xsl:text>
					</div>
				</xsl:otherwise>
			</xsl:choose>

		</li>
	</xsl:template>

	<xsl:template name="paging">
		<xsl:variable name="next">
			<xsl:value-of select="$start+$rows"/>
		</xsl:variable>

		<xsl:variable name="previous">
			<xsl:choose>
				<xsl:when test="$start &gt;= $rows">
					<xsl:value-of select="$start - $rows"/>
				</xsl:when>
				<xsl:otherwise>0</xsl:otherwise>
			</xsl:choose>
		</xsl:variable>

		<xsl:variable name="current" select="$start div $rows + 1"/>
		<xsl:variable name="total" select="ceiling($numFound div $rows)"/>

		<div class="paging_div">
			<div style="float:left;">
				<xsl:choose>
					<xsl:when test="$numFound= 1">
						<xsl:text>Displaying 1 result</xsl:text>
						<xsl:if test="string($name)"> for <b>
								<xsl:value-of select="$name"/>
							</b>
						</xsl:if>
						<xsl:text>.</xsl:text>
					</xsl:when>
					<xsl:otherwise>
						<xsl:text>Displaying records </xsl:text>
						<b>
							<xsl:value-of select="$start + 1"/>
						</b>
						<xsl:text> to </xsl:text>
						<xsl:choose>
							<xsl:when test="$numFound &gt; ($start + $rows)">
								<b>
									<xsl:value-of select="$start + $rows"/>
								</b>
							</xsl:when>
							<xsl:otherwise>
								<b>
									<xsl:value-of select="$numFound"/>
								</b>
							</xsl:otherwise>
						</xsl:choose>
						<xsl:text> of </xsl:text>
						<b>
							<xsl:value-of select="$numFound"/>
						</b>
						<xsl:text> total results</xsl:text>
						<xsl:if test="string($name)"> for <b>
								<xsl:value-of select="$name"/>
							</b>
						</xsl:if>
						<xsl:text>.</xsl:text>
					</xsl:otherwise>
				</xsl:choose>
			</div>

			<!-- paging functionality -->
			<div style="float:right;">
				<xsl:choose>
					<xsl:when test="$numFound &gt; $rows and $start &gt; $previous">
						<a class="pagingBtn" style="border-left:1px solid #454545;"
							href="salemSearch.htm?q={$q}&amp;rows={$rows}&amp;start={$previous}"
							>«Previous</a>
					</xsl:when>
					<xsl:otherwise>
						<span class="pagingSep" style="border-left:1px solid #454545;"
							>«Previous</span>
					</xsl:otherwise>
				</xsl:choose>

				<!-- always display links to the first two pages -->
				<xsl:if test="$start div $rows &gt;= 3">
					<a class="pagingBtn" href="salemSearch.htm?q={$q}&amp;rows={$rows}&amp;start=0">
						<xsl:text>1</xsl:text>
					</a>
				</xsl:if>
				<xsl:if test="$start div $rows &gt;= 4">
					<a class="pagingBtn"
						href="salemSearch.htm?q={$q}&amp;rows={$rows}&amp;start={$rows}">
						<xsl:text>2</xsl:text>
					</a>
				</xsl:if>

				<!-- display only if you are on page 6 or greater -->
				<xsl:if test="$start div $rows &gt;= 5">
					<span class="pagingSep">...</span>
				</xsl:if>

				<!-- always display links to the previous two pages -->
				<xsl:if test="$start div $rows &gt;= 2">
					<a class="pagingBtn"
						href="salemSearch.htm?q={$q}&amp;rows={$rows}&amp;start={$start - ($rows * 2)}">
						<xsl:value-of select="($start div $rows) -1"/>
					</a>
				</xsl:if>
				<xsl:if test="$start div $rows &gt;= 1">
					<a class="pagingBtn"
						href="salemSearch.htm?q={$q}&amp;rows={$rows}&amp;start={$start - $rows}">
						<xsl:value-of select="$start div $rows"/>
					</a>
				</xsl:if>

				<span class="pagingBtn" style="background-color:#D9DCD9;">
					<b>
						<xsl:value-of select="$current"/>
					</b>
				</span>

				<!-- next two pages -->
				<xsl:if test="($start div $rows) + 1 &lt; $total">
					<a class="pagingBtn"
						href="salemSearch.htm?q={$q}&amp;rows={$rows}&amp;start={$start + $rows}">
						<xsl:value-of select="($start div $rows) +2"/>
					</a>
				</xsl:if>
				<xsl:if test="($start div $rows) + 2 &lt; $total">
					<a class="pagingBtn"
						href="salemSearch.htm?q={$q}&amp;rows={$rows}&amp;start={$start + ($rows * 2)}">
						<xsl:value-of select="($start div $rows) +3"/>
					</a>
				</xsl:if>
				<xsl:if test="$start div $rows &lt;= $total - 6">
					<span class="pagingSep">...</span>
				</xsl:if>

				<!-- last two pages -->
				<xsl:if test="$start div $rows &lt;= $total - 5">
					<a class="pagingBtn"
						href="salemSearch.htm?q={$q}&amp;rows={$rows}&amp;start={($total * $rows) - ($rows * 2)}">
						<xsl:value-of select="$total - 1"/>
					</a>
				</xsl:if>
				<xsl:if test="$start div $rows &lt;= $total - 4">
					<a class="pagingBtn"
						href="salemSearch.htm?q={$q}&amp;rows={$rows}&amp;start={($total * $rows) - $rows}">
						<xsl:value-of select="$total"/>
					</a>
				</xsl:if>

				<xsl:choose>
					<xsl:when test="$numFound &gt; $rows and $next &lt; $numFound">
						<a class="pagingBtn"
							href="salemSearch.htm?q={$q}&amp;rows={$rows}&amp;start={$next}"
							>Next»</a>
					</xsl:when>
					<xsl:otherwise>
						<span class="pagingSep">Next»</span>
					</xsl:otherwise>
				</xsl:choose>
			</div>
		</div>
	</xsl:template>

</xsl:stylesheet>
