<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="2.0"
	xmlns:cinclude="http://apache.org/cocoon/include/1.0">

	<xsl:param name="q"/>
	<xsl:param name="rows"/>
	<xsl:param name="start"/>	

	<xsl:template match="/">
		<html>
			<head>
				<title>
					<xsl:text>Browse the Salem Witchcraft Papers Names Index</xsl:text>
				</title>
				<link type="text/css" href="../style.css" rel="stylesheet"/>
				<script type="text/javascript" src="../javascript/jquery-1.2.6.min.js"/>
				<script type="text/javascript" src="../javascript/jquery.lightbox-0.5.min.js"/>
				<script type="text/javascript" src="../javascript/salem-archives-lightbox.js"/>
				<script type="text/javascript" src="../javascript/search_form.js"/>
			</head>
		</html>
		<body>
			<div class="header">
				<img src="../images/startdoc2.jpg" width="621" height="90" border="1"/>
				<ul class="menu">
					<li class="menu_item menu_home" style="width:13%;">
						<a href="../home.html">Home</a>
					</li>
					<li class="menu_item menu_archives" style="width:15%">
						<a href="../archive2.html">Archives</a>
					</li>
					<li class="menu_item menu_books" style="width:24%;">
						<a href="../books.html">Books &amp; Letters</a>
					</li>
					<li class="menu_item menu_documents" style="width:20%;">
						<a href="../17docs.html">Documents</a>
					</li>
					<li class="menu_item menu_maps" style="width:13%;">
						<a href="../maps.html">Maps</a>
					</li>
					<li class="menu_item menu_people" style="width:15%;">
						<a
							href="people?group.num=all"
							>People</a>
					</li>
				</ul>
			</div>
			<div class="content_container">
				<div class="options">
					<a href="transcripts.html">Return to The Salem Witchcraft Papers</a>
				</div>
				<div class="search_content">
					<h1>Search the Salem Witchcraft Papers</h1>
					<form id="search_form" method="GET">
						<xsl:text>Search for word or phrase: </xsl:text>
						<input type="hidden" name="rows" value="10"/>
						<input type="hidden" name="start" value="0"/>
						<input type="text" name="q" value="{if (contains($q, '*:*')) then '' else substring-before($q, ' AND')}" id="q"/>
				
						<select id="field" name="field">
							<option value="fulltext" selected="true">Fulltext</option>
							<option value="title">Title</option>
							<option value="case_title">Case Title</option>
							<option value="name_text">Name</option>
						</select>	
							
						<br/>
						<xsl:text>and/or documents dated
						(1692/1693, excluding some undated items):</xsl:text>
						<br/>
						<xsl:text>year: </xsl:text>
						<!--<select id="range">
							<option value="select">Select...</option>
							<option value="exactly">Exactly</option>
							<option value="after">After</option>
							<option value="before">Before</option>
							<option value="from">From...</option>
						</select>-->
						<select id="year">
							<option value="">any</option>
							<xsl:choose>
								<xsl:when test="contains($q, 'y1692')">
									<option value="1692" selected="selected">1692</option>
								</xsl:when>
								<xsl:otherwise>
									<option value="1692">1692</option>
								</xsl:otherwise>
							</xsl:choose>
							<xsl:choose>
								<xsl:when test="contains($q, 'y1693')">
									<option value="1693" selected="selected">1693</option>
								</xsl:when>
								<xsl:otherwise>
									<option value="1693">1693</option>
								</xsl:otherwise>
							</xsl:choose>
							<xsl:choose>
								<xsl:when test="contains($q, 'y1696')">
									<option value="1696" selected="selected">1696</option>
								</xsl:when>
								<xsl:otherwise>
									<option value="1696">1696</option>
								</xsl:otherwise>
							</xsl:choose>
							<xsl:choose>
								<xsl:when test="contains($q, 'y1697')">
									<option value="1697" selected="selected">1697</option>
								</xsl:when>
								<xsl:otherwise>
									<option value="1697">1697</option>
								</xsl:otherwise>
							</xsl:choose>
							<xsl:choose>
								<xsl:when test="contains($q, 'y1702')">
									<option value="1702" selected="selected">1702</option>
								</xsl:when>
								<xsl:otherwise>
									<option value="1702">1702</option>
								</xsl:otherwise>
							</xsl:choose>
							<xsl:choose>
								<xsl:when test="contains($q, 'y1703')">
									<option value="1703" selected="selected">1703</option>
								</xsl:when>
								<xsl:otherwise>
									<option value="1703">1703</option>
								</xsl:otherwise>
							</xsl:choose>
							<xsl:choose>
								<xsl:when test="contains($q, 'y1709')">
									<option value="1709" selected="selected">1709</option>
								</xsl:when>
								<xsl:otherwise>
									<option value="1709">1709</option>
								</xsl:otherwise>
							</xsl:choose>
							<xsl:choose>
								<xsl:when test="contains($q, 'y1710')">
									<option value="1710" selected="selected">1710</option>
								</xsl:when>
								<xsl:otherwise>
									<option value="1710">1710</option>
								</xsl:otherwise>
							</xsl:choose>
							<xsl:choose>
								<xsl:when test="contains($q, 'y1711')">
									<option value="1711" selected="selected">1711</option>
								</xsl:when>
								<xsl:otherwise>
									<option value="1711">1711</option>
								</xsl:otherwise>
							</xsl:choose>
							<xsl:choose>
								<xsl:when test="contains($q, 'y1712')">
									<option value="1712" selected="selected">1712</option>
								</xsl:when>
								<xsl:otherwise>
									<option value="1712">1712</option>
								</xsl:otherwise>
							</xsl:choose>
							<xsl:choose>
								<xsl:when test="contains($q, 'y1713')">
									<option value="1713" selected="selected">1713</option>
								</xsl:when>
								<xsl:otherwise>
									<option value="1713">1713</option>
								</xsl:otherwise>
							</xsl:choose>
							<xsl:choose>
								<xsl:when test="contains($q, 'y1717')">
									<option value="1717" selected="selected">1717</option>
								</xsl:when>
								<xsl:otherwise>
									<option value="1717">1717</option>
								</xsl:otherwise>
							</xsl:choose>
							<xsl:choose>
								<xsl:when test="contains($q, 'y1718')">
									<option value="1718" selected="selected">1718</option>
								</xsl:when>
								<xsl:otherwise>
									<option value="1718">1718</option>
								</xsl:otherwise>
							</xsl:choose>
							<xsl:choose>
								<xsl:when test="contains($q, 'y1750')">
									<option value="1750" selected="selected">1750</option>
								</xsl:when>
								<xsl:otherwise>
									<option value="1750">1750</option>
								</xsl:otherwise>
							</xsl:choose>
						</select>
						
						<xsl:text>month: </xsl:text>
						<select id="month">
							<option value="">any</option>
							<xsl:choose>
								<xsl:when test="contains($q, 'm01')">
									<option value="01" selected="selected">January</option>
								</xsl:when>
								<xsl:otherwise>
									<option value="01">January</option>
								</xsl:otherwise>
							</xsl:choose>
							<xsl:choose>
								<xsl:when test="contains($q, 'm02')">
									<option value="02" selected="selected">February</option>
								</xsl:when>
								<xsl:otherwise>
									<option value="02">February</option>
								</xsl:otherwise>
							</xsl:choose>
							<xsl:choose>
								<xsl:when test="contains($q, 'm03')">
									<option value="03" selected="selected">March</option>
								</xsl:when>
								<xsl:otherwise>
									<option value="03">March</option>
								</xsl:otherwise>
							</xsl:choose>
							<xsl:choose>
								<xsl:when test="contains($q, 'm04')">
									<option value="04" selected="selected">April</option>
								</xsl:when>
								<xsl:otherwise>
									<option value="04">April</option>
								</xsl:otherwise>
							</xsl:choose>
							<xsl:choose>
								<xsl:when test="contains($q, 'm05')">
									<option value="05" selected="selected">May</option>
								</xsl:when>
								<xsl:otherwise>
									<option value="05">May</option>
								</xsl:otherwise>
							</xsl:choose>
							<xsl:choose>
								<xsl:when test="contains($q, 'm06')">
									<option value="06" selected="selected">June</option>
								</xsl:when>
								<xsl:otherwise>
									<option value="06">June</option>
								</xsl:otherwise>
							</xsl:choose>
							<xsl:choose>
								<xsl:when test="contains($q, 'm07')">
									<option value="07" selected="selected">July</option>
								</xsl:when>
								<xsl:otherwise>
									<option value="07">July</option>
								</xsl:otherwise>
							</xsl:choose>
							<xsl:choose>
								<xsl:when test="contains($q, 'm08')">
									<option value="08" selected="selected">August</option>
								</xsl:when>
								<xsl:otherwise>
									<option value="08">August</option>
								</xsl:otherwise>
							</xsl:choose>
							<xsl:choose>
								<xsl:when test="contains($q, 'm09')">
									<option value="09" selected="selected">September</option>
								</xsl:when>
								<xsl:otherwise>
									<option value="09">September</option>
								</xsl:otherwise>
							</xsl:choose>
							<xsl:choose>
								<xsl:when test="contains($q, 'm10')">
									<option value="10" selected="selected">October</option>
								</xsl:when>
								<xsl:otherwise>
									<option value="10">October</option>
								</xsl:otherwise>
							</xsl:choose>
							<xsl:choose>
								<xsl:when test="contains($q, 'm11')">
									<option value="11" selected="selected">November</option>
								</xsl:when>
								<xsl:otherwise>
									<option value="11">November</option>
								</xsl:otherwise>
							</xsl:choose>
							<xsl:choose>
								<xsl:when test="contains($q, 'm12')">
									<option value="12" selected="selected">December</option>
								</xsl:when>
								<xsl:otherwise>
									<option value="12">December</option>
								</xsl:otherwise>
							</xsl:choose>							
						</select>
						<xsl:text>day: </xsl:text>
						<select id="day">
							<option value="">any</option>
							<xsl:choose>
								<xsl:when test="contains($q, 'd01')">
									<option selected="selected">01</option>
								</xsl:when>
								<xsl:otherwise>
									<option>01</option>
								</xsl:otherwise>
							</xsl:choose>
							<xsl:choose>
								<xsl:when test="contains($q, 'd02')">
									<option selected="selected">02</option>
								</xsl:when>
								<xsl:otherwise>
									<option>02</option>
								</xsl:otherwise>
							</xsl:choose>
							<xsl:choose>
								<xsl:when test="contains($q, 'd03')">
									<option selected="selected">03</option>
								</xsl:when>
								<xsl:otherwise>
									<option>03</option>
								</xsl:otherwise>
							</xsl:choose>
							<xsl:choose>
								<xsl:when test="contains($q, 'd04')">
									<option selected="selected">04</option>
								</xsl:when>
								<xsl:otherwise>
									<option>04</option>
								</xsl:otherwise>
							</xsl:choose>
							<xsl:choose>
								<xsl:when test="contains($q, 'd05')">
									<option selected="selected">05</option>
								</xsl:when>
								<xsl:otherwise>
									<option>05</option>
								</xsl:otherwise>
							</xsl:choose>
							<xsl:choose>
								<xsl:when test="contains($q, 'd06')">
									<option selected="selected">06</option>
								</xsl:when>
								<xsl:otherwise>
									<option>06</option>
								</xsl:otherwise>
							</xsl:choose>
							<xsl:choose>
								<xsl:when test="contains($q, 'd07')">
									<option selected="selected">07</option>
								</xsl:when>
								<xsl:otherwise>
									<option>07</option>
								</xsl:otherwise>
							</xsl:choose>
							<xsl:choose>
								<xsl:when test="contains($q, 'd08')">
									<option selected="selected">08</option>
								</xsl:when>
								<xsl:otherwise>
									<option>08</option>
								</xsl:otherwise>
							</xsl:choose>
							<xsl:choose>
								<xsl:when test="contains($q, 'd09')">
									<option selected="selected">09</option>
								</xsl:when>
								<xsl:otherwise>
									<option>09</option>
								</xsl:otherwise>
							</xsl:choose>
							<xsl:choose>
								<xsl:when test="contains($q, 'd10')">
									<option selected="selected">10</option>
								</xsl:when>
								<xsl:otherwise>
									<option>10</option>
								</xsl:otherwise>
							</xsl:choose>
							<xsl:choose>
								<xsl:when test="contains($q, 'd11')">
									<option selected="selected">11</option>
								</xsl:when>
								<xsl:otherwise>
									<option>11</option>
								</xsl:otherwise>
							</xsl:choose>
							<xsl:choose>
								<xsl:when test="contains($q, 'd12')">
									<option selected="selected">12</option>
								</xsl:when>
								<xsl:otherwise>
									<option>12</option>
								</xsl:otherwise>
							</xsl:choose>
							<xsl:choose>
								<xsl:when test="contains($q, 'd13')">
									<option selected="selected">13</option>
								</xsl:when>
								<xsl:otherwise>
									<option>13</option>
								</xsl:otherwise>
							</xsl:choose>
							<xsl:choose>
								<xsl:when test="contains($q, 'd14')">
									<option selected="selected">14</option>
								</xsl:when>
								<xsl:otherwise>
									<option>14</option>
								</xsl:otherwise>
							</xsl:choose>
							<xsl:choose>
								<xsl:when test="contains($q, 'd15')">
									<option selected="selected">15</option>
								</xsl:when>
								<xsl:otherwise>
									<option>15</option>
								</xsl:otherwise>
							</xsl:choose>
							<xsl:choose>
								<xsl:when test="contains($q, 'd16')">
									<option selected="selected">16</option>
								</xsl:when>
								<xsl:otherwise>
									<option>16</option>
								</xsl:otherwise>
							</xsl:choose>
							<xsl:choose>
								<xsl:when test="contains($q, 'd17')">
									<option selected="selected">17</option>
								</xsl:when>
								<xsl:otherwise>
									<option>17</option>
								</xsl:otherwise>
							</xsl:choose>
							<xsl:choose>
								<xsl:when test="contains($q, 'd18')">
									<option selected="selected">18</option>
								</xsl:when>
								<xsl:otherwise>
									<option>18</option>
								</xsl:otherwise>
							</xsl:choose>
							<xsl:choose>
								<xsl:when test="contains($q, 'd19')">
									<option selected="selected">19</option>
								</xsl:when>
								<xsl:otherwise>
									<option>19</option>
								</xsl:otherwise>
							</xsl:choose>
							<xsl:choose>
								<xsl:when test="contains($q, 'd20')">
									<option selected="selected">20</option>
								</xsl:when>
								<xsl:otherwise>
									<option>20</option>
								</xsl:otherwise>
							</xsl:choose>
							<xsl:choose>
								<xsl:when test="contains($q, 'd21')">
									<option selected="selected">21</option>
								</xsl:when>
								<xsl:otherwise>
									<option>21</option>
								</xsl:otherwise>
							</xsl:choose>
							<xsl:choose>
								<xsl:when test="contains($q, 'd22')">
									<option selected="selected">22</option>
								</xsl:when>
								<xsl:otherwise>
									<option>22</option>
								</xsl:otherwise>
							</xsl:choose>
							<xsl:choose>
								<xsl:when test="contains($q, 'd23')">
									<option selected="selected">23</option>
								</xsl:when>
								<xsl:otherwise>
									<option>23</option>
								</xsl:otherwise>
							</xsl:choose>
							<xsl:choose>
								<xsl:when test="contains($q, 'd24')">
									<option selected="selected">24</option>
								</xsl:when>
								<xsl:otherwise>
									<option>24</option>
								</xsl:otherwise>
							</xsl:choose>
							<xsl:choose>
								<xsl:when test="contains($q, 'd25')">
									<option selected="selected">25</option>
								</xsl:when>
								<xsl:otherwise>
									<option>25</option>
								</xsl:otherwise>
							</xsl:choose>
							<xsl:choose>
								<xsl:when test="contains($q, 'd26')">
									<option selected="selected">26</option>
								</xsl:when>
								<xsl:otherwise>
									<option>26</option>
								</xsl:otherwise>
							</xsl:choose>
							<xsl:choose>
								<xsl:when test="contains($q, 'd27')">
									<option selected="selected">27</option>
								</xsl:when>
								<xsl:otherwise>
									<option>27</option>
								</xsl:otherwise>
							</xsl:choose>
							<xsl:choose>
								<xsl:when test="contains($q, 'd28')">
									<option selected="selected">28</option>
								</xsl:when>
								<xsl:otherwise>
									<option>28</option>
								</xsl:otherwise>
							</xsl:choose>
							<xsl:choose>
								<xsl:when test="contains($q, 'd29')">
									<option selected="selected">29</option>
								</xsl:when>
								<xsl:otherwise>
									<option>29</option>
								</xsl:otherwise>
							</xsl:choose>
							<xsl:choose>
								<xsl:when test="contains($q, 'd30')">
									<option selected="selected">30</option>
								</xsl:when>
								<xsl:otherwise>
									<option>30</option>
								</xsl:otherwise>
							</xsl:choose>
							<xsl:choose>
								<xsl:when test="contains($q, 'd31')">
									<option selected="selected">31</option>
								</xsl:when>
								<xsl:otherwise>
									<option>31</option>
								</xsl:otherwise>
							</xsl:choose>
						</select>
						<br/>
						<br/>
						<input type="submit" value="Search" id="search_button"/>
						<input type="button" value="Clear Results" onclick="window.location.href='salemSearch.htm'"/>
					</form>
					<div id="search">
						<xsl:if test="$q">							
							<cinclude:include src="cocoon:/search_results?q={$q}"/>
						</xsl:if>
					</div>
				</div>
			</div>
			<div class="footer">© Copyright 2002 by Benjamin Ray and The Rector and Visitors of the
				University of Virginia</div>
		</body>
	</xsl:template>
</xsl:stylesheet>
