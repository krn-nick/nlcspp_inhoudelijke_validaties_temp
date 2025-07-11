<stylesheet version="3.0"
            xmlns:nvr="NLCSValidatieRegelsNameSpace"
            xmlns="http://www.w3.org/1999/XSL/Transform"
  >
  
  <output method="xml" indent="yes"/>
  
  <variable name="scopes" select="document('../doc/NLCSValidatieRegels.xml')/nvr:NLCSValidatieregels/nvr:scopes"/>
  
  <template match="@* | node()">
    <copy>
      <apply-templates select="@* | node()"/>
    </copy>
  </template>
  
  <template match="text()[contains(., '{{STATUS}}')]">
    <variable name="text" select="."/>
    <variable name="status" select="$scopes/nvr:scope[1]/nvr:statussen/nvr:status"/>
    <variable name="replaced" select="replace($text, '\{\{STATUS\}\}', $status)"/>
    <value-of select="$replaced"/>
  </template>
  
  <template match="text()[contains(., '{{TEKENING TYPE}}')]">
    <variable name="text" select="."/>
    <variable name="tekening_soort" select="$scopes/nvr:scope[1]/nvr:tekeningSoort"/>
    <variable name="replaced" select="replace($text, '\{\{TEKENING TYPE\}\}', $tekening_soort)"/>
    <value-of select="$replaced"/>
  </template>
  
</stylesheet>
