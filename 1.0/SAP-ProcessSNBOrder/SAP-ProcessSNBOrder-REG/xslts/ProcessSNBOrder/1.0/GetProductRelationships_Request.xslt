<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
   <xsl:param name="name"/>
   <xsl:param name="version"/>
   <xsl:template match="/">
      <soapenv:Envelope xmlns:soapenv="http://schemas.xmlsoap.org/soap/envelope/" xmlns:oper="urn:com.macrovision:flexnet/operations">
         <soapenv:Header/>
         <soapenv:Body>
            <oper:getProductRelationshipsRequest>
               <oper:productIdentifier>
                  <oper:uniqueId>
                     <xsl:value-of select="./*[local-name()='getMaintenanceQueryResponse']/*[local-name()='responseData']/*[local-name()='maintenance']/*[local-name()='uniqueId']/text()"/>
                  </oper:uniqueId>
                  <oper:primaryKeys>
                     <oper:name><xsl:value-of select="$name"/></oper:name>
                     <oper:version><xsl:value-of select="$version"/></oper:version>
                  </oper:primaryKeys>
               </oper:productIdentifier>
            </oper:getProductRelationshipsRequest>
         </soapenv:Body>
      </soapenv:Envelope>
   </xsl:template>
</xsl:stylesheet>