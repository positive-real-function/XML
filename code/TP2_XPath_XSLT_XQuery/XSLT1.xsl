<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="2.0">

    <xsl:template match="/FILMS">
        <html>
            <head>
                <title>Films par année</title>
            </head>
            <body>
                <h1>Films par année</h1>
                
                <!--annee group  -->
                <xsl:for-each-group select="FILM" group-by="@annee">
                    <xsl:sort select="current-grouping-key()" order="descending" />
                    
                    <h2>Année <xsl:value-of select="current-grouping-key()"/></h2>
                    
                    <!-- des films -->
                    <ul>
                        <xsl:for-each select="current-group()">
                            <li>

                                <i><xsl:value-of select="TITRE"/></i>
                                <!-- realisateur -->
                                (<xsl:value-of select="key('directors', MES/@idref)/ACTPNOM"/>
                                <xsl:text> </xsl:text>
                                <xsl:value-of select="key('directors', MES/@idref)/ACTNOM"/>)
                            </li>
                        </xsl:for-each>
                    </ul>
                </xsl:for-each-group>
            </body>
        </html>
    </xsl:template>
    
    <xsl:key name="directors" match="ARTISTE" use="@id" />
</xsl:stylesheet>