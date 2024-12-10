<?xml version="1.0" encoding="ISO-8859-1"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">

    <!-- ?????? -->
    <xsl:output method="xml" encoding="ISO-8859-1" indent="yes"/>

    <!-- ????? cinema -->
    <xsl:template match="/cinema">
        <cinema>
            <!-- ??? film ???? -->
            <xsl:for-each select="film">
                <film id="{@id}">
                    <titre><xsl:value-of select="titre" /></titre>
                    <annee><xsl:value-of select="annee" /></annee>
                    <realisateur><xsl:value-of select="realisateur" /></realisateur>
                    <!-- ?? role ?? -->
                    <xsl:apply-templates select="role" />
                </film>
            </xsl:for-each>
        </cinema>
    </xsl:template>

    <!-- ?? role ??????? -->
    <xsl:template match="role" />

    <!-- ????????????? -->
    <xsl:template match="*">
        <xsl:copy>
            <xsl:apply-templates />
        </xsl:copy>
    </xsl:template>

</xsl:stylesheet>