<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">
	<xsl:output method="xml"/>

	<xsl:template match="/">
		<xsl:apply-templates select="TEI.2"/>
	</xsl:template>

	<xsl:template match="TEI.2 ">
		<xsl:element name="add">
			<xsl:element name="doc">
				<xsl:element name="field">
					<xsl:attribute name="name">
						<xsl:text>id</xsl:text>
					</xsl:attribute>
					<xsl:value-of select="@id"/>
				</xsl:element>
				<xsl:apply-templates select="teiHeader"/>
				<xsl:apply-templates select="text"/>
			</xsl:element>
		</xsl:element>

	</xsl:template>

	<xsl:template match="text">
		<field name="fulltext">
			<xsl:value-of select="normalize-space(//fileDesc/titleStmt/title)"/>
			<xsl:text> </xsl:text>
			<xsl:value-of select="normalize-space(//fileDesc/titleStmt/author)"/>
			<xsl:text> </xsl:text>
			<xsl:value-of select="normalize-space(//fileDesc/publicationStmt/publisher)"/>
			<xsl:text> </xsl:text>
			<xsl:value-of select="normalize-space(//fileDesc/publicationStmt/date)"/>
			<xsl:text> </xsl:text>
			<xsl:value-of select="normalize-space(//sourceDesc/biblFull/titleStmt/title)"/>
			<xsl:text> </xsl:text>
			<xsl:value-of select="normalize-space(//sourceDesc/biblFull/titleStmt/author)"/>
			<xsl:text> </xsl:text>
			<xsl:value-of select="normalize-space(//sourceDesc/biblFull/publicationStmt/publisher)"/>
			<xsl:text> </xsl:text>
			<xsl:value-of select="normalize-space(//sourceDesc/biblFull/publicationStmt/date)"/>
			<xsl:text> </xsl:text>


			<xsl:for-each select="descendant-or-self::text()">
				<xsl:value-of select="."/>
				<xsl:text> </xsl:text>
			</xsl:for-each>
		</field>
	</xsl:template>

	<xsl:template match="teiHeader">
		<xsl:element name="field">
			<xsl:attribute name="name">
				<xsl:text>name</xsl:text>
			</xsl:attribute>
			<xsl:value-of select="normalize-space(fileDesc/titleStmt/title)"/>
		</xsl:element>
		<xsl:element name="field">
			<xsl:attribute name="name">
				<xsl:text>f_author</xsl:text>
			</xsl:attribute>
			<xsl:value-of select="normalize-space(fileDesc/titleStmt/author)"/>
		</xsl:element>
		<xsl:element name="field">
			<xsl:attribute name="name">
				<xsl:text>f_publisher</xsl:text>
			</xsl:attribute>
			<xsl:value-of select="normalize-space(fileDesc/publicationStmt/publisher)"/>
		</xsl:element>
		<xsl:element name="field">
			<xsl:attribute name="name">
				<xsl:text>f_year</xsl:text>
			</xsl:attribute>
			<xsl:value-of select="normalize-space(fileDesc/publicationStmt/date)"/>
		</xsl:element>
		<xsl:element name="field">
			<xsl:attribute name="name">
				<xsl:text>book_title</xsl:text>
			</xsl:attribute>
			<xsl:value-of select="normalize-space(//sourceDesc/biblFull/titleStmt/title)"/>
		</xsl:element>
		<xsl:element name="field">
			<xsl:attribute name="name">
				<xsl:text>book_author</xsl:text>
			</xsl:attribute>
			<xsl:value-of select="normalize-space(//sourceDesc/biblFull/titleStmt/author)"/>
		</xsl:element>
		<xsl:element name="field">
			<xsl:attribute name="name">
				<xsl:text>book_publisher</xsl:text>
			</xsl:attribute>
			<xsl:value-of select="normalize-space(//sourceDesc/biblFull/publicationStmt/publisher)"
			/>
		</xsl:element>
		<xsl:element name="field">
			<xsl:attribute name="name">
				<xsl:text>book_year</xsl:text>
			</xsl:attribute>
			<xsl:value-of select="normalize-space(//sourceDesc/biblFull/publicationStmt/date)"/>
		</xsl:element>


		<!-- this section grabs the first word out of the f_title -->

		<field name="firstwordtitle">

			<!-- if title has more than one word, it gets the first word.  if there is only one word,it gets that.  without this code, if there is a one-word
				title and no whitespace, it will get no data -->
			<xsl:variable name="first_word">
				<xsl:choose>
					<xsl:when
						test="substring-before(normalize-space(fileDesc/titleStmt/title), ' ')">
						<xsl:value-of
							select="substring-before(normalize-space(fileDesc/titleStmt/title), ' ')"
						/>
					</xsl:when>
					<xsl:otherwise>
						<xsl:value-of select="normalize-space(fileDesc/titleStmt/title)"/>
					</xsl:otherwise>
				</xsl:choose>
			</xsl:variable>
			<xsl:choose>

				<!-- the following sections have the same logic.
					if the first word is 'A', 'An', or 'The' a variable is created which puts the text after the first space.  Then a
					sub-string before is done on that variable to grab the first real word of the title -->

				<xsl:when test="$first_word = 'A'">
					<xsl:variable name="after_a">
						<xsl:value-of
							select="substring-after(normalize-space(fileDesc/titleStmt/title), ' ')"
						/>
					</xsl:variable>

					<!-- this conditional must be implemented for a two word title -->

					<xsl:choose>
						<xsl:when test="substring-before($after_a, ' ')">
							<xsl:value-of select="substring-before($after_a, ' ')"/>
						</xsl:when>
						<xsl:otherwise>
							<xsl:value-of select="$after_a"/>
						</xsl:otherwise>
					</xsl:choose>

				</xsl:when>
				<xsl:when test="$first_word = 'The'">
					<xsl:variable name="after_the">
						<xsl:value-of
							select="substring-after(normalize-space(fileDesc/titleStmt/title), ' ')"
						/>
					</xsl:variable>
					<xsl:choose>
						<xsl:when test="substring-before($after_the, ' ')">
							<xsl:value-of select="substring-before($after_the, ' ')"/>
						</xsl:when>
						<xsl:otherwise>
							<xsl:value-of select="$after_the"/>
						</xsl:otherwise>
					</xsl:choose>
				</xsl:when>
				<xsl:when test="$first_word = 'An'">
					<xsl:variable name="after_an">
						<xsl:value-of
							select="substring-after(normalize-space(fileDesc/titleStmt/title), ' ')"
						/>
					</xsl:variable>
					<xsl:choose>
						<xsl:when test="substring-before($after_an, ' ')">
							<xsl:value-of select="substring-before($after_an, ' ')"/>
						</xsl:when>
						<xsl:otherwise>
							<xsl:value-of select="$after_an"/>
						</xsl:otherwise>
					</xsl:choose>
				</xsl:when>
				<xsl:otherwise>
					<xsl:value-of select="$first_word"/>
				</xsl:otherwise>
			</xsl:choose>
		</field>


		<!-- this section grabs the first word out of the f_author -->

		<field name="firstwordauthor">

			<!-- if title has more than one word, it gets the first word.  if there is only one word,it gets that.  without this code, if there is a one-word
				title and no whitespace, it will get no data -->
			<xsl:variable name="first_word">
				<xsl:choose>
					<xsl:when
						test="substring-before(normalize-space(fileDesc/titleStmt/author), ' ')">
						<xsl:value-of
							select="substring-before(normalize-space(fileDesc/titleStmt/author), ' ')"
						/>
					</xsl:when>
					<xsl:otherwise>
						<xsl:value-of select="normalize-space(fileDesc/titleStmt/author)"/>
					</xsl:otherwise>
				</xsl:choose>
			</xsl:variable>
			<xsl:choose>

				<!-- the following sections have the same logic.
					if the first word is 'A', 'An', or 'The' a variable is created which puts the text after the first space.  Then a
					sub-string before is done on that variable to grab the first real word of the title -->

				<xsl:when test="$first_word = 'A'">
					<xsl:variable name="after_a">
						<xsl:value-of
							select="substring-after(normalize-space(fileDesc/titleStmt/author), ' ')"
						/>
					</xsl:variable>

					<!-- this conditional must be implemented for a two word title -->

					<xsl:choose>
						<xsl:when test="substring-before($after_a, ' ')">
							<xsl:value-of select="substring-before($after_a, ' ')"/>
						</xsl:when>
						<xsl:otherwise>
							<xsl:value-of select="$after_a"/>
						</xsl:otherwise>
					</xsl:choose>

				</xsl:when>
				<xsl:when test="$first_word = 'The'">
					<xsl:variable name="after_the">
						<xsl:value-of
							select="substring-after(normalize-space(fileDesc/titleStmt/author), ' ')"
						/>
					</xsl:variable>
					<xsl:choose>
						<xsl:when test="substring-before($after_the, ' ')">
							<xsl:value-of select="substring-before($after_the, ' ')"/>
						</xsl:when>
						<xsl:otherwise>
							<xsl:value-of select="$after_the"/>
						</xsl:otherwise>
					</xsl:choose>
				</xsl:when>
				<xsl:when test="$first_word = 'An'">
					<xsl:variable name="after_an">
						<xsl:value-of
							select="substring-after(normalize-space(fileDesc/titleStmt/author), ' ')"
						/>
					</xsl:variable>
					<xsl:choose>
						<xsl:when test="substring-before($after_an, ' ')">
							<xsl:value-of select="substring-before($after_an, ' ')"/>
						</xsl:when>
						<xsl:otherwise>
							<xsl:value-of select="$after_an"/>
						</xsl:otherwise>
					</xsl:choose>
				</xsl:when>
				<xsl:otherwise>
					<xsl:value-of select="$first_word"/>
				</xsl:otherwise>
			</xsl:choose>
		</field>


	</xsl:template>

</xsl:stylesheet>
