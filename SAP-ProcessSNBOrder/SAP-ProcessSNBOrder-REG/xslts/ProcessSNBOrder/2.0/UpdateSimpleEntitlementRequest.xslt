<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">
   <xsl:param name="autoDeploy" />
   <xsl:template match="/">
      <soapenv:Envelope xmlns:soapenv="http://schemas.xmlsoap.org/soap/envelope/" xmlns:urn="urn:v4.webservices.operations.flexnet.com">
         <soapenv:Header />
         <soapenv:Body>
            <urn:updateSimpleEntitlementRequest>
               <urn:simpleEntitlement>
                  <xsl:if test="string-length(//*[local-name()='tempMaintainanceRenewal']/*[local-name()='maintainanceRenewal']/*[local-name()='E1EDL24']/*[local-name()='E1TXTH9'])!=0">
                     <urn:entitlementIdentifier>
                        <urn:primaryKeys>
                           <xsl:for-each select="//*[local-name()='tempMaintainanceRenewal']/*[local-name()='maintainanceRenewal']/*[local-name()='E1EDL24']/*[local-name()='E1TXTH9']">
                              <xsl:if test="./*[local-name()='E1TXTP9']/*[local-name()='TDLINE'][contains(text(),'ENT')]">
                                 <urn:entitlementId>
                                    <xsl:value-of select="./*[local-name()='E1TXTP9']/*[local-name()='TDLINE']" />
                                 </urn:entitlementId>
                              </xsl:if>
                           </xsl:for-each>
                        </urn:primaryKeys>
                     </urn:entitlementIdentifier>
                  </xsl:if>
                  <urn:autoDeploy>
                     <xsl:value-of select="$autoDeploy" />
                  </urn:autoDeploy>
                  <urn:entitlementAttributes>
                     <!--Zero or more repetitions:-->
                     <urn:attribute>
                        <urn:attributeName>SAPIDOCID</urn:attributeName>
                        <!--Optional:-->
                        <urn:stringValue>
                           <xsl:value-of select="//*[local-name()='ZSHPORD']/*[local-name()='IDOC']/*[local-name()='EDI_DC40']/*[local-name()='DOCNUM']" />
                        </urn:stringValue>
                     </urn:attribute>
                  </urn:entitlementAttributes>
               </urn:simpleEntitlement>
            </urn:updateSimpleEntitlementRequest>
         </soapenv:Body>
      </soapenv:Envelope>
   </xsl:template>
</xsl:stylesheet>