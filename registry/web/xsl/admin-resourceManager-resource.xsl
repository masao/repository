<?xml version="1.0" encoding='UTF-8'?> <xsl:stylesheet version="1.0"  xmlns:xsl="http://www.w3.org/1999/XSL/Transform"   xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#"  xmlns:dc="http://purl.org/dc/elements/1.1/"  xmlns:dcq="http://purl.org/dc/terms/"  xmlns:res="http://dublincore.org/registry/resources/"  xmlns:java="java" ><xsl:output method="xml" indent="yes" encoding="UTF-8"    doctype-system="http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd"    doctype-public="-//W3C//DTD XHTML 1.0 Transitional//EN" />   <xsl:include href="banner.xsl"/><xsl:include href="footer.xsl"/>	<xsl:include href="_url_encode.xsl"/><xsl:param name="reqType" select="''"/><xsl:param name="modelSize" select="'0'"/><xsl:param name="uiStyle" select="'std'"/><xsl:param name="uiLang" select="'en-US'"/><xsl:param name="resultsLang" select="'en-US'"/><xsl:param name="item" select="''"/><xsl:param name="itemBase" select="''"/><xsl:param name="itemType" select="''"/><xsl:param name="property" select="''"/><xsl:param name="objValue" select="''"/><xsl:param name="objLang" select="''"/><xsl:param name="location" select="'administration'"/><xsl:variable name="rdf" select="'http://www.w3.org/1999/02/22-rdf-syntax-ns#'" /><xsl:variable name="rdfs" select="'http://www.w3.org/2000/01/rdf-schema#'"/><xsl:variable name="dc" select="'http://purl.org/dc/elements/1.1/'" /><xsl:variable name="dcq" select="'http://purl.org/dc/terms/'" /><xsl:variable name="dctype" select="'http://purl.org/dc/dcmitype/'" /><xsl:variable name="locale" select="java:util.Locale.new(substring($uiLang,1,2), substring($uiLang,4,2))"/><xsl:variable name="resources" select="java:util.ResourceBundle.getBundle('ui', $locale)"/><xsl:template match="rdf:RDF">	<html>	<head>		<title>The Open Metadata Registry</title>		<link type="text/css" rel="stylesheet" href="/dcregistry/css/default.css" />	</head>	<body>	<xsl:call-template name="banner">				<xsl:with-param name="action" select="$location" />	</xsl:call-template>	<p/>	<h1>Resource Properties</h1>	<table cellspacing="0" width="50%" class="border">	<xsl:apply-templates select ="rdf:Description" />		</table>		<xsl:variable name="encoded_item">		<xsl:value-of select="java:net.URLEncoder.encode($itemBase,'UTF8')" />	</xsl:variable>		<p/>	[<a><xsl:attribute name="HREF"><xsl:value-of select="concat('/dcregistry/adminCollectionManagerServlet?reqType=detail', '&amp;', 'item=', $encoded_item, '&amp;', 'itemType=', $itemType)"/></xsl:attribute>Back to Previous Page</a>]&#160;&#160;	[<a href="/dcregistry/adminServlet">Back to Top Page</a>]	<p /><xsl:call-template name="footer" />	</body>	</html></xsl:template><xsl:template match="rdf:Description">	<xsl:variable name="res">		<xsl:value-of select="./@rdf:about"/>	</xsl:variable>		<xsl:variable name="encoded_res">		<xsl:value-of select="java:net.URLEncoder.encode($res,'UTF8')" />	</xsl:variable>		<tr>	<th width="75%"><xsl:value-of select="$res"/></th>	<th align="right" width="25%">	<a><xsl:attribute name="HREF"><xsl:value-of select="concat('/dcregistry/adminResourceManagerServlet?reqType=deleteResource', '&amp;', 'item=', $encoded_res)"/></xsl:attribute>	Delete Resource</a>	</th></tr>		<xsl:for-each select="descendant::*">		<xsl:call-template name="print-property-list">			<xsl:with-param name="value" select="."/>			<xsl:with-param name="this_res" select="./@rdf:resource"/>			<xsl:with-param name="lang" select="@xml:lang"/>			<xsl:with-param name="res" select="$res"/>			<xsl:with-param name="nsURI" select="namespace-uri()"/>			<xsl:with-param name="ln" select="local-name()"/>		</xsl:call-template>	</xsl:for-each>		<tr><td colspan="2">	<form action="/dcregistry/adminResourceManagerServlet" method="post">		<input type="hidden" name="item" value="{$res}"/>		<input type="submit" name="reqType" value="Add New Property"/>	</form>	</td></tr>	</xsl:template><xsl:template name="print-property-list">	<xsl:param name="value"/>	<xsl:param name="this_res"/>	<xsl:param name="lang"/>	<xsl:param name="res"/>	<xsl:param name="nsURI"/>	<xsl:param name="ln"/>		<xsl:variable name="encoded_res">		<xsl:value-of select="java:net.URLEncoder.encode($res,'UTF8')" />	</xsl:variable>		<xsl:variable name="encoded_this_res">		<xsl:value-of select="java:net.URLEncoder.encode($this_res,'UTF8')" />	</xsl:variable>		<xsl:variable name="encoded_property">		<xsl:value-of select="java:net.URLEncoder.encode(concat($nsURI, $ln),'UTF8')" />	</xsl:variable>		<tr><td colspan="2">	<a class="label"><xsl:attribute name="HREF"><xsl:value-of select="concat('/dcregistry/adminResourceManagerServlet?reqType=property', '&amp;', 'item=', $encoded_res, '&amp;', 'property=', $encoded_property, '&amp;', 'itemType=', $itemType)"/></xsl:attribute>	<xsl:value-of select="$nsURI"/><xsl:value-of select="$ln"/>			</a></td></tr>	</xsl:template></xsl:stylesheet>