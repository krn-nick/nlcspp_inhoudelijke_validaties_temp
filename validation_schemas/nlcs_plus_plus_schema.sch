<?xml version="1.0" encoding="UTF-8"?>
<schema xmlns ="http://purl.oclc.org/dsdl/schematron"
	    xmlns:svrl="http://purl.oclc.org/dsdl/svrl"
	    xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
        xmlns:math="http://www.w3.org/2005/xpath-functions/math"
	    xmlns:xi="http://www.w3.org/2001/XInclude"
        xmlns:gml="http://www.opengis.net/gml/3.2"
        queryBinding="xslt3">


    <!-- schematron namespace declarations -->
    <ns prefix="keronic" uri = "http://example.com/my-functions"/>
    <ns prefix="gml" uri="http://www.opengis.net/gml/3.2"/>
    <ns prefix="nlcs" uri="NLCSnetbeheer"/>

    <phase id="v11_r1">
        <active pattern="v11-structure-aprojectreferentie-has-other-objects"/>
    </phase>

    <include href="patterns/aprojectreferentie/v11/structure_aprojectreferentie_has_other_objects.sch"/>
  </schema>
