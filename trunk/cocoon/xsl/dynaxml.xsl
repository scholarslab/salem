<xsl:stylesheet version="1.1" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">


  <xsl:output method="html" indent="yes" encoding="utf-8" media-type="text/html"
    doctype-public="-//W3C//DTD HTML 4.0//EN"/>
  
  <!-- ==================================================================== -->
  <!-- Included Stylesheets                                                 -->
  <!-- ==================================================================== -->
 
  <xsl:include href="component.xsl"/>
  <xsl:include href="parameter.xsl"/>
  <xsl:include href="autotoc.xsl"/>
  <xsl:include href="titlepage.xsl"/>
  <xsl:include href="structure.xsl"/>
  <!-- xsl:include href="xref.xsl"/ -->

  <!-- ==================================================================== -->
  <!-- Set Variables                                                        -->
  <!-- ==================================================================== -->

  <!-- ====================================================================== -->
  <!-- Strip Element Space                                                    -->
  <!-- ====================================================================== -->

  <xsl:strip-space elements="*"/>

  <!-- ==================================================================== -->
  <!-- Define Keys                                                          -->
  <!-- ==================================================================== -->

  <xsl:key name="chunk-id" match="titlePage|div1|div2" use="@id"/>
  <xsl:key name="note-id" match="note" use="@id"/>
  <xsl:key name="groups" match="persname" use="@cats"/>

  <!-- ==================================================================== -->
  <!-- Root Template                                                        -->
  <!-- ==================================================================== -->

  <xsl:template match="/">
    <xsl:choose>
      <xsl:when test="//tei.2[@id = 'names']">
        <xsl:call-template name="chunk"/>
      </xsl:when>
      <xsl:otherwise>
        <xsl:call-template name="fpchunk"/>
      </xsl:otherwise>
    </xsl:choose>
  </xsl:template>


  <xsl:template name="chunk">
    <html>
      <xsl:call-template name="page.start"/>
      <body link="#990000" vlink="#990000" alink="#990000">
        <table width="80%" align="center" cellpadding="3">
          <xsl:call-template name="table.start"/>
          <xsl:call-template name="table.next"/>
          <tr valign="top">
            <xsl:apply-templates name="cat"/>
            <!-- xsl:apply-templates name="pers"/ -->
            <!-- xsl:apply-templates name="bio"/ -->
          </tr>
          <!-- xsl:call-template name="table.end"/ -->
        </table>
      </body>
    </html>

  </xsl:template>

  <xsl:template name="fpchunk">
    <xsl:param name="chunk.id" select="$chunk.id"/>
    <html>
      <xsl:call-template name="page.start"/>
      <body link="#990000" vlink="#990000" alink="#990000">
        <table width="80%" align="center" cellpadding="3">
          <xsl:call-template name="table.start"/>
          <xsl:call-template name="table.next.full"/>
          <tr valign="top"> </tr>
        </table>
        <table width="80%" align="center" cellpadding="3">
          <tr>
            <td colspan="3">
              <xsl:apply-templates select="//div2[@id=$chunk.id]"/>
            </td>
          </tr>
        </table>
      </body>
    </html>

  </xsl:template>

  <xsl:template name="page.start">
    <!-- head, title, meta, and script elements -->
    <head>
      <title>Salem Witch Trials Important Persons</title>
      <meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1">
        <script language="JavaScript" type="text/JavaScript">
<!--
function MM_preloadImages() { //v3.0
  var d=document; if(d.images){ if(!d.MM_p) d.MM_p=new Array();
    var i,j=d.MM_p.length,a=MM_preloadImages.arguments; for(i=0; i<a.length; i++)
    if (a[i].indexOf("#")!=0){ d.MM_p[j]=new Image; d.MM_p[j++].src=a[i];}}
}

function MM_findObj(n, d) { //v4.01
  var p,i,x;  if(!d) d=document; if((p=n.indexOf("?"))>0&&parent.frames.length) {
    d=parent.frames[n.substring(p+1)].document; n=n.substring(0,p);}
  if(!(x=d[n])&&d.all) x=d.all[n]; for (i=0;!x&&i<d.forms.length;i++) x=d.forms[i][n];
  for(i=0;!x&&d.layers&&i<d.layers.length;i++) x=MM_findObj(n,d.layers[i].document);
  if(!x && d.getElementById) x=d.getElementById(n); return x;
}

