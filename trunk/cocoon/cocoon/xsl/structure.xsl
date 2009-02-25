<xsl:stylesheet version="1.1" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">

<xsl:key name="div1notes" match="//div1[@id]/*/note" use="@id"/>


<xsl:template match="tei.2">
  <xsl:apply-templates/>
</xsl:template>

<xsl:template match="teiHeader"/>

<xsl:template match="text">
  <xsl:apply-templates/>
</xsl:template>

<xsl:template match="front">
  <xsl:apply-templates/>
</xsl:template>

<xsl:template match="body">
  <xsl:apply-templates/>
</xsl:template>

<xsl:template match="back">
  <xsl:apply-templates/>
</xsl:template>


<xsl:template name="cat" match="div2[@type='groups']">
	<!-- tr valign="top" --> 
	  <td height="471" rowspan="3" bgcolor="#FFFFFF">
		  <!-- xsl:call-template name="cat.head"/ -->
			<xsl:apply-templates/>
			<p>
	       <a>
	         <xsl:attribute name="href">
		      <xsl:text>names.xml?</xsl:text>
		       <xsl:text>group.num=all</xsl:text>
		       <xsl:text>&#038;clear-stylesheet-cache=yes</xsl:text>
		       </xsl:attribute>
	         <xsl:text>All</xsl:text>
	      </a>
			</p>
	  </td>
	<!-- /tr -->
</xsl:template>

<xsl:template name="cat.head">
  <xsl:param name="group.num" select="$group.num"/>
	<xsl:choose>
	  <xsl:when test="$group.num=//persname/@cats">
		  <xsl:text>: </xsl:text><br/><xsl:value-of select="//name[@id=$group.num]"/>
		</xsl:when>
		<xsl:otherwise>
		</xsl:otherwise>
	</xsl:choose>
</xsl:template>

<xsl:template name="pers" match="div2[@type='persons']">
  <xsl:param name="mbio.num" select="$mbio.num"/>
  <xsl:param name="group.num" select="$group.num"/>
<!-- names.xml
<div2 type="persons">
<persname residence="Salem" cats="G1" mbio="mb1">Bridget Bishop</persname -->
<!-- minibios.xml
<div1 id="minibios" type="minibios">
<div2 id="mb1">
<head>Bridget Bishop</head -->


	<!-- tr valign="top" --> 
    <td height="471" rowspan="3" bgcolor="#FFFFFF">
			<xsl:apply-templates/>
	  </td>
		
		<xsl:choose>
		  <xsl:when test="$mbio.num='none'">
		  </xsl:when>
		  <xsl:when test="substring($mbio.num, 1, 4)='None'">
               <td height="471" rowspan="3" bgcolor="#FFFFCC">
			  <p>No mini biography exists for this person at this time.</p>
				<!-- xsl:call-template name="name.search"/ -->
		     </td>
		  </xsl:when>
		  <xsl:when test="$mbio.num">
        <td height="471" rowspan="3" bgcolor="#FFFFCC">
			    <xsl:apply-templates select="document('../xml/minibios.xml')//div2[@id=$mbio.num]"/>
				<xsl:if test="//persname[@mbio=$mbio.num]/@pics">
				  <a target="new">
					  <xsl:attribute name="href">						  
							<xsl:text>pics.xml?</xsl:text>							
							<xsl:text>chunk.id=</xsl:text>
							<xsl:value-of select="//persname[@mbio=$mbio.num]/@pics"/>					
						</xsl:attribute>
					  <img>
				    <xsl:attribute name="src"><xsl:value-of select='$image.dir'/>/images.gif</xsl:attribute></img>
					</a>
				</xsl:if>
				<xsl:if test="//persname[@mbio=$mbio.num]/@maps">
				  <a target="new">
					  <xsl:attribute name="href">						  
							<xsl:text>maps.xml?</xsl:text>
							<xsl:text>chunk.id=</xsl:text>
							<xsl:value-of select="//persname[@mbio=$mbio.num]/@maps"/>
						</xsl:attribute>
					  <img>
				    <xsl:attribute name="src"><xsl:value-of select='$image.dir'/>/pmap.gif</xsl:attribute></img>
				  </a>
				</xsl:if>
				<xsl:if test="//persname[@mbio=$mbio.num]/@bio">
				  <a target="new">
					  <xsl:attribute name="href">						
							<xsl:text>bios.xml?</xsl:text>							
							<xsl:text>chunk.id=</xsl:text>
							<xsl:value-of select="//persname[@mbio=$mbio.num]/@bio"/>
						</xsl:attribute>
					  <img>
				    <xsl:attribute name="src"><xsl:value-of select='$image.dir'/>/fullbio.gif</xsl:attribute></img>
					</a>
				</xsl:if>
				<xsl:if test="//persname[@mbio=$mbio.num]/@crt">
				  <a target="new">
					  <xsl:attribute name="href">						  
							<xsl:text>courtexams.xml?</xsl:text>
							<xsl:text>chunk.id=</xsl:text>
							<xsl:value-of select="//persname[@mbio=$mbio.num]/@crt"/>					
						</xsl:attribute>
					  <img>
				    <xsl:attribute name="src"><xsl:value-of select='$image.dir'/>/ce.gif</xsl:attribute></img>
					</a>
				</xsl:if>
				<xsl:call-template name="name.search"/>
	      </td>
			</xsl:when>
			<xsl:otherwise>
			</xsl:otherwise>
		</xsl:choose>
	<!-- /tr -->
