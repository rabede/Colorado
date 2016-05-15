<?xml version="1.0" encoding="utf-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
	version="1.0">
	<xsl:output method="xml" encoding="utf-8" />
	<xsl:template match="*">
		<xsl:copy>
			<xsl:copy-of select="./@*" />
			<xsl:apply-templates />
		</xsl:copy>
	</xsl:template>
	<xsl:template match="geocache">
	<xsl:element name="extensions">
		<xsl:element name="cache">
			<xsl:attribute name="id">
        <xsl:value-of select="count(preceding::geocache)" />
      </xsl:attribute>
			<xsl:apply-templates />
		</xsl:element>
		</xsl:element>
	</xsl:template>
	<xsl:template match="geocache/type">
		<xsl:element name="type">
			<xsl:choose>
				<xsl:when test="string()='Multi'">
					<xsl:text>Multi-cache</xsl:text>
				</xsl:when>
				<xsl:when test="string()='Traditional'">
					<xsl:text>TraditionalCache</xsl:text>
				</xsl:when>
				<xsl:otherwise>
					<xsl:apply-templates />
				</xsl:otherwise>
			</xsl:choose>
		</xsl:element>
	</xsl:template>
	<xsl:template match="geocache/difficulty">
		<xsl:element name="difficulty">
			<xsl:choose>
				<xsl:when test=".='1.0'">
					<xsl:value-of select="1" />
				</xsl:when>
				<xsl:when test=".='2.0'">
					<xsl:value-of select="2" />
				</xsl:when>
				<xsl:when test=".='3.0'">
					<xsl:value-of select="3" />
				</xsl:when>
				<xsl:when test=".='4.0'">
					<xsl:value-of select="4" />
				</xsl:when>
				<xsl:when test=".='5.0'">
					<xsl:value-of select="5" />
				</xsl:when>
				<xsl:otherwise>
					<xsl:apply-templates />
				</xsl:otherwise>
			</xsl:choose>
		</xsl:element>
	</xsl:template>
	<xsl:template match="geocache/terrain">
		<xsl:element name="terrain">
			<xsl:choose>
				<xsl:when test=".='1.0'">
					<xsl:value-of select="1" />
				</xsl:when>
				<xsl:when test=".='2.0'">
					<xsl:value-of select="2" />
				</xsl:when>
				<xsl:when test=".='3.0'">
					<xsl:value-of select="3" />
				</xsl:when>
				<xsl:when test=".='4.0'">
					<xsl:value-of select="4" />
				</xsl:when>
				<xsl:when test=".='5.0'">
					<xsl:value-of select="5" />
				</xsl:when>
				<xsl:otherwise>
					<xsl:apply-templates />
				</xsl:otherwise>
			</xsl:choose>
		</xsl:element>
	</xsl:template>
	<xsl:template match="geocache/summary">
		<xsl:element name="short_description">
			<xsl:apply-templates />
		</xsl:element>
	</xsl:template>
	<xsl:template match="geocache/description">
		<xsl:element name="long_description">
			<xsl:apply-templates />
		</xsl:element>
	</xsl:template>
	<xsl:template match="geocache/hints">
		<xsl:element name="encoded_hints">
			<xsl:apply-templates />
		</xsl:element>
	</xsl:template>
	
</xsl:stylesheet>