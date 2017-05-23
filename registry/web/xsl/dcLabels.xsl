<?xml version='1.0' encoding='UTF-8'?>
 
<xsl:stylesheet version="1.0"	
	xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
	xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#"
	xmlns:rdfs="http://www.w3.org/2000/01/rdf-schema#"
	xmlns:dc="http://purl.org/dc/elements/1.1/"
	xmlns:dcq="http://purl.org/dc/terms/"
	xmlns:reg="http://dublincore.org/registry/"
        xmlns:cores="http://www.cores-eu.net/registry/reg/"
	xmlns:java="java" >


<xsl:template match="rdf:type">
	<xsl:call-template name="print_labels">
		<xsl:with-param name="label" select="java:getString($label_names,'rdf_type')" />
		<xsl:with-param name="uri" select="concat(namespace-uri(), local-name())" />
		<xsl:with-param name="value" select="." />
		<xsl:with-param name="xitem" select="../@rdf:about"/>
	</xsl:call-template>
</xsl:template>

<xsl:template match="rdf:value">
	<xsl:call-template name="print_labels">
		<xsl:with-param name="label" select="java:getString($label_names,'rdf_value')" />
		<xsl:with-param name="uri" select="concat(namespace-uri(), local-name())" />
		<xsl:with-param name="value" select="." />
		<xsl:with-param name="xitem" select="../@rdf:about"/>
	</xsl:call-template>
</xsl:template>

<xsl:template match="rdfs:label">
	<xsl:call-template name="print_labels">
		<xsl:with-param name="label" select="java:getString($label_names,'rdfs_label')" />
		<xsl:with-param name="uri" select="concat(namespace-uri(), local-name())" />
		<xsl:with-param name="value" select="." />
		<xsl:with-param name="xitem" select="../@rdf:about"/>
	</xsl:call-template>
</xsl:template>

<xsl:template match="rdfs:comment">
	<xsl:call-template name="print_labels">
		<xsl:with-param name="label" select="java:getString($label_names,'rdfs_comment')" />
		<xsl:with-param name="uri" select="concat(namespace-uri(), local-name())" />
		<xsl:with-param name="value" select="." />
		<xsl:with-param name="xitem" select="../@rdf:about"/>
	</xsl:call-template>
</xsl:template>


<xsl:template match="rdfs:isDefinedBy">
	<xsl:call-template name="print_labels">
		<xsl:with-param name="label" select="java:getString($label_names,'rdfs_isDefinedBy')" />
		<xsl:with-param name="uri" select="concat(namespace-uri(), local-name())" />
		<xsl:with-param name="value" select="." />
		<xsl:with-param name="xitem" select="../@rdf:about"/>
	</xsl:call-template>
</xsl:template>

<xsl:template match="rdfs:range">
	<xsl:call-template name="print_labels">
		<xsl:with-param name="label" select="java:getString($label_names,'rdfs_range')" />
		<xsl:with-param name="uri" select="concat(namespace-uri(), local-name())" />
		<xsl:with-param name="value" select="." />
		<xsl:with-param name="xitem" select="../@rdf:about"/>
	</xsl:call-template>
</xsl:template>

<xsl:template match="rdfs:subPropertyOf">
	<xsl:call-template name="print_labels">
		<xsl:with-param name="label" select="java:getString($label_names,'rdfs_subPropertyOf')" />
		<xsl:with-param name="uri" select="concat(namespace-uri(), local-name())" />
		<xsl:with-param name="value" select="." />
		<xsl:with-param name="xitem" select="../@rdf:about"/>
	</xsl:call-template>
</xsl:template>

<xsl:template match="rdfs:subClassOf">
	<xsl:call-template name="print_labels">
		<xsl:with-param name="label" select="java:getString($label_names,'rdfs_subClassOf')" />
		<xsl:with-param name="uri" select="concat(namespace-uri(), local-name())" />
		<xsl:with-param name="value" select="." />
		<xsl:with-param name="xitem" select="../@rdf:about"/>
	</xsl:call-template>
</xsl:template>

