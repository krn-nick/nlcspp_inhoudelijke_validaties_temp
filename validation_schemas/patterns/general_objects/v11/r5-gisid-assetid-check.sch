<?xml version="1.0" encoding="UTF-8"?>
<pattern xmlns ="http://purl.oclc.org/dsdl/schematron" id="r5-gisid-assetid-check">
    <rule context="//nlcs:MSstation | //nlcs:MSkabel | //nlcs:MSmof | //nlcs:Amantelbuis">
        <let name="handle" 
            value="nlcs:Handle"/>
        
        <let name="statuses"
            value="keronic:get-statuses-where-gisid-required()"/>
        
        <let name="status-requires-id"
            value="some $status in ($statuses) satisfies($status = nlcs:Status)"/>
        
        <let name="statuses-in-object"
            value="nlcs:GisId and nlcs:AssetId"/>
        
        <assert id="gisId-assetId-not-unset-if-new-revision-existing"
            test="not($status-requires-id) or $statuses-in-object">
            Het gis id en assset id mogen niet leeg zijn als de status <value-of select="$statuses"/> is! Bij het volgende object is het leeg:
            
            <value-of select="$handle"/>
        </assert>
        
        <assert id="gisId-assetId-are-unset-if-new"
            test="$status-requires-id or not(nlcs:GisId or nlcs:AssetId)">
            Het gis id en assset id MOETEN leeg zijn als de status NIET <value-of select="$statuses"/> is! Bij het volgende object is het leeg:
            
            <value-of select="$handle"/>
        </assert>
    </rule>
</pattern>