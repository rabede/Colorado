<?xml version="1.0" encoding="utf-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0"
                xmlns:groundspeak="http://www.groundspeak.com/cache/1/0">


  <xsl:output method="xml" encoding="utf-8"/>

  <xsl:template match="*">
    <xsl:copy>
      <xsl:copy-of select="./@*"/>
      <xsl:apply-templates/>
    </xsl:copy>
  </xsl:template>

  <xsl:template match="groundspeak:cache">
    <xsl:copy>
      <xsl:copy-of select="./@*"/>
      <xsl:attribute name="id"><xsl:value-of select="count(preceding::groundspeak:cache)"/></xsl:attribute>
      <xsl:apply-templates/>
    </xsl:copy>
  </xsl:template>
 
</xsl:stylesheet>