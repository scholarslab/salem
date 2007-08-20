<xsl:stylesheet version="1.1" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">

<!-- ==================================================================== -->
<!-- Set Variables                                                        -->
<!-- ==================================================================== -->

<xsl:variable name="doc-path">http://jefferson.village.virginia.edu:8090/saxon/servlet/SaxonServlet?source=salem/texts/</xsl:variable>
<!-- xsl:variable name="doc-path">http://localhost:8080/saxon/servlet/SaxonServlet?source=salem/texts/</xsl:variable -->


<!-- ==================================================================== -->
<!-- Set Parameters                                                       -->
<!-- ==================================================================== -->

<xsl:param name="text.name"><xsl:value-of select="//tei.2/@id"/></xsl:param>

<xsl:param name="text.size"></xsl:param>

<xsl:param name="query.string">&#038;style=salem/xsl/dynaxml.xsl</xsl:param>

<xsl:param name="doc.path">http://jefferson.village.virginia.edu:8090/saxon/servlet/SaxonServlet?source=salem/texts/<xsl:value-of select="$text.name"/>.xml<xsl:value-of select="$query.string"/></xsl:param>
<!-- xsl:param name="doc.path">http://localhost:8080/saxon/servlet/SaxonServlet?source=salem/texts/<xsl:value-of select="$text.name"/>.xml<xsl:value-of select="$query.string"/></xsl:param -->

<xsl:param name="beg.doc.path">http://jefferson.village.virginia.edu:8090/saxon/servlet/SaxonServlet?source=salem/texts/</xsl:param>
<!-- xsl:param name="beg.doc.path">http://localhost:8080/saxon/servlet/SaxonServlet?source=salem/texts/</xsl:param -->

<xsl:param name="end.doc.path">.xml<xsl:value-of select="$query.string"/></xsl:param>

<xsl:param name="image.dir">http://jefferson.village.virginia.edu/salem/images</xsl:param>
<xsl:param name="html.dir">http://jefferson.village.virginia.edu/salem</xsl:param>

<xsl:param name="doc.view">frame</xsl:param>

<xsl:param name="chunk.id">tpage</xsl:param>

<xsl:param name="group.num">all</xsl:param>

<xsl:param name="mbio.num">none</xsl:param>

<xsl:param name="name.bio">intro</xsl:param>

</xsl:stylesheet>
