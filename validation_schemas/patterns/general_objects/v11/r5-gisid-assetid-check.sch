<?xml version="1.0" encoding="UTF-8"?>
<pattern xmlns ="http://purl.oclc.org/dsdl/schematron" id="r5-gisid-assetid-check">
    <rule context="//nlcs:MSstation | //nlcs:MSkabel | //nlcs:MSmof | //nlcs:Amantelbuis">
        <let name="handle" 
            value="nlcs:Handle"/>
        
        <let name="statuses"
            value="keronic:get-statuses-where-gisid-required()"/>
        
        <assert id="gisId-assetId-not-unset-if-new-revision-existing"
            test="not(some $status in ($statuses) satisfies($status = nlcs:Status)) or (nlcs:GisId and nlcs:AssetId)">
            Het gis id en assset id mogen niet leeg zijn als de status Revisie, Bestaand of Verwijderd is! Bij het volgende object is het leeg:
            
            <value-of select="$handle"/>
        </assert>
        
        <assert id="gisId-assetId-are-unset-if-new"
            test="some $status in ($statuses) satisfies($status = nlcs:Status) or (not(nlcs:GisId) and not(nlcs:AssetId))">
            Het gis id en assset id MOETEN leeg zijn als de status NIET Revisie, Bestaand of Verwijderd is! Bij het volgende object is het leeg:
            
            <value-of select="$statuses"/>
        </assert>
    </rule>
</pattern>