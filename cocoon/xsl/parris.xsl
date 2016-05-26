<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:xs="http://www.w3.org/2001/XMLSchema" exclude-result-prefixes="xs xd tei"
    xmlns:xd="http://www.oxygenxml.com/ns/doc/xsl"
    xmlns:tei="http://www.tei.org/ns/"
    version="2.0">
    <xd:doc scope="stylesheet">
        <xd:desc>
            <xd:p><xd:b>Created on:</xd:b> Nov 24, 2015</xd:p>
            <xd:p><xd:b>Author:</xd:b> Chris Ruotolo</xd:p>
            <xd:p>Stylesheet to transform parris-church-recbook.xml</xd:p>
        </xd:desc>
    </xd:doc>
    <xsl:output method="xml" indent="yes"/>
    
    <xsl:template match="/">
        <html>
            <head>
                <title>
                    <xsl:value-of select="TEI.2/teiHeader/fileDesc/titleStmt/title[@type='245']" />
                    <xsl:text> | Salem Witch Trials</xsl:text>
                </title>
                <link type="text/css" href="http://salem.lib.virginia.edu/style.css?v=2" rel="stylesheet"/>
                <style type="text/css">
                    .pb {display:block; width:100%; text-align: right; border-top: thin solid black}
                    .del {text-decoration: line-through}
                    #header{display:none; border-bottom:thin solid black}
                    
                </style>
                <script type="text/javascript">
                    <xsl:comment>
                    function toggle_visibility(id) {
                        var e = document.getElementById(id);
                            if(e.style.display == 'block')
                        e.style.display = 'none';
                            else
                        e.style.display = 'block';
                    }
                    //</xsl:comment>
                </script>
            </head>
            <body>

                    
                      <div class="header nosearchhi">
                          <img src="http://salem.lib.virginia.edu/images/startdoc2.jpg" width="621" height="90" alt="Salem Witch Trials Logo"/>
<!--                        <ul class="menu">
                            <li class="menu_item menu_home" style="width:13%;"><a href="../home.html">Home</a></li>
                            <li class="menu_item menu_archives" style="width:15%"><a href="../archive2.html">Archives</a></li>
                            <li class="menu_item menu_books" style="width:24%;"><a href="../books.html">Books &amp; Diaries</a></li>
                            <li class="menu_item menu_documents" style="width:20%;"><a href="../17docs.html">Documents</a></li>
                            <li class="menu_item menu_maps" style="width:13%;"><a href="../maps.html">Maps</a></li>
                            <li class="menu_item menu_people" style="width:15%;"><a href="../people?group.num=all">People</a></li>
                        </ul>-->
                    </div>
                    
                    <div id="page_content">
                        <br/>
                        <a href="#" onclick="toggle_visibility('header');">Click to expand/collapse header</a>
                        <div id="header">
                            <br/>
                            <xsl:apply-templates select="TEI.2/teiHeader"/>
                            <br/><br/>
                        </div>
                        <p>&#160;</p>
                        <h3><xsl:value-of select="TEI.2/teiHeader/fileDesc/titleStmt/title[@type='245']" /></h3>
                        
                        <xsl:for-each select="TEI.2/text/body/div1">
                            <xsl:apply-templates />
                            <hr/>
                        </xsl:for-each>
                        
                    </div>
                
                
                
                    <p align="center">
                                <a href="home.html" shape="rect">Salem Home</a>
                                | <a href="17docs.html" shape="rect">17th Century
                                    Documents</a>

                    </p>                
                
            </body>
        </html>
        
    </xsl:template>
    
    <!-- templates to format the header -->
    <xsl:template match="fileDesc">
        <div><i>About the electronic version:</i><br/>
            <xsl:apply-templates select="titleStmt"/>
        </div>
        <div><xsl:apply-templates select="publicationStmt"/></div>
        <br/>
        <div>
            <xsl:for-each select="sourceDesc">
                <i>About the source version:</i><br/>
                <xsl:apply-templates select="bibl"/>
                <br/>
            </xsl:for-each>
        </div>
        <xsl:if test="sourceStmt">
            <div><xsl:apply-templates select="."/></div>
        </xsl:if>
    </xsl:template>
    <xsl:template match="titleStmt">
        <b>Title: </b><xsl:value-of select="title"/><br/>
        <b>Author: </b><xsl:value-of select="author"/><br/>
        <b>Editor: </b><xsl:value-of select="editor"/><br/>
        <xsl:if test="respStmt">
            <b><xsl:value-of select="respStmt/resp"/>: </b>
            <xsl:value-of select="respStmt/name"/>
        </xsl:if>
    </xsl:template>
    <xsl:template match="bibl">
            <b>Title: </b><xsl:apply-templates/><br/>
    </xsl:template>
    <xsl:template match="publicationStmt|imprint">
        <b>Publisher: </b><xsl:value-of select="publisher"/><xsl:text>, </xsl:text><xsl:value-of select="pubPlace"/><br/>
        <b>Authority: </b><xsl:value-of select="authority"/><br/>
        <b>Date: </b><xsl:value-of select="date"/><br/>
    </xsl:template>
    
    <xsl:template match="encodingDesc">
        <b>Note: </b><xsl:value-of select="." />
    </xsl:template>
    
    
    <!-- templates to format the body -->
    <xsl:template match="p">
        <p><xsl:apply-templates /></p>
    </xsl:template>
    
    <xsl:template match="head">
        <h3 align="center"><xsl:apply-templates /></h3>
    </xsl:template>
    
    <xsl:template match="pb">

        <p class="pb">page: <xsl:value-of select="@n"/><br/>
            <a href="http://www.danverslibrary.org/archive/wp-content/uploads/2015/09/ChurchRecords_0{@n+10}.jpg">image</a></p>
    </xsl:template>
    
    <xsl:template match="lb">
        <br/>
    </xsl:template>

    <xsl:template match="table">
        <table>
            <xsl:apply-templates/>
        </table>
    </xsl:template>
    
    <xsl:template match="row">
        <tr>
            <xsl:apply-templates/>
        </tr>
    </xsl:template>
    
    <xsl:template match="cell">
        <td>
            <xsl:apply-templates/>
        </td>
    </xsl:template>
    
    <xsl:template match="list">
        <list>
            <xsl:apply-templates/>
        </list>
    </xsl:template>

    <xsl:template match="list">
        <ul>
            <xsl:apply-templates/>
        </ul>
    </xsl:template>
    <xsl:template match="item">
        <li>
            <xsl:apply-templates/>
        </li>
    </xsl:template>
    
    <xsl:template match="del">
        <span class="del"><xsl:apply-templates/></span>
    </xsl:template>
        
</xsl:stylesheet>