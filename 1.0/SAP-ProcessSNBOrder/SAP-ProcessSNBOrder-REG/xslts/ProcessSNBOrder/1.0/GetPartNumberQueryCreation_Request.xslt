<xsl:stylesheet version="1.0"
	xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
	<xsl:param name="searchType" />
	<xsl:param name="pageNumber" />
	<xsl:param name="batchSize" />
	<xsl:template match="/">
		<xsl:variable name="max">
			<xsl:for-each
				select="./*[local-name()='getProductRelationshipsResponse']/*[local-name()='relationship']/*[local-name()='relatedProduct']/*[local-name()='primaryKeys']/*[local-name()='version']">
				<xsl:sort select="." data-type="number" order="descending" />
				<xsl:if test="position() = 1">
					<xsl:value-of select="." />
				</xsl:if>
			</xsl:for-each>
		</xsl:variable>
		<soapenv:Envelope xmlns:soapenv="http://schemas.xmlsoap.org/soap/envelope/"
			xmlns:oper="urn:com.macrovision:flexnet/operations">
			<soapenv:Header />
			<soapenv:Body>
				<oper:getPartNumbersQueryRequest>
					<oper:queryParams>
						<oper:productName>
							<oper:value>
								<xsl:value-of
									select="./*[local-name()='getProductRelationshipsResponse']/*[local-name()='relationship']/*[local-name()='relatedProduct']/*[local-name()='primaryKeys'][*[local-name()='version']=$max]/*[local-name()='name']/text()" />
							</oper:value>
							<oper:searchType>
								<xsl:value-of select="$searchType" />
							</oper:searchType>
						</oper:productName>
					</oper:queryParams>
					<oper:pageNumber>
						<xsl:value-of select="$pageNumber" />
					</oper:pageNumber>
					<oper:batchSize>
						<xsl:value-of select="$batchSize" />
					</oper:batchSize>
				</oper:getPartNumbersQueryRequest>
			</soapenv:Body>
		</soapenv:Envelope>
	</xsl:template>
</xsl:stylesheet>