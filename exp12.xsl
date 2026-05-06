<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
    <!-- Output as HTML with indentation for readability -->
    <xsl:output method="html" indent="yes" encoding="UTF-8"/>

    <!-- Root template: Match the root element and create HTML structure -->
    <xsl:template match="/">
        <html lang="en">
            <head>
                <meta charset="UTF-8"/>
                <title>Library Books Collection</title>
                <!-- Link to external CSS for styling -->
                <link rel="stylesheet" type="text/css" href="style.css"/>
                <!-- Inline styles for attractive design -->
                <style>
                    body {
                        font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
                        background: linear-gradient(135deg, #667eea 0%, #764ba2 100%);
                        margin: 0;
                        padding: 20px;
                        color: #333;
                    }
                    .container {
                        max-width: 1200px;
                        margin: 0 auto;
                        background: rgba(255, 255, 255, 0.95);
                        padding: 30px;
                        border-radius: 15px;
                        box-shadow: 0 10px 30px rgba(0, 0, 0, 0.2);
                    }
                    h1 {
                        text-align: center;
                        color: #4a5568;
                        margin-bottom: 40px;
                        font-size: 2.5em;
                        text-shadow: 2px 2px 4px rgba(0, 0, 0, 0.1);
                    }
                    .books-grid {
                        display: grid;
                        grid-template-columns: repeat(auto-fit, minmax(300px, 1fr));
                        gap: 20px;
                        margin-bottom: 40px;
                    }
                    .book {
                        background: linear-gradient(145deg, #ffffff, #f7fafc);
                        border: 1px solid #e2e8f0;
                        border-radius: 10px;
                        padding: 20px;
                        box-shadow: 0 4px 6px rgba(0, 0, 0, 0.1);
                        transition: transform 0.3s ease, box-shadow 0.3s ease;
                    }
                    .book:hover {
                        transform: translateY(-5px);
                        box-shadow: 0 8px 15px rgba(0, 0, 0, 0.15);
                    }
                    .book-title {
                        font-size: 1.4em;
                        font-weight: bold;
                        color: #2d3748;
                        margin-bottom: 10px;
                        border-bottom: 2px solid #4299e1;
                        padding-bottom: 5px;
                    }
                    .book-author {
                        font-style: italic;
                        color: #718096;
                        margin-bottom: 8px;
                    }
                    .book-year, .book-genre {
                        color: #4a5568;
                        margin-bottom: 5px;
                    }
                    .back-btn {
                        display: inline-block;
                        padding: 12px 25px;
                        background: linear-gradient(45deg, #4299e1, #3182ce);
                        color: white;
                        text-decoration: none;
                        border-radius: 25px;
                        font-weight: bold;
                        text-align: center;
                        transition: background 0.3s ease, transform 0.3s ease;
                        box-shadow: 0 4px 8px rgba(0, 0, 0, 0.2);
                    }
                    .back-btn:hover {
                        background: linear-gradient(45deg, #3182ce, #2c5282);
                        transform: scale(1.05);
                    }
                </style>
            </head>
            <body>
                <div class="container">
                    <h1>📚 Library Books Collection</h1>
                    <!-- Apply templates to process each book -->
                    <div class="books-grid">
                        <xsl:apply-templates select="library/book"/>
                    </div>
                    <!-- Back button -->
                    <div style="text-align: center;">
                        <a href="index.html" class="back-btn">← Back to Home</a>
                    </div>
                </div>
            </body>
        </html>
    </xsl:template>

    <!-- Template for each book element -->
    <xsl:template match="book">
        <div class="book">
            <div class="book-title">
                <xsl:value-of select="title"/>
            </div>
            <div class="book-author">
                by <xsl:value-of select="author"/>
            </div>
            <div class="book-year">
                Year: <xsl:value-of select="year"/>
            </div>
            <div class="book-genre">
                Genre: <xsl:value-of select="genre"/>
            </div>
        </div>
    </xsl:template>

</xsl:stylesheet>