</xsl:template>

<xsl:template match="name[@type='group']">
  <xsl:param name="group.num" select="$group.num"/>
   <p align="left">
	 <xsl:choose>
	   <xsl:when test="$group.num=@id">
	     <table bgcolor="#FFFFCC"><tr><td bgcolor="#FFFFCC">
	       <a>
	         <xsl:attribute name="href">
		       <xsl:value-of select='$doc-path'/><xsl:text>names.xml</xsl:text>
		       <xsl:value-of select='$query.string'/>
		       <xsl:text>&#038;group.num=</xsl:text><xsl:value-of select='@id'/>
		       <xsl:text>&#038;clear-stylesheet-cache=yes</xsl:text>
		       </xsl:attribute>
	         <xsl:apply-templates/>
	      </a>
	     </td></tr></table>
	   </xsl:when>
	   <xsl:otherwise>
	       <a>
	         <xsl:attribute name="href">
		      <xsl:text>names.xml?</xsl:text>		     
		       <xsl:text>group.num=</xsl:text><xsl:value-of select='@id'/>
		       </xsl:attribute>
	         <xsl:apply-templates/>
	      </a>
	   </xsl:otherwise>
	 </xsl:choose>
	 </p>
</xsl:template>

<xsl:template match="persname">
  <xsl:param name="group.num" select="$group.num"/>
  <xsl:param name="mbio.num" select="$mbio.num"/>
	
	<!-- xsl:message>
	  <xsl:value-of select="$group.num"/>
	  <xsl:text>hmmm</xsl:text>
	  <xsl:value-of select="key('groups', $group.num)"/>
		<xsl:text>ahhh</xsl:text>
	</xsl:message -->
	<xsl:choose>
	  <xsl:when test="$group.num='all'">
	     <p align='left'>
			 <xsl:choose>
			   <xsl:when test="@mbio">
				   <xsl:choose>
	         <xsl:when test="$mbio.num=@mbio">
	         <table bgcolor="#FFFFCC"><tr><td bgcolor="#FFFFCC">
				   <a>
	            <xsl:attribute name="href">
				      <xsl:text>names.xml?</xsl:text>		        
		          <xsl:text>group.num=</xsl:text><xsl:value-of select='$group.num'/>
		          <xsl:text>&#038;mbio.num=</xsl:text><xsl:value-of select='@mbio'/>
		          </xsl:attribute>
					   <xsl:apply-templates/>					 
					 </a>
					 </td></tr></table>
					 </xsl:when> <!-- test="$mbio.num=@mbio" -->
					 <xsl:otherwise>
				   <a>
	            <xsl:attribute name="href">
				      <xsl:text>names.xml?</xsl:text>		      
		          <xsl:text>group.num=</xsl:text><xsl:value-of select='$group.num'/>
		          <xsl:text>&#038;mbio.num=</xsl:text><xsl:value-of select='@mbio'/>		         
		          </xsl:attribute>
					   <xsl:apply-templates/>					 
					 </a>
					 </xsl:otherwise>
					 </xsl:choose>
				 </xsl:when><!-- test="@mbio" -->
				 <xsl:otherwise>
			      <xsl:apply-templates/>
				 </xsl:otherwise>
			 </xsl:choose>
			 </p>
		</xsl:when><!-- test="$group.num='all'" -->
		<xsl:otherwise>
		   <xsl:choose>
		      <xsl:when test="$group.num=@cats">
	          <p align="left">
			       <xsl:choose>
			        <xsl:when test="@mbio">
	              <xsl:choose>
					        <xsl:when test="$mbio.num=@mbio">
	                  <table bgcolor="#FFFFCC"><tr><td bgcolor="#FFFFCC">
				        <a>
	               <xsl:attribute name="href">
				          <xsl:text>names.xml?</xsl:text>		          
		              <xsl:text>group.num=</xsl:text><xsl:value-of select='$group.num'/>
		              <xsl:text>&#038;mbio.num=</xsl:text><xsl:value-of select='@mbio'/>		
		             </xsl:attribute>
					       <xsl:apply-templates/>					 
					      </a>
		        </td></tr></table>
						      </xsl:when><!-- test="$mbio.num=@mbio" -->
						      <xsl:otherwise>
				        <a>
	               <xsl:attribute name="href">
				          <xsl:text>names.xml?</xsl:text>		            
		              <xsl:text>group.num=</xsl:text><xsl:value-of select='$group.num'/>
		              <xsl:text>&#038;mbio.num=</xsl:text><xsl:value-of select='@mbio'/>		             
		             </xsl:attribute>
					       <xsl:apply-templates/>					 
					      </a>
						      </xsl:otherwise>
						</xsl:choose>
				      </xsl:when><!-- test="@mbio" -->
				      <xsl:otherwise>
			           <xsl:apply-templates/>
				      </xsl:otherwise>
			       </xsl:choose>
						</p>
			    </xsl:when><!-- test="$group.num=@cats" -->
					<xsl:when test="$group.num=substring(@cats, 1, 3)">
	          <p align="left">
			       <xsl:choose>
			        <xsl:when test="@mbio">
	              <xsl:choose>
					        <xsl:when test="$mbio.num=@mbio">
	                  <table bgcolor="#FFFFCC"><tr><td bgcolor="#FFFFCC">
				        <a>
	               <xsl:attribute name="href">
				          <xsl:text>names.xml?</xsl:text>		          
		              <xsl:text>group.num=</xsl:text><xsl:value-of select='$group.num'/>
		              <xsl:text>&#038;mbio.num=</xsl:text><xsl:value-of select='@mbio'/>		          
		             </xsl:attribute>
					       <xsl:apply-templates/>					 
					      </a>
		        </td></tr></table>
						      </xsl:when><!-- test="$mbio.num=@mbio" -->
						      <xsl:otherwise>
				        <a>
	               <xsl:attribute name="href">
				          <xsl:text>names.xml?</xsl:text>	
		              <xsl:text>group.num=</xsl:text><xsl:value-of select='$group.num'/>
		              <xsl:text>&#038;mbio.num=</xsl:text><xsl:value-of select='@mbio'/>		             
		             </xsl:attribute>
					       <xsl:apply-templates/>					 
					      </a>
						      </xsl:otherwise>
						</xsl:choose>
				      </xsl:when><!-- test="@mbio" -->
				      <xsl:otherwise>
			           <xsl:apply-templates/>
				      </xsl:otherwise>
			       </xsl:choose>
						</p>
					</xsl:when><!-- test="$group.num=substring(@cats, 1, 3)" -->
					<xsl:when test="$group.num=substring(@cats, 5, 3)">
	          <p align="left">
			       <xsl:choose>
			        <xsl:when test="@mbio">
	              <xsl:choose>
					        <xsl:when test="$mbio.num=@mbio">
	                  <table bgcolor="#FFFFCC"><tr><td bgcolor="#FFFFCC">
				        <a>
	               <xsl:attribute name="href">
				         <xsl:text>names.xml?</xsl:text>		              
		              <xsl:text>group.num=</xsl:text><xsl:value-of select='$group.num'/>
		              <xsl:text>&#038;mbio.num=</xsl:text><xsl:value-of select='@mbio'/>		     
		             </xsl:attribute>
					       <xsl:apply-templates/>					 
					      </a>
		        </td></tr></table>
						      </xsl:when><!-- test="$mbio.num=@mbio" -->
						      <xsl:otherwise>
				        <a>
	               <xsl:attribute name="href">
				          <xsl:value-of select='$doc-path'/><xsl:text>names.xml</xsl:text>
		              <xsl:value-of select='$query.string'/>
		              <xsl:text>&#038;group.num=</xsl:text><xsl:value-of select='$group.num'/>
		              <xsl:text>&#038;mbio.num=</xsl:text><xsl:value-of select='@mbio'/>
		              <xsl:text>&#038;clear-stylesheet-cache=yes</xsl:text>
		             </xsl:attribute>
					       <xsl:apply-templates/>					 
					      </a>
						      </xsl:otherwise>
						</xsl:choose>
				      </xsl:when><!-- test="@mbio" -->
				      <xsl:otherwise>
			           <xsl:apply-templates/>
				      </xsl:otherwise>
			       </xsl:choose>
						</p>
					</xsl:when><!-- test="$group.num=substring(@cats, 5, 3)" -->
					<xsl:when test="$group.num=substring(@cats, 9, 3)">
	          <p align="left">
			       <xsl:choose>
			        <xsl:when test="@mbio">
	              <xsl:choose>
					        <xsl:when test="$mbio.num=@mbio">
	                  <table bgcolor="#FFFFCC"><tr><td bgcolor="#FFFFCC">
				        <a>
	               <xsl:attribute name="href">
				          <xsl:text>names.xml?</xsl:text>		            
		              <xsl:text>group.num=</xsl:text><xsl:value-of select='$group.num'/>
		              <xsl:text>&#038;mbio.num=</xsl:text><xsl:value-of select='@mbio'/>		           
		             </xsl:attribute>
					       <xsl:apply-templates/>					 
					      </a>
		        </td></tr></table>
						      </xsl:when><!-- test="$mbio.num=@mbio" -->
						      <xsl:otherwise>
				        <a>
	               <xsl:attribute name="href">
				          <xsl:value-of select='$doc-path'/><xsl:text>names.xml</xsl:text>
		              <xsl:value-of select='$query.string'/>
		              <xsl:text>&#038;group.num=</xsl:text><xsl:value-of select='$group.num'/>
		              <xsl:text>&#038;mbio.num=</xsl:text><xsl:value-of select='@mbio'/>
		              <xsl:text>&#038;clear-stylesheet-cache=yes</xsl:text>
		             </xsl:attribute>
					       <xsl:apply-templates/>					 
					      </a>
						      </xsl:otherwise>
						</xsl:choose>
				      </xsl:when><!-- test="@mbio" -->
				      <xsl:otherwise>
			           <xsl:apply-templates/>
				      </xsl:otherwise>
			       </xsl:choose>
						</p>
					</xsl:when><!-- test="$group.num=substring(@cats, 9, 3)" -->
					<xsl:when test="$group.num=substring(@cats, 13, 3)">
	          <p align="left">
			       <xsl:choose>
			        <xsl:when test="@mbio">
	              <xsl:choose>
					        <xsl:when test="$mbio.num=@mbio">
	                  <table bgcolor="#FFFFCC"><tr><td bgcolor="#FFFFCC">
				        <a>
	               <xsl:attribute name="href">
				          <xsl:text>names.xml?</xsl:text>		          
		              <xsl:text>group.num=</xsl:text><xsl:value-of select='$group.num'/>
		              <xsl:text>&#038;mbio.num=</xsl:text><xsl:value-of select='@mbio'/>		      
		             </xsl:attribute>
					       <xsl:apply-templates/>					 
					      </a>
		        </td></tr></table>
						      </xsl:when><!-- test="$mbio.num=@mbio" -->
						      <xsl:otherwise>
				        <a>
	               <xsl:attribute name="href">
				          <xsl:text>names.xml?</xsl:text>
		              <xsl:text>group.num=</xsl:text><xsl:value-of select='$group.num'/>
		              <xsl:text>&#038;mbio.num=</xsl:text><xsl:value-of select='@mbio'/>		            
		             </xsl:attribute>
					       <xsl:apply-templates/>					 
					      </a>
						      </xsl:otherwise>
						</xsl:choose>
				      </xsl:when><!-- test="@mbio" -->
				      <xsl:otherwise>
			           <xsl:apply-templates/>
				      </xsl:otherwise>
			       </xsl:choose>
						</p>
					</xsl:when><!-- test="$group.num=substring(@cats, 13, 3)" -->
					<xsl:otherwise>
					</xsl:otherwise>
		   </xsl:choose>
		</xsl:otherwise>
	</xsl:choose>
