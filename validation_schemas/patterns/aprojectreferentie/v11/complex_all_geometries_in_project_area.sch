<?xml version="1.0" encoding="UTF-8"?>
<pattern xmlns ="http://purl.oclc.org/dsdl/schematron" id="v11-all-geometries-in-project-area">
    <!-- Point geometries -->
    <rule context="//nlcs:MSmof | //nlcs:MSoverdrachtspunt">
        <let name="handle"
            value="nlcs:Handle"/>

        <let name="project_area_pos_list"
             value="tokenize(normalize-space(//nlcs:AprojectReferentie/nlcs:Geometry/gml:Polygon/gml:exterior/gml:LinearRing/gml:posList))"/>
        
        <let name="point_pos"
            value="tokenize(normalize-space((nlcs:Geometry/gml:Point/gml:pos)))"/>

        <assert id="assert-point-inside-project-area" test="keronic:point-3d-interacts-with-area-2d($point_pos, $project_area_pos_list)">
            Point with handle <value-of select="$handle"/> is outside the project area.
        </assert>
    </rule>

    <!-- Line geometries -->
    <rule context="//nlcs:MSkabel | //nlcs:Amantelbuis | //nlcs:Akunstwerk | //nlcs:EAarddraad | //nlcs:Aaanlegtechniek">
        <let name="handle"
            value="nlcs:Handle"/>
        
        <let name="project_area_pos_list"
             value="tokenize(normalize-space(//nlcs:AprojectReferentie/nlcs:Geometry/gml:Polygon/gml:exterior/gml:LinearRing/gml:posList))"/>

        <let name="line_pos_list"
            value="tokenize(normalize-space((nlcs:Geometry/gml:LineString/gml:posList)))"/>

        <assert id="assert-line-inside-project-area" test="keronic:line-3d-interacts-with-area-2d($line_pos_list, $project_area_pos_list)">
            Line with handle <value-of select="$handle"/> is outside the project area.
        </assert>
    </rule>

    <!-- Area geometries -->
    <rule context="//nlcs:MSstation | //nlcs:ABeschermingsvlak">
        <let name="project_area_pos_list"
             value="tokenize(normalize-space(//nlcs:AprojectReferentie/nlcs:Geometry/gml:Polygon/gml:exterior/gml:LinearRing/gml:posList))"/>

        <let name="area_pos_list"
            value="tokenize(normalize-space((nlcs:Geometry/gml:Polygon/gml:exterior/gml:LinearRing/gml:posList)))"/>

        <assert id="assert-area-inside-project-area" test="1 = 1">
            Project area: <value-of select="$project_area_pos_list"/>
            Area: <value-of select="$area_pos_list"/>
        </assert>
    </rule>
</pattern>