<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
   <xsl:param name="searchType"/>
   <xsl:param name="pageNumber"/>
   <xsl:param name="batchSize"/>
   <xsl:template match="/">
      <soapenv:Envelope xmlns:soapenv="http://schemas.xmlsoap.org/soap/envelope/" xmlns:oper="urn:v2.webservices.operations.flexnet.com">
         <soapenv:Header/>
         <soapenv:Body>
            <oper:getPartNumbersQueryRequest>
               <oper:queryParams>
                  <oper:partId>
                     <oper:value>
                        <xsl:value-of select="./*[local-name()='E1EDL24']/*[local-name()='MATNR']/text()"/>
                     </oper:value>
                     <oper:searchType><xsl:value-of select="$searchType"/></oper:searchType>
                  </oper:partId>
               </oper:queryParams>
               <oper:pageNumber><xsl:value-of select="$pageNumber"/></oper:pageNumber>
               <oper:batchSize><xsl:value-of select="$batchSize"/></oper:batchSize>
            </oper:getPartNumbersQueryRequest>
         </soapenv:Body>
      </soapenv:Envelope>
   </xsl:template>
</xsl:stylesheet>
