<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:xs="http://www.w3.org/2001/XMLSchema" exclude-result-prefixes="xs xd tei"
    xmlns:xd="http://www.oxygenxml.com/ns/doc/xsl"
    xmlns:tei="http://www.tei.org/ns/"
    version="2.0">
    <xd:doc scope="stylesheet">
        <xd:desc>
            <xd:p><xd:b>Created on:</xd:b> Jan 4, 2011</xd:p>
            <xd:p><xd:b>Author:</xd:b> Wayne Graham</xd:p>
            <xd:p>Basic stylesheet to transform the TEI diaries</xd:p>
        </xd:desc>
    </xd:doc>
    
    <xsl:output encoding="UTF-8" method="xhtml"/>
    
    <xsl:template match="/">
        <html>
            <head>
                <title>
                    <xsl:value-of select="TEI.2/teiHeader/fileDesc/titleStmt/title" />
                    <xsl:text> | Salem Witch Trials</xsl:text>
                </title>
                <link type="text/css" href="../style.css?v=2" rel="stylesheet"/>
            </head>
            <body>
                <div id="wrap">
                    <div class="header nosearchhi">
                        <img src="../images/startdoc2.jpg" width="621" height="90" alt="Salem Witch Trials Logo"/>
                        <ul class="menu">
                            <li class="menu_item menu_home" style="width:13%;"><a href="../home.html">Home</a></li>
                            <li class="menu_item menu_archives" style="width:15%"><a href="../archive2.html">Archives</a></li>
                            <li class="menu_item menu_books" style="width:24%;"><a href="../books.html">Books &amp; Diaries</a></li>
                            <li class="menu_item menu_documents" style="width:20%;"><a href="../17docs.html">Documents</a></li>
                            <li class="menu_item menu_maps" style="width:13%;"><a href="../maps.html">Maps</a></li>
                            <li class="menu_item menu_people" style="width:15%;"><a href="../people?group.num=all">People</a></li>
                        </ul>
                    </div>
                    
                    <div id="page_content">
                        
                        <h2><xsl:value-of select="TEI.2/text/front/titlePage/titlePart" /></h2>
                        
                        <xsl:for-each select="TEI.2/text/body/div1">
                            <xsl:apply-templates />
                            <hr/>
                        </xsl:for-each>
                        
                    </div>
                </div>
                
                <footer id="footer">
                    &#169; 2010 by Benjamin Ray and the Rector and Visitors of the University of Virginia
                </footer>
                
            </body>
        </html>
        
    </xsl:template>
    
    <xsl:template match="TEI.2/text/body/div1/p">
        <p class="div1"><xsl:apply-templates /></p>
    </xsl:template>
    
    <xsl:template match="TEI.2/text/body/div1/div2/p">
        <p class="div2"><xsl:apply-templates /></p>
    </xsl:template>
    
    <xsl:template match="TEI.2/text/body/div1/div2/div3/p">
        <p class="div3"><xsl:apply-templates /></p>
    </xsl:template>
    
    <xsl:template match="TEI.2/text/body/div1/div2/div3/div4/p">
        <p class="div4"><xsl:apply-templates /></p>
    </xsl:template>
    
    <xsl:template match="TEI.2/text/body/div1/div2/div3/div4/div5/p">
        <p class="div5"><xsl:apply-templates /></p>
    </xsl:template>
    
    <xsl:template match="TEI.2/text/body/div1/div2/div3/div4/div5/div6/p">
        <p class="div6"><xsl:apply-templates /></p>
    </xsl:template>
    
    <xsl:template match="//date">
        <strong><xsl:value-of select="node()" /></strong>
        
    </xsl:template>
    
</xsl:stylesheet>
