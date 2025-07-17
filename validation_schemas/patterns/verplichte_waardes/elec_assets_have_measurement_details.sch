<?xml version="1.0" encoding="UTF-8"?>
<pattern xmlns ="http://purl.oclc.org/dsdl/schematron" id="v11-elec-assets-have-measurement-details">
    <rule context="//nlcs:MSstation | //nlcs:MSkabel | //nlcs:MSmof | //nlcs:MSoverdrachtspunt | //nlcs:Amantelbuis">
        <let name="handle" 
            value="nlcs:Handle"/>
    
        <let name="inmeetwijze_is_valid"
            value="keronic:element-exists-and-not-empty(nlcs:Inmeetwijze)"/>

        <let name="nauwkeurigheid_is_valid"
            value="keronic:element-exists-and-not-empty(nlcs:Nauwkeurigheid)"/>
        
        <assert id="elec-objects-does-not-have-inmeetwijze-or-nauwkeurigheid"
            test="$inmeetwijze_is_valid and $nauwkeurigheid_is_valid">
            Object <value-of select="$handle"/> moet een inmeetwijze en nauwkeurigheid hebben.
        </assert>
    </rule>
</pattern>