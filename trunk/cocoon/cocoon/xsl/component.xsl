<xsl:stylesheet version="1.1" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:js="javascript:code">

<!-- <xsl:script language="javascript" implements-prefix="js">
<![CDATA[
  function win(){
    NewWin=window.open('','NewWin','toolbar=no,status=no,width=200,height=100');
  }
]]>
</xsl:script>
-->
 
  <xsl:param name="doc.lang"/>
  <xsl:param name="toc.depth"/>
  <xsl:param name="toc.id"/>
  <xsl:param name="div.cnt"/>
  <xsl:param name="anchor.id"/> 
  
<xsl:template match="address">
  <xsl:apply-templates/>
</xsl:template>

<xsl:template match="addrLine">
  <xsl:apply-templates/>
</xsl:template>

<xsl:template match="char">
  <xsl:text>[</xsl:text><a>
    <xsl:attribute name="href">
      <xsl:text>javascript:smallSTART('http://www.mojikyo.gr.jp/gif/</xsl:text><xsl:value-of select="substring(@mojikyo_num,1,3)"/><xsl:text>/</xsl:text><xsl:value-of select="@mojikyo_num"/><xsl:text>.gif')</xsl:text>
    </xsl:attribute>
  <xsl:apply-templates/></a><xsl:text>]</xsl:text>
</xsl:template>

<xsl:template match="docAuthor">
  <xsl:apply-templates/>
</xsl:template>

<xsl:template match="foreign">
  <i><xsl:apply-templates/></i>
</xsl:template>

<xsl:template match="q">
  <xsl:apply-templates/>
</xsl:template>

<xsl:template match="author">
  <xsl:choose>
    <xsl:when test="@rend='hide'">
      <xsl:text>&#x2014;&#x2014;&#x2014;</xsl:text>
    </xsl:when>
    <xsl:when test="ancestor::bibl">
      <xsl:text> </xsl:text><xsl:apply-templates/><xsl:text>. </xsl:text>
    </xsl:when>
    <xsl:otherwise>
      <xsl:text> </xsl:text><xsl:apply-templates/><xsl:text> </xsl:text>
    </xsl:otherwise>
  </xsl:choose>
</xsl:template>

<xsl:template match="listBibl">
  <xsl:if test="$anchor.id=@id">
    <a name="X"></a>
  </xsl:if>
  <xsl:apply-templates/>
</xsl:template>

<xsl:template match="bibl">
  <xsl:choose>
    <xsl:when test="ancestor::listBibl">
      <xsl:choose>
	     <xsl:when test="$anchor.id=@id">
	       <a name="@id"></a>
         <table cellpadding="0" cellspacing="0" width="100%" bgcolor="#FFFFFF">
	       <!-- table -->
				 <tr><td bgcolor="#99CC99">
	       <p class="hang"><a><xsl:attribute name="name"><xsl:value-of select="@id"/></xsl:attribute>
         <xsl:apply-templates/></a></p>
	       </td></tr></table>
	     </xsl:when>
	     <xsl:otherwise>
         <table cellpadding="0" cellspacing="0" width="100%" bgcolor="#FFFFFF"><tr><td>
	      <xsl:element name="br"/><p class="hang"><a><xsl:attribute name="name"><xsl:value-of select="@id"/></xsl:attribute>
        <xsl:apply-templates/></a></p>
         </td></tr></table>
	     </xsl:otherwise>
      </xsl:choose>
    </xsl:when>
    <xsl:otherwise>
         <table cellpadding="0" cellspacing="0" width="100%" bgcolor="#FFFFFF"><tr><td>
      <p class="hang"><a><xsl:attribute name="name"><xsl:value-of select="@id"/></xsl:attribute>
      <xsl:apply-templates/></a></p></td></tr></table>
    </xsl:otherwise>
  </xsl:choose>
</xsl:template>

<xsl:template match="byline">
  <p class="right"><xsl:apply-templates/></p>
</xsl:template>

<xsl:template match="cit">
  <blockquote><xsl:apply-templates/></blockquote>
</xsl:template>

<xsl:template match="cit/bibl">
  <p class="right"><xsl:apply-templates/></p>
</xsl:template>

<xsl:template match="div3[@type='event']/date" priority="1">
  <xsl:apply-templates/>
