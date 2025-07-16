<?xml version="1.0" encoding="UTF-8"?>
<pattern xmlns ="http://purl.oclc.org/dsdl/schematron" id="r9-objects-have-valid-date">
    <rule context="//nlcs:MSstation | //nlcs:MSkabel | //nlcs:MSmof | //nlcs:MSoverdrachtspunt">
        
        <let name="datumaanleg"
            value="nlcs:DatumAanleg"/>
        
        
        <assert id="date-exists"
            test="$datumaanleg">
            De datumaanleg van object <value-of select="nlcs:Handle"/> bestaat niet!
        </assert>
        
        <!-- Only flag this if the datumaanleg exists, otherwise the first assert will catch it anyway -->
        <assert id="date-not-in-future"
            test="if ($datumaanleg) then xs:date($datumaanleg) le current-date() else true()">
            De datumaanleg van object <value-of select="nlcs:Handle"/> ligt in de toekomst!
        </assert>
    </rule>
</pattern>