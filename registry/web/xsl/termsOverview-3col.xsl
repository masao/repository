<?xml version="1.0" encoding='UTF-8'?> <xsl:stylesheet version="1.0"  xmlns:xsl="http://www.w3.org/1999/XSL/Transform"   xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#"  xmlns:dc="http://purl.org/dc/elements/1.1/"  xmlns:reg="http://dublincore.org/registry/"  xmlns:refInfo="org.dublincore.dcregistry.bean.refinementsBean"  xmlns:java="java" ><xsl:output method="xml" indent="yes" encoding="UTF-8"    doctype-system="http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd"    doctype-public="-//W3C//DTD XHTML 1.0 Transitional//EN" /><xsl:include href="banner.xsl"/><xsl:include href="navbar.xsl"/><xsl:include href="searchForm.xsl"/><xsl:include href="footer.xsl"/><xsl:include href="getShortName.xsl"/><xsl:include href="getHREFLink.xsl"/>	<xsl:include href="_url_encode.xsl"/><xsl:param name="modelSize" select="'0'"/><xsl:param name="reqType" select="'termsOverview'"/><xsl:param name="action" select="'navigate'"/><xsl:param name="uiStyle" select="'std'"/><xsl:param name="uiLang" select="'en-US'"/><xsl:param name="resultsLang" select="'en-US'"/><xsl:param name="detailItem" select="' '"/><xsl:param name="searchTerm" select="''"/><xsl:param name="searchCase" select="'N'"/><xsl:param name="searchType" select="'exact phrase'"/><xsl:param name="location" select="'search'"/><xsl:param name="docRoot"/><xsl:variable name="rdf" select="'http://www.w3.org/1999/02/22-rdf-syntax-ns#'" /><xsl:variable name="rdfs" select="'http://www.w3.org/2000/01/rdf-schema#'"/><xsl:variable name="dc" select="'http://purl.org/dc/elements/1.1/'" /><xsl:variable name="dcq" select="'http://purl.org/dc/terms/'" /><xsl:variable name="dctype" select="'http://purl.org/dc/dcmitype/'" /><xsl:variable name="locale" select="java:util.Locale.new(substring($uiLang,1,2), substring($uiLang,4,2))"/><xsl:variable name="resources" select="java:util.ResourceBundle.getBundle('ui', $locale)"/><xsl:template match="rdf:RDF">	<html>	<head>		<title>The Open Metadata Registry</title>		<link type="text/css" rel="stylesheet" href="/dcregistry/css/default.css" />	</head>	<body>	<xsl:call-template name="banner">				<xsl:with-param name="location" select="$location" />		<xsl:with-param name="action" select="$action" />	</xsl:call-template>		<xsl:call-template name="searchForm">		<xsl:with-param name="action" select="$action" />		<xsl:with-param name="searchTerm" select="$searchTerm" />		<xsl:with-param name="searchCase" select="$searchCase" />		<xsl:with-param name="searchType" select="$searchType" />		<xsl:with-param name="reqType" select="$reqType" />		<xsl:with-param name="uiLang" select="$uiLang" />		<xsl:with-param name="language" select="$resultsLang" />		<xsl:with-param name="uiStyle" select="$uiStyle" />		<xsl:with-param name="docRoot" select="$docRoot" />	</xsl:call-template>		<p/>	<table width="100%">	<tr><td>	<h4><xsl:value-of disable-output-escaping='yes' select="java:getString($resources,'summary_elements')"/></h4>				</td><td align="right">	<h5><xsl:value-of disable-output-escaping='yes' select="java:getString($resources,'items_found')"/>	<xsl:text> </xsl:text>	<xsl:value-of select="$modelSize"/></h5>	</td></tr>	</table>		<xsl:apply-templates select="//rdf:Description[@rdf:about='http://dublincore.org/dcregistry/elements/']"/>		<p />	<xsl:call-template name="footer" />	</body>	</html></xsl:template><xsl:template match="rdf:Description[@rdf:about='http://dublincore.org/dcregistry/elements/']">		<xsl:variable name="item_count">		<xsl:value-of select="count(./*)-1"/>	</xsl:variable>		<p/>	<table width="100%" cellspacing="10" cellpadding="3" border="0">		<xsl:for-each select="*[substring(local-name(),1,1)='_'][position() mod 3 = 1]">		<tr>		<xsl:apply-templates select ="./@rdf:resource | following-sibling::*[position() &lt; 3]/@rdf:resource" />		</tr>	</xsl:for-each>		</table>	</xsl:template><xsl:template match="*/@rdf:resource">	<xsl:variable name="item">		<xsl:value-of select="."/>	</xsl:variable>		<xsl:variable name="encoded_item">		<xsl:value-of select="java:net.URLEncoder.encode($item,'UTF8')" />	</xsl:variable>		<td width="33%" align="left" valign="top">	<a><xsl:attribute name="HREF"><xsl:value-of select="concat('/dcregistry/detailServlet?reqType=detail', '&amp;', 'item=', $encoded_item)"/></xsl:attribute>	<xsl:choose>				<xsl:when test="contains($item, $dc)">			<xsl:choose>				<xsl:when test="string-length($item) > string-length($dc)">					<xsl:value-of select="substring-after($item, $dc)"/>				</xsl:when>				<xsl:otherwise>					<xsl:value-of select="$item"/>								</xsl:otherwise>			</xsl:choose>		</xsl:when>		<xsl:when test="contains($item, $dcq)">			<xsl:choose>				<xsl:when test="string-length($item) > string-length($dcq)">					<xsl:value-of select="substring-after($item, $dcq)"/>				</xsl:when>				<xsl:otherwise>					<xsl:value-of select="$item"/>								</xsl:otherwise>			</xsl:choose>		</xsl:when>		<xsl:when test="contains($item, $dctype)">			<xsl:choose>				<xsl:when test="string-length($item) > string-length($dctype)">					<xsl:value-of select="substring-after($item, $dctype)"/>				</xsl:when>				<xsl:otherwise>					<xsl:value-of select="$item"/>								</xsl:otherwise>			</xsl:choose>		</xsl:when>		<xsl:otherwise>			<xsl:value-of select="$item"/>						</xsl:otherwise>	</xsl:choose>	</a>		<xsl:apply-templates select="refInfo:getRefinements($item, $docRoot)"/>			</td>	</xsl:template><xsl:template match="refinements">	<br/>	<xsl:for-each select="refinement">		<xsl:sort select="."/>				<xsl:variable name="encoded_item">			<xsl:value-of select="java:net.URLEncoder.encode(substring-after(., '*'),'UTF8')" />		</xsl:variable>		<a><xsl:attribute name="HREF"><xsl:value-of select="concat('/dcregistry/detailServlet?reqType=detail', '&amp;', 'item=', $encoded_item)"/></xsl:attribute>		<xsl:value-of select="substring-before(., '*')"/>		</a>&#160;	</xsl:for-each>	</xsl:template></xsl:stylesheet>