<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0"
	xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
	<xsl:template match="/">
		<errorResponse>
			<xsl:if
				test="string-length(//*[local-name()='fulfillEntitlementsResponse']/*[local-name()='entitlement']/*[local-name()='failureReason'])!=0">
				<xsl:for-each
					select="//*[local-name()='fulfillEntitlementsResponse']/*[local-name()='entitlement']">
					<xsl:if test="string-length(./*[local-name()='failureReason'])!=0">
						<xsl:value-of select="./*[local-name()='failureReason']/text()" />
					</xsl:if>
				</xsl:for-each>
			</xsl:if>
			<xsl:if
				test="string-length(//*[local-name()='createEntitlementLineItemResponse']/*[local-name()='failedData']/*[local-name()='failedLineItemData']/*[local-name()='reason'])!=0">
				<xsl:for-each
					select="//*[local-name()='createEntitlementLineItemResponse']/*[local-name()='failedData']/*[local-name()='failedLineItemData']">
					<xsl:if test="string-length(./*[local-name()='reason'])!=0">
						<xsl:value-of select="./*[local-name()='reason']/text()" />
					</xsl:if>
					<xsl:text>&#xa;</xsl:text>
					<xsl:text>&#xa;</xsl:text>
				</xsl:for-each>
			</xsl:if>
		</errorResponse>
	</xsl:template>
</xsl:stylesheet>