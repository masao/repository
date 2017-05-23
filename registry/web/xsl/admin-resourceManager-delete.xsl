<?xml version="1.0" encoding='UTF-8'?> <xsl:stylesheet version="1.0"  xmlns:xsl="http://www.w3.org/1999/XSL/Transform"   xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#"  xmlns:dc="http://purl.org/dc/elements/1.1/"  xmlns:dcq="http://purl.org/dc/terms/"  xmlns:res="http://dublincore.org/registry/resources/"  xmlns:java="java" ><xsl:output method="xml" indent="yes" encoding="UTF-8"    doctype-system="http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd"    doctype-public="-//W3C//DTD XHTML 1.0 Transitional//EN" /> <xsl:include href="banner.xsl"/><xsl:include href="footer.xsl"/>	<xsl:include href="_url_encode.xsl"/><xsl:param name="reqType" select="''"/><xsl:param name="modelSize" select="'0'"/><xsl:param name="uiStyle" select="'std'"/><xsl:param name="uiLang" select="'en-US'"/><xsl:param name="resultsLang" select="'en-US'"/><xsl:param name="item" select="''"/><xsl:param name="property" select="''"/><xsl:param name="objValue" select="''"/><xsl:param name="objLang" select="''"/><xsl:param name="location" select="'administration'"/><xsl:variable name="rdf" select="'http://www.w3.org/1999/02/22-rdf-syntax-ns#'" /><xsl:variable name="rdfs" select="'http://www.w3.org/2000/01/rdf-schema#'"/><xsl:variable name="dc" select="'http://purl.org/dc/elements/1.1/'" /><xsl:variable name="dcq" select="'http://purl.org/dc/terms/'" /><xsl:variable name="dctype" select="'http://purl.org/dc/dcmitype/'" /><xsl:variable name="locale" select="java:util.Locale.new(substring($uiLang,1,2), substring($uiLang,4,2))"/><xsl:variable name="resources" select="java:util.ResourceBundle.getBundle('ui', $locale)"/><xsl:template match="rdf:RDF">	<html>	<head>		<title>The Open Metadata Registry</title>		<link type="text/css" rel="stylesheet" href="/dcregistry/css/default.css" />	</head>	<body>	<xsl:call-template name="banner">				<xsl:with-param name="action" select="$location" />	</xsl:call-template>	<p/>	<h1>Delete Assertion</h1>	<table cellspacing="0" class="border">		<xsl:apply-templates select ="rdf:Description" />		</table>		<xsl:variable name="encoded_item">		<xsl:value-of select="java:net.URLEncoder.encode($item,'UTF8')" />	</xsl:variable>		<xsl:variable name="encoded_property">		<xsl:value-of select="java:net.URLEncoder.encode($property,'UTF8')" />	</xsl:variable>		<p/>[<a><xsl:attribute name="HREF"><xsl:value-of select="concat('/dcregistry/adminResourceManagerServlet?reqType=property', '&amp;', 'item=', $encoded_item, '&amp;', 'property=', $encoded_property)"/></xsl:attribute>Back to Previous Page</a>]&#160;&#160;	[<a href="/dcregistry/adminServlet">Back to Top Page</a>]	<p/><xsl:call-template name="footer" />	</body>	</html></xsl:template><xsl:template match="rdf:Description">	<xsl:variable name="res">		<xsl:value-of select="./@rdf:about"/>	</xsl:variable>	<form action="/dcregistry/adminResourceManagerServlet" method="post">	<tr><th style="text-align:right;">Subject</th>	<td>	<xsl:value-of select="$res"/>	</td></tr>	<xsl:for-each select="descendant::*">		<tr><th style="text-align:right;">Predicate</th>		<td>		<xsl:value-of select="$property"/>		</td></tr>				<tr><th style="text-align:right;">Object</th>		<td>		<xsl:choose>			<xsl:when test="@rdf:resource">				<xsl:value-of select="@rdf:resource"/>			</xsl:when>			<xsl:otherwise>				<xsl:value-of select="."/>			</xsl:otherwise>		</xsl:choose>		</td></tr>	</xsl:for-each>	<tr><th style="text-align:right;">&#160;</th>	<td>	<input name="reqType" value="Confirm Delete" type="submit" />&#160;&#160;<input name="reqType" value="Cancel" type="submit" />	</td></tr>	<input type="hidden" name="item" value="{$res}" />	<input type="hidden" name="property" value="{$property}" />	<input type="hidden" name="objValue" value="{$objValue}" />	<input type="hidden" name="objLang" value="{$objLang}" />	</form>	</xsl:template></xsl:stylesheet>