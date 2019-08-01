<xsl:stylesheet version="1.0"
	xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
	<xsl:param name="tempAddedYear" />
	<xsl:template match="/">
		<soapenv:Envelope xmlns:soapenv="http://schemas.xmlsoap.org/soap/envelope/"
			xmlns:oper="urn:com.macrovision:flexnet/operations">
			<soapenv:Header />
			<soapenv:Body>
				<oper:createEntitlementLineItemRequest>
					<xsl:for-each select="//*[local-name()='tempMaintainanceRenewal']/*[local-name()='maintainanceRenewal']">
						<xsl:variable name="sapOrderId">
							<xsl:for-each
								select="./*[local-name()='E1EDL24']/*[local-name()='E1TXTH9']">
								<xsl:if
									test="./*[local-name()='E1TXTP9']/*[local-name()='TDLINE'][contains(text(),'ENT')]">
									<xsl:value-of
										select="substring-before(substring-after(./*[local-name()='E1TXTP9']/*[local-name()='TDLINE']/text(),'-'),'-')" />
								</xsl:if>
							</xsl:for-each>
						</xsl:variable>
						<oper:lineItem>
							<xsl:if
								test="string-length(./*[local-name()='E1EDL24']/*[local-name()='E1TXTH9'])!=0">
								<oper:entitlementIdentifier>
									<oper:primaryKeys>
										<xsl:for-each
											select="./*[local-name()='E1EDL24']/*[local-name()='E1TXTH9']">
											<xsl:if
												test="./*[local-name()='E1TXTP9']/*[local-name()='TDLINE'][contains(text(),'ENT')]">
												<oper:entitlementId>
													<xsl:value-of
														select="./*[local-name()='E1TXTP9']/*[local-name()='TDLINE']" />
												</oper:entitlementId>
											</xsl:if>
										</xsl:for-each>
									</oper:primaryKeys>
								</oper:entitlementIdentifier>
							</xsl:if>
							<oper:maintenanceLineItems>
								<xsl:if
									test="string-length(./*[local-name()='E1EDL24']/*[local-name()='E1EDL43']/*[local-name()='BELNR'])!=0 and string-length(./*[local-name()='E1EDL24']/*[local-name()='E1EDL43']/*[local-name()='POSNR'])!=0">
									<oper:activationId>
										<oper:id>
											<xsl:value-of
												select="concat('MNT-',$sapOrderId,'-',./*[local-name()='E1EDL24']/*[local-name()='E1EDL43']/*[local-name()='POSNR'],'-',./*[local-name()='randomNumber'])" />
										</oper:id>
									</oper:activationId>
								</xsl:if>
								<oper:maintenanceProduct>
									<oper:primaryKeys>
										<xsl:if test="string-length(./*[local-name()='name'])!=0">
											<oper:name>
												<xsl:value-of select="./*[local-name()='name']" />
											</oper:name>
										</xsl:if>
										<xsl:if test="string-length(./*[local-name()='version'])!=0">
											<oper:version>
												<xsl:value-of select="./*[local-name()='version']" />
											</oper:version>
										</xsl:if>
									</oper:primaryKeys>
								</oper:maintenanceProduct>
								<xsl:if
									test="string-length(./*[local-name()='E1EDL24']/*[local-name()='MATNR'])!=0">
									<oper:partNumber>
										<oper:primaryKeys>
											<oper:partId>
												<xsl:value-of
													select="./*[local-name()='E1EDL24']/*[local-name()='MATNR']" />
											</oper:partId>
										</oper:primaryKeys>
									</oper:partNumber>
								</xsl:if>
								<xsl:if
									test="string-length(./*[local-name()='E1EDL24']/*[local-name()='E1EDL43']/*[local-name()='BELNR'])!=0">
									<oper:orderId>
										<xsl:value-of
											select="./*[local-name()='E1EDL24']/*[local-name()='E1EDL43']/*[local-name()='BELNR']" />
									</oper:orderId>
								</xsl:if>
								<xsl:if
									test="string-length(./*[local-name()='E1EDL24']/*[local-name()='E1EDL43']/*[local-name()='POSNR'])!=0">
									<oper:orderLineNumber>
										<xsl:value-of
											select="./*[local-name()='E1EDL24']/*[local-name()='E1EDL43']/*[local-name()='POSNR']" />
									</oper:orderLineNumber>
								</xsl:if>
								<xsl:for-each
									select="//*[local-name()='ZSHPORD']/*[local-name()='IDOC']/*[local-name()='E1EDL20']/*[local-name()='E1EDT13']">
									<xsl:if test="./*[local-name()='QUALF']=006">
										<oper:startDate>
											<xsl:value-of
												select="concat(substring(./*[local-name()='NTANF'],1,4),'-',substring(./*[local-name()='NTANF'],5,2),'-',substring(./*[local-name()='NTANF'],7,2))" />
										</oper:startDate>
									</xsl:if>
								</xsl:for-each>
								<xsl:if test="string-length($tempAddedYear)!=0">
									<oper:expirationDate>
										<xsl:value-of
											select="concat((substring($tempAddedYear,1,4)+1),substring($tempAddedYear,5,7))" />
									</oper:expirationDate>
								</xsl:if>
								<xsl:if
									test="string-length(./*[local-name()='E1EDL24']/*[local-name()='E1TXTH9'])!=0">
									<oper:associatedLineItems>
										<oper:primaryKeys>
											<xsl:for-each
												select="./*[local-name()='E1EDL24']/*[local-name()='E1TXTH9']">
												<xsl:if
													test="./*[local-name()='E1TXTP9']/*[local-name()='TDLINE'][contains(text(),'ACT')]">
													<oper:activationId>
														<xsl:value-of
															select="./*[local-name()='E1TXTP9']/*[local-name()='TDLINE']" />
													</oper:activationId>
												</xsl:if>
											</xsl:for-each>
										</oper:primaryKeys>
									</oper:associatedLineItems>
								</xsl:if>
							</oper:maintenanceLineItems>
							<oper:autoDeploy>true</oper:autoDeploy>
						</oper:lineItem>
					</xsl:for-each>
				</oper:createEntitlementLineItemRequest>
			</soapenv:Body>
		</soapenv:Envelope>
	</xsl:template>
</xsl:stylesheet>