</xsl:template>

<xsl:template match="daterange">
</xsl:template>

<xsl:template match="region" priority="1">
</xsl:template>

<xsl:template match="date/datestruct/occasion" priority="1">
</xsl:template>

<xsl:template match="date/datestruct/persname" priority="1">
</xsl:template>

<xsl:template match="date/datestruct/year" priority="1">
</xsl:template>

<xsl:template match="date/datestruct" priority="1">
</xsl:template>

<xsl:template match="date/certainty" priority="1">
</xsl:template>

<xsl:template match="date">
  <xsl:text> </xsl:text><xsl:apply-templates/><xsl:text> </xsl:text>
</xsl:template>

<xsl:template match="pubPlace">
  <xsl:text> </xsl:text><xsl:apply-templates/><xsl:text>, </xsl:text>
</xsl:template>

<xsl:template match="publisher">
  <xsl:text> </xsl:text><xsl:apply-templates/><xsl:text> </xsl:text>
</xsl:template>

<xsl:template match="emph">
  <xsl:variable name="rend" select="@rend"/>
  <xsl:choose>
    <xsl:when test="$rend='italic'">
      <i><xsl:apply-templates/></i>
    </xsl:when>
    <xsl:when test="$rend='bold'">
      <b><xsl:apply-templates/></b>
    </xsl:when>
    <xsl:otherwise>
      <i><xsl:apply-templates/></i>
    </xsl:otherwise>
  </xsl:choose>
</xsl:template>

<xsl:template match="hi">
  <xsl:variable name="rend" select="@rend"/>
  <xsl:choose>
    <xsl:when test="$rend='italic'">
      <i><xsl:apply-templates/></i>
    </xsl:when>
    <xsl:when test="$rend='bold'">
      <b><xsl:apply-templates/></b>
    </xsl:when>
    <xsl:when test="$rend='superscript'">
      <sup><xsl:apply-templates/></sup>
    </xsl:when>
    <xsl:otherwise>
      <i><xsl:apply-templates/></i>
    </xsl:otherwise>
  </xsl:choose>
</xsl:template>

<xsl:template match="epigraph">
  <blockquote><xsl:apply-templates/></blockquote><br/><br/>
</xsl:template>

<xsl:template match="epigraph/bibl">
  <p class="right"><xsl:apply-templates/></p>
</xsl:template>

<xsl:template match="head">
   <h4><xsl:apply-templates/></h4>
</xsl:template>

<xsl:template match="lb">
  <xsl:apply-templates/><br/>
</xsl:template>

<xsl:template match="lg">
  <xsl:param name="doc.lang" select="$doc.lang"/>
  <xsl:param name="text.size" select="$text.size"/>
  <xsl:variable name="lang" select="@lang"/>
  <xsl:choose>
    <xsl:when test="@type='stanza'">
      <xsl:if test="$doc.lang=$lang">
<!-- table cellpadding="0" cellspacing="5" width="100%" bgcolor="#FFFFFF" -->
	      <table cellspacing="0" cellpadding="0">
          <xsl:choose>
          <xsl:when test="//TEI.2[@id='related']">
           <font size="1">
	         <xsl:apply-templates>
	          <xsl:with-param name="text.size"><xsl:value-of select="$text.size"/></xsl:with-param>
	          <xsl:with-param name="doc.lang"><xsl:value-of select="$doc.lang"/></xsl:with-param>
	         </xsl:apply-templates>
           </font>
          </xsl:when>
          <xsl:otherwise>
	         <xsl:apply-templates>
	          <xsl:with-param name="text.size"><xsl:value-of select="$text.size"/></xsl:with-param>
	          <xsl:with-param name="doc.lang"><xsl:value-of select="$doc.lang"/></xsl:with-param>
	         </xsl:apply-templates>
         </xsl:otherwise>
         </xsl:choose>
	      </table>
	     <br/>
      </xsl:if>
    </xsl:when>
    <xsl:when test="@type='poem'">
      <xsl:if test="$doc.lang=$lang">
