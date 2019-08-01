<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0"
	xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
	<xsl:param name="fileName" />
	<xsl:template match="/">
		<xsl:if
			test="(//*[local-name()='createEntitlementLineItemResponse']/*[local-name()='statusInfo']/*[local-name()='status']/text()='SUCCESS' or //*[local-name()='createEntitlementLineItemResponse']/*[local-name()='statusInfo']/*[local-name()='status']/text()='PARTIAL_FAILURE')">
			<confirmationFile>
				<xsl:for-each
					select="//*[local-name()='tempMaintainanceRenewal']/*[local-name()='maintainanceRenewal']">
					<xsl:value-of
						select="concat($fileName,';',substring(./*[local-name()='E1EDL24']/*[local-name()='E1EDL43']/*[local-name()='POSNR'],(string-length(./*[local-name()='E1EDL24']/*[local-name()='E1EDL43']/*[local-name()='POSNR'])-2),3),';',number(./*[local-name()='E1EDL24']/*[local-name()='LFIMG']))" />
					<xsl:text>&#xa;</xsl:text>
				</xsl:for-each>
			</confirmationFile>
		</xsl:if>
		<xsl:if
			test="count(//*[local-name()='fulfillEntitlementsResponse']/*[local-name()='entitlement'])!=0">
			<confirmationFile>
				<xsl:for-each
					select="//*[local-name()='fulfillEntitlementsResponse']/*[local-name()='entitlement']">
					<xsl:if test="count(./*[local-name()='failureReason'])=0">
						<xsl:variable name="myVar"
							select="./*[local-name()='entitlementId']" />
						<xsl:for-each
							select="../..//*[local-name()='fulfillEntitlements']/*[local-name()='entitlement']/*[local-name()='lineItems']">
							<xsl:if test="$myVar=./../*[local-name()='entitlementId']">
								<xsl:value-of
									select="concat($fileName,';',substring(substring-before(substring-after(substring-after(./*[local-name()='lineItemId'], '-'), '-'), '-'),(string-length(substring-before(substring-after(substring-after(./*[local-name()='lineItemId'], '-'), '-'), '-'))-2),3),';',number(./*[local-name()='numberOfCopies']))" />
								<xsl:text>&#xa;</xsl:text>
							</xsl:if>
						</xsl:for-each>
					</xsl:if>
				</xsl:for-each>
			</confirmationFile>
		</xsl:if>
	</xsl:template>
</xsl:stylesheet>