<?xml version="1.0" encoding="UTF-8"?>
<pattern xmlns ="http://purl.oclc.org/dsdl/schematron" id="r7_cables_have_subnettype">
    <rule context="//nlcs:MSkabel">
        <let name="subnettype"
            value="nlcs:Subnettype"/>
        
        <assert test="keronic:element-exists-and-not-empty($subnettype)">
                Het object <value-of select="nlcs:Handle"/> moet een waarde voor Subnettype hebben!
        </assert>
    </rule>
</pattern>