<xsl:template match="rdfs:domain">
	<xsl:call-template name="print_labels">
		<xsl:with-param name="label" select="java:getString($label_names,'rdfs_domain')" />
		<xsl:with-param name="uri" select="concat(namespace-uri(), local-name())" />
		<xsl:with-param name="value" select="." />
		<xsl:with-param name="xitem" select="../@rdf:about"/>
	</xsl:call-template>
</xsl:template>

<xsl:template match="rdfs:seeAlso">
	<xsl:call-template name="print_labels">
		<xsl:with-param name="label" select="java:getString($label_names,'rdfs_seeAlso')" />
		<xsl:with-param name="uri" select="concat(namespace-uri(), local-name())" />
		<xsl:with-param name="value" select="." />
		<xsl:with-param name="xitem" select="../@rdf:about"/>
	</xsl:call-template>
</xsl:template>


<xsl:template match="dc:title">
	<xsl:call-template name="print_labels">
		<xsl:with-param name="label" select="java:getString($label_names,'dc_title')"/>
		<xsl:with-param name="uri" select="concat(namespace-uri(), local-name())" />
		<xsl:with-param name="value" select="." />
		<xsl:with-param name="xitem" select="../@rdf:about"/>
	</xsl:call-template>
</xsl:template>

<xsl:template match="dc:description">
	<xsl:call-template name="print_labels">
		<xsl:with-param name="label" select="java:getString($label_names,'dc_description')" />
		<xsl:with-param name="uri" select="concat(namespace-uri(), local-name())" />
		<xsl:with-param name="value" select="." />
		<xsl:with-param name="xitem" select="../@rdf:about"/>
	</xsl:call-template>
</xsl:template>

<xsl:template match="dc:creator">
	<xsl:call-template name="print_labels">
		<xsl:with-param name="label" select="java:getString($label_names,'dc_creator')" />
		<xsl:with-param name="uri" select="concat(namespace-uri(), local-name())" />
		<xsl:with-param name="value" select="." />
		<xsl:with-param name="xitem" select="../@rdf:about"/>
	</xsl:call-template>
</xsl:template>

<xsl:template match="dc:contributor">
	<xsl:call-template name="print_labels">
		<xsl:with-param name="label" select="java:getString($label_names,'dc_contributor')" />
		<xsl:with-param name="uri" select="concat(namespace-uri(), local-name())" />
		<xsl:with-param name="value" select="." />
		<xsl:with-param name="xitem" select="../@rdf:about"/>
	</xsl:call-template>
</xsl:template>

<xsl:template match="dc:publisher">
	<xsl:call-template name="print_labels">
		<xsl:with-param name="label" select="java:getString($label_names,'dc_publisher')" />
		<xsl:with-param name="uri" select="concat(namespace-uri(), local-name())" />
		<xsl:with-param name="value" select="." />
		<xsl:with-param name="xitem" select="../@rdf:about"/>
	</xsl:call-template>
</xsl:template>

<xsl:template match="dc:date">
	<xsl:call-template name="print_labels">
		<xsl:with-param name="label" select="java:getString($label_names,'dc_date')" />
		<xsl:with-param name="uri" select="concat(namespace-uri(), local-name())" />
		<xsl:with-param name="value" select="." />
		<xsl:with-param name="xitem" select="../@rdf:about"/>
	</xsl:call-template>
</xsl:template>

<xsl:template match="dc:language">
	<xsl:call-template name="print_labels">
		<xsl:with-param name="label" select="java:getString($label_names,'dc_language')" />
		<xsl:with-param name="uri" select="concat(namespace-uri(), local-name())" />
		<xsl:with-param name="value" select="." />
		<xsl:with-param name="xitem" select="../@rdf:about"/>
	</xsl:call-template>
</xsl:template>

<xsl:template match="dc:relation">
	<xsl:call-template name="print_labels">
		<xsl:with-param name="label" select="java:getString($label_names,'dc_relation')" />
		<xsl:with-param name="uri" select="concat(namespace-uri(), local-name())" />
		<xsl:with-param name="value" select="." />
		<xsl:with-param name="xitem" select="../@rdf:about"/>
	</xsl:call-template>
</xsl:template>

<xsl:template match="dc:subject">
	<xsl:call-template name="print_labels">
		<xsl:with-param name="label" select="java:getString($label_names,'dc_subject')" />
		<xsl:with-param name="uri" select="concat(namespace-uri(), local-name())" />
		<xsl:with-param name="value" select="." />
		<xsl:with-param name="xitem" select="../@rdf:about"/>
	</xsl:call-template>