<!--table cellpadding="0" cellspacing="5" width="100%" bgcolor="#FFFFFF" -->
	<table cellspacing="0" cellpadding="0">
	  <tr>
	    <td>
	      <xsl:apply-templates>
		<xsl:with-param name="text.size"><xsl:value-of select="$text.size"/></xsl:with-param>
		<xsl:with-param name="doc.lang"><xsl:value-of select="$doc.lang"/></xsl:with-param>
	      </xsl:apply-templates>
	    </td>
	  </tr>
	</table>
      </xsl:if>
    </xsl:when>
    <xsl:otherwise>
      <xsl:if test="$doc.lang=$lang">
	<!-- table cellpadding="0" cellspacing="5" width="100%" bgcolor="#FFFFFF" -->		
	<table cellspacing="0" cellpadding="0">
	  <xsl:apply-templates>
	    <xsl:with-param name="text.size"><xsl:value-of select="$text.size"/></xsl:with-param>
	    <xsl:with-param name="doc.lang"><xsl:value-of select="$doc.lang"/></xsl:with-param>
	  </xsl:apply-templates>
	</table>
      </xsl:if>
    </xsl:otherwise>
  </xsl:choose>
</xsl:template>

<xsl:template match="l">
  <tr>
    <xsl:choose>
      <xsl:when test="ancestor::lg[1]/@n and position()=2">
	       <td width="40">
	         <font color="silver" size="-2">
	           <xsl:value-of select="ancestor::lg[1]/@n"/>
	         </font>
	       </td>
      </xsl:when>
      <xsl:otherwise>
	       <td width="40">
	       </td>
      </xsl:otherwise>
    </xsl:choose>
    <td>
     <xsl:choose>
	    <xsl:when test="$text.size=''">
        <xsl:choose>
         <xsl:when test="//TEI.2[@id='related']">
           <font size="2">
	           <xsl:apply-templates/>
           </font>
         </xsl:when>
         <xsl:otherwise>
	         <xsl:apply-templates/>
         </xsl:otherwise>
        </xsl:choose>
	    </xsl:when>
	    <xsl:otherwise>
	      <font>
	        <xsl:attribute name="size"><xsl:value-of select="$text.size"/></xsl:attribute>
	        <xsl:apply-templates/>
	      </font>
	    </xsl:otherwise>
     </xsl:choose>
    </td>
  </tr>
</xsl:template>

<xsl:template match="list">
  <xsl:choose>
    <xsl:when test="@type='gloss'">
      <dl><xsl:apply-templates mode="gloss" select="item"/></dl>
    </xsl:when>
    <xsl:when test="@type='unordered'">
      <ul><xsl:apply-templates/></ul>
    </xsl:when>
    <xsl:when test="@type='ordered'">
      <ol><xsl:apply-templates/></ol>
    </xsl:when>
  </xsl:choose>
</xsl:template>

<xsl:template match="item">
  <li><xsl:apply-templates/></li>
</xsl:template>

<xsl:template  match="label">
  <xsl:apply-templates/>
</xsl:template>

<xsl:template mode="gloss" match="item">
 <dt><xsl:apply-templates mode="print" select="preceding-sibling::*[1]"/></dt>
 <dd><xsl:apply-templates/></dd>
</xsl:template>

<xsl:template  match="name">
  <xsl:apply-templates/>
</xsl:template>

