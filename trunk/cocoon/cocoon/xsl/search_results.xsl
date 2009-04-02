<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="2.0">
	<xsl:output method="xhtml" encoding="UTF-8"/>

	<xsl:param name="q"/>
	<xsl:param name="rows"/>
	<xsl:param name="start"/>
	<xsl:param name="mode"/>

	<xsl:template match="/">
		<xsl:choose>
			<xsl:when test="$mode = 'teidoc'">
				<xsl:apply-templates select="//doc" mode="teidoc"/>
			</xsl:when>
			<xsl:otherwise>
				<xsl:call-template name="paging"/>
				<xsl:apply-templates select="//doc" mode="normal"/>
				<xsl:call-template name="paging"/>
			</xsl:otherwise>
		</xsl:choose>

	</xsl:template>
	
	<xsl:template match="doc" mode="teidoc">
		<xsl:variable name="id" select="str[@name='id']"/>
		
		<div class="doc">
			<a href="{str[@name='doc_id']}.xml?div_id={str[@name='chapter_id']}#{$id}">
				<xsl:value-of select="str[@name='title']"/>
			</a>
		</div>
	</xsl:template>

	<xsl:template match="doc" mode="normal">
		<xsl:variable name="id" select="str[@name='id']"/>

		<div class="doc">
			<a href="../{str[@name='doc_id']}.xml?div_id={str[@name='chapter_id']}#{$id}">
				<xsl:value-of select="str[@name='title']"/>
			</a>
			<br/>
			<xsl:apply-templates select="//lst[@name=$id]/arr[@name='fulltext']/str"/>
		</div>
	</xsl:template>

	<xsl:template match="str">
		<xsl:if test="position() &gt; 1">
			<xsl:text> ... </xsl:text>
		</xsl:if>
		<xsl:value-of select="." disable-output-escaping="yes"/>
	</xsl:template>

	<xsl:template name="paging">
		<xsl:variable name="numFound">
			<xsl:value-of select="//result[@name='response']/@numFound"/>
		</xsl:variable>

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
				<xsl:text> total results.</xsl:text>
			</div>

			<!-- paging functionality -->
			<div style="float:right;">
				<xsl:choose>
					<xsl:when test="$numFound &gt; $rows and $start &gt; $previous">
						<a class="pagingBtn" style="border-left:1px solid #454545;"
							href="salemSearch.htm?q={$q}&amp;rows={$rows}&amp;start={$previous}&amp;ajax=true"
							>«Previous</a>
					</xsl:when>
					<xsl:otherwise>
						<span class="pagingSep" style="border-left:1px solid #454545;"
						>«Previous</span>
					</xsl:otherwise>
				</xsl:choose>

				<!-- always display links to the first two pages -->
				<xsl:if test="$start div $rows &gt;= 3">
					<a class="pagingBtn"
						href="salemSearch.htm?q={$q}&amp;rows={$rows}&amp;start=0&amp;ajax=true">
						<xsl:text>1</xsl:text>
					</a>
				</xsl:if>
				<xsl:if test="$start div $rows &gt;= 4">
					<a class="pagingBtn"
						href="salemSearch.htm?q={$q}&amp;rows={$rows}&amp;start={$rows}&amp;ajax=true">
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
						href="salemSearch.htm?q={$q}&amp;rows={$rows}&amp;start={$start - ($rows * 2)}&amp;ajax=true">
						<xsl:value-of select="($start div $rows) -1"/>
					</a>
				</xsl:if>
				<xsl:if test="$start div $rows &gt;= 1">
					<a class="pagingBtn"
						href="salemSearch.htm?q={$q}&amp;rows={$rows}&amp;start={$start - $rows}&amp;ajax=true">
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
						href="salemSearch.htm?q={$q}&amp;rows={$rows}&amp;start={$start + $rows}&amp;ajax=true">
						<xsl:value-of select="($start div $rows) +2"/>
					</a>
				</xsl:if>
				<xsl:if test="($start div $rows) + 2 &lt; $total">
					<a class="pagingBtn"
						href="salemSearch.htm?q={$q}&amp;rows={$rows}&amp;start={$start + ($rows * 2)}&amp;ajax=true">
						<xsl:value-of select="($start div $rows) +3"/>
					</a>
				</xsl:if>
				<xsl:if test="$start div $rows &lt;= $total - 6">
					<span class="pagingSep">...</span>
				</xsl:if>

				<!-- last two pages -->
				<xsl:if test="$start div $rows &lt;= $total - 5">
					<a class="pagingBtn"
						href="salemSearch.htm?q={$q}&amp;rows={$rows}&amp;start={($total * $rows) - ($rows * 2)}&amp;ajax=true">
						<xsl:value-of select="$total - 1"/>
					</a>
				</xsl:if>
				<xsl:if test="$start div $rows &lt;= $total - 4">
					<a class="pagingBtn"
						href="salemSearch.htm?q={$q}&amp;rows={$rows}&amp;start={($total * $rows) - $rows}&amp;ajax=true">
						<xsl:value-of select="$total"/>
					</a>
				</xsl:if>

				<xsl:choose>
					<xsl:when test="$numFound &gt; $rows and $next &lt; $numFound">
						<a class="pagingBtn"
							href="salemSearch.htm?q={$q}&amp;rows={$rows}&amp;start={$next}&amp;ajax=true"
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
