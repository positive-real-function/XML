<?xml version="1.0" encoding="iso-8859-1"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">

    <!-- Match the root element of the XML document -->
    <xsl:template match="/cinema">
        <html>
            <head>
                <title>Cinema</title>
            </head>
            <body>
                <h1>Liste de films</h1>

                <!-- Iterate through each film element -->
                <xsl:for-each select="film">
                    <div>
                        <!-- Output the film title -->
                        <h2><xsl:value-of select="titre"/></h2>
                        <p><strong>Année:</strong> <xsl:value-of select="annee"/></p>
                        <p><strong>Réalisateur:</strong> <xsl:value-of select="realisateur"/></p>
                        <p><strong>Type:</strong> <xsl:value-of select="@type"/></p>

                        <!-- Display the cast in a sublist -->
                        <ul>
                            <xsl:for-each select="role">
                                <li>
                                    <strong><xsl:value-of select="nom"/>:</strong> <xsl:value-of select="acteur"/>
                                </li>
                            </xsl:for-each>
                        </ul>

                        <!-- Display the producer(s) -->
                        <xsl:for-each select="/cinema/producteur[film/@ref = @id]">
                            <p><strong>Producteur:</strong> <xsl:value-of select="nom"/></p>
                        </xsl:for-each>

                        <hr/>
                    </div>
                </xsl:for-each>
            </body>
        </html>
    </xsl:template>

</xsl:stylesheet>