<xsl:template match="div3[@type='event']/p" priority="1"> 
  <xsl:param name="doc.lang" select="$doc.lang"/>
  <xsl:param name="text.size" select="$text.size"/> 
  <xsl:variable name="lang" select="@lang"/>
  <xsl:if test="$doc.lang=$lang">
    <!-- p -->
      <xsl:if test="ancestor::div3[@type='event']">
        <xsl:choose>
          <!-- making sure that it's the first paragraph in the div3 -->
          <xsl:when test="not(preceding-sibling::p)">
            <xsl:choose>
             <xsl:when test="ancestor::div2[@type='narrative chronology']">
               <!-- date value or daterange to/from to get exact dates -->
              <xsl:number count="div3"/><xsl:text>. </xsl:text> 
               <xsl:choose>
                 <xsl:when test="ancestor::div3/date[@value]">
                   <xsl:choose>
                     <!-- is it a negative date number? -->
                     <xsl:when test="substring(ancestor::div3/date/@value, 1, 1)='-'">
                       <xsl:value-of select="substring(ancestor::div3/date/@value, 2)"/>
                       <xsl:text> B.C. </xsl:text>
                     </xsl:when>
                     <xsl:otherwise>
                       <xsl:value-of select="ancestor::div3/date/@value"/>
                     </xsl:otherwise>
                   </xsl:choose>
                 </xsl:when>
                 <xsl:otherwise>
                    <xsl:if test="ancestor::div3/date/daterange[@from]">
                      <xsl:choose>
                       <xsl:when test="substring(ancestor::div3/date/daterange/@from, 1, 1)='-'">
                         <xsl:value-of select="substring(ancestor::div3/date/daterange/@from, 2)"/>
                         <xsl:choose>
                           <xsl:when test="substring(ancestor::div3/date/daterange/@to, 1, 1)='-'">
                             <xsl:text> - </xsl:text>
                             <xsl:value-of select="substring(ancestor::div3/date/daterange/@to, 2)"/>
                             <xsl:text> B.C. </xsl:text>
                           </xsl:when>
                           <xsl:otherwise>
                             <xsl:text> B.C. </xsl:text>
                             <xsl:if test="ancestor::div3/date/daterange[@to]">
                               <xsl:text> - </xsl:text>
                               <xsl:value-of select="ancestor::div3/date/daterange/@to"/>
                               <xsl:text> A.D. </xsl:text>
                             </xsl:if>
                           </xsl:otherwise>
                         </xsl:choose>
                       </xsl:when>
                       <xsl:otherwise>
                         <xsl:value-of select="ancestor::div3/date/daterange/@from"/>
                         <xsl:if test="ancestor::div3/date/daterange[@to]">
                           <xsl:text> - </xsl:text>
                           <xsl:value-of select="ancestor::div3/date/daterange/@to"/>
                          </xsl:if>
                       </xsl:otherwise>
                      </xsl:choose>
                    </xsl:if>
                 </xsl:otherwise>
               </xsl:choose>
             </xsl:when>
             <xsl:otherwise>
              <xsl:number count="div3" format="I"/><xsl:text>. </xsl:text> 
               <xsl:if test="ancestor::div3[@type='event']/date/certainty='narrative event'">
                <xsl:text>[</xsl:text>
               </xsl:if>
               <xsl:choose>
                 <xsl:when test="ancestor::div3/date[@value]">
                   <xsl:choose>
                     <xsl:when test="substring(ancestor::div3/date/@value, 1, 1)='-'">
                       <xsl:value-of select="substring(ancestor::div3/date/@value, 2)"/>
                       <xsl:text> B.C. </xsl:text>
                     </xsl:when>
                     <xsl:otherwise>
                       <xsl:value-of select="ancestor::div3/date/@value"/>
                     </xsl:otherwise>
                   </xsl:choose>
                 </xsl:when>
                 <xsl:otherwise>
                    <xsl:if test="ancestor::div3/date/daterange[@from]">
                      <xsl:choose>
                       <xsl:when test="substring(ancestor::div3/date/daterange/@from, 1, 1)='-'">
                         <xsl:value-of select="substring(ancestor::div3/date/daterange/@from, 2)"/>
                         <xsl:choose>
                           <xsl:when test="substring(ancestor::div3/date/daterange/@to, 1, 1)='-'">
                             <xsl:text> - </xsl:text>
                             <xsl:value-of select="substring(ancestor::div3/date/daterange/@to, 2)"/>
                             <xsl:text> B.C. </xsl:text>
                           </xsl:when>
                           <xsl:otherwise>
                             <xsl:text> B.C. </xsl:text>
                             <xsl:if test="ancestor::div3/date/daterange[@to]">
                               <xsl:text> - </xsl:text>
                               <xsl:value-of select="ancestor::div3/date/daterange/@to"/>
                               <xsl:text> A.D. </xsl:text>
                             </xsl:if>
                           </xsl:otherwise>
                         </xsl:choose>
                       </xsl:when>
                       <xsl:otherwise>
                         <xsl:value-of select="ancestor::div3/date/daterange/@from"/>
                         <xsl:if test="ancestor::div3/date/daterange[@to]">
                           <xsl:text> - </xsl:text>
                           <xsl:value-of select="ancestor::div3/date/daterange/@to"/>
                          </xsl:if>
                       </xsl:otherwise>
                      </xsl:choose>
                    </xsl:if>
                 </xsl:otherwise>
               </xsl:choose>
             </xsl:otherwise>
            </xsl:choose>
          </xsl:when>
          <xsl:otherwise>
          </xsl:otherwise>
         <!-- end choice for first paragraph or not-->
         </xsl:choose>
      </xsl:if>
  <xsl:choose>
	<xsl:when test="$text.size=''">
	  <xsl:apply-templates/>
	</xsl:when>
	<xsl:otherwise>
	  <font>
	    <xsl:attribute name="size"><xsl:value-of select="$text.size"/></xsl:attribute>
	    <xsl:apply-templates/>
	  </font>
	</xsl:otherwise>
      </xsl:choose>
      <xsl:if test="ancestor::div3[@type='event']/date/certainty='narrative event'">
         <xsl:text>]</xsl:text>
      </xsl:if>
      <!-- /p -->
      <br/><br/>
  </xsl:if>
