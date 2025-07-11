<xsl:stylesheet version="3.0"
	xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
	xmlns:nvr="NLCSValidatieRegelsNameSpace"
	exclude-result-prefixes="nvr">
	
	<xsl:output method="xml" indent="yes"/>
	
	<!-- Load config XML -->
	<xsl:variable name="config-doc" select="document('../doc/NLCSValidatieRegels.xml')"/>
	<xsl:variable name="scopes" select="$config-doc/nvr:NLCSValidatieregels/nvr:scopes/nvr:scope"/>
	
	<!-- Main template -->
	<xsl:template match="/">
		<xsl:variable name="source-doc" select="."/>
		<xsl:variable name="input-uri" select="base-uri($source-doc)"/>
		<xsl:variable name="file-name" select="tokenize($input-uri, '/')[last()]"/>
		<xsl:variable name="output-base" select="replace($input-uri, '^.*?xml_templates', 'xml_output')"/>
		<xsl:variable name="base-dir" select="substring-before($output-base, $file-name)"/>
		
		<!-- For each scope -->
		<xsl:for-each select="$scopes">
			<xsl:variable name="scope" select="."/>
			<xsl:variable name="scope-naam" select="@naam"/>
			<xsl:variable name="tekeningsoort" select="$scope/nvr:tekeningSoort"/>
			<xsl:variable name="scope-dir" select="concat($base-dir, translate($scope-naam, ' ', '_'), '/')"/>
			
			<!-- For each status -->
			<xsl:for-each select="$scope/nvr:statussen/nvr:status">
				<xsl:variable name="status" select="."/>
				<xsl:variable name="status-dir" select="concat($scope-dir, translate($status, ' ', '_'), '/')"/>
				
				<!-- For each bedrijfstoestand -->
				<xsl:for-each select="$scope/nvr:bedrijfsToestanden/nvr:bedrijfstoestand">
					<xsl:variable name="bedrijfstoestand" select="."/>
					<xsl:variable name="output-file" select="concat($status-dir, translate($bedrijfstoestand, ' ', '_'), '_', $file-name)"/>
					
					<!-- Create final output file -->
					<xsl:result-document href="{$output-file}">
						<xsl:apply-templates select="$source-doc/*" mode="generate">
							<xsl:with-param name="tekeningsoort" select="$tekeningsoort"/>
							<xsl:with-param name="status" select="$status"/>
							<xsl:with-param name="bedrijfstoestand" select="$bedrijfstoestand"/>
						</xsl:apply-templates>
					</xsl:result-document>
				</xsl:for-each>
			</xsl:for-each>
		</xsl:for-each>
	</xsl:template>
	
	<!-- Identity transform -->
	<xsl:template match="@* | node()" mode="generate">
		<xsl:param name="tekeningsoort"/>
		<xsl:param name="status"/>
		<xsl:param name="bedrijfstoestand"/>
		<xsl:copy>
			<xsl:apply-templates select="@* | node()" mode="generate">
				<xsl:with-param name="tekeningsoort" select="$tekeningsoort"/>
				<xsl:with-param name="status" select="$status"/>
				<xsl:with-param name="bedrijfstoestand" select="$bedrijfstoestand"/>				
			</xsl:apply-templates>
		</xsl:copy>
	</xsl:template>
	
	<!-- Replace placeholders -->
	<xsl:template match="text()[contains(., '{{')]" mode="generate">
		<xsl:param name="tekeningsoort"/>
		<xsl:param name="status"/>
		<xsl:param name="bedrijfstoestand"/>
		
		<xsl:variable name="replaced1" select="replace(., '\{\{TEKENING TYPE\}\}', $tekeningsoort)"/>
		<xsl:variable name="replaced2" select="replace($replaced1, '\{\{STATUS\}\}', $status)"/>
		<xsl:variable name="replaced3" select="replace($replaced2, '\{\{BEDRIJFSTOESTAND\}\}', $bedrijfstoestand)"/>
		<xsl:value-of select="$replaced3"/>
	</xsl:template>
</xsl:stylesheet>
