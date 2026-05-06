<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
<xsl:output method="html" indent="yes"/>

<xsl:template match="/">
<html>
<head>
    <title>Students Information</title>
    <link rel="stylesheet" type="text/css" href="style.css"/>
</head>
<body>
    <div class="container">
        <h1>Students Information</h1>
        <xsl:apply-templates select="students"/>
        <div class="back-btn">
            <a href="indexwd.html">← Back</a>
        </div>
    </div>
</body>
</html>
</xsl:template>

<xsl:template match="students">
    <div class="students">
        <xsl:apply-templates select="student"/>
    </div>
</xsl:template>

<xsl:template match="student">
    <div class="student">
        <div class="name"><xsl:value-of select="name"/></div>
        <div class="rollno"><xsl:value-of select="rollno"/></div>
        <div class="course"><xsl:value-of select="course"/></div>
        <div class="city"><xsl:value-of select="city"/></div>
    </div>
</xsl:template>

</xsl:stylesheet>