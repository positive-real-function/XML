<?xml version="1.0" encoding="iso-8859-1"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">

    <!-- 定义输出为HTML -->
    <xsl:output method="html" encoding="UTF-8" indent="yes"/>

    <!-- 匹配根节点 -->
    <xsl:template match="/">
        <html>
            <head>
                <title>Cinema</title>
            </head>
            <body>
                <h1>Liste de films</h1>
                <ul>
                    <!-- 匹配每一个 film 元素 -->
                    <xsl:for-each select="cinema/film">
                        <li>
                            <!-- 电影标题加粗 -->
                            <strong>
                                <xsl:value-of select="titre"/>
                            </strong>
                            ,
                            <xsl:value-of select="annee"/>
                            ,
                            <xsl:value-of select="@type"/>
                            , réalisé par
                            <xsl:value-of select="realisateur"/>

                            <!-- 角色列表 -->
                            <ul>
                                <xsl:for-each select="role">
                                    <li>
                                        <xsl:value-of select="nom"/> :
                                        <xsl:value-of select="acteur"/>
                                    </li>
                                </xsl:for-each>
                            </ul>
                        </li>
                    </xsl:for-each>
                </ul>
            </body>
        </html>
    </xsl:template>

</xsl:stylesheet>