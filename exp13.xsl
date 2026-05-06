<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
    <!-- Output as HTML -->
    <xsl:output method="html" indent="yes" encoding="UTF-8"/>

    <!-- Root template -->
    <xsl:template match="/">
        <html lang="en">
            <head>
                <meta charset="UTF-8"/>
                <title>Library Catalog</title>
                <link rel="stylesheet" type="text/css" href="style.css"/>
                <style>
                    body {
                        font-family: Arial, sans-serif;
                        background: #f4f4f4;
                        margin: 0;
                        padding: 20px;
                    }
                    .container {
                        max-width: 1000px;
                        margin: 0 auto;
                        background: white;
                        padding: 20px;
                        border-radius: 8px;
                        box-shadow: 0 0 10px rgba(0,0,0,0.1);
                    }
                    h1 {
                        text-align: center;
                        color: #333;
                    }
                    .book {
                        border: 1px solid #ddd;
                        margin: 10px 0;
                        padding: 15px;
                        border-radius: 5px;
                        background: #fafafa;
                    }
                    .book.fiction {
                        background: #e8f5e8;
                        border-color: #4caf50;
                    }
                    .book.dystopian {
                        background: #fff3e0;
                        border-color: #ff9800;
                    }
                    .book.romance {
                        background: #fce4ec;
                        border-color: #e91e63;
                    }
                    .title {
                        font-size: 1.2em;
                        font-weight: bold;
                        color: #2c3e50;
                    }
                    .author {
                        font-style: italic;
                        color: #555;
                    }
                    .year {
                        color: #777;
                    }
                    .genre {
                        font-weight: bold;
                        text-transform: uppercase;
                        font-size: 0.9em;
                    }
                    .fiction { color: #4caf50; }
                    .dystopian { color: #ff9800; }
                    .romance { color: #e91e63; }
                    .summary {
                        margin-top: 30px;
                        padding: 15px;
                        background: #e3f2fd;
                        border-radius: 5px;
                    }
                    .back-btn {
                        display: inline-block;
                        padding: 10px 20px;
                        background: #3498db;
                        color: white;
                        text-decoration: none;
                        border-radius: 5px;
                        margin-top: 20px;
                    }
                    .back-btn:hover {
                        background: #2980b9;
                    }
                </style>
            </head>
            <body>
                <div class="container">
                    <h1>📚 Library Catalog</h1>

                    <!-- Conditional: Show summary if there are classic books -->
                    <xsl:if test="count(library/book[year &lt; 1950]) > 0">
                        <div class="summary">
                            <h3>Classic Literature</h3>
                            <p>We have <xsl:value-of select="count(library/book[year &lt; 1950])"/> classic books published before 1950!</p>
                        </div>
                    </xsl:if>

                    <!-- Loop through books -->
                    <xsl:for-each select="library/book">
                        <div class="book">
                            <!-- Conditional class based on genre -->
                            <xsl:attribute name="class">
                                book
                                <xsl:if test="genre='Fiction'"> fiction</xsl:if>
                                <xsl:if test="genre='Dystopian'"> dystopian</xsl:if>
                                <xsl:if test="genre='Romance'"> romance</xsl:if>
                            </xsl:attribute>

                            <div class="title"><xsl:value-of select="title"/></div>
                            <div class="author">by <xsl:value-of select="author"/></div>
                            <div class="year">Published: <xsl:value-of select="year"/></div>
                            <div class="genre">
                                Genre:
                                <span>
                                    <xsl:attribute name="class">
                                        <xsl:value-of select="translate(genre, 'ABCDEFGHIJKLMNOPQRSTUVWXYZ', 'abcdefghijklmnopqrstuvwxyz')"/>
                                    </xsl:attribute>
                                    <xsl:value-of select="genre"/>
                                </span>
                                <!-- Conditional message based on genre -->
                                <xsl:if test="genre='Fiction'"> - Classic Fiction</xsl:if>
                                <xsl:if test="genre='Dystopian'"> - Thought-Provoking</xsl:if>
                                <xsl:if test="genre='Romance'"> - Heartwarming</xsl:if>
                            </div>

                            <!-- Conditional: Highlight old books -->
                            <xsl:if test="year &lt; 1900">
                                <div style="color: #8b4513; font-style: italic;">📜 Vintage Classic</div>
                            </xsl:if>

                            <!-- Conditional: Highlight modern books -->
                            <xsl:if test="year &gt; 2000">
                                <div style="background: #f0f8ff; padding: 5px; margin-top: 5px; border-radius: 3px;">
                                    🆕 Modern Literature
                                </div>
                            </xsl:if>
                        </div>
                    </xsl:for-each>

                    <!-- Conditional: Show total count -->
                    <div class="summary">
                        <p>Total Books: <xsl:value-of select="count(library/book)"/></p>
                        <p>Fiction Books: <xsl:value-of select="count(library/book[genre='Fiction'])"/></p>
                        <p>Books Published Before 1950: <xsl:value-of select="count(library/book[year &lt; 1950])"/></p>
                    </div>

                    <div style="text-align: center;">
                        <a href="index.html" class="back-btn">← Back</a>
                    </div>
                </div>
            </body>
        </html>
    </xsl:template>

</xsl:stylesheet>