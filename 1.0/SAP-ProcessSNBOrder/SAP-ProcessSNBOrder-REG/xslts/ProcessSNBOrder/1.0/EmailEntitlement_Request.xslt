<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0"
	xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
	<xsl:param name="ignoreExistingEmailList" />
	<xsl:param name="ignoreExistingEmailList1" />
	<xsl:template match="/">
		<soapenv:Envelope xmlns:soapenv="http://schemas.xmlsoap.org/soap/envelope/"
			xmlns:oper="urn:com.macrovision:flexnet/operations">
			<soapenv:Header />
			<soapenv:Body>
				<oper:emailEntitlementRequest>
					<oper:entitlementIdentifier>
						<oper:primaryKeys>
							<xsl:choose>
								<xsl:when
									test="count(//*[local-name()='fulfillEntitlements']/*[local-name()='entitlement'][1]/*[local-name()='maintenanceLineItems'])=0">
									<oper:entitlementId>
										<xsl:value-of
											select="(//*[local-name()='fulfillEntitlements']/*[local-name()='entitlement']/*[local-name()='entitlementId']/text())[1]"></xsl:value-of>
									</oper:entitlementId>
								</xsl:when>
								<xsl:otherwise></xsl:otherwise>
							</xsl:choose>
						</oper:primaryKeys>
					</oper:entitlementIdentifier>
					<xsl:choose>
						<xsl:when
							test="count(//*[local-name()='getUsersQueryResponse']/*[local-name()='responseData']/*[local-name()='user'])!=0">
							<oper:ignoreExistingEmailList><xsl:value-of select="$ignoreExistingEmailList1" />
							</oper:ignoreExistingEmailList>
						</xsl:when>
						<xsl:otherwise>
							<oper:ignoreExistingEmailList><xsl:value-of select="$ignoreExistingEmailList" />
							</oper:ignoreExistingEmailList>
						</xsl:otherwise>
					</xsl:choose>
					<oper:emailIdList>
						<xsl:for-each
							select="//*[local-name()='getUsersQueryResponse']/*[local-name()='responseData']/*[local-name()='user']">
							<xsl:if
								test="(./*[local-name()='optIn']/text())='true' and (./*[local-name()='status']/text())='Active'">
								<oper:emailId>
									<xsl:value-of
										select="./*[local-name()='userIdentifier']/*[local-name()='primaryKeys']/*[local-name()='emailAddress']/text()"></xsl:value-of>
								</oper:emailId>
							</xsl:if>
						</xsl:for-each>
					</oper:emailIdList>
				</oper:emailEntitlementRequest>
			</soapenv:Body>
		</soapenv:Envelope>
	</xsl:template>
</xsl:stylesheet>