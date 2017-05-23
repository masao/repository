<?xml version="1.0" encoding='UTF-8'?> <xsl:stylesheet version="1.0"  xmlns:xsl="http://www.w3.org/1999/XSL/Transform"   xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#"  xmlns:rdfs="http://www.w3.org/2000/01/rdf-schema#"  xmlns:dc="http://purl.org/dc/elements/1.1/"  xmlns:dcq="http://purl.org/dc/terms/"  xmlns:reg="http://dublincore.org/registry#"  xmlns:xinfo="org.dublincore.dcregistry.bean.xinfoBean"  xmlns:java="java" 	exclude-result-prefixes="java rdf rdfs reg dc dcq xinfo"><xsl:output method="xml" indent="yes" encoding="UTF-8"    doctype-system="http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd"    doctype-public="-//W3C//DTD XHTML 1.0 Transitional//EN" /><xsl:include href="banner.xsl"/><xsl:include href="navbar.xsl"/><xsl:include href="searchForm.xsl"/><xsl:include href="footer.xsl"/><xsl:include href="dcLabels.xsl"/><xsl:include href="getShortName.xsl"/><xsl:include href="getHREFLink.xsl"/><xsl:include href="_url_encode.xsl"/><xsl:param name="modelSize" select="'0'"/><xsl:param name="reqType" select="' '"/><xsl:param name="action" select="'navigate'"/><xsl:param name="uiStyle" select="'std'"/><xsl:param name="uiLang" select="'en-US'"/><xsl:param name="resultsLang" select="'en-US'"/><xsl:param name="item" select="' '"/><xsl:param name="node" select="' '"/><xsl:param name="xlang" select="' '"/><xsl:param name="detailItem" select="' '"/><xsl:param name="location" select="'search'"/><xsl:param name="searchTerm" select="' '"/><xsl:param name="searchCase" select="'N'"/><xsl:param name="searchType" select="'exact phrase'"/><xsl:param name="docRoot"/><xsl:variable name="rdf" select="'http://www.w3.org/1999/02/22-rdf-syntax-ns#'" /><xsl:variable name="rdfs" select="'http://www.w3.org/2000/01/rdf-schema#'"/><xsl:variable name="dc" select="'http://purl.org/dc/elements/1.1/'" /><xsl:variable name="dcq" select="'http://purl.org/dc/terms/'" /><xsl:variable name="dctype" select="'http://purl.org/dc/dcmitype/'" /><xsl:variable name="bundle">	<xsl:choose>		<xsl:when test="$uiStyle='rdf'">						<xsl:value-of select="'rdf'"/>							</xsl:when>		<xsl:otherwise>			<xsl:value-of select="'labels'"/>				</xsl:otherwise>	</xsl:choose></xsl:variable><xsl:variable name="locale" select="java:util.Locale.new(substring($uiLang,1,2), substring($uiLang,4,2))"/><xsl:variable name="resources" select="java:util.ResourceBundle.getBundle('ui', $locale)"/><xsl:variable name="label_names" select="java:util.ResourceBundle.getBundle($bundle, $locale)"/> <xsl:template match="rdf:RDF">	<html>	<head>		<title>The Open Metadata Registry</title>		<link type="text/css" rel="stylesheet" href="/dcregistry/css/default.css" />	</head>	<body>		<xsl:call-template name="banner">				<xsl:with-param name="location" select="$location" />		<xsl:with-param name="action" select="$action" />	</xsl:call-template>	<xsl:call-template name="searchForm">		<xsl:with-param name="action" select="$action" />		<xsl:with-param name="searchTerm" select="$searchTerm" />		<xsl:with-param name="searchCase" select="$searchCase" />		<xsl:with-param name="searchType" select="$searchType" />		<xsl:with-param name="reqType" select="$reqType" />		<xsl:with-param name="uiLang" select="$uiLang" />		<xsl:with-param name="language" select="$resultsLang" />		<xsl:with-param name="uiStyle" select="$uiStyle" />		<xsl:with-param name="docRoot" select="$docRoot" />	</xsl:call-template>				<xsl:apply-templates select="rdf:Description"/>		<xsl:if test="$modelSize='0'">		<p/>		No provenance information for this assertion. 		<p/>	</xsl:if>		<p />	<xsl:call-template name="footer" />	</body>	</html></xsl:template><xsl:template match="rdf:Description">	<table cellspacing="0" class="border" width="100%">	<tr><th colspan="2">	<xsl:value-of disable-output-escaping='yes' select="java:getString($resources,'provenance')"/>	&#160;<xsl:value-of select="$xlang"/> translation of:&#160;	<a><xsl:attribute name="href"><xsl:value-of select="$item"/></xsl:attribute>	<xsl:value-of select="$item"/></a>,&#160;	<a><xsl:attribute name="href"><xsl:value-of select="$node"/></xsl:attribute>	<xsl:value-of select="$node"/></a>	</th></tr>		<xsl:for-each select="descendant-or-self::node()">		<xsl:apply-templates select="rdfs:label"/>		<xsl:apply-templates select="rdfs:comment"/>		<xsl:apply-templates select="dc:description"/>		<xsl:apply-templates select="rdfs:isDefinedBy"/>		<xsl:apply-templates select="rdf:type"/>		<xsl:apply-templates select="rdf:value"/>				<xsl:apply-templates select="rdfs:range"/>		<xsl:apply-templates select="rdfs:domain"/>		<xsl:apply-templates select="rdfs:seeAlso"/>		<xsl:apply-templates select="dc:title"/>				<xsl:apply-templates select="dc:creator"/>		<xsl:apply-templates select="dc:contributor"/>			<xsl:apply-templates select="dc:publisher"/>		<xsl:apply-templates select="dc:date"/>			<xsl:apply-templates select="dc:language"/>		<xsl:apply-templates select="dc:relation"/>		<xsl:apply-templates select="dc:subject"/>		<xsl:apply-templates select="dc:type"/>		<xsl:apply-templates select="dc:format"/>		<xsl:apply-templates select="dc:identifier"/>		<xsl:apply-templates select="dc:source"/>		<xsl:apply-templates select="dc:coverage"/>		<xsl:apply-templates select="dc:rights"/>		<xsl:apply-templates select="dcq:abstract"/>		<xsl:apply-templates select="dcq:alternative"/>		<xsl:apply-templates select="dcq:available"/>		<xsl:apply-templates select="dcq:conformsTo"/>		<xsl:apply-templates select="dcq:created"/>		<xsl:apply-templates select="dcq:extent"/>		<xsl:apply-templates select="dcq:hasFormat"/>		<xsl:apply-templates select="dcq:hasPart"/>		<xsl:apply-templates select="dcq:hasVersion"/>		<xsl:apply-templates select="dcq:isFormatOf"/>		<xsl:apply-templates select="dcq:isPartOf"/>		<xsl:apply-templates select="dcq:isReferencedBy"/>		<xsl:apply-templates select="dcq:isReplacedBy"/>		<xsl:apply-templates select="dcq:isRequiredBy"/>		<xsl:apply-templates select="dcq:issued"/>		<xsl:apply-templates select="dcq:isVersionOf"/>		<xsl:apply-templates select="dcq:mediator"/>		<xsl:apply-templates select="dcq:medium"/>		<xsl:apply-templates select="dcq:modified"/>		<xsl:apply-templates select="dcq:references"/>		<xsl:apply-templates select="dcq:replaces"/>		<xsl:apply-templates select="dcq:requires"/>		<xsl:apply-templates select="dcq:spatial"/>		<xsl:apply-templates select="dcq:tableOfContents"/>		<xsl:apply-templates select="dcq:temporal"/>		<xsl:apply-templates select="dcq:valid"/>		<xsl:apply-templates select="rdfs:subPropertyOf"/>		<xsl:apply-templates select="rdfs:subClassOf"/>		<xsl:apply-templates select="reg:superPropertyOf"/>		<xsl:apply-templates select="reg:superClassOf"/>		<xsl:apply-templates select="reg:includes"/>				</xsl:for-each>	</table>	<br /></xsl:template><xsl:template name="print_labels">	<xsl:param name="label"/>	<xsl:param name="uri"/>	<xsl:param name="value"/>	<xsl:param name="xitem"/>	<tr><td width="15%">	<xsl:choose>		<xsl:when test="$uri='http://dublincore.org/registry#superPropertyOf'">				<span>			<xsl:value-of disable-output-escaping='yes' select="$label"/>			</span>			</xsl:when>		<xsl:when test="$uri='http://dublincore.org/registry#superClassOf'">				<span>			<xsl:value-of disable-output-escaping='yes' select="$label"/>			</span>			</xsl:when>		<xsl:when test="$uri='http://dublincore.org/registry#includes'">			<span>				<xsl:value-of disable-output-escaping='yes' select="$label"/>			</span>			</xsl:when>		<xsl:otherwise>			<a>			<xsl:attribute name="href"><xsl:value-of select="$uri"/></xsl:attribute>			<xsl:value-of disable-output-escaping='yes' select="$label"/></a>		</xsl:otherwise>	</xsl:choose>	</td><td width="85%">	<xsl:if test="$value!=''">		<xsl:value-of select="$value"/>	</xsl:if>	<xsl:if test="@rdf:resource">		<xsl:call-template name="print-local-link">			<xsl:with-param name="item" select="@rdf:resource"/>			<xsl:with-param name="uri" select="$uri" />		</xsl:call-template>	</xsl:if>	</td></tr>	</xsl:template><xsl:template name="print-local-link">	<xsl:param name="item"/>	<xsl:param name="uri"/>	<xsl:variable name="shortName">		<xsl:call-template name="getShortName">			<xsl:with-param name="item" select="$item"/>		</xsl:call-template>	</xsl:variable>		<xsl:variable name="HTMLLink">		<xsl:call-template name="getHREFLink">			<xsl:with-param name="item" select="$item"/>		</xsl:call-template>	</xsl:variable>		<a><xsl:attribute name="href"><xsl:value-of select="$HTMLLink"/></xsl:attribute>	<xsl:value-of select="$shortName"/></a>	</xsl:template></xsl:stylesheet>