</xsl:template>



<xsl:template match="p">
  <xsl:param name="text.size" select="$text.size"/>
    <p>
	    <xsl:apply-templates/>
		</p>
</xsl:template>

<xsl:template match="ref">
  <xsl:choose>
    <xsl:when test="@type='endnote'">
      <sup class="ref"><a target="_top">
	    <xsl:attribute name="href">
	      <xsl:apply-templates mode="link" select="id(@target)"/>
	    </xsl:attribute>
	    <xsl:apply-templates/>
      </a></sup>
    </xsl:when>
    <xsl:when test="@type='citation'">
     <a target="self">
       <xsl:attribute name="href">
          <xsl:value-of select="$doc.path"/>
          <xsl:text>&#038;chunk.id=</xsl:text>
        <xsl:choose>
          <xsl:when test="@target">
            <xsl:value-of select="@target"/>
          </xsl:when>
          <xsl:otherwise>
            <xsl:value-of select="ancestor::div1/@id"/>
          </xsl:otherwise>
        </xsl:choose>
        <xsl:text>&#038;anchor.id=</xsl:text>
        <xsl:choose>
          <xsl:when test="contains(@from,'id (')">
            <xsl:value-of select="substring(@from,5,string-length(normalize-space(@from))-5)"/>
          </xsl:when>
        </xsl:choose>
	     </xsl:attribute>
	     <xsl:apply-templates/>
     </a>
    </xsl:when>
    <xsl:otherwise>
      <a target="_top">
	    <xsl:attribute name="href">
	      <xsl:apply-templates mode="link" select="id(@target)"/>
	    </xsl:attribute>
	    <xsl:apply-templates/>
      </a>
    </xsl:otherwise>
  </xsl:choose>
</xsl:template>

<xsl:template match="xref">
  <xsl:choose>
   <xsl:when test="//TEI.2[@id='listtexts']">
     <i><a>
     <xsl:attribute name="href">
        <xsl:value-of select="$beg.doc.path"/>
        <xsl:value-of select="@doc"/>
        <xsl:value-of select="$end.doc.path"/>
        <!-- xsl:text>&#038;chunk.id=tpage&#038;doc.view=toc</xsl:text -->
<xsl:text>&#038;chunk.id=tpage&#038;doc.view=tocc</xsl:text>
        <xsl:text>&#038;doc.lang=</xsl:text><xsl:value-of select="$doc.lang"/>
     </xsl:attribute>
	   <xsl:apply-templates/>
     </a></i>
   </xsl:when>
   <xsl:when test="@doc = 'bibliography'">
   <i><a>
     <xsl:attribute name="href">
        <xsl:value-of select="$beg.doc.path"/><xsl:value-of select="@doc"/><xsl:value-of select="$end.doc.path"/>
        <xsl:text>&#038;doc.view=content</xsl:text>
        <xsl:text>&#038;chunk.id=</xsl:text>
<!--        <xsl:choose>
          <xsl:when test="@from">
            <xsl:variable name="extdoc">../texts/<xsl:value-of select="@doc"/>.xml</xsl:variable>
            <xsl:variable name="from" select="@from"/>
            <xsl:variable name="docnode" select="document('../texts/bibliography.xml')"/>
            <xsl:value-of select="$docnode//*[@id=$from]/ancestor-or-self::bibl/@id"/>
          </xsl:when>
          <xsl:otherwise>
          </xsl:otherwise>
        </xsl:choose>