</xsl:template>

<xsl:template match="dc:type">
	<xsl:call-template name="print_labels">
		<xsl:with-param name="label" select="java:getString($label_names,'dc_type')" />
		<xsl:with-param name="uri" select="concat(namespace-uri(), local-name())" />
		<xsl:with-param name="value" select="." />
		<xsl:with-param name="xitem" select="../@rdf:about"/>
	</xsl:call-template>
</xsl:template>

<xsl:template match="dc:format">
	<xsl:call-template name="print_labels">
		<xsl:with-param name="label" select="java:getString($label_names,'dc_format')" />
		<xsl:with-param name="uri" select="concat(namespace-uri(), local-name())" />
		<xsl:with-param name="value" select="." />
		<xsl:with-param name="xitem" select="../@rdf:about"/>
	</xsl:call-template>
</xsl:template>

<xsl:template match="dc:identifier">
	<xsl:call-template name="print_labels">
		<xsl:with-param name="label" select="java:getString($label_names,'dc_identifier')" />
		<xsl:with-param name="uri" select="concat(namespace-uri(), local-name())" />
		<xsl:with-param name="value" select="." />
		<xsl:with-param name="xitem" select="../@rdf:about"/>
	</xsl:call-template>
</xsl:template>

<xsl:template match="dc:source">
	<xsl:call-template name="print_labels">
		<xsl:with-param name="label" select="java:getString($label_names,'dc_source')" />
		<xsl:with-param name="uri" select="concat(namespace-uri(), local-name())" />
		<xsl:with-param name="value" select="." />
		<xsl:with-param name="xitem" select="../@rdf:about"/>
	</xsl:call-template>
</xsl:template>

<xsl:template match="dc:coverage">
	<xsl:call-template name="print_labels">
		<xsl:with-param name="label" select="java:getString($label_names,'dc_coverage')" />
		<xsl:with-param name="uri" select="concat(namespace-uri(), local-name())" />
		<xsl:with-param name="value" select="." />
		<xsl:with-param name="xitem" select="../@rdf:about"/>
	</xsl:call-template>
</xsl:template>

<xsl:template match="dc:rights">
	<xsl:call-template name="print_labels">
		<xsl:with-param name="label" select="java:getString($label_names,'dc_rights')" />
		<xsl:with-param name="uri" select="concat(namespace-uri(), local-name())" />
		<xsl:with-param name="value" select="." />
		<xsl:with-param name="xitem" select="../@rdf:about"/>
	</xsl:call-template>
</xsl:template>


<xsl:template match="dcq:abstract">
	<xsl:call-template name="print_labels">
		<xsl:with-param name="label" select="java:getString($label_names,'dcq_abstract')" />
		<xsl:with-param name="uri" select="concat(namespace-uri(), local-name())" />
		<xsl:with-param name="value" select="." />
		<xsl:with-param name="xitem" select="../@rdf:about"/>
	</xsl:call-template>
</xsl:template>

<xsl:template match="dcq:alternative">
	<xsl:call-template name="print_labels">
		<xsl:with-param name="label" select="java:getString($label_names,'dcq_alternative')" />
		<xsl:with-param name="uri" select="concat(namespace-uri(), local-name())" />
		<xsl:with-param name="value" select="." />
		<xsl:with-param name="xitem" select="../@rdf:about"/>
	</xsl:call-template>
</xsl:template>

<xsl:template match="dcq:available">
	<xsl:call-template name="print_labels">
		<xsl:with-param name="label" select="java:getString($label_names,'dcq_available')" />
		<xsl:with-param name="uri" select="concat(namespace-uri(), local-name())" />
		<xsl:with-param name="value" select="." />
		<xsl:with-param name="xitem" select="../@rdf:about"/>
	</xsl:call-template>
</xsl:template>

<xsl:template match="dcq:conformsTo">
	<xsl:call-template name="print_labels">
		<xsl:with-param name="label" select="java:getString($label_names,'dcq_conformsTo')" />
		<xsl:with-param name="uri" select="concat(namespace-uri(), local-name())" />
		<xsl:with-param name="value" select="." />
		<xsl:with-param name="xitem" select="../@rdf:about"/>
	</xsl:call-template>
