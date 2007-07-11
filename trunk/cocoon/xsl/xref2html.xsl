<?xml version="1.0"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
                version="1.0">

<xsl:output method="html" indent="yes" />
<xsl:param name="id"/>
<xsl:param name="n"/>
<xsl:template match="/">
	<html>
	<head>
	<style>
	.speech {margin-left:10px; 
			margin-top:.5em; 
			margin-bottom:1em}
	.stage {font-style:italic; 
			margin-top:.5em; 
			margin-bottom:.5em;
			margin-left: 10px;
			color: green}
	.entry {margin-left:40px; margin-bottom:.5em}
	.nameentry {color:brown; font-weight:bold}
	.head1 {font-size: 14pt; 
			font-weight:bold;
			margin-left: 40px}

	.content {margin-left:20px; margin-bottom: 4ex}
	.speaker {font-weight:bold}

	.foot {margin-bottom: 1em; text-align: center}

	.parasmall {margin-bottom:2em;
			margin-top:1em;
			font-size: 9pt}
	.para {margin-left:10px; 
			margin-top:.5em;
			margin-bottom:.25em}
	.seg {margin-left:10px}
	
	.keywords {color:brown;
			font-style:italic}	

          BODY {margin-left:5px; 
			margin-right: 200px; 
			background-color: #FFFFFF; 
			font-family: Times, serif;
			font-size: 11pt}
          P          { margin-top:.5em; 
			margin-bottom: .25em; }
          HR         { color: #888833; }
        </style>
	<title>
	<xsl:value-of select="//biblFull/titleStmt/title" />
	</title>
	</head>

	<body bgcolor="#FFFFFF" text="#000000" link="#990066" vlink="#990066" leftmargin="0" topmargin="0" marginwidth="0" marginheight="0"> 
		<xsl:call-template name="heading"/>
			<HR/>
			<div class="content">
				<xsl:apply-templates select="//div2[@id=$id] | //div1[@n=$n]"/>
			</div>
			<HR/>
			<div class="foot">
				<xsl:call-template name="footer"/>
			</div>
	</body>
	</html>
</xsl:template>


<xsl:template name="heading">
	<p align="center">
		<img src="../images/startdoc2.jpg" width="621" height="90" border="1"/>
	</p> 
	<div align="center">  
  		<div class="para">
			<b>
				<font size="+2" color="#000000">The Salem Witchcraft Papers</font>
			</b>
		</div> 
    		<div class="para">
				<font size="+1">Verbatim Transcriptions of the Court Records 
				<br/>
				In three volumes
				<br/>
   				Revised, corrected, and augmented edition by Benjamin C. Ray and Tara S. Wood
				</font>
				<br/>
				<font size="-1">
				&#x00A9; 2003, Benjamin C. Ray and The Rector and Visitors of the University of Virginia 
				</font><br/>
		</div>
	</div>
</xsl:template>

<xsl:template match="div1">
	<xsl:apply-templates/>
</xsl:template>


<xsl:template match="div2">
	<xsl:choose>
		<xsl:when test="@type='entry'">
			<DIV CLASS="entry"><xsl:apply-templates/></DIV>
		</xsl:when>
		<xsl:otherwise>
			<xsl:apply-templates/>
		</xsl:otherwise>
	</xsl:choose>
</xsl:template>

<xsl:template match="div2/head | div1/head">
<xsl:choose>
	<xsl:when test="child::seg">
                <DIV CLASS="head1"><xsl:value-of select="seg[@type='title']"/></DIV>
        </xsl:when>

        <xsl:otherwise>
                <DIV CLASS="head1"><xsl:apply-templates/></DIV>
        </xsl:otherwise>
</xsl:choose>
</xsl:template>

<xsl:template match="p">
	<xsl:choose>
		<xsl:when test="parent::div2[@type='entry']">
			<xsl:apply-templates/>
		</xsl:when>
		<xsl:otherwise>	
			<DIV CLASS="para">
				&#160;&#160;&#160;&#160;&#160;&#160;<xsl:apply-templates/>
			</DIV>
		</xsl:otherwise>
	</xsl:choose>
</xsl:template>

<xsl:template match="lb">
	<BR/>
</xsl:template>

<xsl:template match="seg">
	<DIV CLASS="seg"><xsl:apply-templates/></DIV>
</xsl:template>

<xsl:template match="name">
	<xsl:choose>
		<xsl:when test="@type='index-entry'">
			<SPAN CLASS="nameentry"><xsl:apply-templates/></SPAN>
		</xsl:when>
		<xsl:otherwise>
			<xsl:apply-templates/>		
		</xsl:otherwise>
	</xsl:choose>
</xsl:template>

<xsl:template match="hi">
	<xsl:choose>
		<xsl:when test="@rend='smallcaps'">
			<xsl:apply-templates/>
		</xsl:when>
		<xsl:when test="@rend='bold'">
			<B><xsl:apply-templates/></B>
		</xsl:when>
		<xsl:when test="italic | italics">
			<I><xsl:apply-templates/></I>
		</xsl:when>
		<xsl:otherwise>
			<I><xsl:apply-templates/></I>
		</xsl:otherwise>
	</xsl:choose>
</xsl:template>

<xsl:template match="xref">
	<xsl:variable name="page" select="@doc"/>
	<xsl:variable name="idnum" select="substring-after($page, 'p')"/>
	<a href="http://etext.lib.virginia.edu/etcbin/salem-browse?id={$idnum}"><xsl:apply-templates/></a>	
</xsl:template>

<xsl:template name="footer">
	<div class="foot">
		<div class="para">
			<a href="../html/home.html">Salem Home</a> | 
     			<a href="../html/17docs.html">17th Century Documents</a>
		</div>
		<div class="parasmall">
			<a href="http://www.virginia.edu/copyright.html">
				&#x00A9; 2002, The Rector and Visitors of the University of Virginia
			</a>
		</div>
	</div>
</xsl:template>


</xsl:stylesheet>
