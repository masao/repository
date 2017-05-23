<?xml version="1.0" encoding='UTF-8'?> <xsl:stylesheet version="1.0"  xmlns:xsl="http://www.w3.org/1999/XSL/Transform"   xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#"  xmlns:dc="http://purl.org/dc/elements/1.1/"  xmlns:dcq="http://purl.org/dc/terms/"  xmlns:res="http://dublincore.org/registry/resources/"  xmlns:java="java" ><xsl:output method="xml" indent="yes" encoding="UTF-8"    doctype-system="http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd"    doctype-public="-//W3C//DTD XHTML 1.0 Transitional//EN" /><xsl:include href="banner.xsl"/><xsl:include href="footer.xsl"/>	<xsl:include href="_url_encode.xsl"/><xsl:param name="reqType" select="''"/><xsl:param name="modelSize" select="'0'"/><xsl:param name="uiStyle" select="'std'"/><xsl:param name="uiLang" select="'en-US'"/><xsl:param name="resultsLang" select="'en-US'"/><xsl:param name="item" select="''"/><xsl:param name="property" select="''"/><xsl:param name="objValue" select="''"/><xsl:param name="objLang" select="''"/><xsl:param name="location" select="'administration'"/><xsl:variable name="rdf" select="'http://www.w3.org/1999/02/22-rdf-syntax-ns#'" /><xsl:variable name="rdfs" select="'http://www.w3.org/2000/01/rdf-schema#'"/><xsl:variable name="dc" select="'http://purl.org/dc/elements/1.1/'" /><xsl:variable name="dcq" select="'http://purl.org/dc/terms/'" /><xsl:variable name="dctype" select="'http://purl.org/dc/dcmitype/'" /><xsl:variable name="locale" select="java:util.Locale.new(substring($uiLang,1,2), substring($uiLang,4,2))"/><xsl:variable name="resources" select="java:util.ResourceBundle.getBundle('ui', $locale)"/><xsl:template match="rdf:RDF">	<html>	<head>		<title>The Open Metadata Registry</title>		<link type="text/css" rel="stylesheet" href="/dcregistry/css/default.css" />	</head>	<body>	<xsl:call-template name="banner">				<xsl:with-param name="location" select="$location" />	</xsl:call-template>	<p/>	<table width="100%" cellspacing="0" cellpadding="0" border="1">	<tr><td>		<table width="100%" cellspacing="3" cellpadding="0" border="0">	<tr><td>		<table width="100%" cellspacing="0" cellpadding="3" border="0">		<tr><td width="25%" valign="top" bgcolor="#EEEEEE">	Use this form to manage (update, delete and add) resource.  	<p/>	Select a resource from the list provided to see a list of 	all off the assertions for that resource.  	</td><td width="75%" bgcolor="FFFFFF" valign="top">	<!--	<table width="100%">	<tr><td>	<h4>All Registered Resources</h4>				</td><td align="right">	<h5><xsl:value-of disable-output-escaping='yes' select="java:getString($resources,'items_found')"/>	&#160;	<xsl:value-of select="$modelSize"/></h5>	</td></tr>	</table>	-->		<xsl:apply-templates select="//rdf:Description[@rdf:about='http://dublincore.org/dcregistry/resources/']"/>		</td></tr>	</table>		</td></tr>	</table>		</td></tr>	</table>		<p />[<a href="/dcregistry/adminServlet">Back to Top Page</a>]	<p />	<xsl:call-template name="footer" />	</body>	</html></xsl:template><xsl:template match="rdf:Description[@rdf:about='http://dublincore.org/dcregistry/resources/']">		<p/>	<table width="100%" border="0">			<xsl:for-each select="./*">		<xsl:sort select="@rdf:resource"/>		<xsl:if test="substring(local-name(),1,1)='_'">			<tr>			<xsl:call-template name="print-terms">				<xsl:with-param name="item" select="@rdf:resource"/>			</xsl:call-template>			</tr>		</xsl:if>	</xsl:for-each>		</table>	</xsl:template><xsl:template name="print-terms">	<xsl:param name="item"/>	<xsl:variable name="encoded_item">		<xsl:value-of select="java:net.URLEncoder.encode($item,'UTF8')" />	</xsl:variable>		<td>	<a class="label"><xsl:attribute name="HREF"><xsl:value-of select="concat('/dcregistry/adminResourceManagerServlet?reqType=resource', '&amp;', 'item=', $encoded_item)"/></xsl:attribute>	<xsl:value-of select="$item"/>					</a></td>	</xsl:template></xsl:stylesheet>