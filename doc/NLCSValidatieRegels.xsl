<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:ns="NLCSValidatieRegelsNameSpace">
	<xsl:output method="html" doctype-system="about:legacy-compat" encoding="UTF-8" indent="yes" />
	
	<xsl:variable name="lowercase" select="'abcdefghijklmnopqrstuvwxyz'"/>
	<xsl:variable name="uppercase" select="'ABCDEFGHIJKLMNOPQRSTUVWXYZ'"/>
	<xsl:template name="human-string">
		<!--
			Convert a string to a 'human-string' 
		 -->
		<xsl:param name="a-string"/>
		<xsl:value-of select="concat(translate(substring(local-name(),1,1), $lowercase, $uppercase),
  						      		 substring(local-name(), 2),
          							 substring(' ', 1 div not(position()=last())))"/>
	</xsl:template>
	
	<xsl:template name="tablefy">
		<!--
			Converts an XML-node to an HTML table structure 
		 -->
		<xsl:param name="node"/>
		<xsl:param name="prefix"/>
		<xsl:param name="id"/>
		
		<xsl:if test="count($node) = 0">
			<xsl:value-of select="concat($prefix, text())"/>
		</xsl:if>
		
		<xsl:if test="count($node) = 1">
			<xsl:for-each select="$node">
				<xsl:call-template name="tablefy">
					<xsl:with-param name="node" select="*"/>
					<xsl:with-param name="prefix" select="concat($prefix, local-name($node), ': ')"/>
					<xsl:with-param name="id" select="''"/>
    			</xsl:call-template>
    		</xsl:for-each>			
		</xsl:if>
		
		<xsl:if test="count($node) > 1">
			<table class="validatieDocumentatieTable">
				<xsl:attribute name="id">
        			<xsl:value-of select="$id"/>
      			</xsl:attribute>
				<xsl:for-each select="$node">
					<tr class="validatieDocumentatieRow">
						<td class="validatieDocumentatieCell">
							<b>
								<xsl:call-template name="human-string">
	    							<xsl:with-param name="a-string" select="local-name()"/>
								</xsl:call-template>											
							</b>
						</td>
						<td class="validatieDocumentatieCell">
							<xsl:call-template name="tablefy">
								<xsl:with-param name="node" select="*"/>
								<xsl:with-param name="prefix" select="''"/>
								<xsl:with-param name="id" select="''"/>
				    		</xsl:call-template>
				    	</td>
					</tr>
				</xsl:for-each>	
			</table>
		</xsl:if>
	</xsl:template>
	
	<xsl:template match="/">
		<!--
			The actual body of the documentation 
		-->
		<html>
			<head>
				<title>NLCS++ Inhoudelijke Validaties - Documentatie</title>
				<link rel="stylesheet" href="NLCSValidatieRegels.css" />
			</head>
			<body>
				<h1>NLCS++ Inhoudelijke validaties - Documentatie</h1>
				
				<h2>Index</h2>
				
				<h3>Validatie regels</h3>
				
				<xsl:for-each select="/ns:NLCSValidatieregels/ns:validatieRegels/ns:validatieRegel">
					<xsl:variable name="nummer" select="ns:nummer/text()"/>
					<xsl:variable name="naam" select="ns:naam/text()"/>
					<li>
						<a>
							<xsl:attribute name="href">
			        			<xsl:value-of select="concat('#', $nummer)"/>
			      			</xsl:attribute>
							<xsl:value-of select="$nummer"/> - <xsl:value-of select="$naam"/>
						</a>
					</li>					
				</xsl:for-each>
				
				<h3>Scopes</h3>
				<xsl:for-each select="/ns:NLCSValidatieregels/ns:scopes/ns:scope">
					<xsl:variable name="naam" select="@naam"/>
					<li>
						<a>
							<xsl:attribute name="href">
			        			<xsl:value-of select="concat('#', $naam)"/>
			      			</xsl:attribute>
							<xsl:value-of select="$naam"/>
						</a>
					</li>				
				</xsl:for-each>
				
				<h2>Documentatie</h2>
				
				<h3>Validatie regels</h3>
				
					<xsl:for-each select="/ns:NLCSValidatieregels/ns:validatieRegels/ns:validatieRegel">
						<xsl:call-template name="tablefy">
							<xsl:with-param name="node" select="*"/>
							<xsl:with-param name="prefix" select="''"/>
							<xsl:with-param name="id" select="ns:nummer/text()"/>
      					</xsl:call-template>
						<br/>
					</xsl:for-each>
					
				<h3>Scopes</h3>
				
				<xsl:for-each select="/ns:NLCSValidatieregels/ns:scopes/ns:scope">
						<xsl:variable name="naam" select="@naam"/>
						<b>
							<xsl:value-of select="$naam"/>
						</b>
						<br/><br/>
						<xsl:call-template name="tablefy">
							<xsl:with-param name="node" select="*"/>
							<xsl:with-param name="prefix" select="''"/>
							<xsl:with-param name="id" select="$naam"/>
      					</xsl:call-template>
						<br/>
				</xsl:for-each>
			</body>
		</html>
	</xsl:template>
</xsl:stylesheet>
