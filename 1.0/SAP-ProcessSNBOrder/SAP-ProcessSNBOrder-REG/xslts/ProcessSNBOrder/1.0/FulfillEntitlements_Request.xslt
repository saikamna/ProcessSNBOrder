<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">
   <xsl:param name="typePartner" />
   <xsl:param name="SourceAccountType" />
   <xsl:param name="sourceSystem" />
   <xsl:param name="accountType" />
   <xsl:param name="deviceFlag" />
   <xsl:param name="accountTypeBFO" />
   <xsl:param name="SEWorkIDAccOwner" />
   <xsl:param name="currentDate" />
   <xsl:param name="accountCurrency" />
   <xsl:param name="tempAddedYear" />
   <xsl:template match="/">
      <xsl:variable name="firstStructure">
         <xsl:if test="string-length(//*[local-name()='ZSHPORD']/*[local-name()='IDOC']/*[local-name()='E1EDL20']/*[local-name()='E1TXTH8'][*[local-name()='TDOBJECT']='VBBK'][*[local-name()='TDID']='Z109'][*[local-name()='TDOBNAME']=//*[local-name()='ZSHPORD']/*[local-name()='IDOC']/*[local-name()='E1EDL20']/*[local-name()='VBELN']]/*[local-name()='E1TXTP8']/*[local-name()='TDLINE'])!=0">
            <xsl:for-each select="//*[local-name()='ZSHPORD']/*[local-name()='IDOC']/*[local-name()='E1EDL20']/*[local-name()='E1TXTH8'][*[local-name()='TDOBJECT']='VBBK'][*[local-name()='TDID']='Z109'][*[local-name()='TDOBNAME']=//*[local-name()='ZSHPORD']/*[local-name()='IDOC']/*[local-name()='E1EDL20']/*[local-name()='VBELN']]/*[local-name()='E1TXTP8']">
               <xsl:value-of select="translate(./*[local-name()='TDLINE'], ';', ',')" />
            </xsl:for-each>
         </xsl:if>
      </xsl:variable>
      <xsl:variable name="secondStructure">
         <xsl:if test="string-length(//*[local-name()='ZSHPORD']/*[local-name()='IDOC']/*[local-name()='E1EDL20']/*[local-name()='E1TXTH8'][*[local-name()='TDOBJECT']='VBBK'][*[local-name()='TDID']='Z500'][*[local-name()='TDOBNAME']=//*[local-name()='ZSHPORD']/*[local-name()='IDOC']/*[local-name()='E1EDL20']/*[local-name()='VBELN']]/*[local-name()='E1TXTP8']/*[local-name()='TDLINE'])!=0">
            <xsl:for-each select="//*[local-name()='ZSHPORD']/*[local-name()='IDOC']/*[local-name()='E1EDL20']/*[local-name()='E1TXTH8'][*[local-name()='TDOBJECT']='VBBK'][*[local-name()='TDID']='Z500'][*[local-name()='TDOBNAME']=//*[local-name()='ZSHPORD']/*[local-name()='IDOC']/*[local-name()='E1EDL20']/*[local-name()='VBELN']]/*[local-name()='E1TXTP8']">
               <xsl:value-of select="translate(./*[local-name()='TDLINE'], ';', ',')" />
            </xsl:for-each>
         </xsl:if>
      </xsl:variable>
      <xsl:variable name="thirdStructure">
         <xsl:choose>
            <xsl:when test="string-length($secondStructure)!=0 and string-length($firstStructure)!=0">
               <xsl:value-of select="concat(',',$secondStructure)" />
            </xsl:when>
            <xsl:otherwise>
               <xsl:value-of select="$secondStructure" />
            </xsl:otherwise>
         </xsl:choose>
      </xsl:variable>
      <fulfillEntitlements>
         <organization>
            <xsl:if test="string-length(//*[local-name()='ZSHPORD']/*[local-name()='IDOC']/*[local-name()='E1EDL20']/*[local-name()='E1ADRM1'][*[local-name()='PARTNER_Q']='AG']/*[local-name()='PARTNER_ID'])!=0">
               <name>
                  <xsl:value-of select="concat('SAPSNB.',number(//*[local-name()='ZSHPORD']/*[local-name()='IDOC']/*[local-name()='E1EDL20']/*[local-name()='E1ADRM1'][*[local-name()='PARTNER_Q']='AG']/*[local-name()='PARTNER_ID']),'_','SAPSNB.',number(//*[local-name()='ZSHPORD']/*[local-name()='IDOC']/*[local-name()='E1EDL20']/*[local-name()='E1ADRM1'][*[local-name()='PARTNER_Q']='AG']/*[local-name()='PARTNER_ID']))" />
               </name>
            </xsl:if>
            <xsl:if test="string-length(//*[local-name()='ZSHPORD']/*[local-name()='IDOC']/*[local-name()='E1EDL20']/*[local-name()='E1ADRM1'][*[local-name()='PARTNER_Q']='AG']/*[local-name()='NAME1'])!=0">
               <displayName>
                  <xsl:value-of select="concat(//*[local-name()='ZSHPORD']/*[local-name()='IDOC']/*[local-name()='E1EDL20']/*[local-name()='E1ADRM1'][*[local-name()='PARTNER_Q']='AG']/*[local-name()='NAME1'],//*[local-name()='ZSHPORD']/*[local-name()='IDOC']/*[local-name()='E1EDL20']/*[local-name()='E1ADRM1'][*[local-name()='PARTNER_Q']='AG']/*[local-name()='NAME2'])" />
               </displayName>
            </xsl:if>
            <address>
               <xsl:if test="string-length(//*[local-name()='ZSHPORD']/*[local-name()='IDOC']/*[local-name()='E1EDL20']/*[local-name()='E1ADRM1'][*[local-name()='PARTNER_Q']='AG']/*[local-name()='STREET1'])!=0">
                  <address1>
                     <xsl:value-of select="//*[local-name()='ZSHPORD']/*[local-name()='IDOC']/*[local-name()='E1EDL20']/*[local-name()='E1ADRM1'][*[local-name()='PARTNER_Q']='AG']/*[local-name()='STREET1']" />
                  </address1>
               </xsl:if>
               <xsl:if test="string-length(//*[local-name()='ZSHPORD']/*[local-name()='IDOC']/*[local-name()='E1EDL20']/*[local-name()='E1ADRM1'][*[local-name()='PARTNER_Q']='AG']/*[local-name()='STREET2'])!=0">
                  <address2>
                     <xsl:value-of select="//*[local-name()='ZSHPORD']/*[local-name()='IDOC']/*[local-name()='E1EDL20']/*[local-name()='E1ADRM1'][*[local-name()='PARTNER_Q']='AG']/*[local-name()='STREET2']" />
                  </address2>
               </xsl:if>
               <xsl:if test="string-length(//*[local-name()='ZSHPORD']/*[local-name()='IDOC']/*[local-name()='E1EDL20']/*[local-name()='E1ADRM1'][*[local-name()='PARTNER_Q']='AG']/*[local-name()='CITY1'])!=0">
                  <city>
                     <xsl:value-of select="//*[local-name()='ZSHPORD']/*[local-name()='IDOC']/*[local-name()='E1EDL20']/*[local-name()='E1ADRM1'][*[local-name()='PARTNER_Q']='AG']/*[local-name()='CITY1']" />
                  </city>
               </xsl:if>
               <xsl:if test="(//*[local-name()='ZSHPORD']/*[local-name()='IDOC']/*[local-name()='E1EDL20']/*[local-name()='E1ADRM1'][*[local-name()='PARTNER_Q']='AG']/*[local-name()='REGION'])='US' or (//*[local-name()='ZSHPORD']/*[local-name()='IDOC']/*[local-name()='E1EDL20']/*[local-name()='E1ADRM1'][*[local-name()='PARTNER_Q']='AG']/*[local-name()='REGION'])='CA'">
                  <state>
                     <xsl:value-of select="//*[local-name()='ZSHPORD']/*[local-name()='IDOC']/*[local-name()='E1EDL20']/*[local-name()='E1ADRM1'][*[local-name()='PARTNER_Q']='AG']/*[local-name()='REGION']" />
                  </state>
               </xsl:if>
               <xsl:if test="string-length(//*[local-name()='ZSHPORD']/*[local-name()='IDOC']/*[local-name()='E1EDL20']/*[local-name()='E1ADRM1'][*[local-name()='PARTNER_Q']='AG']/*[local-name()='POSTL_COD1'])!=0">
                  <zipCode>
                     <xsl:value-of select="//*[local-name()='ZSHPORD']/*[local-name()='IDOC']/*[local-name()='E1EDL20']/*[local-name()='E1ADRM1'][*[local-name()='PARTNER_Q']='AG']/*[local-name()='POSTL_COD1']" />
                  </zipCode>
               </xsl:if>
               <xsl:if test="string-length(//*[local-name()='ZSHPORD']/*[local-name()='IDOC']/*[local-name()='E1EDL20']/*[local-name()='E1ADRM1'][*[local-name()='PARTNER_Q']='AG']/*[local-name()='COUNTRY1'])!=0">
                  <country>
                     <xsl:value-of select="//*[local-name()='ZSHPORD']/*[local-name()='IDOC']/*[local-name()='E1EDL20']/*[local-name()='E1ADRM1'][*[local-name()='PARTNER_Q']='AG']/*[local-name()='COUNTRY1']" />
                  </country>
               </xsl:if>
               <xsl:if test="(//*[local-name()='ZSHPORD']/*[local-name()='IDOC']/*[local-name()='E1EDL20']/*[local-name()='E1ADRM1'][*[local-name()='PARTNER_Q']='AG']/*[local-name()='REGION'])!='US' or (//*[local-name()='ZSHPORD']/*[local-name()='IDOC']/*[local-name()='E1EDL20']/*[local-name()='E1ADRM1'][*[local-name()='PARTNER_Q']='AG']/*[local-name()='REGION'])!='CANADA'">
                  <region>
                     <xsl:value-of select="//*[local-name()='ZSHPORD']/*[local-name()='IDOC']/*[local-name()='E1EDL20']/*[local-name()='E1ADRM1'][*[local-name()='PARTNER_Q']='AG']/*[local-name()='REGION']" />
                  </region>
               </xsl:if>
            </address>
            <xsl:if test="string-length(//*[local-name()='result']/*[local-name()='target'][*[local-name()='publisherCode']='SDH']/*[local-name()='id'])!=0">
               <goldenId>
                  <xsl:value-of select="//*[local-name()='result']/*[local-name()='target'][*[local-name()='publisherCode']='SDH']/*[local-name()='id']" />
               </goldenId>
            </xsl:if>
            <xsl:if test="string-length(//*[local-name()='result']/*[local-name()='target'][*[local-name()='publisherCode']='BFO']/*[local-name()='id'])!=0">
               <bFOAccountId>
                  <xsl:value-of select="//*[local-name()='result']/*[local-name()='target'][*[local-name()='publisherCode']='BFO']/*[local-name()='id']" />
               </bFOAccountId>
            </xsl:if>
            <xsl:if test="string-length(//*[local-name()='queryResponse']/*[local-name()='result']/*[local-name()='records']/*[local-name()='CurrencyIsoCode'])!=0">
               <accountCurrency>
                  <xsl:value-of select="//*[local-name()='queryResponse']/*[local-name()='result']/*[local-name()='records']/*[local-name()='CurrencyIsoCode']" />
               </accountCurrency>
            </xsl:if>
            <xsl:if test="string-length(//*[local-name()='queryResponse']/*[local-name()='result']/*[local-name()='records']/*[local-name()='CurrencyIsoCode'])=0">
               <accountCurrency>USD</accountCurrency>
            </xsl:if>
            <xsl:if test="string-length(//*[local-name()='queryResponse']/*[local-name()='result']/*[local-name()='records']/*[local-name()='Owner']/*[local-name()='Name'])!=0">
               <accountManager>
                  <xsl:value-of select="//*[local-name()='queryResponse']/*[local-name()='result']/*[local-name()='records']/*[local-name()='Owner']/*[local-name()='Name']" />
               </accountManager>
            </xsl:if>
            <xsl:if test="string-length($accountType)!=0">
               <accountType>
                  <xsl:value-of select="$accountType" />
               </accountType>
            </xsl:if>
            <xsl:if test="string-length($accountTypeBFO)!=0">
               <accountTypeBFO>
                  <xsl:value-of select="$accountTypeBFO" />
               </accountTypeBFO>
            </xsl:if>
            <xsl:if test="string-length(//*[local-name()='queryResponse']/*[local-name()='result']/*[local-name()='records']/*[local-name()='LeadingBusiness__c'])!=0">
               <businessUnit>
                  <xsl:value-of select="//*[local-name()='queryResponse']/*[local-name()='result']/*[local-name()='records']/*[local-name()='LeadingBusiness__c']" />
               </businessUnit>
            </xsl:if>
            <xsl:if test="string-length(//*[local-name()='queryResponse']/*[local-name()='result']/*[local-name()='records']/*[local-name()='LeadingBusiness__c'])=0">
               <businessUnit>BD</businessUnit>
            </xsl:if>
            <xsl:if test="string-length($deviceFlag)!=0">
               <deviceFlag>
                  <xsl:value-of select="$deviceFlag" />
               </deviceFlag>
            </xsl:if>
            <xsl:if test="string-length(//*[local-name()='queryResponse']/*[local-name()='result']/*[local-name()='records']/*[local-name()='Fax'])!=0">
               <fax>
                  <xsl:value-of select="//*[local-name()='queryResponse']/*[local-name()='result']/*[local-name()='records']/*[local-name()='Fax']" />
               </fax>
            </xsl:if>
            <xsl:if test="string-length(//*[local-name()='queryResponse']/*[local-name()='result']/*[local-name()='records']/*[local-name()='ClassLevel1__c'])!=0">
               <globalClassificationLevel1>
                  <xsl:value-of select="//*[local-name()='queryResponse']/*[local-name()='result']/*[local-name()='records']/*[local-name()='ClassLevel1__c']" />
               </globalClassificationLevel1>
            </xsl:if>
            <xsl:if test="string-length(//*[local-name()='queryResponse']/*[local-name()='result']/*[local-name()='records']/*[local-name()='ClassLevel1__c'])=0">
               <globalClassificationLevel1>EU</globalClassificationLevel1>
            </xsl:if>
            <xsl:if test="string-length(//*[local-name()='queryResponse']/*[local-name()='result']/*[local-name()='records']/*[local-name()='ClassLevel2__c'])!=0">
               <globalClassificationLevel2>
                  <xsl:value-of select="//*[local-name()='queryResponse']/*[local-name()='result']/*[local-name()='records']/*[local-name()='ClassLevel2__c']" />
               </globalClassificationLevel2>
            </xsl:if>
            <xsl:if test="string-length(//*[local-name()='queryResponse']/*[local-name()='result']/*[local-name()='records']/*[local-name()='SDHGoldenVersion__c'])!=0">
               <goldenVersion>
                  <xsl:value-of select="//*[local-name()='queryResponse']/*[local-name()='result']/*[local-name()='records']/*[local-name()='SDHGoldenVersion__c']" />
               </goldenVersion>
            </xsl:if>
            <xsl:if test="string-length(//*[local-name()='queryResponse']/*[local-name()='result']/*[local-name()='records']/*[local-name()='MarketSegment__c'])!=0">
               <marketSegment>
                  <xsl:value-of select="//*[local-name()='queryResponse']/*[local-name()='result']/*[local-name()='records']/*[local-name()='MarketSegment__c']" />
               </marketSegment>
            </xsl:if>
            <xsl:if test="string-length(//*[local-name()='queryResponse']/*[local-name()='result']/*[local-name()='records']/*[local-name()='MarketSegment__c'])=0">
               <marketSegment>BDZ</marketSegment>
            </xsl:if>
            <xsl:if test="string-length($SEWorkIDAccOwner)!=0">
               <SEWorkIDAccOwner>
                  <xsl:value-of select="$SEWorkIDAccOwner" />
               </SEWorkIDAccOwner>
            </xsl:if>
            <xsl:if test="string-length(//*[local-name()='queryResponse']/*[local-name()='result']/*[local-name()='records']/*[local-name()='MarketSubSegment__c'])!=0">
               <marketSubSegment>
                  <xsl:value-of select="//*[local-name()='queryResponse']/*[local-name()='result']/*[local-name()='records']/*[local-name()='MarketSubSegment__c']" />
               </marketSubSegment>
            </xsl:if>
            <xsl:if test="string-length(//*[local-name()='queryResponse']/*[local-name()='result']/*[local-name()='records']/*[local-name()='Phone'])!=0">
               <phone>
                  <xsl:value-of select="//*[local-name()='queryResponse']/*[local-name()='result']/*[local-name()='records']/*[local-name()='Phone']" />
               </phone>
            </xsl:if>
            <xsl:if test="string-length(//*[local-name()='queryResponse']/*[local-name()='result']/*[local-name()='records']/*[local-name()='POBoxZip__c'])!=0">
               <postCode>
                  <xsl:value-of select="//*[local-name()='queryResponse']/*[local-name()='result']/*[local-name()='records']/*[local-name()='POBoxZip__c']" />
               </postCode>
            </xsl:if>
            <xsl:if test="string-length($sourceSystem)!=0">
               <sourceSystem>
                  <xsl:value-of select="$sourceSystem" />
               </sourceSystem>
            </xsl:if>
            <xsl:if test="string-length(//*[local-name()='queryResponse']/*[local-name()='result']/*[local-name()='records']/*[local-name()='Id'])!=0">
               <sourceSystemAccountID>
                  <xsl:value-of select="//*[local-name()='queryResponse']/*[local-name()='result']/*[local-name()='records']/*[local-name()='Id']" />
               </sourceSystemAccountID>
            </xsl:if>
            <xsl:if test="string-length(//*[local-name()='queryResponse']/*[local-name()='result']/*[local-name()='records']/*[local-name()='VATNumber__c'])!=0">
               <tax>
                  <xsl:value-of select="//*[local-name()='queryResponse']/*[local-name()='result']/*[local-name()='records']/*[local-name()='VATNumber__c']" />
               </tax>
            </xsl:if>
            <xsl:if test="string-length(//*[local-name()='queryResponse']/*[local-name()='result']/*[local-name()='records']/*[local-name()='Website'])!=0">
               <website>
                  <xsl:value-of select="//*[local-name()='queryResponse']/*[local-name()='result']/*[local-name()='records']/*[local-name()='Website']" />
               </website>
            </xsl:if>
            <xsl:if test="string-length(//*[local-name()='queryResponse']/*[local-name()='result']/*[local-name()='records']/*[local-name()='Name'])!=0">
               <siteName>
                  <xsl:value-of select="//*[local-name()='queryResponse']/*[local-name()='result']/*[local-name()='records']/*[local-name()='Name']" />
               </siteName>
            </xsl:if>
            <xsl:if test="string-length(//*[local-name()='queryResponse']/*[local-name()='result']/*[local-name()='records']/*[local-name()='POBox__c'])!=0">
               <poBox>
                  <xsl:value-of select="//*[local-name()='queryResponse']/*[local-name()='result']/*[local-name()='records']/*[local-name()='POBox__c']" />
               </poBox>
            </xsl:if>
            <xsl:if test="string-length($SourceAccountType)!=0">
               <sourceAccountType>
                  <xsl:value-of select="$SourceAccountType" />
               </sourceAccountType>
            </xsl:if>
            <xsl:if test="string-length($typePartner)!=0">
               <types>
                  <type>
                     <xsl:value-of select="$typePartner" />
                  </type>
               </types>
            </xsl:if>
         </organization>
         <xsl:if test="string-length(//*[local-name()='tempLineItem']/*[local-name()='lineItem'])!=0">
            <xsl:for-each select="//*[local-name()='tempLineItem']">
               <entitlement>
                  <xsl:if test="string-length(./*[local-name()='lineItem']/*[local-name()='E1EDL24']/*[local-name()='E1EDL43']/*[local-name()='BELNR'])!=0 and string-length(./*[local-name()='lineItem']/*[local-name()='E1EDL24']/*[local-name()='POSNR'])!=0">
                     <entitlementId>
                        <xsl:value-of select="concat('ENT-',./*[local-name()='lineItem']/*[local-name()='E1EDL24']/*[local-name()='E1EDL43']/*[local-name()='BELNR'],'-',./*[local-name()='lineItem']/*[local-name()='E1EDL24']/*[local-name()='POSNR'],'-',./*[local-name()='lineItem']/*[local-name()='randomNumber'])" />
                     </entitlementId>
                  </xsl:if>
                  <xsl:if test="string-length(./*[local-name()='lineItem']/*[local-name()='E1EDL24']/*[local-name()='ARKTX'])!=0">
                     <description>
                        <xsl:value-of select="./*[local-name()='lineItem']/*[local-name()='E1EDL24']/*[local-name()='ARKTX']" />
                     </description>
                  </xsl:if>
                  <xsl:if test="string-length($firstStructure)!=0 or string-length($thirdStructure)!=0">
                     <shipToEmail>
                        <xsl:value-of select="concat($firstStructure,$thirdStructure)" />
                     </shipToEmail>
                  </xsl:if>
                  <xsl:if test="string-length($firstStructure)=0 and string-length($thirdStructure)=0">
                     <shipToEmail>
                        <xsl:value-of select="//*[local-name()='ZSHPORD']/*[local-name()='IDOC']/*[local-name()='E1EDL20']/*[local-name()='E1ADRM1'][*[local-name()='PARTNER_Q']='AG']/*[local-name()='E_MAIL']" />
                     </shipToEmail>
                  </xsl:if>
                  <xsl:if test="//*[local-name()='ZSHPORD']/*[local-name()='IDOC']/*[local-name()='E1EDL20']/*[local-name()='E1ADRM1']/*[local-name()='PARTNER_Q']='WE'">
                     <shipToAddress>
                        <xsl:value-of select="concat(//*[local-name()='ZSHPORD']/*[local-name()='IDOC']/*[local-name()='E1EDL20']/*[local-name()='E1ADRM1'][*[local-name()='PARTNER_Q']='WE']/*[local-name()='STREET1'],',',//*[local-name()='ZSHPORD']/*[local-name()='IDOC']/*[local-name()='E1EDL20']/*[local-name()='E1ADRM1'][*[local-name()='PARTNER_Q']='WE']/*[local-name()='POSTL_COD1'],',',//*[local-name()='ZSHPORD']/*[local-name()='IDOC']/*[local-name()='E1EDL20']/*[local-name()='E1ADRM1'][*[local-name()='PARTNER_Q']='WE']/*[local-name()='CITY1'],',',//*[local-name()='ZSHPORD']/*[local-name()='IDOC']/*[local-name()='E1EDL20']/*[local-name()='E1ADRM1'][*[local-name()='PARTNER_Q']='WE']/*[local-name()='REGION'],',',//*[local-name()='ZSHPORD']/*[local-name()='IDOC']/*[local-name()='E1EDL20']/*[local-name()='E1ADRM1'][*[local-name()='PARTNER_Q']='WE']/*[local-name()='COUNTRY1'])" />
                     </shipToAddress>
                  </xsl:if>
                  <xsl:for-each select="./*[local-name()='lineItem']">
                     <xsl:if test="string-length(./*[local-name()='randomNumber'])!=0">
                        <lineItems>
                           <xsl:if test="string-length(./*[local-name()='E1EDL24']/*[local-name()='E1EDL43']/*[local-name()='BELNR'])!=0 and string-length(./*[local-name()='E1EDL24']/*[local-name()='POSNR'])!=0">
                              <lineItemId>
                                 <xsl:value-of select="concat('ACT-',./*[local-name()='E1EDL24']/*[local-name()='E1EDL43']/*[local-name()='BELNR'],'-',./*[local-name()='E1EDL24']/*[local-name()='POSNR'],'-',./*[local-name()='randomNumber'])" />
                              </lineItemId>
                           </xsl:if>
                           <xsl:if test="string-length(./*[local-name()='E1EDL24']/*[local-name()='MATNR'])!=0">
                              <partNumber>
                                 <xsl:value-of select="./*[local-name()='E1EDL24']/*[local-name()='MATNR']" />
                              </partNumber>
                           </xsl:if>
                           <licenseModelAttributesName>BusinessUnit</licenseModelAttributesName>
                           <licenseModelAttributesValue>60</licenseModelAttributesValue>
                           <xsl:if test="string-length(./*[local-name()='E1EDL24']/*[local-name()='E1EDL41']/*[local-name()='BSTNR'])!=0">
                              <licenseModelAttributesName1>PUR_REF</licenseModelAttributesName1>
                              <licenseModelAttributesValue1>
                                 <xsl:value-of select="./*[local-name()='E1EDL24']/*[local-name()='E1EDL41']/*[local-name()='BSTNR']" />
                              </licenseModelAttributesValue1>
                           </xsl:if>
                           <xsl:for-each select="//*[local-name()='ZSHPORD']/*[local-name()='IDOC']/*[local-name()='E1EDL20']/*[local-name()='E1EDT13']">
                              <xsl:if test="./*[local-name()='QUALF']=006">
                                 <fNPTimeZoneValue>
                                    <xsl:value-of select="./*[local-name()='TZONE_BEG']" />
                                 </fNPTimeZoneValue>
                              </xsl:if>
                           </xsl:for-each>
                           <xsl:if test="string-length(./*[local-name()='E1EDL24']/*[local-name()='E1EDL43']/*[local-name()='BELNR'])!=0">
                              <orderId>
                                 <xsl:value-of select="./*[local-name()='E1EDL24']/*[local-name()='E1EDL43']/*[local-name()='BELNR']" />
                              </orderId>
                           </xsl:if>
                           <xsl:if test="string-length(./*[local-name()='E1EDL24']/*[local-name()='POSNR'])!=0">
                              <orderLineNumber>
                                 <xsl:value-of select="./*[local-name()='E1EDL24']/*[local-name()='POSNR']" />
                              </orderLineNumber>
                           </xsl:if>
                           <xsl:if test="string-length(./*[local-name()='E1EDL24']/*[local-name()='LFIMG'])!=0">
                              <numberOfCopies>
                                 <xsl:value-of select="number(./*[local-name()='E1EDL24']/*[local-name()='LFIMG'])" />
                              </numberOfCopies>
                           </xsl:if>
                           <xsl:for-each select="//*[local-name()='ZSHPORD']/*[local-name()='IDOC']/*[local-name()='E1EDL20']/*[local-name()='E1EDT13']">
                              <xsl:if test="./*[local-name()='QUALF']=006 and string-length(./*[local-name()='NTANF'])!=0">
                                 <startDate>
                                    <xsl:value-of select="concat(substring(./*[local-name()='NTANF'],1,4),'-',substring(./*[local-name()='NTANF'],5,2),'-',substring(./*[local-name()='NTANF'],7,2))" />
                                 </startDate>
                              </xsl:if>
                              <xsl:if test="(./*[local-name()='QUALF'])=006 and string-length(./*[local-name()='NTANF'])=0">
                                 <startDate>
                                    <xsl:value-of select="$currentDate" />
                                 </startDate>
                              </xsl:if>
                           </xsl:for-each>
                           <xsl:if test="string-length(//*[local-name()='ZSHPORD']/*[local-name()='IDOC']/*[local-name()='E1EDL20']/*[local-name()='E1ADRM1'][*[local-name()='PARTNER_Q']='WE']/*[local-name()='PARTNER_ID'])!=0">
                              <lineItemAttributesName3>InstalledAt</lineItemAttributesName3>
                              <lineItemAttributesValue3>
                                 <xsl:value-of select="//*[local-name()='ZSHPORD']/*[local-name()='IDOC']/*[local-name()='E1EDL20']/*[local-name()='E1ADRM1'][*[local-name()='PARTNER_Q']='WE']/*[local-name()='PARTNER_ID']" />
                              </lineItemAttributesValue3>
                           </xsl:if>
                           <xsl:if test="string-length(./*[local-name()='E1EDL24']/*[local-name()='E1EDL43']/*[local-name()='POSNR'])!=0">
                              <lineItemAttributesName4>OrderLineNo</lineItemAttributesName4>
                              <lineItemAttributesValue4>
                                 <xsl:value-of select="./*[local-name()='E1EDL24']/*[local-name()='E1EDL43']/*[local-name()='POSNR']" />
                              </lineItemAttributesValue4>
                           </xsl:if>
                           <xsl:if test="string-length(//*[local-name()='ZSHPORD']/*[local-name()='IDOC']/*[local-name()='E1EDL20']/*[local-name()='VBELN'])!=0">
                              <lineItemAttributesName5>SAP_Delivery_Number</lineItemAttributesName5>
                              <lineItemAttributesValue5>
                                 <xsl:value-of select="//*[local-name()='ZSHPORD']/*[local-name()='IDOC']/*[local-name()='E1EDL20']/*[local-name()='VBELN']" />
                              </lineItemAttributesValue5>
                           </xsl:if>
                           <lineItemAttributesName7>SourceSystem</lineItemAttributesName7>
                           <lineItemAttributesValue7>
                              <xsl:value-of select="$sourceSystem" />
                           </lineItemAttributesValue7>
                        </lineItems>
                     </xsl:if>
                  </xsl:for-each>
                  <autoDeploy>true</autoDeploy>
                  <channelPartnerTierName>
                     <xsl:value-of select="concat('SAPSNB.',number(//*[local-name()='ZSHPORD']/*[local-name()='IDOC']/*[local-name()='E1EDL20']/*[local-name()='E1ADRM1'][*[local-name()='PARTNER_Q']='AG']/*[local-name()='PARTNER_ID']),'_','SAPSNB.',number(//*[local-name()='ZSHPORD']/*[local-name()='IDOC']/*[local-name()='E1EDL20']/*[local-name()='E1ADRM1'][*[local-name()='PARTNER_Q']='AG']/*[local-name()='PARTNER_ID']))" />
                  </channelPartnerTierName>
                  <xsl:if test="string-length(//*[local-name()='ZSHPORD']/*[local-name()='IDOC']/*[local-name()='EDI_DC40']/*[local-name()='DOCNUM'])!=0">
                     <entitlementAttributesName>SAPIDOCID</entitlementAttributesName>
                     <entitlementAttributesValue>
                        <xsl:value-of select="//*[local-name()='ZSHPORD']/*[local-name()='IDOC']/*[local-name()='EDI_DC40']/*[local-name()='DOCNUM']" />
                     </entitlementAttributesValue>
                  </xsl:if>
                  <entitlementAttributesName1>EntitlementType</entitlementAttributesName1>
                  <entitlementAttributesValue1>SoftwareAccount</entitlementAttributesValue1>
                  <entitlementAttributesName4>SourceSystem</entitlementAttributesName4>
                  <entitlementAttributesValue4>
                     <xsl:value-of select="$sourceSystem" />
                  </entitlementAttributesValue4>
                  <xsl:if test="string-length(./*[local-name()='lineItem']/*[local-name()='E1EDL24']/*[local-name()='E1EDL43']/*[local-name()='BELNR'])!=0">
                     <entitlementAttributesName5>ponumber</entitlementAttributesName5>
                     <entitlementAttributesValue5>
                        <xsl:value-of select="./*[local-name()='lineItem']/*[local-name()='E1EDL24']/*[local-name()='E1EDL43']/*[local-name()='BELNR']" />
                     </entitlementAttributesValue5>
                  </xsl:if>
               </entitlement>
            </xsl:for-each>
         </xsl:if>
         <xsl:if test="string-length(//*[local-name()='tempMaintainanceLineItem']/*[local-name()='maintainanceLineItem'])!=0">
            <xsl:for-each select="//*[local-name()='tempMaintainanceLineItem']">
               <entitlement>
                  <xsl:if test="string-length(./*[local-name()='maintainanceLineItem']/*[local-name()='E1EDL24']/*[local-name()='E1EDL43']/*[local-name()='BELNR'])!=0 and string-length(./*[local-name()='maintainanceLineItem']/*[local-name()='E1EDL24']/*[local-name()='E1EDL43']/*[local-name()='POSNR'])!=0">
                     <entitlementId>
                        <xsl:value-of select="concat('ENT-',./*[local-name()='maintainanceLineItem']/*[local-name()='E1EDL24']/*[local-name()='E1EDL43']/*[local-name()='BELNR'],'-',./*[local-name()='maintainanceLineItem']/*[local-name()='E1EDL24']/*[local-name()='E1EDL43']/*[local-name()='POSNR'],'-',./*[local-name()='maintainanceLineItem']/*[local-name()='randomNumber'])" />
                     </entitlementId>
                  </xsl:if>
                  <xsl:if test="string-length(./*[local-name()='maintainanceLineItem']/*[local-name()='E1EDL24']/*[local-name()='ARKTX'])!=0">
                     <description>
                        <xsl:value-of select="./*[local-name()='maintainanceLineItem']/*[local-name()='E1EDL24']/*[local-name()='ARKTX']" />
                     </description>
                  </xsl:if>
                  <xsl:if test="string-length($firstStructure)!=0 or string-length($thirdStructure)!=0">
                     <shipToEmail>
                        <xsl:value-of select="concat($firstStructure,$thirdStructure)" />
                     </shipToEmail>
                  </xsl:if>
                  <xsl:if test="string-length($firstStructure)=0 and string-length($thirdStructure)=0">
                     <shipToEmail>
                        <xsl:value-of select="//*[local-name()='ZSHPORD']/*[local-name()='IDOC']/*[local-name()='E1EDL20']/*[local-name()='E1ADRM1'][*[local-name()='PARTNER_Q']='AG']/*[local-name()='E_MAIL']" />
                     </shipToEmail>
                  </xsl:if>
                  <xsl:if test="//*[local-name()='ZSHPORD']/*[local-name()='IDOC']/*[local-name()='E1EDL20']/*[local-name()='E1ADRM1']/*[local-name()='PARTNER_Q']='WE'">
                     <shipToAddress>
                        <xsl:value-of select="concat(//*[local-name()='ZSHPORD']/*[local-name()='IDOC']/*[local-name()='E1EDL20']/*[local-name()='E1ADRM1'][*[local-name()='PARTNER_Q']='WE']/*[local-name()='STREET1'],',',//*[local-name()='ZSHPORD']/*[local-name()='IDOC']/*[local-name()='E1EDL20']/*[local-name()='E1ADRM1'][*[local-name()='PARTNER_Q']='WE']/*[local-name()='POSTL_COD1'],',',//*[local-name()='ZSHPORD']/*[local-name()='IDOC']/*[local-name()='E1EDL20']/*[local-name()='E1ADRM1'][*[local-name()='PARTNER_Q']='WE']/*[local-name()='CITY1'],',',//*[local-name()='ZSHPORD']/*[local-name()='IDOC']/*[local-name()='E1EDL20']/*[local-name()='E1ADRM1'][*[local-name()='PARTNER_Q']='WE']/*[local-name()='REGION'],',',//*[local-name()='ZSHPORD']/*[local-name()='IDOC']/*[local-name()='E1EDL20']/*[local-name()='E1ADRM1'][*[local-name()='PARTNER_Q']='WE']/*[local-name()='COUNTRY1'])" />
                     </shipToAddress>
                  </xsl:if>
                  <xsl:for-each select="./*[local-name()='maintainanceLineItem']">
                     <xsl:if test="string-length(./*[local-name()='randomNumber'])!=0">
                        <lineItems>
                           <xsl:if test="string-length(./*[local-name()='E1EDL24']/*[local-name()='E1EDL43']//*[local-name()='BELNR'])!=0 and string-length(./*[local-name()='E1EDL24']/*[local-name()='E1EDL43']/*[local-name()='POSNR'])!=0">
                              <lineItemId>
                                 <xsl:value-of select="concat('ACT-',./*[local-name()='E1EDL24']/*[local-name()='E1EDL43']/*[local-name()='BELNR'],'-',./*[local-name()='E1EDL24']/*[local-name()='E1EDL43']/*[local-name()='POSNR'],'-',./*[local-name()='randomNumber'])" />
                              </lineItemId>
                           </xsl:if>
                           <xsl:if test="string-length(./*[local-name()='partId'])!=0">
                              <partNumber>
                                 <xsl:value-of select="./*[local-name()='partId']" />
                              </partNumber>
                           </xsl:if>
                           <licenseModelAttributesName>BusinessUnit</licenseModelAttributesName>
                           <licenseModelAttributesValue>60</licenseModelAttributesValue>
                           <xsl:if test="string-length(./*[local-name()='E1EDL24']/*[local-name()='E1EDL41']/*[local-name()='BSTNR'])!=0">
                              <licenseModelAttributesName1>PUR_REF</licenseModelAttributesName1>
                              <licenseModelAttributesValue1>
                                 <xsl:value-of select="./*[local-name()='E1EDL24']/*[local-name()='E1EDL41']/*[local-name()='BSTNR']" />
                              </licenseModelAttributesValue1>
                           </xsl:if>
                           <xsl:for-each select="//*[local-name()='ZSHPORD']/*[local-name()='IDOC']/*[local-name()='E1EDL20']/*[local-name()='E1EDT13']">
                              <xsl:if test="./*[local-name()='QUALF']=006">
                                 <fNPTimeZoneValue>
                                    <xsl:value-of select="./*[local-name()='TZONE_BEG']" />
                                 </fNPTimeZoneValue>
                              </xsl:if>
                           </xsl:for-each>
                           <xsl:if test="string-length(./*[local-name()='E1EDL24']/*[local-name()='E1EDL43']/*[local-name()='BELNR'])!=0">
                              <orderId>
                                 <xsl:value-of select="./*[local-name()='E1EDL24']/*[local-name()='E1EDL43']/*[local-name()='BELNR']" />
                              </orderId>
                           </xsl:if>
                           <xsl:if test="string-length(./*[local-name()='E1EDL24']/*[local-name()='E1EDL43']/*[local-name()='POSNR'])!=0">
                              <orderLineNumber>
                                 <xsl:value-of select="./*[local-name()='E1EDL24']/*[local-name()='E1EDL43']/*[local-name()='POSNR']" />
                              </orderLineNumber>
                           </xsl:if>
                           <xsl:if test="string-length(./*[local-name()='E1EDL24']/*[local-name()='LFIMG'])!=0">
                              <numberOfCopies>
                                 <xsl:value-of select="number(./*[local-name()='E1EDL24']/*[local-name()='LFIMG'])" />
                              </numberOfCopies>
                           </xsl:if>
                           <xsl:for-each select="//*[local-name()='ZSHPORD']/*[local-name()='IDOC']/*[local-name()='E1EDL20']/*[local-name()='E1EDT13']">
                              <xsl:if test="./*[local-name()='QUALF']=006 and string-length(./*[local-name()='NTANF'])!=0">
                                 <startDate>
                                    <xsl:value-of select="concat(substring(./*[local-name()='NTANF'],1,4),'-',substring(./*[local-name()='NTANF'],5,2),'-',substring(./*[local-name()='NTANF'],7,2))" />
                                 </startDate>
                              </xsl:if>
                              <xsl:if test="(./*[local-name()='QUALF'])=006 and string-length(./*[local-name()='NTANF'])=0">
                                 <startDate>
                                    <xsl:value-of select="$currentDate" />
                                 </startDate>
                              </xsl:if>
                           </xsl:for-each>
                           <xsl:if test="string-length(//*[local-name()='ZSHPORD']/*[local-name()='IDOC']/*[local-name()='E1EDL20']/*[local-name()='E1ADRM1'][*[local-name()='PARTNER_Q']='WE']/*[local-name()='PARTNER_ID'])!=0">
                              <lineItemAttributesName3>InstalledAt</lineItemAttributesName3>
                              <lineItemAttributesValue3>
                                 <xsl:value-of select="//*[local-name()='ZSHPORD']/*[local-name()='IDOC']/*[local-name()='E1EDL20']/*[local-name()='E1ADRM1'][*[local-name()='PARTNER_Q']='WE']/*[local-name()='PARTNER_ID']" />
                              </lineItemAttributesValue3>
                           </xsl:if>
                           <xsl:if test="string-length(./*[local-name()='E1EDL24']/*[local-name()='E1EDL43']/*[local-name()='POSNR'])!=0">
                              <lineItemAttributesName4>OrderLineNo</lineItemAttributesName4>
                              <lineItemAttributesValue4>
                                 <xsl:value-of select="./*[local-name()='E1EDL24']/*[local-name()='E1EDL43']/*[local-name()='POSNR']" />
                              </lineItemAttributesValue4>
                           </xsl:if>
                           <xsl:if test="string-length(//*[local-name()='ZSHPORD']/*[local-name()='IDOC']/*[local-name()='E1EDL20']/*[local-name()='VBELN'])!=0">
                              <lineItemAttributesName5>SAP_Delivery_Number</lineItemAttributesName5>
                              <lineItemAttributesValue5>
                                 <xsl:value-of select="//*[local-name()='ZSHPORD']/*[local-name()='IDOC']/*[local-name()='E1EDL20']/*[local-name()='VBELN']" />
                              </lineItemAttributesValue5>
                           </xsl:if>
                           <lineItemAttributesName7>SourceSystem</lineItemAttributesName7>
                           <lineItemAttributesValue7>
                              <xsl:value-of select="$sourceSystem" />
                           </lineItemAttributesValue7>
                        </lineItems>
                        <maintenanceLineItems>
                           <xsl:if test="string-length(./*[local-name()='E1EDL24']/*[local-name()='E1EDL43']/*[local-name()='BELNR'])!=0 and string-length(./*[local-name()='E1EDL24']/*[local-name()='POSNR'])!=0">
                              <maintenanceLineItemsId>
                                 <xsl:value-of select="concat('MNT-',./*[local-name()='E1EDL24']/*[local-name()='E1EDL43']/*[local-name()='BELNR'],'-',./*[local-name()='E1EDL24']/*[local-name()='POSNR'],'-',./*[local-name()='randomNumber'])" />
                              </maintenanceLineItemsId>
                           </xsl:if>
                           <xsl:if test="string-length(./*[local-name()='E1EDL24']/*[local-name()='MATNR'])!=0">
                              <partNumber>
                                 <xsl:value-of select="./*[local-name()='E1EDL24']/*[local-name()='MATNR']" />
                              </partNumber>
                           </xsl:if>
                           <xsl:if test="string-length(./*[local-name()='E1EDL24']/*[local-name()='E1EDL43']/*[local-name()='BELNR'])!=0">
                              <orderId>
                                 <xsl:value-of select="./*[local-name()='E1EDL24']/*[local-name()='E1EDL43']/*[local-name()='BELNR']" />
                              </orderId>
                           </xsl:if>
                           <xsl:if test="string-length(./*[local-name()='E1EDL24']/*[local-name()='POSNR'])!=0">
                              <orderLineNumber>
                                 <xsl:value-of select="./*[local-name()='E1EDL24']/*[local-name()='POSNR']" />
                              </orderLineNumber>
                           </xsl:if>
                           <xsl:for-each select="//*[local-name()='ZSHPORD']/*[local-name()='IDOC']/*[local-name()='E1EDL20']/*[local-name()='E1EDT13']">
                              <xsl:if test="./*[local-name()='QUALF']=006 and string-length(./*[local-name()='NTANF'])!=0">
                                 <startDate>
                                    <xsl:value-of select="concat(substring(./*[local-name()='NTANF'],1,4),'-',substring(./*[local-name()='NTANF'],5,2),'-',substring(./*[local-name()='NTANF'],7,2))" />
                                 </startDate>
                              </xsl:if>
                              <xsl:if test="(./*[local-name()='QUALF'])=006 and string-length(./*[local-name()='NTANF'])=0">
                                 <startDate>
                                    <xsl:value-of select="$currentDate" />
                                 </startDate>
                              </xsl:if>
                           </xsl:for-each>
                           <xsl:if test="string-length($tempAddedYear)!=0">
                              <expirationDate>
                                 <xsl:value-of select="concat((substring($tempAddedYear,1,4)+1),substring($tempAddedYear,5,7))" />
                              </expirationDate>
                           </xsl:if>
                        </maintenanceLineItems>
                     </xsl:if>
                  </xsl:for-each>
                  <autoDeploy>true</autoDeploy>
                  <channelPartnerTierName>
                     <xsl:value-of select="concat('SAPSNB.',number(//*[local-name()='ZSHPORD']/*[local-name()='IDOC']/*[local-name()='E1EDL20']/*[local-name()='E1ADRM1'][*[local-name()='PARTNER_Q']='AG']/*[local-name()='PARTNER_ID']),'_','SAPSNB.',number(//*[local-name()='ZSHPORD']/*[local-name()='IDOC']/*[local-name()='E1EDL20']/*[local-name()='E1ADRM1'][*[local-name()='PARTNER_Q']='AG']/*[local-name()='PARTNER_ID']))" />
                  </channelPartnerTierName>
                  <xsl:if test="string-length(//*[local-name()='ZSHPORD']/*[local-name()='IDOC']/*[local-name()='EDI_DC40']/*[local-name()='DOCNUM'])!=0">
                     <entitlementAttributesName>SAPIDOCID</entitlementAttributesName>
                     <entitlementAttributesValue>
                        <xsl:value-of select="//*[local-name()='ZSHPORD']/*[local-name()='IDOC']/*[local-name()='EDI_DC40']/*[local-name()='DOCNUM']" />
                     </entitlementAttributesValue>
                  </xsl:if>
				  <entitlementAttributesName1>EntitlementType</entitlementAttributesName1>
                  <entitlementAttributesValue1>SoftwareAccount</entitlementAttributesValue1>
                  <entitlementAttributesName4>SourceSystem</entitlementAttributesName4>
                  <entitlementAttributesValue4>
                     <xsl:value-of select="$sourceSystem" />
                  </entitlementAttributesValue4>
                  <xsl:if test="string-length(./*[local-name()='maintainanceLineItem']/*[local-name()='E1EDL24']/*[local-name()='E1EDL43']/*[local-name()='BELNR'])!=0">
                     <entitlementAttributesName5>ponumber</entitlementAttributesName5>
                     <entitlementAttributesValue5>
                        <xsl:value-of select="./*[local-name()='maintainanceLineItem']/*[local-name()='E1EDL24']/*[local-name()='E1EDL43']/*[local-name()='BELNR']" />
                     </entitlementAttributesValue5>
                  </xsl:if>
               </entitlement>
            </xsl:for-each>
         </xsl:if>
      </fulfillEntitlements>
   </xsl:template>
</xsl:stylesheet>