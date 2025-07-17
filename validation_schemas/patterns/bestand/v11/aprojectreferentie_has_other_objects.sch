<?xml version="1.0" encoding="UTF-8"?>
<pattern xmlns ="http://purl.oclc.org/dsdl/schematron" id="v11-aprojectreferentie-has-other-objects">
    <rule context="//nlcs:NLCSnetbeheerType">
        <let name="nlcs_objecten"
             value="*[not(self::nlcs:VersieNummer or self::nlcs:AprojectReferentie)]"/>

        <let name="aprojectreferenties"
             value="nlcs:AprojectReferentie"/>

        <assert id="assert-objects-in-file" 
                test="count($nlcs_objecten) > 0 and count($aprojectreferenties) = 1">
            Het NLCS++ bestand moet een Aprojectreferentie en minstens 1 ander NLCS object bevatten. Huidig aantal objecten:
            <value-of select="count($nlcs_objecten)"/>
        </assert>
    </rule>
</pattern>