-->
        <xsl:text>&#038;toc.depth=1</xsl:text>
        <xsl:text>&#038;anchor.id=</xsl:text>
        <xsl:choose>
          <xsl:when test="contains(@from,'id (')">
            <xsl:value-of select="substring(@from,5,string-length(normalize-space(@from))-5)"/>
          </xsl:when>
          <xsl:otherwise>
            <xsl:value-of select="@from"/>
          </xsl:otherwise>
        </xsl:choose>
        <xsl:text>&#038;doc.lang=english</xsl:text>
        <xsl:text>#</xsl:text><xsl:value-of select="@from"/>
	   </xsl:attribute>
	   <xsl:apply-templates/>
   </a></i>
   </xsl:when>
   <xsl:otherwise>
   <!-- need to find a way to get the document name dynamically generated -->
   <i><a>
     <xsl:attribute name="href">
        <xsl:value-of select="$beg.doc.path"/><xsl:value-of select="@doc"/><xsl:value-of select="$end.doc.path"/>
        <xsl:text>&#038;chunk.id=</xsl:text>
        <xsl:choose>
          <xsl:when test="@doc='lienuzhuan'">
            <xsl:choose>
              <xsl:when test="@from">
                <xsl:variable name="extdoc">../texts/<xsl:value-of select="@doc"/>.xml</xsl:variable>
                <xsl:variable name="from" select="@from"/>
                <xsl:variable name="docnode" select="document('../texts/lienuzhuan.xml')"/>
                <xsl:value-of select="$docnode//*[@id=$from]/ancestor-or-self::div2/@id"/>
              </xsl:when>
              <xsl:otherwise>
              </xsl:otherwise>
            </xsl:choose>
           </xsl:when>
          <xsl:when test="@doc='odes'">
            <xsl:choose>
              <xsl:when test="@from">
                <xsl:variable name="extdoc">../texts/<xsl:value-of select="@doc"/>.xml</xsl:variable>
                <xsl:variable name="from" select="@from"/>
                <xsl:variable name="docnode" select="document('../texts/odes.xml')"/>
                <xsl:value-of select="$docnode//*[@id=$from]/ancestor-or-self::div3/@id"/>
              </xsl:when>
              <xsl:otherwise>
              </xsl:otherwise>
            </xsl:choose>
           </xsl:when>
           <xsl:otherwise>
           </xsl:otherwise>
        </xsl:choose>
        <xsl:text>&#038;anchor.id=</xsl:text>
        <xsl:choose>
          <xsl:when test="contains(@from,'id (')">
            <xsl:value-of select="substring(@from,5,string-length(normalize-space(@from))-5)"/>
          </xsl:when>
        </xsl:choose>
        <xsl:text>&#038;doc.lang=bilingual</xsl:text>
	   </xsl:attribute>
	   <xsl:apply-templates/>
   </a></i>
   </xsl:otherwise>
  </xsl:choose>
</xsl:template>

<!-- Does this really work? Doesn't scroll either :(-->

<!-- New Version? -->

<xsl:template mode="link" match="*">
  <xsl:variable name="n">
      <xsl:value-of select="$doc.path"/>
      <xsl:text>&#038;chunk.id=</xsl:text>
      <xsl:value-of select="ancestor::div1/@id"/>
      <xsl:text>&#038;anchor.id=</xsl:text>
      <xsl:value-of select="@id"/>
  </xsl:variable>
  <xsl:value-of select="$n"/>
</xsl:template>


<!-- Because of order in the following, "rend" takes precedence over "level" -->