</xsl:template>

<xsl:template match="dcq:created">
	<xsl:call-template name="print_labels">
		<xsl:with-param name="label" select="java:getString($label_names,'dcq_created')" />
		<xsl:with-param name="uri" select="concat(namespace-uri(), local-name())" />
		<xsl:with-param name="value" select="." />
		<xsl:with-param name="xitem" select="../@rdf:about"/>
	</xsl:call-template>
</xsl:template>

<xsl:template match="dcq:extent">
	<xsl:call-template name="print_labels">
		<xsl:with-param name="label" select="java:getString($label_names,'dcq_extent')" />
		<xsl:with-param name="uri" select="concat(namespace-uri(), local-name())" />
		<xsl:with-param name="value" select="." />
		<xsl:with-param name="xitem" select="../@rdf:about"/>
	</xsl:call-template>
</xsl:template>

<xsl:template match="dcq:hasFormat">
	<xsl:call-template name="print_labels">
		<xsl:with-param name="label" select="java:getString($label_names,'dcq_hasFormat')" />
		<xsl:with-param name="uri" select="concat(namespace-uri(), local-name())" />
		<xsl:with-param name="value" select="." />
		<xsl:with-param name="xitem" select="../@rdf:about"/>
	</xsl:call-template>
</xsl:template>

<xsl:template match="dcq:hasPart">
	<xsl:call-template name="print_labels">
		<xsl:with-param name="label" select="java:getString($label_names,'dcq_hasPart')" />
		<xsl:with-param name="uri" select="concat(namespace-uri(), local-name())" />
		<xsl:with-param name="value" select="." />
		<xsl:with-param name="xitem" select="../@rdf:about"/>
	</xsl:call-template>
</xsl:template>

<xsl:template match="dcq:hasVersion">
	<xsl:call-template name="print_labels">
		<xsl:with-param name="label" select="java:getString($label_names,'dcq_hasVersion')" />
		<xsl:with-param name="uri" select="concat(namespace-uri(), local-name())" />
		<xsl:with-param name="value" select="." />
		<xsl:with-param name="xitem" select="../@rdf:about"/>
	</xsl:call-template>
</xsl:template>

<xsl:template match="dcq:isFormatOf">
	<xsl:call-template name="print_labels">
		<xsl:with-param name="label" select="java:getString($label_names,'dcq_isFormatOf')" />
		<xsl:with-param name="uri" select="concat(namespace-uri(), local-name())" />
		<xsl:with-param name="value" select="." />
		<xsl:with-param name="xitem" select="../@rdf:about"/>
	</xsl:call-template>
</xsl:template>

<xsl:template match="dcq:isPartOf">
	<xsl:call-template name="print_labels">
		<xsl:with-param name="label" select="java:getString($label_names,'dcq_isPartOf')" />
		<xsl:with-param name="uri" select="concat(namespace-uri(), local-name())" />
		<xsl:with-param name="value" select="." />
		<xsl:with-param name="xitem" select="../@rdf:about"/>
	</xsl:call-template>
</xsl:template>

<xsl:template match="dcq:isReferencedBy">
	<xsl:call-template name="print_labels">
		<xsl:with-param name="label" select="java:getString($label_names,'dcq_isReferencedBy')" />
		<xsl:with-param name="uri" select="concat(namespace-uri(), local-name())" />
		<xsl:with-param name="value" select="." />
		<xsl:with-param name="xitem" select="../@rdf:about"/>
	</xsl:call-template>
</xsl:template>

<xsl:template match="dcq:isReplacedBy">
	<xsl:call-template name="print_labels">
		<xsl:with-param name="label" select="java:getString($label_names,'dcq_isReplacedBy')" />
		<xsl:with-param name="uri" select="concat(namespace-uri(), local-name())" />
		<xsl:with-param name="value" select="." />
		<xsl:with-param name="xitem" select="../@rdf:about"/>
	</xsl:call-template>
</xsl:template>