</xsl:template>

<xsl:template name="minibios">
  <!-- persname element mbio attribute points to minibios.xml, div2 element w/ id attribute-->
</xsl:template>

<xsl:template match="div3[@type='court']">
      <!-- p align="left"><xsl:apply-templates/></p -->
</xsl:template>

<!-- xsl:template match="div3[@type='']">
      <xsl:apply-templates/>
</xsl:template -->

<!-- xsl:template match="div1|div2|div3|div4|div5|div6">
  <xsl:param name="text.size" select="$text.size"/>
	<xsl:param name="div.lvl" select="substring($chunk.id,1,2)"/>
  <xsl:apply-templates/>
</xsl:template -->

<xsl:template match="pb">
  <div align="center">
    <!-- table cellpadding="5" cellspacing="5" bgcolor="#FFFFFF" -->
    <table cellpadding="0" cellspacing="0" width="5%">
      <tr>
	<td>
	  <a target="new">
	    <xsl:attribute name="href"><xsl:value-of select="$image.dir"/>/<xsl:value-of select="@id"/><![CDATA[.jpg]]></xsl:attribute>
	    <img border="0">
			<xsl:attribute name="src"><xsl:value-of select="$image.dir"/>/pageicon.gif</xsl:attribute></img><br/>
	    <font face="Arial"><xsl:value-of select="@n"/></font>
	  </a>
	</td>
      </tr>
    </table>
  </div>
