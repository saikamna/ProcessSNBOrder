<xsl:stylesheet version="1.0"
	xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
	<xsl:template match="/">
		<tempStructure>
			<xsl:variable name="faultyPartNumber">
				<xsl:for-each
					select="//*[local-name()='getPartNumbersQueryToValidatePartNumberResponseList']/*[local-name()='getPartNumbersQueryResponse']">
					<xsl:if
						test="count(./*[local-name()='responseData']/*[local-name()='partNumber']/*[local-name()='partNumberIdentifier'])=0">
						false
					</xsl:if>
				</xsl:for-each>
			</xsl:variable>
			<faultyPartNumber>
				<xsl:value-of select="$faultyPartNumber" />
			</faultyPartNumber>
			<xsl:variable name="faultyPartNumberRenewal">
				<xsl:for-each
					select="//*[local-name()='getPartNumbersQueryForMaintainanceRenewalResponseList']/*[local-name()='getPartNumbersQueryResponse']">
					<xsl:if
						test="count(./*[local-name()='responseData']/*[local-name()='partNumber']/*[local-name()='partNumberIdentifier'])=0">
						false
					</xsl:if>
				</xsl:for-each>
			</xsl:variable>
			<faultyPartNumberRenewal>
				<xsl:value-of select="$faultyPartNumberRenewal" />
			</faultyPartNumberRenewal>
			<xsl:if
				test="count(//*[local-name()='getMaintenanceQueryResponseList']/*[local-name()='getMaintenanceQueryResponse'])!=0">
				<tempPartNumber>
					<xsl:for-each
						select="//*[local-name()='getMaintenanceQueryResponseList']/*[local-name()='getMaintenanceQueryResponse']">
						<xsl:value-of select="concat(./*[local-name()='MATNR']/text(),',')" />
					</xsl:for-each>
				</tempPartNumber>
			</xsl:if>
			<xsl:if
				test="count(//*[local-name()='getPartNumbersQueryForMaintainanceRenewalResponseList']/*[local-name()='getPartNumbersQueryResponse'])!=0">
				<tempPartNumber>
					<xsl:for-each
						select="//*[local-name()='getPartNumbersQueryForMaintainanceRenewalResponseList']/*[local-name()='getPartNumbersQueryResponse']">
						<xsl:value-of select="concat(./*[local-name()='MATNR']/text(),',')" />
					</xsl:for-each>
				</tempPartNumber>
			</xsl:if>
			<tempLineItem>
				<xsl:for-each
					select="//*[local-name()='getMaintenanceQueryResponseList']/*[local-name()='getMaintenanceQueryResponse']">
					<xsl:if
						test="count(./*[local-name()='responseData']/*[local-name()='maintenance'])=0">
						<xsl:variable name="partIdLineItem" select="./*[local-name()='MATNR']/text()" />
						<xsl:variable name="positionLineItem" select="(./*[local-name()='POSNR']/text())[1]" />
						<lineItem>
							<xsl:for-each
								select="//*[local-name()='ZSHPORD']/*[local-name()='IDOC']/*[local-name()='E1EDL20']/*[local-name()='E1EDL24']">
								<xsl:if test="(./*[local-name()='MATNR']/text())=$partIdLineItem">
									<xsl:if test="(./*[local-name()='POSNR']/text())=$positionLineItem">
										<xsl:copy-of select="." />
									</xsl:if>
								</xsl:if>
							</xsl:for-each>
							<randomNumber>
								<xsl:value-of select="./*[local-name()='randomNumber']" />
							</randomNumber>
						</lineItem>
					</xsl:if>
				</xsl:for-each>
			</tempLineItem>
			<tempMaintainanceLineItem>
				<xsl:for-each
					select="//*[local-name()='getMaintenanceQueryResponseList']/*[local-name()='getMaintenanceQueryResponse']">
					<xsl:if
						test="count(./*[local-name()='responseData']/*[local-name()='maintenance'])!=0">
						<xsl:variable name="partIdMaintainanceLineItem"
							select="./*[local-name()='MATNR']/text()" />
						<xsl:variable name="positionMaintainanceLineItem"
							select="(./*[local-name()='POSNR']/text())[1]" />
						<neha><xsl:value-of select="$positionMaintainanceLineItem" /></neha>
						<maintainanceLineItem>
							<xsl:for-each
								select="//*[local-name()='ZSHPORD']/*[local-name()='IDOC']/*[local-name()='E1EDL20']/*[local-name()='E1EDL24']">
								<xsl:if
									test="(./*[local-name()='MATNR']/text())=$partIdMaintainanceLineItem">
									<xsl:if
										test="(./*[local-name()='POSNR']/text())=$positionMaintainanceLineItem">
										<xsl:copy-of select="." />
									</xsl:if>
								</xsl:if>
							</xsl:for-each>
							<randomNumber>
								<xsl:value-of select="./*[local-name()='randomNumber']" />
							</randomNumber>
							<xsl:for-each
								select="../..//*[local-name()='getPartNumbersQueryResponseList']/*[local-name()='getPartNumbersQueryResponse']">
								<xsl:if
									test="(./*[local-name()='MATNR']/text())=$partIdMaintainanceLineItem">
									<xsl:if
										test="(./*[local-name()='POSNR']/text())=$positionMaintainanceLineItem">
										<uniqueId>
											<xsl:value-of
												select="./*[local-name()='responseData']/*[local-name()='partNumber']/*[local-name()='partNumberIdentifier']/*[local-name()='uniqueId']/text()" />
										</uniqueId>
										<partId>
											<xsl:value-of
												select="./*[local-name()='responseData']/*[local-name()='partNumber']/*[local-name()='partNumberIdentifier']/*[local-name()='primaryKeys']/*[local-name()='partId']/text()" />
										</partId>
									</xsl:if>
								</xsl:if>
							</xsl:for-each>
						</maintainanceLineItem>
					</xsl:if>
				</xsl:for-each>
			</tempMaintainanceLineItem>
			<tempMaintainanceRenewal>
				<xsl:for-each
					select="//*[local-name()='getPartNumbersQueryForMaintainanceRenewalResponseList']/*[local-name()='getPartNumbersQueryResponse']">
					<xsl:variable name="partIdMaintainanceRenewal" select="./*[local-name()='MATNR']/text()" />
					<xsl:variable name="positionMaintainanceRenewal"
						select="(./*[local-name()='POSNR']/text())[1]" />
					<maintainanceRenewal>
						<xsl:for-each
							select="//*[local-name()='ZSHPORD']/*[local-name()='IDOC']/*[local-name()='E1EDL20']/*[local-name()='E1EDL24']">
							<xsl:if
								test="(./*[local-name()='MATNR']/text())=$partIdMaintainanceRenewal">
								<xsl:if
									test="(./*[local-name()='POSNR']/text())=$positionMaintainanceRenewal">
									<xsl:copy-of select="." />
								</xsl:if>
							</xsl:if>
						</xsl:for-each>
						<randomNumber>
							<xsl:value-of select="./*[local-name()='randomNumber']" />
						</randomNumber>
						<name>
							<xsl:value-of
								select="./*[local-name()='responseData']/*[local-name()='partNumber']/*[local-name()='mappedProduct']/*[local-name()='primaryKeys']/*[local-name()='name']/text()" />
						</name>
						<version>
							<xsl:value-of
								select="./*[local-name()='responseData']/*[local-name()='partNumber']/*[local-name()='mappedProduct']/*[local-name()='primaryKeys']/*[local-name()='version']/text()" />
						</version>
					</maintainanceRenewal>
				</xsl:for-each>
			</tempMaintainanceRenewal>
		</tempStructure>
	</xsl:template>
</xsl:stylesheet>