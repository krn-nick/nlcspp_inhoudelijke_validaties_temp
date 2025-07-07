<?xml version="1.0" encoding="UTF-8"?>
<pattern xmlns ="http://purl.oclc.org/dsdl/schematron" id="v11-structure-statuses-allowed-for-tekening-type">
    <rule context="//nlcs:NLCSnetbeheerType">
        
        <let name="tekening_type"
            value="nlcs:AprojectReferentie/nlcs:TekeningType"/>
        
        <let name="allowed_statuses"
            value="
                if ($tekening_type = 'BESTAANDE SITUATIE') then 
                    ['BESTAAND']
                else if ($tekening_type = 'DEELREVISIE') then 
                    ['BESTAAND', 'NIEUW', 'REVISIE', 'VERWIJDERD', 'TIJDELIJK']
                else if ($tekening_type = 'DEFINITIEF ONTWERP') then 
                    ['BESTAAND', 'NIEUW', 'REVISIE', 'VERWIJDERD', 'TIJDELIJK']
                else if ($tekening_type = 'EINDREVISIE') then 
                    ['BESTAAND', 'NIEUW', 'REVISIE', 'VERWIJDERD']
                else if ($tekening_type = 'VOORONTWERP') then 
                    []
                else 
                    []
            "/>
        
        <let name="nlcs_objecten"
            value="*[not(self::nlcs:VersieNummer or self::nlcs:AprojectReferentie)]"/>
        
        <let name="nlcs_objecten_with_invalid_statuses"
            value="$nlcs_objecten[nlcs:Status[not(. = $allowed_statuses)]]"/>
        
        <assert id="status-in-line-with-type" 
            test="count($nlcs_objecten_with_invalid_statuses) = 0">
            Invalid statuses for tekening type <value-of select="$tekening_type"/>, must be one of: <value-of select="$allowed_statuses"/>
            
            Invalid objects: 
            <value-of select="string-join(for $nlcs_object in $nlcs_objecten_with_invalid_statuses return concat('Handle: ', $nlcs_object/nlcs:Handle, ', Status: ', $nlcs_object/nlcs:Status), ' | ')"/>
        </assert>
    </rule>
</pattern>

