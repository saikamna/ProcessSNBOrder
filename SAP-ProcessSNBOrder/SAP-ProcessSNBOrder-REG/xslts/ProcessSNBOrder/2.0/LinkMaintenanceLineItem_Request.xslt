<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
   <xsl:template match="/">
      <soapenv:Envelope xmlns:soapenv="http://schemas.xmlsoap.org/soap/envelope/" xmlns:oper="urn:v4.webservices.operations.flexnet.com">
         <soapenv:Header/>
         <soapenv:Body>
            <oper:linkMaintenanceLineItemRequest>
               <oper:linkMaintenanceLineItemList>
                  <xsl:for-each select="//*[local-name()='fulfillEntitlements']/*[local-name()='entitlement']/*[local-name()='lineItems']">
                     <xsl:if test="count(../*[local-name()='maintenanceLineItems'])!=0">
                        <xsl:variable name="compare" select="substring-after(*[local-name()='lineItemId'],'ACT-')"/>
                        <oper:linkMaintenanceLineItem>
                           <oper:lineItemIdentifier>
                              <oper:primaryKeys>
                                 <oper:activationId>
                                    <xsl:value-of select="*[local-name()='lineItemId']"/>
                                 </oper:activationId>
                              </oper:primaryKeys>
                           </oper:lineItemIdentifier>
                           <xsl:for-each select="//*[local-name()='maintenanceLineItems']">
                              <xsl:if test="contains(*[local-name()='maintenanceLineItemsId'],$compare)">
                                 <oper:maintenanceLineItemIdentifier>
                                    <oper:primaryKeys>
                                       <oper:activationId>
                                          <xsl:value-of select="*[local-name()='maintenanceLineItemsId']"/>
                                       </oper:activationId>
                                    </oper:primaryKeys>
                                 </oper:maintenanceLineItemIdentifier>
                              </xsl:if>
                           </xsl:for-each>
                        </oper:linkMaintenanceLineItem>
                     </xsl:if>
                  </xsl:for-each>
               </oper:linkMaintenanceLineItemList>
            </oper:linkMaintenanceLineItemRequest>
         </soapenv:Body>
      </soapenv:Envelope>
   </xsl:template>
</xsl:stylesheet>