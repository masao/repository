<?xml version="1.0" encoding='UTF-8'?>
 
<xsl:stylesheet version="1.0"
  xmlns:xsl="http://www.w3.org/1999/XSL/Transform" 
  xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#"
  xmlns:rdfs="http://www.w3.org/2000/01/rdf-schema#"
  xmlns:reg="http://dublincore.org/Registry#"
  xmlns:dc="http://purl.org/dc/elements/1.1/"
  xmlns:dcq="http://purl.org/dc/terms/"
  xmlns:langInfo="org.dublincore.dcregistry.bean.languageBean"
  xmlns:java="java" 
  exclude-result-prefixes="java rdf rdfs reg dc dcq langInfo">

<xsl:output method="html" indent="yes" encoding="UTF-8"
    doctype-system="http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd"
    doctype-public="-//W3C//DTD XHTML 1.0 Transitional//EN" />


<xsl:include href="banner.xsl"/>
<xsl:include href="navbar.xsl"/>
<xsl:include href="preferenceForm.xsl"/> <!-- main -->
<xsl:include href="footer.xsl"/>
<xsl:include href="_url_encode.xsl"/>
<xsl:include href="admin-common.xsl"/>

<xsl:param name="uiStyle" select="'std'"/>
<xsl:param name="uiLang" select="'en_US'"/>
<xsl:param name="resultsLang" select="'en_US'"/>
<xsl:param name="location" select="'administration'"/>
<xsl:param name="itemType" select="'unknown'"/>
<!-- <xsl:param name="reqType" select="' '"/> -->
<xsl:param name="sid" select="''"/>
<xsl:param name="docRoot"/>

<xsl:variable name="ui" select="'ui'"/>

<xsl:variable name="rdf" select="'http://www.w3.org/1999/02/22-rdf-syntax-ns#'" />
<xsl:variable name="rdfs" select="'http://www.w3.org/2000/01/rdf-schema#'"/>
<xsl:variable name="service" select="'/registry/preferenceServlet'"/>

<xsl:variable name="admin" select="'/dcregistry/adminServlet'"/>

<xsl:variable name="bundle">
    <xsl:choose>
	<xsl:when test="$uiStyle='rdf'">
	    <xsl:value-of select="'rdf'"/>
	</xsl:when>
	<xsl:otherwise>
	    <xsl:value-of select="'labels'"/>
	</xsl:otherwise>
    </xsl:choose>
</xsl:variable>

<xsl:variable name="locale" select="java:util.Locale.new(substring($uiLang,1,2), substring($uiLang,4,2))"/>
<xsl:variable name="resources" select="java:util.ResourceBundle.getBundle('ui', $locale)"/>
<xsl:variable name="label_names" select="java:util.ResourceBundle.getBundle($bundle, $locale)"/>

<xsl:template match="/">
    <html>
    <head>
	<title>The Open Metadata Registry</title>
	<link type="text/css" rel="stylesheet" href="/dcregistry/css/default.css" />
    </head>	
    <body>

	<xsl:call-template name="banner">		
		<xsl:with-param name="location" select="$location" />
	</xsl:call-template>
	
	<p/>
	
	<h3>Edit: <xsl:value-of select="rdf:RDF/rdf:Description/@rdf:about"/></h3>

	<!-- <xsl:apply-templates select="*"/> -->
	<xsl:call-template name="printAddForm">
	    <xsl:with-param name="itemType" select="$itemType"/>
	</xsl:call-template>

	<p/>

	<!--
	<xsl:choose>
	    <xsl:when test="$itemType = 'property'">
	     [<a>
		<xsl:attribute name="href"><xsl:value-of select="$admin"/>?reqType=detail&amp;itemType=term&amp;item=<xsl:call-template name="_url_encode"><xsl:with-param name="url" select="rdf:RDF/rdf:Description/@rdf:about"/></xsl:call-template></xsl:attribute>
		Back to the Term
	    </a>]
	    </xsl:when>
	</xsl:choose>
	-->
	[<a href="JavaScript:history.back()">Back to Previous Page</a>]

	[<a href="{$admin}">Back to Top Page</a>]

	<p />
	<xsl:call-template name="footer" />
	
	</body>
	</html>

</xsl:template>