</xsl:template>

<xsl:template name="name.search">
  <xsl:param name="mbio.num" select="$mbio.num"/>
  <xsl:variable name="namelist" select="concat(normalize-space(//persname[@mbio=$mbio.num]),' ')"/>
  <xsl:variable name="firstname" select="substring-before($namelist, ' ')"/>
  <xsl:variable name="lastname" select="substring-after($namelist, ' ')"/>
  <xsl:variable name="searchname"><xsl:value-of select="$firstname"/>+<xsl:value-of select="$lastname"/></xsl:variable>
  <xsl:variable name="queryname"><xsl:value-of select="substring($lastname,1,3)"/><xsl:value-of select="substring($firstname,1,3)"/></xsl:variable>
 
		<br/>
		<br/>
		<div align="center">
		<xsl:choose>
		  <xsl:when test="$mbio.num='mb40'">
			</xsl:when>
		  <xsl:when test="$mbio.num='mb41'">
			</xsl:when>
			<xsl:otherwise>
		<a><xsl:attribute name="href"><xsl:text>http://etext.lib.virginia.edu/etcbin/ot2www-salemname?name=</xsl:text>
		<xsl:value-of select="$searchname"/>
		<xsl:text>&#038;query=</xsl:text>
		<xsl:value-of select="$queryname"/>
		</xsl:attribute>
		<img>
		<xsl:attribute name="src"><xsl:value-of select='$image.dir'/>/search.gif</xsl:attribute></img>
		</a>
		 </xsl:otherwise>
		 </xsl:choose>
		</div>
</xsl:template>

</xsl:stylesheet>












