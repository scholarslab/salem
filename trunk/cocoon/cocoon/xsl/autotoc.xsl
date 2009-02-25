<?xml version="1.0" encoding="UTF-8"?>

<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.1">


  <xsl:template name="book.autotoc">

    <table cellpadding="0" cellspacing="0" width="100%" bgcolor="#FFFFFF">

      <tr>
        <td width="5%"/>

        <td>

          <xsl:choose>

            <xsl:when test="$doc.lang = 'chinese'">

              <b>
                <font size="+1">

                  <xsl:value-of
                    select="//titlePage/docTitle/titlePart[@type='main' and @lang='chinese']"/>

                </font>
              </b>

            </xsl:when>

            <xsl:otherwise>

              <b>
                <font size="+1">

                  <xsl:value-of
                    select="//titlePage/docTitle/titlePart[@type='main' and @lang='english']"/>

                </font>
              </b>

            </xsl:otherwise>

          </xsl:choose>

          <br/>

          <img width="20" height="2">
            <xsl:attribute name="src"><xsl:value-of select="$image.dir"/>/spacer.gif</xsl:attribute>
          </img>

          <a>
            <xsl:attribute name="href"
              >http://jefferson.village.virginia.edu/xwomen/bibliography.html</xsl:attribute>
            <font size="-1">Bibliographical Data</font>
          </a>

        </td>

        <td>

          <img width="50">

            <xsl:attribute name="src">
              <xsl:value-of select="$image.dir"/>/spacer.gif</xsl:attribute>

          </img>

        </td>

        <td width="25%" valign="bottom">

          <br/>

          <font size="-1" face="Arial">

            <xsl:choose>

              <xsl:when test="$doc.lang != 'chinese'">

                <a>

                  <xsl:attribute name="href">
                    <xsl:value-of select="$doc.path"
                      />&amp;doc.view=tocc&amp;chunk.id=<xsl:value-of select="$chunk.id"
                      />&amp;toc.depth=<xsl:value-of select="$toc.depth"
                      />&amp;toc.id=<xsl:value-of select="$toc.id"/>&amp;doc.lang=chinese</xsl:attribute>

                  <xsl:attribute name="target">_top</xsl:attribute>

                  <b>

                    <xsl:choose>

                      <xsl:when test="$doc.lang = 'bilingual'">

                        <xsl:text>Chinese</xsl:text>

                      </xsl:when>

                      <xsl:otherwise>

                        <xsl:text>&#20013; &#25991;</xsl:text>

                      </xsl:otherwise>

                    </xsl:choose>

                  </b>

                </a>

              </xsl:when>

              <xsl:otherwise>

                <b>

                  <font color="#C0C0C0">

                    <xsl:text>&#20013; &#25991;</xsl:text>

                  </font>

                </b>

              </xsl:otherwise>

            </xsl:choose>

            <br/>

            <xsl:choose>

              <xsl:when test="$doc.lang != 'english'">

                <a>

                  <xsl:attribute name="href">
                    <xsl:value-of select="$doc.path"
                      />&amp;doc.view=tocc&amp;chunk.id=<xsl:value-of select="$chunk.id"
                      />&amp;toc.depth=<xsl:value-of select="$toc.depth"
                      />&amp;toc.id=<xsl:value-of select="$toc.id"/>&amp;doc.lang=english</xsl:attribute>

                  <xsl:attribute name="target">_top</xsl:attribute>

                  <b>

                    <xsl:text>English</xsl:text>

                  </b>

                </a>

              </xsl:when>

              <xsl:otherwise>

                <b>

                  <font color="#C0C0C0">

                    <xsl:text>English</xsl:text>

                  </font>

                </b>

              </xsl:otherwise>

            </xsl:choose>

            <br/>

            <xsl:choose>

              <xsl:when test="$doc.lang != 'bilingual'">

                <a>

                  <xsl:attribute name="href">
                    <xsl:value-of select="$doc.path"
                      />&amp;doc.view=tocc&amp;chunk.id=<xsl:value-of select="$chunk.id"
                      />&amp;toc.depth=<xsl:value-of select="$toc.depth"
                      />&amp;toc.id=<xsl:value-of select="$toc.id"/>&amp;doc.lang=bilingual</xsl:attribute>

                  <xsl:attribute name="target">_top</xsl:attribute>

                  <b>

                    <xsl:choose>

                      <xsl:when test="$doc.lang = 'chinese'">

                        <xsl:text>&#38617; &#35486;</xsl:text>

                      </xsl:when>

                      <xsl:otherwise>

                        <xsl:text>Bilingual</xsl:text>

                      </xsl:otherwise>

                    </xsl:choose>

                  </b>

                </a>

              </xsl:when>

              <xsl:otherwise>

                <b>

                  <font color="#C0C0C0">

                    <xsl:text>Bilingual</xsl:text>

                  </font>

                </b>

              </xsl:otherwise>

            </xsl:choose>

          </font>

        </td>

      </tr>

    </table>

    <!-- hr/ -->

    <xsl:apply-templates select="//div1" mode="toc"/>

    <!-- hr/ -->

  </xsl:template>



  <xsl:template name="div1.autotoc">

    <table cellpadding="0" cellspacing="0" width="100%" bgcolor="#FFFFFF">

      <tr>
        <td height="10"/>
      </tr>

      <tr>
        <td width="5%"/>

        <td>

          <xsl:choose>

            <xsl:when test="$doc.lang = 'chinese'">

              <font size="+1">

                <xsl:value-of
                  select="//titlePage/docTitle/titlePart[@type='main' and @lang='chinese']"/>

              </font>

            </xsl:when>

            <xsl:otherwise>

              <font size="+1">

                <xsl:value-of
                  select="//titlePage/docTitle/titlePart[@type='main' and @lang='english']"/>

              </font>

            </xsl:otherwise>

          </xsl:choose>

        </td>

        <td>

          <img width="50">

            <xsl:attribute name="src">
              <xsl:value-of select="$image.dir"/>/spacer.gif</xsl:attribute>

          </img>

        </td>

        <td width="25%">

          <br/>

          <font size="-1" face="Arial">

            <xsl:choose>

              <xsl:when test="$doc.lang != 'chinese'">

                <a>

                  <xsl:attribute name="href">
                    <xsl:value-of select="$doc.path"
                      />&amp;doc.view=divtoc&amp;chunk.id=<xsl:value-of select="$chunk.id"
                      />&amp;toc.depth=<xsl:value-of select="$toc.depth"
                      />&amp;toc.id=<xsl:value-of select="$toc.id"/>&amp;doc.lang=chinese</xsl:attribute>

                  <xsl:attribute name="target">_top</xsl:attribute>

                  <b>

                    <xsl:choose>

                      <xsl:when test="$doc.lang = 'bilingual'">

                        <xsl:text>Chinese</xsl:text>

                      </xsl:when>

                      <xsl:otherwise>

                        <xsl:text>&#20013; &#25991;</xsl:text>

                      </xsl:otherwise>

                    </xsl:choose>

                  </b>

                </a>

              </xsl:when>

              <xsl:otherwise>

                <b>

                  <font color="#C0C0C0">

                    <xsl:text>&#20013; &#25991;</xsl:text>

                  </font>

                </b>

              </xsl:otherwise>

            </xsl:choose>

            <br/>

            <xsl:choose>

              <xsl:when test="$doc.lang != 'english'">

                <a>

                  <xsl:attribute name="href">
                    <xsl:value-of select="$doc.path"
                      />&amp;doc.view=divtoc&amp;chunk.id=<xsl:value-of select="$chunk.id"
                      />&amp;toc.depth=<xsl:value-of select="$toc.depth"
                      />&amp;toc.id=<xsl:value-of select="$toc.id"/>&amp;doc.lang=english</xsl:attribute>

                  <xsl:attribute name="target">_top</xsl:attribute>

                  <b>

                    <xsl:text>English</xsl:text>

                  </b>

                </a>

              </xsl:when>

              <xsl:otherwise>

                <b>

                  <font color="#C0C0C0">

                    <xsl:text>English</xsl:text>

                  </font>

                </b>

              </xsl:otherwise>

            </xsl:choose>

            <br/>

            <xsl:choose>

              <xsl:when test="$doc.lang != 'bilingual'">

                <a>

                  <xsl:attribute name="href">
                    <xsl:value-of select="$doc.path"
                      />&amp;doc.view=divtoc&amp;chunk.id=<xsl:value-of select="$chunk.id"
                      />&amp;toc.depth=<xsl:value-of select="$toc.depth"
                      />&amp;toc.id=<xsl:value-of select="$toc.id"/>&amp;doc.lang=bilingual</xsl:attribute>

                  <xsl:attribute name="target">_top</xsl:attribute>

                  <b>

                    <xsl:choose>

                      <xsl:when test="$doc.lang = 'chinese'">

                        <xsl:text>&#38617; &#35486;</xsl:text>

                      </xsl:when>

                      <xsl:otherwise>

                        <xsl:text>Bilingual</xsl:text>

                      </xsl:otherwise>

                    </xsl:choose>

                  </b>

                </a>

              </xsl:when>

              <xsl:otherwise>

                <b>

                  <font color="#C0C0C0">

                    <xsl:text>Bilingual</xsl:text>

                  </font>

                </b>

              </xsl:otherwise>

            </xsl:choose>

          </font>

        </td>

      </tr>

    </table>

    <!-- hr/ -->

    <xsl:apply-templates select="//div1[number($div.cnt)]" mode="toc"/>

    <!-- hr/ -->

  </xsl:template>



  <xsl:template match="div1" mode="toc">

    <xsl:variable name="head" select="head"/>

    <xsl:if test="$head">

      <xsl:element name="a">

        <xsl:attribute name="name">

          <xsl:value-of select="@id"/>

          <xsl:text>.toc</xsl:text>

        </xsl:attribute>

        <table cellpadding="0" cellspacing="0" width="100%" bgcolor="#FFFFFF">

          <tr>
            <td height="10"/>
          </tr>

          <tr>

            <td width="10"/>

            <xsl:choose>

              <xsl:when test="$doc.lang='bilingual'">

                <!-- nobr -->

                <td align="left" valign="top" width="500">

                  <xsl:apply-templates select="head[@lang='chinese']" mode="tocNoLink"/>

                </td>

                <td>
                  <xsl:apply-templates select="head[@lang='english']" mode="tocNoLink"/>
                </td>

                <!-- /nobr -->

              </xsl:when>

              <xsl:otherwise>

                <td align="left" valign="top" width="500">

                  <!-- nobr -->

                  <xsl:apply-templates select="head[@lang=$doc.lang]" mode="tocNoLink"/>

                  <!-- /nobr -->

                </td>

              </xsl:otherwise>

            </xsl:choose>

          </tr>

        </table>

        <xsl:apply-templates select="div2" mode="toc"/>

      </xsl:element>

    </xsl:if>

  </xsl:template>



  <xsl:template match="div2" mode="toc">

    <xsl:variable name="head" select="head"/>

    <xsl:if test="$head">

      <table cellpadding="0" cellspacing="0" width="100%" bgcolor="#FFFFFF">

        <tr>

          <td width="20"/>

          <td width="10"/>

          <xsl:choose>

            <xsl:when test="$doc.lang='bilingual'">

              <!-- nobr -->

              <xsl:choose>

                <xsl:when test="ancestor::TEI.2[@id='odes']">

                  <td align="left" valign="top" width="500">

                    <xsl:apply-templates select="head[@lang='chinese']" mode="tocNoLink"/>

                  </td>

                  <td>
                    <xsl:apply-templates select="head[@lang='english']" mode="tocNoLink"/>
                  </td>

                </xsl:when>

                <xsl:otherwise>

                  <td align="left" valign="top" width="500">

                    <xsl:apply-templates select="head[@lang='chinese']" mode="toc"/>

                  </td>

                  <td>
                    <xsl:apply-templates select="head[@lang='english']" mode="toc"/>
                  </td>

                </xsl:otherwise>

              </xsl:choose>

              <!-- /nobr -->

            </xsl:when>

            <xsl:otherwise>

              <xsl:choose>

                <xsl:when test="ancestor::TEI.2[@id='odes']">

                  <td align="left" valign="top" width="500">

                    <!-- nobr -->

                    <xsl:apply-templates select="head[@lang=$doc.lang]" mode="tocNoLink"/>

                    <!-- /nobr -->

                  </td>

                </xsl:when>

                <xsl:otherwise>

                  <td align="left" valign="top" width="500">

                    <!-- nobr -->

                    <xsl:apply-templates select="head[@lang=$doc.lang]" mode="toc"/>

                    <!-- /nobr -->

                  </td>

                </xsl:otherwise>

              </xsl:choose>

            </xsl:otherwise>

          </xsl:choose>

        </tr>

      </table>

      <xsl:if test="ancestor::TEI.2[@id='odes']">

        <xsl:apply-templates select="div3" mode="toc"/>

      </xsl:if>

    </xsl:if>

  </xsl:template>



  <xsl:template match="div3" mode="toc">

    <xsl:variable name="head" select="head"/>

    <xsl:if test="$head">

      <table cellpadding="0" cellspacing="0" width="100%" bgcolor="#FFFFFF">

        <tr>

          <td width="20"/>

          <td width="20"/>

          <td width="10"/>

          <xsl:choose>

            <xsl:when test="$doc.lang='bilingual'">

              <td align="left" valign="top" width="500">

                <!-- nobr -->

                <xsl:apply-templates select="head[@lang='chinese']" mode="toc"/>

              </td>

              <td>
                <xsl:apply-templates select="head[@lang='english']" mode="toc"/>
              </td>

              <!-- /nobr -->

            </xsl:when>

            <xsl:otherwise>

              <td align="left" valign="top" width="500">

                <!-- nobr -->

                <xsl:apply-templates select="head[@lang=$doc.lang]" mode="toc"/>

                <!-- /nobr -->

              </td>

            </xsl:otherwise>

          </xsl:choose>

        </tr>

      </table>

    </xsl:if>

  </xsl:template>



  <xsl:template match="head" mode="toc">

    <xsl:choose>

      <xsl:when test="$chunk.id=ancestor::*[1]/@id">

        <a name="X"/>

        <xsl:apply-templates/>

      </xsl:when>

      <xsl:otherwise>

        <a>

          <xsl:attribute name="href">
            <xsl:value-of select="$doc.path"/>&amp;chunk.id=<xsl:value-of
              select="ancestor::*[1]/@id"/>&amp;toc.depth=<xsl:value-of select="$toc.depth"
              />&amp;toc.id=<xsl:value-of select="$toc.id"/>&amp;doc.lang=<xsl:value-of
              select="$doc.lang"/>
          </xsl:attribute>

          <xsl:attribute name="target">_top</xsl:attribute>

          <xsl:apply-templates/>

        </a>

      </xsl:otherwise>

    </xsl:choose>

  </xsl:template>

  <xsl:template match="head" mode="tocNoLink">

    <xsl:choose>

      <xsl:when test="$chunk.id=ancestor::*[1]/@id">

        <a name="X"/>

        <xsl:apply-templates/>

      </xsl:when>

      <xsl:otherwise>

        <xsl:apply-templates/>

      </xsl:otherwise>

    </xsl:choose>

  </xsl:template>



  <xsl:template name="expand">

    <xsl:variable name="toc.id" select="@id"/>

    <a>

      <xsl:attribute name="href">
        <xsl:value-of select="$doc.path"/>&amp;chunk.id=<xsl:value-of select="$chunk.id"
          />&amp;toc.id=<xsl:value-of select="$toc.id"/>&amp;doc.lang=<xsl:value-of
          select="$doc.lang"/>
      </xsl:attribute>

      <xsl:attribute name="target">_top</xsl:attribute>

      <img src="c:\Programs\jakarta-tomcat-3.2.4\webapps\saxon\xwomen\icons\i_expand.gif" border="0"/>

    </a>

  </xsl:template>

  <xsl:template name="collapse">

    <xsl:variable name="toc.id" select="@id"/>

    <a>

      <xsl:attribute name="href">
        <xsl:value-of select="$doc.path"/>&amp; chunk.id=<xsl:value-of select="$chunk.id"
          />&amp;toc.id=<xsl:value-of select="0"/>&amp;doc.lang=<xsl:value-of
          select="$doc.lang"/>
      </xsl:attribute>

      <xsl:attribute name="target">_top</xsl:attribute>

      <img src="c:\Programs\jakarta-tomcat-3.2.4\webapps\saxon\xwomen\icons\i_colpse.gif" border="0"/>

    </a>

  </xsl:template>

</xsl:stylesheet>