<xsl:template match="dcq:isRequiredBy">
	<xsl:call-template name="print_labels">
		<xsl:with-param name="label" select="java:getString($label_names,'dcq_isRequiredBy')" />
		<xsl:with-param name="uri" select="concat(namespace-uri(), local-name())" />
		<xsl:with-param name="value" select="." />
		<xsl:with-param name="xitem" select="../@rdf:about"/>
	</xsl:call-template>
</xsl:template>

<xsl:template match="dcq:issued">
	<xsl:call-template name="print_labels">
		<xsl:with-param name="label" select="java:getString($label_names,'dcq_issued')" />
		<xsl:with-param name="uri" select="concat(namespace-uri(), local-name())" />
		<xsl:with-param name="value" select="." />
		<xsl:with-param name="xitem" select="../@rdf:about"/>
	</xsl:call-template>
</xsl:template>

<xsl:template match="dcq:isVersionOf">
	<xsl:call-template name="print_labels">
		<xsl:with-param name="label" select="java:getString($label_names,'dcq_isVersionOf')" />
		<xsl:with-param name="uri" select="concat(namespace-uri(), local-name())" />
		<xsl:with-param name="value" select="." />
		<xsl:with-param name="xitem" select="../@rdf:about"/>
	</xsl:call-template>
</xsl:template>

<xsl:template match="dcq:mediator">
	<xsl:call-template name="print_labels">
		<xsl:with-param name="label" select="java:getString($label_names,'dcq_mediator')" />
		<xsl:with-param name="uri" select="concat(namespace-uri(), local-name())" />
		<xsl:with-param name="value" select="." />
		<xsl:with-param name="xitem" select="../@rdf:about"/>
	</xsl:call-template>
</xsl:template>

<xsl:template match="dcq:medium">
	<xsl:call-template name="print_labels">
		<xsl:with-param name="label" select="java:getString($label_names,'dcq_medium')" />
		<xsl:with-param name="uri" select="concat(namespace-uri(), local-name())" />
		<xsl:with-param name="value" select="." />
		<xsl:with-param name="xitem" select="../@rdf:about"/>
	</xsl:call-template>
</xsl:template>

<xsl:template match="dcq:modified">
	<xsl:call-template name="print_labels">
		<xsl:with-param name="label" select="java:getString($label_names,'dcq_modified')" />
		<xsl:with-param name="uri" select="concat(namespace-uri(), local-name())" />
		<xsl:with-param name="value" select="." />
		<xsl:with-param name="xitem" select="../@rdf:about"/>
	</xsl:call-template>
</xsl:template>

<xsl:template match="dcq:references">
	<xsl:call-template name="print_labels">
		<xsl:with-param name="label" select="java:getString($label_names,'dcq_references')" />
		<xsl:with-param name="uri" select="concat(namespace-uri(), local-name())" />
		<xsl:with-param name="value" select="." />
		<xsl:with-param name="xitem" select="../@rdf:about"/>
	</xsl:call-template>
</xsl:template>

<xsl:template match="dcq:replaces">
	<xsl:call-template name="print_labels">
		<xsl:with-param name="label" select="java:getString($label_names,'dcq_replaces')" />
		<xsl:with-param name="uri" select="concat(namespace-uri(), local-name())" />
		<xsl:with-param name="value" select="." />
		<xsl:with-param name="xitem" select="../@rdf:about"/>
	</xsl:call-template>
</xsl:template>

<xsl:template match="dcq:requires">
	<xsl:call-template name="print_labels">
		<xsl:with-param name="label" select="java:getString($label_names,'dcq_requires')" />
		<xsl:with-param name="uri" select="concat(namespace-uri(), local-name())" />
		<xsl:with-param name="value" select="." />
		<xsl:with-param name="xitem" select="../@rdf:about"/>
	</xsl:call-template>
</xsl:template>

<xsl:template match="dcq:spatial">
	<xsl:call-template name="print_labels">
		<xsl:with-param name="label" select="java:getString($label_names,'dcq_spatial')" />
		<xsl:with-param name="uri" select="concat(namespace-uri(), local-name())" />
		<xsl:with-param name="value" select="." />
		<xsl:with-param name="xitem" select="../@rdf:about"/>
	</xsl:call-template>
</xsl:template>

