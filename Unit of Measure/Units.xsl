<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:n1="http://www.posc.org/schemas" xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance">

<xsl:key name="uomkey" match="n1:UnitOfMeasure/n1:CatalogSymbol" use="."/>

    <xsl:template match="/">
        <html>
            <head >
              <style type="text/css">
                body {font-family: Arial, Helvetica, sans-serif;
                         margin:20;}
                .label {width:120;
                           font-size:14pt;
                           font-weight:bold;
                           }
                .content {font-size:14pt; 
                           }
              </style>
            </head>
            <body>
              <table border="0" cellspacing="0" cellpadding="5">
                <xsl:for-each select="n1:UnitOfMeasureDictionary">
                    <xsl:for-each select="n1:DocumentInformation">
                        <xsl:for-each select="n1:DocumentName">
                            <tr valign="top">
                              <td><span class="label">Document:</span></td>
                              <td><span class="content"><xsl:apply-templates /></span></td>
                            </tr>
                        </xsl:for-each>
                        <xsl:for-each select="n1:DocumentDate">
                            <tr valign="top">
                              <td><span class="label">Date:</span></td>
                              <td><span class="content"><xsl:apply-templates /></span></td>
                            </tr>
                        </xsl:for-each>
                        <xsl:for-each select="n1:Disclaimer">
                            <tr valign="top">
                              <td><span class="label">Disclaimer:</span></td>
                              <td><span class="content"><xsl:apply-templates /></span></td>
                            </tr>
                        </xsl:for-each>
                    </xsl:for-each>
                </xsl:for-each>
               </table>
                <h2>Units of Measure Information:</h2>
                <xsl:for-each select="n1:UnitOfMeasureDictionary">
                    <xsl:for-each select="n1:UnitsDefinition">
                        <xsl:if test="count(  n1:UnitOfMeasure/n1:BaseUnit  ) &gt;0">
                            <h3>Table of Base Units</h3>
                              <table border="1" cellspacing="0" cellpadding="5">
                                  <thead>
                                      <tr>
                                          <th>Name</th>
                                          <th>Quantity Type</th>
                                          <th>Catalog Name</th>
                                          <th>S1000D UoM Symbol</th>
                                          <th>Base Unit Description</th>
                                      </tr>
                                  </thead>
                                  <tbody>
                                      <xsl:for-each select="n1:UnitOfMeasure">
                                      <xsl:if test="n1:BaseUnit">
                                          <tr>
                                              <td>
                                                  <xsl:for-each select="n1:Name">
                                                      <xsl:apply-templates />
                                                  </xsl:for-each>
                                              </td>
                                              <td>
                                                  <xsl:for-each select="n1:QuantityType">
                                                      <xsl:apply-templates /><BR/>
                                                  </xsl:for-each>
                                              </td>
                                              <td>
                                                  <xsl:for-each select="n1:CatalogName">
                                                      <xsl:apply-templates />
                                                  </xsl:for-each>
                                              </td>
                                              <td>
                                                  <xsl:for-each select="n1:CatalogSymbol">
                                                      <xsl:apply-templates />
                                                  </xsl:for-each>
                                              </td>
                                              <td>
                                                <xsl:text>&#160;</xsl:text>
                                                  <xsl:for-each select="n1:BaseUnit">
                                                      <xsl:for-each select="n1:Description">
                                                          <xsl:apply-templates />
                                                      </xsl:for-each>
                                                  </xsl:for-each>
                                              </td>
                                          </tr>
                                        </xsl:if>
                                      </xsl:for-each>
                                  </tbody>
                              </table>
                        </xsl:if>
                    </xsl:for-each>
                </xsl:for-each>
                <br />
                <p>
                    <p>
                        <p>
                            <br />
                        </p>
                    </p>
                </p>
                <xsl:for-each select="n1:UnitOfMeasureDictionary">
                    <xsl:for-each select="n1:UnitsDefinition">
                        <p>
                            <p>
                                <h3>Table of Customary Units</h3>
                                  <table border="1" cellpadding="5" cellspacing="0">
                                        <thead>
                                            <tr>
                                                <td rowspan="2">Name</td>
                                                <td rowspan="2">Quantity Type</td>
                                                <td rowspan="2">Catalog Name</td>
                                                <td rowspan="2">S1000D UoM Symbol</td>
                                                <td align="center" rowspan="2">Base<br />Unit</td>
                                                <td align="center" colspan="4">Conversion To Base Unit:<br />(A + BX) / (C + DX)<br />
                                                </td>
                                            </tr>
                                            <tr>
                                                <td align="center">A</td>
                                                <td align="center">B</td>
                                                <td align="center">C</td>
                                                <td align="center">D</td>
                                            </tr>
                                        </thead>
                                        <tbody>
                                            <xsl:for-each select="n1:UnitOfMeasure">
                                              <xsl:if test="n1:ConversionToBaseUnit">
                                                <tr>
                                                    <td>
                                                        <xsl:for-each select="n1:Name">
                                                            <xsl:apply-templates />
                                                        </xsl:for-each>
                                                    </td>
                                                    <td>
                                                        <xsl:for-each select="n1:QuantityType">
                                                            <xsl:apply-templates /><BR/>
                                                        </xsl:for-each>
                                                    </td>
                                                    <td>
                                                        <xsl:for-each select="n1:CatalogName">
                                                            <xsl:apply-templates />
                                                        </xsl:for-each>
                                                    </td>
                                                    <td>
                                                        <xsl:for-each select="n1:CatalogSymbol">
                                                          <xsl:apply-templates />
                                                          <xsl:if test="../n1:Deprecated">
                                                            <BR/>(Deprecated)
                                                          </xsl:if>
                                                        </xsl:for-each>
                                                    </td>
                                                    <td align="center">
                                                    <xsl:choose>
                                                      <xsl:when test="contains(n1:ConversionToBaseUnit/@baseUnit,'#')">
                                                        <xsl:choose>
                                                          <xsl:when test="key('uomkey',substring-after(n1:ConversionToBaseUnit/@baseUnit,'#'))">
                                                    <xsl:value-of select="key('uomkey',substring-after(n1:ConversionToBaseUnit/@baseUnit,'#'))"/>
                                                          </xsl:when>
                                                          <xsl:otherwise>
                                                            <xsl:value-of select="substring-after(n1:ConversionToBaseUnit/@baseUnit,'#')"/>
                                                          </xsl:otherwise>
                                                        </xsl:choose>
                                                      </xsl:when>
                                                      <xsl:when test="key('uomkey',n1:ConversionToBaseUnit/@baseUnit)">
                                                        <xsl:value-of select="key('uomkey',n1:ConversionToBaseUnit/@baseUnit)"/>
                                                      </xsl:when>
                                                      <xsl:otherwise>
                                                        <xsl:value-of select="n1:ConversionToBaseUnit/@baseUnit"/>
                                                      </xsl:otherwise>
                                                    </xsl:choose>
                                                    </td>
                                                    <td align="center">
                                                        <xsl:choose>
                                                            <xsl:when test="n1:ConversionToBaseUnit/n1:Formula/n1:A  and  n1:ConversionToBaseUnit/n1:Formula/n1:A  != &quot;&quot;">
                                                                <xsl:for-each select="n1:ConversionToBaseUnit">
                                                                    <xsl:for-each select="n1:Formula">
                                                                        <xsl:for-each select="n1:A">
                                                                            <xsl:apply-templates />
                                                                        </xsl:for-each>
                                                                    </xsl:for-each>
                                                                </xsl:for-each>
                                                            </xsl:when>
                                                            <xsl:otherwise>0</xsl:otherwise>
                                                        </xsl:choose>
                                                    </td>
                                                    <td align="center">
                                                        <xsl:choose>
                                                            <xsl:when test="n1:ConversionToBaseUnit/n1:Factor">
                                                                <xsl:for-each select="n1:ConversionToBaseUnit">
                                                                    <xsl:for-each select="n1:Factor">
                                                                        <xsl:apply-templates />
                                                                    </xsl:for-each>
                                                                </xsl:for-each>
                                                            </xsl:when>
                                                            <xsl:when test="n1:ConversionToBaseUnit/n1:Fraction">
                                                                <xsl:for-each select="n1:ConversionToBaseUnit">
                                                                    <xsl:for-each select="n1:Fraction">
                                                                        <xsl:for-each select="n1:Numerator">
                                                                            <xsl:apply-templates />
                                                                        </xsl:for-each>
                                                                    </xsl:for-each>
                                                                </xsl:for-each>
                                                            </xsl:when>
                                                            <xsl:otherwise>
                                                                <xsl:for-each select="n1:ConversionToBaseUnit">
                                                                    <xsl:for-each select="n1:Formula">
                                                                        <xsl:for-each select="n1:B">
                                                                            <xsl:apply-templates />
                                                                        </xsl:for-each>
                                                                    </xsl:for-each>
                                                                </xsl:for-each>
                                                            </xsl:otherwise>
                                                        </xsl:choose>
                                                    </td>
                                                    <td align="center">
                                                        <xsl:choose>
                                                            <xsl:when test="n1:ConversionToBaseUnit/n1:Formula/n1:C  and  n1:ConversionToBaseUnit/n1:Formula/n1:C  != &quot;&quot;">
                                                                <xsl:for-each select="n1:ConversionToBaseUnit">
                                                                    <xsl:for-each select="n1:Formula">
                                                                        <xsl:for-each select="n1:C">
                                                                            <xsl:apply-templates />
                                                                        </xsl:for-each>
                                                                    </xsl:for-each>
                                                                </xsl:for-each>
                                                            </xsl:when>
                                                            <xsl:when test="n1:ConversionToBaseUnit/n1:Fraction">
                                                                <xsl:for-each select="n1:ConversionToBaseUnit">
                                                                    <xsl:for-each select="n1:Fraction">
                                                                        <xsl:for-each select="n1:Denominator">
                                                                            <xsl:apply-templates />
                                                                        </xsl:for-each>
                                                                    </xsl:for-each>
                                                                </xsl:for-each>
                                                            </xsl:when>
                                                            <xsl:otherwise>1</xsl:otherwise>
                                                        </xsl:choose>
                                                    </td>
                                                    <td align="center">
                                                        <xsl:choose>
                                                            <xsl:when test="n1:ConversionToBaseUnit/n1:Formula/n1:D">
                                                                <xsl:for-each select="n1:ConversionToBaseUnit">
                                                                    <xsl:for-each select="n1:Formula">
                                                                        <xsl:for-each select="n1:D">
                                                                            <xsl:apply-templates />
                                                                        </xsl:for-each>
                                                                    </xsl:for-each>
                                                                </xsl:for-each>
                                                            </xsl:when>
                                                            <xsl:otherwise>0</xsl:otherwise>
                                                        </xsl:choose>
                                                    </td>
                                                </tr>
                                              </xsl:if>
                                            </xsl:for-each>
                                        </tbody>
                                    </table>
                            </p>
                        </p>
                        <br />
                    </xsl:for-each>
                </xsl:for-each>
            </body>
        </html>
    </xsl:template>

<xsl:template match="n1:UnitOfMeasure">
  <xsl:value-of select="n1:Name"/>
</xsl:template>

</xsl:stylesheet>
