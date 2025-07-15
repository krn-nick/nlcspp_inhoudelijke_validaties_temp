<?xml version="1.0" encoding="UTF-8"?>
<schema xmlns ="http://purl.oclc.org/dsdl/schematron"
        xmlns:svrl="http://purl.oclc.org/dsdl/svrl"
        xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
        xmlns:math="http://www.w3.org/2005/xpath-functions/math"
        xmlns:xi="http://www.w3.org/2001/XInclude"
        xmlns:gml="http://www.opengis.net/gml/3.2"
        queryBinding="xslt3">
    
    
    <!-- schematron namespace declarations -->
    <ns prefix="keronic" uri = "http://example.com/my-functions"/>
    <ns prefix="gml" uri="http://www.opengis.net/gml/3.2"/>
    <ns prefix="nlcs" uri="NLCSnetbeheer"/>
    
    <phase id="v11_r1">
        <active pattern="v11-structure-aprojectreferentie-has-other-objects"/>
    </phase>

    <phase id="v11_r2">
        <active pattern="v11-structure-statuses-allowed-for-tekening-type"/>
    </phase>

    <phase id="v11_r3">
        <active pattern="v11-all-geometries-in-project-area"/>
    </phase>
    
    <phase id="v11_r4">
        <active pattern="r4-lines-meet-demand"/>
        <active pattern="r4-areas-meet-demand"/>
    </phase>

    <phase id="v11_r5">
        <active pattern="r5-gisid-assetid-check"/>
    </phase>
    
    <xsl:include href="xsl_functions/global_functions/config_functions.xsl"/>
    <xsl:include href="xsl_functions/helper_functions/helper_functions.xsl"/>
    <xsl:include href="xsl_functions/geometry_functions/2d_geometry_functions.xsl"/>
    <xsl:include href="xsl_functions/geometry_functions/3d_geometry_functions.xsl"/>
    <xsl:include href="xsl_functions/geometry_functions/2d_geometry_interface_functions.xsl"/>
    <xsl:include href="xsl_functions/geometry_functions/3d_geometry_interface_functions.xsl"/>
    <xsl:include href="xsl_functions/geometry_functions/3d_2d_geometry_interface_functions.xsl"/>
    <xsl:include href="xsl_functions/geometry_functions/geometry_interface_functions.xsl"/>
    <xsl:include href="xsl_functions/geometry_functions/line_interface_functions.xsl"/>
    <xsl:include href="xsl_functions/geometry_functions/line_functions.xsl"/>
    <xsl:include href="xsl_functions/geometry_functions/depth_functions.xsl"/>
    <xsl:include href="xsl_functions/geometry_functions/depth_interface_functions.xsl"/>
    
    <include href="patterns/aprojectreferentie/v11/structure_aprojectreferentie_has_other_objects.sch"/>
    <include href="patterns/status/v11/structure_statuses_allowed_for_tekening_type.sch"/>
    <include href="patterns/aprojectreferentie/v11/complex_all_geometries_in_project_area.sch"/>
    <include href="patterns/general_line/v11/r4-lines-meet-demands.sch"/>
    <include href="patterns/general_area/v11/r4-areas-meet-demands.sch"/>
    <include href="patterns/general_objects/v11/r5-gisid-assetid-check.sch"/>
</schema>
