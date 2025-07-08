<?xml version="1.0" encoding="UTF-8"?>
<pattern xmlns ="http://purl.oclc.org/dsdl/schematron" id="r4-lines-meet-demand">
     <rule context="//nlcs:MSkabel | //nlcs:EAarddraad | //nlcs:AaanlegTechniek | //nlcs:Akunstwerk">
          <let name="handle"
               value="nlcs:Handle"/>
          
          <let name="geometry"
               value="tokenize(normalize-space(nlcs:Geometry/gml:LineString/gml:posList))"/>
          
          <let name="geometry_doubles"
               value="for $v in $geometry return xs:double($v)"/>
          
          <let name="coords_amount"
               value="count($geometry) idiv 3"/>
          
          <let name="coords"
               value="for $v in $geometry return xs:double($v)"/>
          
          <let name="distances"
               value="
                    for $i in 1 to $coords_amount - 1
                    return keronic:point-3d-to-point-3d-distance(
                              $coords[(3 * $i) - 2], $coords[(3 * $i) - 1], $coords[(3 * $i)],
                              $coords[(3 * ($i + 1)) - 2], $coords[(3 * ($i + 1)) - 1], $coords[(3 * ($i + 1))]
                         )
               "/>
          
          <assert id="assert-line-meets-length-demand"
               test="not(some $d in $distances satisfies $d le 100 or $d ge 500)">
               Een lijnsegment mag niet korter dan 10 cm of langer dan 50 cm zijn! Het volgende object voeldoet niet aan deze eis:
               
               <value-of select="$handle"/>
          </assert>
          
          <assert id="assert-line-meets-angle-demand"
               test="not(keronic:line-3d-contains-smaller-angle-than($geometry, '45'))">
               Een lijnsegment mag geen knikken bevatten! Het volgende object voldoet niet aan deze eis:
               
               <value-of select="$handle"/>
          </assert>
     </rule>
</pattern>