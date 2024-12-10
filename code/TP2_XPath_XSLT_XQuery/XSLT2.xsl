<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="2.0">
    <xsl:template match="/FILMS">
        <FILMS>
            <xsl:apply-templates select="FILM"/>
        </FILMS>
        <ARTISTES>
            <xsl:apply-templates select="ARTISTE"/>
        </ARTISTES>
    </xsl:template>
    
    <xsl:template match="FILM">
        <xsl:copy>
            <xsl:apply-templates select="@*|node() except MES"/>
        </xsl:copy>
        <xsl:text></xsl:text>
    </xsl:template>
    
    <xsl:template match="ARTISTE">
        <xsl:copy>
            <xsl:apply-templates select="@*|node()"/>
         
            <xsl:for-each select="/FILMS/FILM[MES/@idref = current()/@id]">
                <FILM-MES annee="{@annee}">
                    <xsl:value-of select="TITRE"/>
                </FILM-MES>
            </xsl:for-each>
        </xsl:copy>
    </xsl:template>
    
    <xsl:template match="node()|@*">
        <xsl:copy>
            <xsl:apply-templates select="@*|node()"/>
        </xsl:copy>
    </xsl:template>
</xsl:stylesheet>