<xsl:template match="title">
   <xsl:if test="ancestor::bibl"><xsl:text> </xsl:text></xsl:if>
   <xsl:choose>
    <xsl:when test="@rend='bolditalic'">
      <b><i><xsl:apply-templates/></i></b>
    </xsl:when>
    <xsl:when test="@rend='bold'">
      <b><xsl:apply-templates/></b>
    </xsl:when>
    <xsl:when test="@rend='italic'">
      <i><xsl:apply-templates/></i>
    </xsl:when>
    <xsl:when test="@level='m'">
      <i><xsl:apply-templates/></i>
    </xsl:when>
    <xsl:when test="@level='j'">
      <i><xsl:apply-templates/></i>
    </xsl:when>
    <xsl:when test="@level='s'">
      <i><xsl:apply-templates/></i>
    </xsl:when>
    <xsl:when test="@level='a'">
      &#x201C;<xsl:apply-templates/>&#x201D;
    </xsl:when>
    <xsl:otherwise>
      <xsl:apply-templates/>
    </xsl:otherwise>
   </xsl:choose>
   <xsl:if test="ancestor::bibl"><xsl:text> </xsl:text></xsl:if>
</xsl:template>

<xsl:template match="note">
<xsl:param name="div.lvl" select="substring($chunk.id,1,2)"/>
       	<sup>
         <xsl:choose>
          <xsl:when test="$div.lvl='d1'">
           <xsl:number count="note" level="any" from="div1"/>
          </xsl:when>
          <xsl:when test="$div.lvl='d2'">
             <xsl:number count="note" level="any" from="div2"/>
          </xsl:when>
         </xsl:choose>
        </sup>
</xsl:template>

<xsl:template match="note" mode="note">
<xsl:param name="div.lvl" select="substring($chunk.id,1,2)"/>

				   <xsl:choose>
				     <xsl:when test="preceding-sibling::notep">
					 	   <xsl:text>   </xsl:text>
					     <xsl:element name="p">
                                             <font size="-1">
                  <xsl:apply-templates/>
                                             </font>
					 			</xsl:element>
					 		</xsl:when>
					 		<xsl:otherwise>
					 		  <xsl:element name="p">
                                                 <font size="-1">
                  <xsl:choose>
                   <xsl:when test="$div.lvl='d1'">
                    <xsl:number count="note" level="any" from="div1"/>
                   </xsl:when>
                   <xsl:when test="$div.lvl='d2'">
                    <xsl:number count="note" level="any" from="div2"/>
                   </xsl:when>
                  </xsl:choose>
                  <xsl:text>. </xsl:text>
                  <xsl:apply-templates/>
                                                </font>
					 			</xsl:element>
					 		 </xsl:otherwise>
					 </xsl:choose>
         <!-- /xsl:if -->
</xsl:template>

<!-- figure entity="/people/btrial2" thumb="/people/btrial1" twidth="176" theight="150" -->

<xsl:template match="figure">
  <xsl:choose>
	  <xsl:when test="//div1[@id='pics']">
		  <table cellpadding="5" border="1">
			  <tr>
				  <td width="200" align="center" valign="top">
					   <a><xsl:attribute name="href"><xsl:value-of select="$image.dir"/>/<xsl:value-of select="@entity"/></xsl:attribute>
						 <xsl:if test="@twidth"><xsl:attribute name="width"><xsl:value-of select="@twidth"/></xsl:attribute></xsl:if>
						 <xsl:if test="@theight"><xsl:attribute name="width"><xsl:value-of select="@theight"/></xsl:attribute></xsl:if>
					   <img border="0">
             <xsl:attribute name="src"><xsl:value-of select="$image.dir"/><xsl:text>/</xsl:text>
						 <xsl:choose>
						   <xsl:when test="@thumb">
							   <xsl:value-of select="@thumb"/>
							 </xsl:when>
							 <xsl:otherwise>
							   <xsl:value-of select="@entity"/>
							 </xsl:otherwise>
						 </xsl:choose>
						 </xsl:attribute>
             </img>
						 </a>
				   </td>
					 <td width="440"><xsl:apply-templates/></td>
        </tr>
			</table>
		</xsl:when>
		<xsl:otherwise>
     <img border="0">
     <xsl:attribute name="src"><xsl:value-of select="$image.dir"/>/<xsl:value-of select="@entity"/>.jpg</xsl:attribute>
     </img><xsl:apply-templates/><br/>
		</xsl:otherwise>
	</xsl:choose>
</xsl:template>

<xsl:template match="figdesc">
  <p><b><xsl:text>Description </xsl:text></b><xsl:apply-templates/></p>
</xsl:template>

<xsl:template match="text">
  <p><xsl:apply-templates/></p>
</xsl:template>

</xsl:stylesheet>
