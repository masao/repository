<?xml version="1.0" encoding='UTF-8'?> <xsl:stylesheet version="1.0"  xmlns:xsl="http://www.w3.org/1999/XSL/Transform"   xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#"  xmlns:rdfs="http://www.w3.org/2000/01/rdf-schema#"  xmlns:dc="http://purl.org/dc/elements/1.1/"  xmlns:dcq="http://purl.org/dc/terms/"  xmlns:res="http://dublincore.org/registry/"  xmlns:java="java" ><xsl:output method="xml" indent="yes" encoding="UTF-8"    doctype-system="http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd"    doctype-public="-//W3C//DTD XHTML 1.0 Transitional//EN" /><xsl:include href="banner.xsl"/><xsl:include href="footer.xsl"/>	<xsl:include href="_url_encode.xsl"/><xsl:param name="reqType" select="''"/><xsl:param name="uiStyle" select="'std'"/><xsl:param name="uiLang" select="'en-US'"/><xsl:param name="resultsLang" select="'en-US'"/><xsl:param name="location" select="'administration'"/><xsl:variable name="rdf" select="'http://www.w3.org/1999/02/22-rdf-syntax-ns#'" /><xsl:variable name="rdfs" select="'http://www.w3.org/2000/01/rdf-schema#'"/><xsl:variable name="dc" select="'http://purl.org/dc/elements/1.1/'" /><xsl:variable name="dcq" select="'http://purl.org/dc/terms/'" /><xsl:variable name="dctype" select="'http://purl.org/dc/dcmitype/'" /><xsl:variable name="locale" select="java:util.Locale.new(substring($uiLang,1,2), substring($uiLang,4,2))"/><xsl:variable name="resources" select="java:util.ResourceBundle.getBundle('ui', $locale)"/><xsl:template match="rdf:RDF">	<html>	<head>		<title>The Open Metadata Registry</title>		<link type="text/css" rel="stylesheet" href="/dcregistry/css/default.css" />	</head>	<body>	<xsl:call-template name="banner">				<xsl:with-param name="action" select="$location" />	</xsl:call-template>	<p/>	<h1>Registered Extensions</h1>	<table cellspacing="0" class="border">		<tr>	<th width="10%" align="left" colspan="2">Type</th>	<th width="15%" align="left" colspan="2">Sort Order</th>	<th width="25%" align="left">Property Value</th>	<th width="25%" align="left">Class Name</th>	<th width="25%" align="left" colspan="3">&#160;</th>	</tr>			<xsl:for-each select="rdf:Description">		<xsl:sort select="./dc:type" order="descending"/>			<xsl:sort select="./res:seqno"/>				<xsl:call-template name="print_extension-info">					<xsl:with-param name="item" select="@rdf:about" />					<xsl:with-param name="type" select="./dc:type" />					<xsl:with-param name="seqno" select="./res:seqno" />					<xsl:with-param name="label" select="./rdfs:label" />					<xsl:with-param name="requires" select="./dcq:requires" />				</xsl:call-template>	</xsl:for-each>		<tr>	<form action="/dcregistry/adminExtensionManagerServlet" method="post">	<td width="5%" align="left"><input size="5" type="text" name="type" value="" /></td>	<td width="5%" align="left">&#160;</td>	<td width="5%" align="left"><input size="5" type="text" name="seqno" value="" /></td>	<td width="10%" align="left">&#160;</td>	<td width="25%" align="left"><input size="25" type="text" name="label" value="" /></td>	<td width="25%" align="left"><input size="25" type="text" name="requires" value="" /></td>	<td width="25%" align="left">	<input name="reqType" value="Add" type="submit" />	</td>	</form></tr>	</table>		<p />[<a href="/dcregistry/adminServlet">Back to Top Page</a>]	<p />	<xsl:call-template name="footer" />	</body>	</html></xsl:template><xsl:template name="print_extension-info">	<xsl:param name="item"/>	<xsl:param name="type"/>	<xsl:param name="seqno"/>	<xsl:param name="label"/>	<xsl:param name="requires"/>		<tr>	<form action="/dcregistry/adminExtensionManagerServlet" method="post">	<td width="5%" align="left"><input size="5" type="text" name="type" value="{$type}" /></td>	<td width="5%" align="left">&#160;</td>	<td width="5%" align="left"><input size="5" type="text" name="seqno" value="{$seqno}" /></td>	<td width="10%" align="left">&#160;</td>	<td width="25%" align="left"><input size="25" type="text" name="label" value="{$label}" /></td>	<td width="25%" align="left"><input size="25" type="text" name="requires" value="{$requires}" /></td>	<td width="25%" align="left">	<input name="reqType" value="Update" type="submit" />&#160;&#160;<input name="reqType" value="Delete" type="submit" />	</td>	<input type="hidden" name="item" value="{$item}" />	<input type="hidden" name="prevType" value="{$type}" />	<input type="hidden" name="prevSeqno" value="{$seqno}" />	<input type="hidden" name="prevLabel" value="{$label}" />	<input type="hidden" name="prevRequires" value="{$requires}" />	</form>	</tr>	</xsl:template></xsl:stylesheet>