<xsl:template name="printAddForm">
    <xsl:param name="itemType"/>

    <!--
	'target_element' variable is only used for 'property'.
	'target_element' must be ignored in the case of collection and term.
	I know this processing is so sneaky...
    -->
    <xsl:variable name="target_element" select="rdf:RDF/rdf:Description/*[position()=1]"/>

    <form method="post" action="{$admin}">
	<!--
	    common parameters.
	-->
	<input type="hidden" name="uiStyle"     value="{$uiStyle}"/>
	<input type="hidden" name="uiLang"      value="{$uiLang}"/>
	<input type="hidden" name="resultsLang" value="{$resultsLang}"/>
	<input type="hidden" name="itemType"    value="{$itemType}"/>
	<input type="hidden" name="reqType"     value="insert"/>
	<input type="hidden" name="sid"         value="{$sid}"/>
	<table>
	<xsl:choose>
	    <xsl:when test="$itemType = 'collection'"> <!-- collection -->
		collection (under construction)
	    </xsl:when>
	    <xsl:when test="$itemType = 'term'"> <!-- term / scheme -->
		term / scheme (under construction)
	    </xsl:when>
	    <xsl:when test="$itemType = 'property'"> <!-- property -->
		<tr>
		    <td>Property Name: </td>
		    <td>
			<input name="item" type="hidden" value="{rdf:RDF/rdf:Description/@rdf:about}" />
			<input name="predicate" type="hidden">
			    <xsl:attribute name="value">
				<xsl:call-template name="get-predicate"/>
			    </xsl:attribute>
			</input>
			<xsl:apply-templates select="rdf:RDF/rdf:Description/*"/>
		    </td>
		</tr>
		<tr>
		    <td>Value: </td>
		    <td>
			<xsl:choose>
			    <xsl:when test="concat(namespace-uri($target_element),local-name($target_element)) = 'http://purl.org/dc/elements/1.1/language'"> <!-- case of language -->
				<select name="new_value">
				<xsl:apply-templates select="langInfo:getLanguages($ui, $docRoot)"/>
				</select>
			    </xsl:when>
			    <xsl:otherwise>
				<input name="new_value" size="80">
				    <xsl:attribute name="value">
					<xsl:choose>
					    <xsl:when test="$target_element/@rdf:resource">
						<xsl:value-of select="$target_element/@rdf:resource"/>
					    </xsl:when>
					    <xsl:otherwise>
						<xsl:value-of select="$target_element"/>
					    </xsl:otherwise>
					</xsl:choose>
				    </xsl:attribute>
				</input>
			    </xsl:otherwise>
			</xsl:choose>
		    </td>
		</tr>
		<tr>
		    <td>Language(xml:lang): </td>
		    <td>
			<select name="dc_language">
			    <xsl:choose>
				<xsl:when test="$target_element/@rdf:resource">
				    <xsl:apply-templates select="langInfo:getLanguages($ui, $docRoot)" />
				</xsl:when>
				<xsl:otherwise>
				    <xsl:apply-templates select="langInfo:getLanguages($ui, $docRoot)">
					<xsl:with-param name="default_lang" select="$target_element/@xml:lang"/>
				    </xsl:apply-templates>
				</xsl:otherwise>
			    </xsl:choose>
			</select>
		    </td>
		</tr>
		<tr>
		    <td>Type of the Property: </td>
		    <td>
			<xsl:choose>
			    <xsl:when test="$target_element/@rdf:resource">
				<input name="dc_type" type="radio" value="literal"/>Literal
				<input name="dc_type" type="radio" value="resource" checked="checked"/>Resource
			    </xsl:when>
			    <xsl:otherwise>
				<input name="dc_type" type="radio" value="literal" checked="checked" />Literal
				<input name="dc_type" type="radio" value="resource"/>Resource
			    </xsl:otherwise>
			</xsl:choose>
		    </td>
		</tr>
	    </xsl:when>
	    <xsl:otherwise>
		otherwise (under construction)
	    </xsl:otherwise>
	</xsl:choose>
	</table>
	<div>
	    <input type="submit" value="Modify"/>
	    <input type="reset"/>
	</div>
    </form>
</xsl:template>

<xsl:template name="get-predicate">
    <xsl:variable name="node" select="rdf:RDF/rdf:Description/*[position()=1]"/>
    <xsl:value-of select="concat(namespace-uri($node), local-name($node))"/>
</xsl:template>

<xsl:template match="rdf:*">
    <xsl:value-of
	disable-output-escaping='yes'
	select="java:getString($label_names,concat('rdf_',local-name()))"
    />
</xsl:template>

<xsl:template match="rdfs:*">
    <xsl:value-of
	disable-output-escaping='yes'
	select="java:getString($label_names,concat('rdfs_',local-name()))"
    />
</xsl:template>

<xsl:template match="dc:*">
    <xsl:value-of
	disable-output-escaping='yes'
	select="java:getString($label_names,concat('dc_',local-name()))"
    />
</xsl:template>

<xsl:template match="dcq:*">
    <xsl:value-of
	disable-output-escaping='yes'
	select="java:getString($label_names,concat('dcq_',local-name()))"
    />
</xsl:template>

<xsl:template match="*">
    <b>
	<xsl:value-of select="."/>
    </b>
    <br />	
</xsl:template>

</xsl:stylesheet>