function MM_nbGroup(event, grpName) { //v6.0
  var i,img,nbArr,args=MM_nbGroup.arguments;
  if (event == "init" && args.length > 2) {
    if ((img = MM_findObj(args[2])) != null && !img.MM_init) {
      img.MM_init = true; img.MM_up = args[3]; img.MM_dn = img.src;
      if ((nbArr = document[grpName]) == null) nbArr = document[grpName] = new Array();
      nbArr[nbArr.length] = img;
      for (i=4; i < args.length-1; i+=2) if ((img = MM_findObj(args[i])) != null) {
        if (!img.MM_up) img.MM_up = img.src;
        img.src = img.MM_dn = args[i+1];
        nbArr[nbArr.length] = img;
    } }
  } else if (event == "over") {
    document.MM_nbOver = nbArr = new Array();
    for (i=1; i < args.length-1; i+=3) if ((img = MM_findObj(args[i])) != null) {
      if (!img.MM_up) img.MM_up = img.src;
      img.src = (img.MM_dn && args[i+2]) ? args[i+2] : ((args[i+1])? args[i+1] : img.MM_up);
      nbArr[nbArr.length] = img;
    }
  } else if (event == "out" ) {
    for (i=0; i < document.MM_nbOver.length; i++) {
      img = document.MM_nbOver[i]; img.src = (img.MM_dn) ? img.MM_dn : img.MM_up; }
  } else if (event == "down") {
    nbArr = document[grpName];
    if (nbArr)
      for (i=0; i < nbArr.length; i++) { img=nbArr[i]; img.src = img.MM_up; img.MM_dn = 0; }
    document[grpName] = nbArr = new Array();
    for (i=2; i < args.length-1; i+=2) if ((img = MM_findObj(args[i])) != null) {
      if (!img.MM_up) img.MM_up = img.src;
      img.src = img.MM_dn = (args[i+1])? args[i+1] : img.MM_up;
      nbArr[nbArr.length] = img;
  } }
}
//-->
</script>
      </meta>
    </head>

  </xsl:template>

  <xsl:template name="table.start">
    <tr bordercolor="#FFFFCC" bgcolor="#FFFFFF">
      <td height="94" colspan="3">
        <div align="center">
          <img width="621" height="90" border="1">
            <xsl:attribute name="src"><xsl:value-of select="$image.dir"
            />/startylw2.jpg</xsl:attribute>
          </img>
          <br/>
          <a href="home.html" target="_top"
            onClick="MM_nbGroup('down','group1','home','images/home1c.gif',1)"
            onMouseOver="MM_nbGroup('over','home','images/home1b.gif','images/home1b.gif',1)"
            onMouseOut="MM_nbGroup('out')">
            <img name="home" border="0" onLoad="" width="100" height="20">
              <xsl:attribute name="src"><xsl:value-of select="$image.dir"
              />/home1a.gif</xsl:attribute>
            </img>
          </a>
          <a href="archive2.html" target="_top"
            onClick="MM_nbGroup('down','group1','archives','images/archive1c.gif',1)"
            onMouseOver="MM_nbGroup('over','archives','images/archive1b.gif','images/archive1b.gif',1)"
            onMouseOut="MM_nbGroup('out')">
            <img name="archives" border="0" onLoad="" width="100" height="20">
              <xsl:attribute name="src"><xsl:value-of select="$image.dir"
              />/archive1a.gif</xsl:attribute>
            </img>
          </a>
          <a href="books.html" target="_top"
            onClick="MM_nbGroup('down','group1','books','images/book1c.gif',1)"
            onMouseOver="MM_nbGroup('over','books','images/book1b.gif','images/book1b.gif',1)"
            onMouseOut="MM_nbGroup('out')">
            <img name="books" border="0" onLoad="" width="123" height="20">
              <xsl:attribute name="src"><xsl:value-of select="$image.dir"
              />/book1a.gif</xsl:attribute>
            </img>
          </a>
          <a href="17docs.html" target="_top"
            onClick="MM_nbGroup('down','group1','documents','images/doc1c.gif',1)"
            onMouseOver="MM_nbGroup('over','documents','images/doc1b.gif','images/doc1b.gif',1)"
            onMouseOut="MM_nbGroup('out')">
            <img name="documents" border="0" onLoad="" width="100" height="20">
              <xsl:attribute name="src"><xsl:value-of select="$image.dir"
              />/doc1a.gif</xsl:attribute>
            </img>
          </a>
          <a href="maps.html" target="_top"
            onClick="MM_nbGroup('down','group1','maps','images/map1c.gif',1)"
            onMouseOver="MM_nbGroup('over','maps','images/map1b.gif','images/map1b.gif',1)"
            onMouseOut="MM_nbGroup('out')">
            <img name="maps" border="0" onLoad="" width="100" height="20">
              <xsl:attribute name="src"><xsl:value-of select="$image.dir"
              />/map1a.gif</xsl:attribute>
            </img>
          </a>
          <a
            href="names.xml"
            target="_top" onClick="MM_nbGroup('down','group1','people','images/people1c.gif',1)"
            onMouseOver="MM_nbGroup('over','people','images/people1b.gif','images/people1b.gif',1)"
            onMouseOut="MM_nbGroup('out')">
            <img name="people" border="0" onLoad="" width="100" height="20">
              <xsl:attribute name="src"><xsl:value-of select="$image.dir"
              />/people1a.gif</xsl:attribute>
            </img>
          </a>
        </div>
      </td>
    </tr>
  </xsl:template>

  <xsl:template name="table.next">
    <tr>
      <td height="42" colspan="3" bgcolor="#FFFFFF">
        <h2 align="center">Important Persons in the Salem Court Records</h2>
      </td>
    </tr>
    <tr bgcolor="#CC9966">
      <td width="25%" height="24">
        <div align="left">
          <strong>Categories</strong>
        </div>
      </td>
      <td width="25%">
        <div align="left">
          <strong>
            <xsl:text>Persons</xsl:text>
            <xsl:call-template name="cat.head"/>
          </strong>
        </div>
      </td>
      <td width="50%">
        <div align="left">
          <strong>Brief Biography</strong>
        </div>
      </td>
    </tr>

  </xsl:template>

  <xsl:template name="table.next.full">
    <!-- tr>
  <xsl:call-template name="name.search"/>
	</tr -->
    <tr>
      <td height="42" colspan="3" bgcolor="#FFFFFF">
        <h2 align="center">
          <xsl:apply-templates select="//div1/head"/>
        </h2>
      </td>
    </tr>
  </xsl:template>


</xsl:stylesheet>
