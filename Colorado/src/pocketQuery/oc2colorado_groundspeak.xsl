<?xml version="1.0" encoding="ISO-8859-1"?>
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
		<xsl:element name="groundspeak:cache" namespace="http://www.groundspeak.com/cache/1/0">
			<xsl:attribute name="id">
        <xsl:value-of select="count(preceding::geocache)" />
      </xsl:attribute>
			<xsl:apply-templates />
		</xsl:element>
	</xsl:template>
	<xsl:template match="geocache/name">
		<xsl:element name="groundspeak:name">
			<xsl:apply-templates />
		</xsl:element>
	</xsl:template>
	<xsl:template match="geocache/owner">
		<xsl:element name="groundspeak:placed_by" namespace="http://www.groundspeak.com/cache/1/0">
			<xsl:apply-templates />
		</xsl:element>
	</xsl:template>
	<xsl:template match="geocache/state">
		<xsl:element name="groundspeak:state">
			<xsl:apply-templates />
		</xsl:element>
	</xsl:template>
	<xsl:template match="geocache/country">
		<xsl:element name="groundspeak:country">
			<xsl:apply-templates />
		</xsl:element>
	</xsl:template>
	<xsl:template match="geocache/type">
		<xsl:element name="groundspeak:type">
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
	<xsl:template match="geocache/container">
		<xsl:element name="groundspeak:container">
			<xsl:apply-templates />
		</xsl:element>
	</xsl:template>
	<xsl:template match="geocache/difficulty">
		<xsl:element name="groundspeak:difficulty">
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
		<xsl:element name="groundspeak:terrain">
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
		<xsl:element name="groundspeak:short_description"
			namespace="http://www.groundspeak.com/cache/1/0">
			<xsl:apply-templates />
		</xsl:element>
	</xsl:template>
	<xsl:template match="geocache/description">
		<xsl:element name="groundspeak:long_description"
			namespace="http://www.groundspeak.com/cache/1/0">
			<xsl:apply-templates />
		</xsl:element>
	</xsl:template>
	<xsl:template match="geocache/hints">
		<xsl:element name="groundspeak:encoded_hints" namespace="http://www.groundspeak.com/cache/1/0">
			<xsl:apply-templates />
		</xsl:element>
	</xsl:template>
	<xsl:template match="geocache/logs">
		<xsl:element name="groundspeak:logs">
			<xsl:apply-templates />
		</xsl:element>
	</xsl:template>
	<xsl:template match="log">
		<xsl:element name="groundspeak:log">
			<xsl:apply-templates />
		</xsl:element>
	</xsl:template>
	<xsl:template match="geocache/logs/log/time">
		<xsl:element name="groundspeak:date" namespace="http://www.groundspeak.com/cache/1/0">
			<xsl:apply-templates />
		</xsl:element>
	</xsl:template>
	<xsl:template match="geocache/logs/log/geocacher">
		<xsl:element name="groundspeak:finder" namespace="http://www.groundspeak.com/cache/1/0">
			<xsl:apply-templates />
		</xsl:element>
	</xsl:template>
	<xsl:template match="geocache/logs/log/type">
		<xsl:element name="groundspeak:type">
			<xsl:apply-templates />
		</xsl:element>
	</xsl:template>
	<xsl:template match="geocache/logs/log/text">
		<xsl:element name="groundspeak:text">
			<xsl:apply-templates />
		</xsl:element>
	</xsl:template>
</xsl:stylesheet>