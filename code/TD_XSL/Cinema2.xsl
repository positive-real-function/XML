<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">

    <!-- 定义输出为XML -->
    <xsl:output method="xml" encoding="UTF-8" indent="yes"/>

    <!-- 匹配根节点 -->
    <xsl:template match="/cinema">
        <cinema>
            <!-- 处理并复制每个 film 元素 -->
            <xsl:for-each select="film">
                <xsl:call-template name="processFilm"/>
                <xsl:text>&#10;</xsl:text>
            </xsl:for-each>
        </cinema>
    </xsl:template>

    <!-- 处理每个 film 元素 -->
    <xsl:template name="processFilm">
        <xsl:variable name="filmId" select="@id"/>
        <film>
            <!-- 复制 film 的所有属性 -->
            <xsl:copy-of select="@*"/>
            <!-- 复制 film 的所有子元素 -->
            <xsl:copy-of select="*"/>

            <!-- 查找并添加与 film 关联的 producteurs 的 nom -->
            <xsl:for-each select="/cinema/producteur[film/@ref = $filmId]">
                <producteur>
                    <xsl:value-of select="nom"/>
                </producteur>
            </xsl:for-each>
        </film>
    </xsl:template>

</xsl:stylesheet>