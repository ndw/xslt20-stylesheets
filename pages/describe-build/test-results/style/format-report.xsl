<?xml version="1.0" encoding="utf-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
                xmlns:xs="http://www.w3.org/2001/XMLSchema"
                xmlns="http://www.w3.org/1999/xhtml"
		exclude-result-prefixes="xs"
                version="2.0">

<xsl:output method="xhtml" encoding="utf-8" indent="no"
	    omit-xml-declaration="yes"/>

<xsl:template match="results">
  <html>
    <head>
      <title>Test results</title>
      <link href="style/show-results.css" rel="stylesheet" type="text/css"/>
    </head>
    <body>
      <h1>Test results</h1>
      <table>
        <thead>
          <tr>
            <th>Test</th>
            <th>Differences</th>
            <th>Expected</th>
            <th>Actual</th>
          </tr>
        </thead>
        <tbody>
          <xsl:apply-templates>
            <xsl:sort select="@test" order="ascending"/>
          </xsl:apply-templates>
        </tbody>
      </table>
    </body>
  </html>
</xsl:template>

<xsl:template match="result">
  <tr>
    <xsl:if test="@differences != ''">
      <xsl:attribute name="class" select="'diff'"/>
    </xsl:if>
    <td>
      <a href="result/{@test}">
        <xsl:value-of select="@test"/>
      </a>
    </td>
    <td>
      <xsl:value-of select="@differences"/>
    </td>
    <td>
      <a href="expected/{@test}">
        <xsl:value-of select="@test"/>
      </a>
    </td>
    <td>
      <a href="actual/{@test}">
        <xsl:value-of select="@test"/>
      </a>
    </td>
  </tr>
</xsl:template>

<xsl:template match="element()">
  <xsl:copy>
    <xsl:apply-templates select="@*,node()"/>
  </xsl:copy>
</xsl:template>

<xsl:template match="attribute()|text()|comment()|processing-instruction()">
  <xsl:copy/>
</xsl:template>

</xsl:stylesheet>
