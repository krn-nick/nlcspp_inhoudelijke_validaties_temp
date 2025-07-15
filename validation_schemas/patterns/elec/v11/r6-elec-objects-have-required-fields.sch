<?xml version="1.0" encoding="UTF-8"?>
<pattern xmlns ="http://purl.oclc.org/dsdl/schematron" id="r6-elec-objects-have-required-fields">
    <rule context="//nlcs:MSstation | //nlcs:MSkabel | //nlcs:MSmof | //nlcs:MSoverdrachtspunt | //nlcs:Amantelbuis">
        <let name="handle" 
            value="nlcs:Handle"/>
    
        <let name="inmeetwijze"
            value="nlcs:Inmeetwijze"/>

        <let name="nauwkeurigheid"
            value="nlcs:Nauwkeurigheid"/>
        
        <assert id="elec-objects-does-not-have-inmeetwijze-or-nauwkeurigheid"
            test="string($inmeetwijze) != '' and string($nauwkeurigheid) != ''">
            Object <value-of select="$handle"/> moet een inmeetwijze en nauwkeurigheid hebben.
        </assert>
    </rule>
</pattern>