<xsl:template match="dcq:tableOfContents">
	<xsl:call-template name="print_labels">
		<xsl:with-param name="label" select="java:getString($label_names,'dcq_tableOfContents')" />
		<xsl:with-param name="uri" select="concat(namespace-uri(), local-name())" />
		<xsl:with-param name="value" select="." />
		<xsl:with-param name="xitem" select="../@rdf:about"/>
	</xsl:call-template>
</xsl:template>

<xsl:template match="dcq:temporal">
	<xsl:call-template name="print_labels">
		<xsl:with-param name="label" select="java:getString($label_names,'dcq_temporal')" />
		<xsl:with-param name="uri" select="concat(namespace-uri(), local-name())" />
		<xsl:with-param name="value" select="." />
		<xsl:with-param name="xitem" select="../@rdf:about"/>
	</xsl:call-template>
</xsl:template>

<xsl:template match="dcq:valid">
	<xsl:call-template name="print_labels">
		<xsl:with-param name="label" select="java:getString($label_names,'dcq_valid')" />
		<xsl:with-param name="uri" select="concat(namespace-uri(), local-name())" />
		<xsl:with-param name="value" select="." />
		<xsl:with-param name="xitem" select="../@rdf:about"/>
	</xsl:call-template>
</xsl:template>


<xsl:template match="reg:superPropertyOf">
	<xsl:call-template name="print_labels">
		<xsl:with-param name="label" select="java:getString($label_names,'reg_superPropertyOf')" />
		<xsl:with-param name="uri" select="concat(namespace-uri(), local-name())" />
		<xsl:with-param name="value" select="." />
		<xsl:with-param name="xitem" select="../@rdf:about"/>
	</xsl:call-template>
</xsl:template>

<xsl:template match="reg:superClassOf">
	<xsl:call-template name="print_labels">
		<xsl:with-param name="label" select="java:getString($label_names,'reg_superClassOf')" />
		<xsl:with-param name="uri" select="concat(namespace-uri(), local-name())" />
		<xsl:with-param name="value" select="." />
		<xsl:with-param name="xitem" select="../@rdf:about"/>
	</xsl:call-template>
</xsl:template>

<xsl:template match="reg:includes">	
	<xsl:call-template name="print_labels">
		<xsl:with-param name="label" select="java:getString($label_names,'reg_includes')" />
		<xsl:with-param name="uri" select="concat(namespace-uri(), local-name())" />
		<xsl:with-param name="value" select="." />
		<xsl:with-param name="xitem" select="../@rdf:about"/>
	</xsl:call-template>
</xsl:template>

<xsl:template match="reg:hasUsage">
        <xsl:call-template name="print_labels">
                <xsl:with-param name="label" select="java:getString($label_names,'reg_hasUsage')" />
                <xsl:with-param name="uri" select="concat(namespace-uri(), local-name())" />
                <xsl:with-param name="value" select="." />
                <xsl:with-param name="xitem" select="../@rdf:about"/>
        </xsl:call-template>
</xsl:template>

<xsl:template match="reg:relatedSchemes">
        <xsl:call-template name="print_labels">
                <xsl:with-param name="label" select="java:getString($label_names,'reg_relatedSchemes')" />
                <xsl:with-param name="uri" select="concat(namespace-uri(), local-name())" />
                <xsl:with-param name="value" select="." />
                <xsl:with-param name="xitem" select="../@rdf:about"/>
        </xsl:call-template>
</xsl:template>

<xsl:template match="reg:controlledTerms">
        <xsl:call-template name="print_labels">
                <xsl:with-param name="label" select="java:getString($label_names,'reg_controlledTerms')" />
                <xsl:with-param name="uri" select="concat(namespace-uri(), local-name())" />
                <xsl:with-param name="value" select="." />
                <xsl:with-param name="xitem" select="../@rdf:about"/>
        </xsl:call-template>
</xsl:template>

<xsl:template match="reg:examples">
        <xsl:call-template name="print_labels">
                <xsl:with-param name="label" select="java:getString($label_names,'reg_examples')" />
                <xsl:with-param name="uri" select="concat(namespace-uri(), local-name())" />
                <xsl:with-param name="value" select="." />
                <xsl:with-param name="xitem" select="../@rdf:about"/>
        </xsl:call-template>
</xsl:template>

</xsl:stylesheet>
