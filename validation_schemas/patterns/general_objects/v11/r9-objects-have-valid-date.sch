<?xml version="1.0" encoding="UTF-8"?>
<pattern xmlns ="http://purl.oclc.org/dsdl/schematron" id="r9-objects-have-valid-date">
    <rule context="//nlcs:MSstation | //nlcs:MSkabel | //nlcs:MSmof | //nlcs:MSoverdrachtspunt">
        
        <let name="datumaanleg"
            value="nlcs:DatumAanleg"
            as="xs:date"/>
        
        <assert id="date-not-in-future"
            test="$datumaanleg le current-date()">
            De datumaanleg van object <value-of select="nlcs:Handle"/> ligt in de toekomst!
        </assert>
    </rule>
</pattern>