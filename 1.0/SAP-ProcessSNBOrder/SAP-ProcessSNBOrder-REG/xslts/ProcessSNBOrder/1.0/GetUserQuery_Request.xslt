<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
   <xsl:param name="searchType"/>
   <xsl:param name="pageNumber"/>
   <xsl:param name="batchSize"/>
   <xsl:param name="orgType"/>
	<xsl:template match="/">
		<soapenv:Envelope xmlns:soapenv="http://schemas.xmlsoap.org/soap/envelope/" xmlns:oper="urn:com.macrovision:flexnet/operations">
			<soapenv:Header />
			<soapenv:Body>
				<oper:getUsersQueryRequest>
					<oper:queryParams>
						<oper:orgName>
							<oper:value>
								<xsl:value-of select="//*[local-name()='fulfillEntitlements']/*[local-name()='organization']/*[local-name()='name']/text()"/>
							</oper:value>
							<oper:searchType><xsl:value-of select="$searchType"/></oper:searchType>
						</oper:orgName>
						<oper:orgType><xsl:value-of select="$orgType"/></oper:orgType>
					</oper:queryParams>
					<oper:pageNumber><xsl:value-of select="$pageNumber"/></oper:pageNumber>
					<oper:batchSize><xsl:value-of select="$batchSize"/></oper:batchSize>
				</oper:getUsersQueryRequest>
			</soapenv:Body>
		</soapenv:Envelope>
	</xsl:template>
</xsl:stylesheet>