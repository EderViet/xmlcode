<?xml version="1.0" encoding="utf-8"?>

<!-- Assignment 3 (Task 4 XSLT) by Anh Quoc Viet LE (8310889) -->

<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">

  <xsl:template match="/">

    <html lang="en">
      <head>
        <meta charset="utf-8" />
        <title>DPIT128: Assignment 3 (Task 4 XSLT)</title>
        <style>

          /* BEGIN: Template CSS (DO NOT ALTER/REMOVE) ----------- */

          body {
            background-color: #ededed;
            text-align: center;
          }

          table {
            margin-left: auto;
            margin-right: auto;
          }

          /* END: Template CSS (DO NOT ALTER/REMOVE) ------------- */

          /* INSERT INTERNAL CSS HERE */

          .caption {
            font-size: 20px;
            padding-bottom: 10px;
          }
          table, td, th {
            border: 1px solid #808080;
          }
          th {
            background-color: #b9b9b9;
          }
          th, td {
            padding: 10px;
            font-size: 20px;
          }
          tr:nth-child(even) {
            background-color: #e0e0e0;
          }
          .align-centre {
            text-align: center;
          }
          .negative {
            background-color: #ff9999;
          }
          .middle-rate {
            background-color: #ffdb99;
          }
          .positive {
            background-color: #99cc99;
          }


        </style>
      </head>
      <body>
        <h1>DPIT128: Assignment 3</h1>
        <h2>Anh Quoc Viet LE (8310889)</h2>
        <h3>Date Due: 19/04/2024</h3>
        <hr />
        <p style="font-weight: bold;">
          I have viewed the College&apos;s policy regarding Academic Integrity as provided at the following URL:<br />
          <a href="https://www.uowcollege.edu.au/site-assets/uow-college-australia/documents/policies-and-procedures/16-02-2023-Academic-Integrity-and-Student-Conduct-Policy.pdf" target="_blank">
            https://www.uowcollege.edu.au/site-assets/uow-college-australia/documents/policies-and-procedures/16-02-2023-Academic-Integrity-and-Student-Conduct-Policy.pdf
          </a>
        </p>
        <hr />
        <h2>Task 4 XSLT</h2>

        <!-- BEGIN: Task 4 Solution -->
        <body>

            <xsl:variable name="score-minimum" select="7.5" />
            <xsl:variable name="score-middle" select="8.0" />
            <xsl:variable name="site-URL" select="Hotel Combined">

            <xsl:variable name="date-year" select="substring(comparisons/@dated, 1, 4)" />
            <xsl:variable name="date-month" select="substring(comparisons/@dated, 6, 2)" />
            <xsl:variable name="date-day" select="substring(comparisons/@dated, 9, 2)" />

            <xsl:variable name="formatted-date" select="concat($date-day, '/', $date-month, '/', $date-year)" />


            <table>
                <caption>Search Location: Wollongong</caption>
                <tr>
                    <th>Hotel Name</th>
                    <th>Star Rating</th>
                    <th>Total Reviews</th>
                    <th>Overall Score</th>
                </tr>
                <xsl:for-each select="comparisons/hotel">
            
                    <tr>
                        <td>
                            <xsl:value-of select="name" />
                        </td>
                        <td>
                            <xsl:value-of select="stars" />
                        </td>
                        <td>
                            <xsl:value-of select="reviews" />
                        </td>
                        <td>
                            <xsl:value-of select="score" />
                        </td>    

                        <xsl:choose>

                            <xsl:when test="score &lt; score-minimum"> 
                                <td class="align-centre negative">
                                    <xsl:value-of select="format-number(score, '#,#')">
                                </td>
                            </xsl:when>
                            <xsl:when test="score &lt;= score-minimum">
                                <td class="align-centre middle-rate">
                                    <xsl:value-of select="format-number(score, '#,#')">
                                </td>
                            </xsl:when>
                            <xsl:when test="score &lt; score-middle">
                                <td class="align-centre middle-rate">
                                    <xsl:value-of select="format-number(score, '#,#')">
                                </td>
                            </xsl:when>
                            <xsl:otherwise>
                                <td class="align-centre positive">
                                    <xsl:value-of select="format-number(score, '#,#')">
                                </td>
                            </xsl:otherwise>
                        </xsl:choose>
                    </tr>   
                </xsl:for-each>         
            </table>
        <h3>This information was obtained from <a href="{$site_URL}" target="_blank"><xsl:value-of select="$site-URL" /></a> on <xsl:value-of select="$formatted-date" /></h3>



        <!-- END: Task 4 Solution -->

        <p>&#169; Anh Quoc Viet LE</p>
      </body>
    </html>

  </xsl:template>

</xsl:stylesheet>