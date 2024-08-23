USE [OpenLibrary-LibraryOfCongress-PREMIS]
GO

IF EXISTS (SELECT * FROM DBO.SYSOBJECTS WHERE ID = OBJECT_ID(N'[OpenLibrary-LibraryOfCongress-PREMIS].[dbo].[creatingApplication]') AND OBJECTPROPERTY(ID, N'ISUSERTABLE') = 1) BEGIN DROP TABLE [OpenLibrary-LibraryOfCongress-PREMIS].[dbo].[creatingApplication]END ;

IF EXISTS (SELECT * FROM DBO.SYSOBJECTS WHERE ID = OBJECT_ID(N'[OpenLibrary-LibraryOfCongress-PREMIS].[dbo].[copyrightDocumentationIdentifier]') AND OBJECTPROPERTY(ID, N'ISUSERTABLE') = 1) BEGIN DROP TABLE [OpenLibrary-LibraryOfCongress-PREMIS].[dbo].[copyrightDocumentationIdentifier]END ;

IF EXISTS (SELECT * FROM DBO.SYSOBJECTS WHERE ID = OBJECT_ID(N'[OpenLibrary-LibraryOfCongress-PREMIS].[dbo].[copyrightDocumentationIdentifierType]') AND OBJECTPROPERTY(ID, N'ISUSERTABLE') = 1) BEGIN DROP TABLE [OpenLibrary-LibraryOfCongress-PREMIS].[dbo].[copyrightDocumentationIdentifierType]END ;

IF EXISTS (SELECT * FROM DBO.SYSOBJECTS WHERE ID = OBJECT_ID(N'[OpenLibrary-LibraryOfCongress-PREMIS].[dbo].[copyrightJurisdiction]') AND OBJECTPROPERTY(ID, N'ISUSERTABLE') = 1) BEGIN DROP TABLE [OpenLibrary-LibraryOfCongress-PREMIS].[dbo].[copyrightJurisdiction]END ;

IF EXISTS (SELECT * FROM DBO.SYSOBJECTS WHERE ID = OBJECT_ID(N'[OpenLibrary-LibraryOfCongress-PREMIS].[dbo].[environmentCharacteristic]') AND OBJECTPROPERTY(ID, N'ISUSERTABLE') = 1) BEGIN DROP TABLE [OpenLibrary-LibraryOfCongress-PREMIS].[dbo].[environmentCharacteristic]END ;

IF EXISTS (SELECT * FROM DBO.SYSOBJECTS WHERE ID = OBJECT_ID(N'[OpenLibrary-LibraryOfCongress-PREMIS].[dbo].[environmentDesignation]') AND OBJECTPROPERTY(ID, N'ISUSERTABLE') = 1) BEGIN DROP TABLE [OpenLibrary-LibraryOfCongress-PREMIS].[dbo].[environmentDesignation]END ;

IF EXISTS (SELECT * FROM DBO.SYSOBJECTS WHERE ID = OBJECT_ID(N'[OpenLibrary-LibraryOfCongress-PREMIS].[dbo].[copyrightDocumentationRole]') AND OBJECTPROPERTY(ID, N'ISUSERTABLE') = 1) BEGIN DROP TABLE [OpenLibrary-LibraryOfCongress-PREMIS].[dbo].[copyrightDocumentationRole]END ;

IF EXISTS (SELECT * FROM DBO.SYSOBJECTS WHERE ID = OBJECT_ID(N'[OpenLibrary-LibraryOfCongress-PREMIS].[dbo].[creatingApplicationName]') AND OBJECTPROPERTY(ID, N'ISUSERTABLE') = 1) BEGIN DROP TABLE [OpenLibrary-LibraryOfCongress-PREMIS].[dbo].[creatingApplicationName]END ;

IF EXISTS (SELECT * FROM DBO.SYSOBJECTS WHERE ID = OBJECT_ID(N'[OpenLibrary-LibraryOfCongress-PREMIS].[dbo].[copyrightInformation]') AND OBJECTPROPERTY(ID, N'ISUSERTABLE') = 1) BEGIN DROP TABLE [OpenLibrary-LibraryOfCongress-PREMIS].[dbo].[copyrightInformation]END ;

IF EXISTS (SELECT * FROM DBO.SYSOBJECTS WHERE ID = OBJECT_ID(N'[OpenLibrary-LibraryOfCongress-PREMIS].[dbo].[copyrightStatus]') AND OBJECTPROPERTY(ID, N'ISUSERTABLE') = 1) BEGIN DROP TABLE [OpenLibrary-LibraryOfCongress-PREMIS].[dbo].[copyrightStatus]END ;

IF EXISTS (SELECT * FROM DBO.SYSOBJECTS WHERE ID = OBJECT_ID(N'[OpenLibrary-LibraryOfCongress-PREMIS].[dbo].[eventOutcomeDetail]') AND OBJECTPROPERTY(ID, N'ISUSERTABLE') = 1) BEGIN DROP TABLE [OpenLibrary-LibraryOfCongress-PREMIS].[dbo].[eventOutcomeDetail]END ;

IF EXISTS (SELECT * FROM DBO.SYSOBJECTS WHERE ID = OBJECT_ID(N'[OpenLibrary-LibraryOfCongress-PREMIS].[dbo].[relatedObjectIdentifier]') AND OBJECTPROPERTY(ID, N'ISUSERTABLE') = 1) BEGIN DROP TABLE [OpenLibrary-LibraryOfCongress-PREMIS].[dbo].[relatedObjectIdentifier]END ;

IF EXISTS (SELECT * FROM DBO.SYSOBJECTS WHERE ID = OBJECT_ID(N'[OpenLibrary-LibraryOfCongress-PREMIS].[dbo].[signatureMethod]') AND OBJECTPROPERTY(ID, N'ISUSERTABLE') = 1) BEGIN DROP TABLE [OpenLibrary-LibraryOfCongress-PREMIS].[dbo].[signatureMethod]END ;

IF EXISTS (SELECT * FROM DBO.SYSOBJECTS WHERE ID = OBJECT_ID(N'[OpenLibrary-LibraryOfCongress-PREMIS].[dbo].[swType]') AND OBJECTPROPERTY(ID, N'ISUSERTABLE') = 1) BEGIN DROP TABLE [OpenLibrary-LibraryOfCongress-PREMIS].[dbo].[swType]END ;

IF EXISTS (SELECT * FROM DBO.SYSOBJECTS WHERE ID = OBJECT_ID(N'[OpenLibrary-LibraryOfCongress-PREMIS].[dbo].[relatedEnvironmentPurpose]') AND OBJECTPROPERTY(ID, N'ISUSERTABLE') = 1) BEGIN DROP TABLE [OpenLibrary-LibraryOfCongress-PREMIS].[dbo].[relatedEnvironmentPurpose]END ;

IF EXISTS (SELECT * FROM DBO.SYSOBJECTS WHERE ID = OBJECT_ID(N'[OpenLibrary-LibraryOfCongress-PREMIS].[dbo].[significantPropertiesType]') AND OBJECTPROPERTY(ID, N'ISUSERTABLE') = 1) BEGIN DROP TABLE [OpenLibrary-LibraryOfCongress-PREMIS].[dbo].[significantPropertiesType]END ;

IF EXISTS (SELECT * FROM DBO.SYSOBJECTS WHERE ID = OBJECT_ID(N'[OpenLibrary-LibraryOfCongress-PREMIS].[dbo].[signer]') AND OBJECTPROPERTY(ID, N'ISUSERTABLE') = 1) BEGIN DROP TABLE [OpenLibrary-LibraryOfCongress-PREMIS].[dbo].[signer]END ;

IF EXISTS (SELECT * FROM DBO.SYSOBJECTS WHERE ID = OBJECT_ID(N'[OpenLibrary-LibraryOfCongress-PREMIS].[dbo].[relatedEventIdentifierType]') AND OBJECTPROPERTY(ID, N'ISUSERTABLE') = 1) BEGIN DROP TABLE [OpenLibrary-LibraryOfCongress-PREMIS].[dbo].[relatedEventIdentifierType]END ;

IF EXISTS (SELECT * FROM DBO.SYSOBJECTS WHERE ID = OBJECT_ID(N'[OpenLibrary-LibraryOfCongress-PREMIS].[dbo].[relatedEnvironmentCharacteristic]') AND OBJECTPROPERTY(ID, N'ISUSERTABLE') = 1) BEGIN DROP TABLE [OpenLibrary-LibraryOfCongress-PREMIS].[dbo].[relatedEnvironmentCharacteristic]END ;

IF EXISTS (SELECT * FROM DBO.SYSOBJECTS WHERE ID = OBJECT_ID(N'[OpenLibrary-LibraryOfCongress-PREMIS].[dbo].[signatureEncoding]') AND OBJECTPROPERTY(ID, N'ISUSERTABLE') = 1) BEGIN DROP TABLE [OpenLibrary-LibraryOfCongress-PREMIS].[dbo].[signatureEncoding]END ;

IF EXISTS (SELECT * FROM DBO.SYSOBJECTS WHERE ID = OBJECT_ID(N'[OpenLibrary-LibraryOfCongress-PREMIS].[dbo].[preservationLevelRole]') AND OBJECTPROPERTY(ID, N'ISUSERTABLE') = 1) BEGIN DROP TABLE [OpenLibrary-LibraryOfCongress-PREMIS].[dbo].[preservationLevelRole]END ;

IF EXISTS (SELECT * FROM DBO.SYSOBJECTS WHERE ID = OBJECT_ID(N'[OpenLibrary-LibraryOfCongress-PREMIS].[dbo].[storageMedium]') AND OBJECTPROPERTY(ID, N'ISUSERTABLE') = 1) BEGIN DROP TABLE [OpenLibrary-LibraryOfCongress-PREMIS].[dbo].[storageMedium]END ;

IF EXISTS (SELECT * FROM DBO.SYSOBJECTS WHERE ID = OBJECT_ID(N'[OpenLibrary-LibraryOfCongress-PREMIS].[dbo].[swDependency]') AND OBJECTPROPERTY(ID, N'ISUSERTABLE') = 1) BEGIN DROP TABLE [OpenLibrary-LibraryOfCongress-PREMIS].[dbo].[swDependency]END ;

IF EXISTS (SELECT * FROM DBO.SYSOBJECTS WHERE ID = OBJECT_ID(N'[OpenLibrary-LibraryOfCongress-PREMIS].[dbo].[relatedObjectIdentifierType]') AND OBJECTPROPERTY(ID, N'ISUSERTABLE') = 1) BEGIN DROP TABLE [OpenLibrary-LibraryOfCongress-PREMIS].[dbo].[relatedObjectIdentifierType]END ;

IF EXISTS (SELECT * FROM DBO.SYSOBJECTS WHERE ID = OBJECT_ID(N'[OpenLibrary-LibraryOfCongress-PREMIS].[dbo].[signature]') AND OBJECTPROPERTY(ID, N'ISUSERTABLE') = 1) BEGIN DROP TABLE [OpenLibrary-LibraryOfCongress-PREMIS].[dbo].[signature]END ;

IF EXISTS (SELECT * FROM DBO.SYSOBJECTS WHERE ID = OBJECT_ID(N'[OpenLibrary-LibraryOfCongress-PREMIS].[dbo].[relatedEventIdentifier]') AND OBJECTPROPERTY(ID, N'ISUSERTABLE') = 1) BEGIN DROP TABLE [OpenLibrary-LibraryOfCongress-PREMIS].[dbo].[relatedEventIdentifier]END ;

IF EXISTS (SELECT * FROM DBO.SYSOBJECTS WHERE ID = OBJECT_ID(N'[OpenLibrary-LibraryOfCongress-PREMIS].[dbo].[signatureValidationRules]') AND OBJECTPROPERTY(ID, N'ISUSERTABLE') = 1) BEGIN DROP TABLE [OpenLibrary-LibraryOfCongress-PREMIS].[dbo].[signatureValidationRules]END ;

IF EXISTS (SELECT * FROM DBO.SYSOBJECTS WHERE ID = OBJECT_ID(N'[OpenLibrary-LibraryOfCongress-PREMIS].[dbo].[swName]') AND OBJECTPROPERTY(ID, N'ISUSERTABLE') = 1) BEGIN DROP TABLE [OpenLibrary-LibraryOfCongress-PREMIS].[dbo].[swName]END ;

IF EXISTS (SELECT * FROM DBO.SYSOBJECTS WHERE ID = OBJECT_ID(N'[OpenLibrary-LibraryOfCongress-PREMIS].[dbo].[significantProperties]') AND OBJECTPROPERTY(ID, N'ISUSERTABLE') = 1) BEGIN DROP TABLE [OpenLibrary-LibraryOfCongress-PREMIS].[dbo].[significantProperties]END ;

IF EXISTS (SELECT * FROM DBO.SYSOBJECTS WHERE ID = OBJECT_ID(N'[OpenLibrary-LibraryOfCongress-PREMIS].[dbo].[relationshipType]') AND OBJECTPROPERTY(ID, N'ISUSERTABLE') = 1) BEGIN DROP TABLE [OpenLibrary-LibraryOfCongress-PREMIS].[dbo].[relationshipType]END ;

IF EXISTS (SELECT * FROM DBO.SYSOBJECTS WHERE ID = OBJECT_ID(N'[OpenLibrary-LibraryOfCongress-PREMIS].[dbo].[relationshipSubType]') AND OBJECTPROPERTY(ID, N'ISUSERTABLE') = 1) BEGIN DROP TABLE [OpenLibrary-LibraryOfCongress-PREMIS].[dbo].[relationshipSubType]END ;

IF EXISTS (SELECT * FROM DBO.SYSOBJECTS WHERE ID = OBJECT_ID(N'[OpenLibrary-LibraryOfCongress-PREMIS].[dbo].[linkingAgentIdentifier]') AND OBJECTPROPERTY(ID, N'ISUSERTABLE') = 1) BEGIN DROP TABLE [OpenLibrary-LibraryOfCongress-PREMIS].[dbo].[linkingAgentIdentifier]END ;

IF EXISTS (SELECT * FROM DBO.SYSOBJECTS WHERE ID = OBJECT_ID(N'[OpenLibrary-LibraryOfCongress-PREMIS].[dbo].[linkingAgentIdentifierType]') AND OBJECTPROPERTY(ID, N'ISUSERTABLE') = 1) BEGIN DROP TABLE [OpenLibrary-LibraryOfCongress-PREMIS].[dbo].[linkingAgentIdentifierType]END ;

IF EXISTS (SELECT * FROM DBO.SYSOBJECTS WHERE ID = OBJECT_ID(N'[OpenLibrary-LibraryOfCongress-PREMIS].[dbo].[environmentPurpose]') AND OBJECTPROPERTY(ID, N'ISUSERTABLE') = 1) BEGIN DROP TABLE [OpenLibrary-LibraryOfCongress-PREMIS].[dbo].[environmentPurpose]END ;

IF EXISTS (SELECT * FROM DBO.SYSOBJECTS WHERE ID = OBJECT_ID(N'[OpenLibrary-LibraryOfCongress-PREMIS].[dbo].[environmentRegistry]') AND OBJECTPROPERTY(ID, N'ISUSERTABLE') = 1) BEGIN DROP TABLE [OpenLibrary-LibraryOfCongress-PREMIS].[dbo].[environmentRegistry]END ;

IF EXISTS (SELECT * FROM DBO.SYSOBJECTS WHERE ID = OBJECT_ID(N'[OpenLibrary-LibraryOfCongress-PREMIS].[dbo].[environmentRegistryRole]') AND OBJECTPROPERTY(ID, N'ISUSERTABLE') = 1) BEGIN DROP TABLE [OpenLibrary-LibraryOfCongress-PREMIS].[dbo].[environmentRegistryRole]END ;

IF EXISTS (SELECT * FROM DBO.SYSOBJECTS WHERE ID = OBJECT_ID(N'[OpenLibrary-LibraryOfCongress-PREMIS].[dbo].[event]') AND OBJECTPROPERTY(ID, N'ISUSERTABLE') = 1) BEGIN DROP TABLE [OpenLibrary-LibraryOfCongress-PREMIS].[dbo].[event]END ;

IF EXISTS (SELECT * FROM DBO.SYSOBJECTS WHERE ID = OBJECT_ID(N'[OpenLibrary-LibraryOfCongress-PREMIS].[dbo].[environmentFunction]') AND OBJECTPROPERTY(ID, N'ISUSERTABLE') = 1) BEGIN DROP TABLE [OpenLibrary-LibraryOfCongress-PREMIS].[dbo].[environmentFunction]END ;

IF EXISTS (SELECT * FROM DBO.SYSOBJECTS WHERE ID = OBJECT_ID(N'[OpenLibrary-LibraryOfCongress-PREMIS].[dbo].[environmentName]') AND OBJECTPROPERTY(ID, N'ISUSERTABLE') = 1) BEGIN DROP TABLE [OpenLibrary-LibraryOfCongress-PREMIS].[dbo].[environmentName]END ;

IF EXISTS (SELECT * FROM DBO.SYSOBJECTS WHERE ID = OBJECT_ID(N'[OpenLibrary-LibraryOfCongress-PREMIS].[dbo].[environmentFunctionType]') AND OBJECTPROPERTY(ID, N'ISUSERTABLE') = 1) BEGIN DROP TABLE [OpenLibrary-LibraryOfCongress-PREMIS].[dbo].[environmentFunctionType]END ;

IF EXISTS (SELECT * FROM DBO.SYSOBJECTS WHERE ID = OBJECT_ID(N'[OpenLibrary-LibraryOfCongress-PREMIS].[dbo].[linkingEventIdentifierType]') AND OBJECTPROPERTY(ID, N'ISUSERTABLE') = 1) BEGIN DROP TABLE [OpenLibrary-LibraryOfCongress-PREMIS].[dbo].[linkingEventIdentifierType]END ;

IF EXISTS (SELECT * FROM DBO.SYSOBJECTS WHERE ID = OBJECT_ID(N'[OpenLibrary-LibraryOfCongress-PREMIS].[dbo].[linkingEnvironmentRole]') AND OBJECTPROPERTY(ID, N'ISUSERTABLE') = 1) BEGIN DROP TABLE [OpenLibrary-LibraryOfCongress-PREMIS].[dbo].[linkingEnvironmentRole]END ;

IF EXISTS (SELECT * FROM DBO.SYSOBJECTS WHERE ID = OBJECT_ID(N'[OpenLibrary-LibraryOfCongress-PREMIS].[dbo].[compositionLevel]') AND OBJECTPROPERTY(ID, N'ISUSERTABLE') = 1) BEGIN DROP TABLE [OpenLibrary-LibraryOfCongress-PREMIS].[dbo].[compositionLevel]END ;

IF EXISTS (SELECT * FROM DBO.SYSOBJECTS WHERE ID = OBJECT_ID(N'[OpenLibrary-LibraryOfCongress-PREMIS].[dbo].[agent]') AND OBJECTPROPERTY(ID, N'ISUSERTABLE') = 1) BEGIN DROP TABLE [OpenLibrary-LibraryOfCongress-PREMIS].[dbo].[agent]END ;

IF EXISTS (SELECT * FROM DBO.SYSOBJECTS WHERE ID = OBJECT_ID(N'[OpenLibrary-LibraryOfCongress-PREMIS].[dbo].[agentIdentifier]') AND OBJECTPROPERTY(ID, N'ISUSERTABLE') = 1) BEGIN DROP TABLE [OpenLibrary-LibraryOfCongress-PREMIS].[dbo].[agentIdentifier]END ;

IF EXISTS (SELECT * FROM DBO.SYSOBJECTS WHERE ID = OBJECT_ID(N'[OpenLibrary-LibraryOfCongress-PREMIS].[dbo].[linkingEventIdentifier]') AND OBJECTPROPERTY(ID, N'ISUSERTABLE') = 1) BEGIN DROP TABLE [OpenLibrary-LibraryOfCongress-PREMIS].[dbo].[linkingEventIdentifier]END ;

IF EXISTS (SELECT * FROM DBO.SYSOBJECTS WHERE ID = OBJECT_ID(N'[OpenLibrary-LibraryOfCongress-PREMIS].[dbo].[contentLocation]') AND OBJECTPROPERTY(ID, N'ISUSERTABLE') = 1) BEGIN DROP TABLE [OpenLibrary-LibraryOfCongress-PREMIS].[dbo].[contentLocation]END ;

IF EXISTS (SELECT * FROM DBO.SYSOBJECTS WHERE ID = OBJECT_ID(N'[OpenLibrary-LibraryOfCongress-PREMIS].[dbo].[contentLocationType]') AND OBJECTPROPERTY(ID, N'ISUSERTABLE') = 1) BEGIN DROP TABLE [OpenLibrary-LibraryOfCongress-PREMIS].[dbo].[contentLocationType]END ;

IF EXISTS (SELECT * FROM DBO.SYSOBJECTS WHERE ID = OBJECT_ID(N'[OpenLibrary-LibraryOfCongress-PREMIS].[dbo].[copyrightApplicableDates]') AND OBJECTPROPERTY(ID, N'ISUSERTABLE') = 1) BEGIN DROP TABLE [OpenLibrary-LibraryOfCongress-PREMIS].[dbo].[copyrightApplicableDates]END ;

IF EXISTS (SELECT * FROM DBO.SYSOBJECTS WHERE ID = OBJECT_ID(N'[OpenLibrary-LibraryOfCongress-PREMIS].[dbo].[agentIdentifierType]') AND OBJECTPROPERTY(ID, N'ISUSERTABLE') = 1) BEGIN DROP TABLE [OpenLibrary-LibraryOfCongress-PREMIS].[dbo].[agentIdentifierType]END ;

IF EXISTS (SELECT * FROM DBO.SYSOBJECTS WHERE ID = OBJECT_ID(N'[OpenLibrary-LibraryOfCongress-PREMIS].[dbo].[agentType]') AND OBJECTPROPERTY(ID, N'ISUSERTABLE') = 1) BEGIN DROP TABLE [OpenLibrary-LibraryOfCongress-PREMIS].[dbo].[agentType]END ;

IF EXISTS (SELECT * FROM DBO.SYSOBJECTS WHERE ID = OBJECT_ID(N'[OpenLibrary-LibraryOfCongress-PREMIS].[dbo].[linkingRightsStatementIdentifierType]') AND OBJECTPROPERTY(ID, N'ISUSERTABLE') = 1) BEGIN DROP TABLE [OpenLibrary-LibraryOfCongress-PREMIS].[dbo].[linkingRightsStatementIdentifierType]END ;

IF EXISTS (SELECT * FROM DBO.SYSOBJECTS WHERE ID = OBJECT_ID(N'[OpenLibrary-LibraryOfCongress-PREMIS].[dbo].[agentName]') AND OBJECTPROPERTY(ID, N'ISUSERTABLE') = 1) BEGIN DROP TABLE [OpenLibrary-LibraryOfCongress-PREMIS].[dbo].[agentName]END ;

IF EXISTS (SELECT * FROM DBO.SYSOBJECTS WHERE ID = OBJECT_ID(N'[OpenLibrary-LibraryOfCongress-PREMIS].[dbo].[act]') AND OBJECTPROPERTY(ID, N'ISUSERTABLE') = 1) BEGIN DROP TABLE [OpenLibrary-LibraryOfCongress-PREMIS].[dbo].[act]END ;

IF EXISTS (SELECT * FROM DBO.SYSOBJECTS WHERE ID = OBJECT_ID(N'[OpenLibrary-LibraryOfCongress-PREMIS].[dbo].[linkingRightsStatementIdentifier]') AND OBJECTPROPERTY(ID, N'ISUSERTABLE') = 1) BEGIN DROP TABLE [OpenLibrary-LibraryOfCongress-PREMIS].[dbo].[linkingRightsStatementIdentifier]END ;

IF EXISTS (SELECT * FROM DBO.SYSOBJECTS WHERE ID = OBJECT_ID(N'[OpenLibrary-LibraryOfCongress-PREMIS].[dbo].[linkingEnvironmentIdentifier]') AND OBJECTPROPERTY(ID, N'ISUSERTABLE') = 1) BEGIN DROP TABLE [OpenLibrary-LibraryOfCongress-PREMIS].[dbo].[linkingEnvironmentIdentifier]END ;

IF EXISTS (SELECT * FROM DBO.SYSOBJECTS WHERE ID = OBJECT_ID(N'[OpenLibrary-LibraryOfCongress-PREMIS].[dbo].[eventDetailInformation]') AND OBJECTPROPERTY(ID, N'ISUSERTABLE') = 1) BEGIN DROP TABLE [OpenLibrary-LibraryOfCongress-PREMIS].[dbo].[eventDetailInformation]END ;

IF EXISTS (SELECT * FROM DBO.SYSOBJECTS WHERE ID = OBJECT_ID(N'[OpenLibrary-LibraryOfCongress-PREMIS].[dbo].[eventIdentifier]') AND OBJECTPROPERTY(ID, N'ISUSERTABLE') = 1) BEGIN DROP TABLE [OpenLibrary-LibraryOfCongress-PREMIS].[dbo].[eventIdentifier]END ;

IF EXISTS (SELECT * FROM DBO.SYSOBJECTS WHERE ID = OBJECT_ID(N'[OpenLibrary-LibraryOfCongress-PREMIS].[dbo].[eventType]') AND OBJECTPROPERTY(ID, N'ISUSERTABLE') = 1) BEGIN DROP TABLE [OpenLibrary-LibraryOfCongress-PREMIS].[dbo].[eventType]END ;

IF EXISTS (SELECT * FROM DBO.SYSOBJECTS WHERE ID = OBJECT_ID(N'[OpenLibrary-LibraryOfCongress-PREMIS].[dbo].[eventIdentifierType]') AND OBJECTPROPERTY(ID, N'ISUSERTABLE') = 1) BEGIN DROP TABLE [OpenLibrary-LibraryOfCongress-PREMIS].[dbo].[eventIdentifierType]END ;

IF EXISTS (SELECT * FROM DBO.SYSOBJECTS WHERE ID = OBJECT_ID(N'[OpenLibrary-LibraryOfCongress-PREMIS].[dbo].[licenseApplicableDates]') AND OBJECTPROPERTY(ID, N'ISUSERTABLE') = 1) BEGIN DROP TABLE [OpenLibrary-LibraryOfCongress-PREMIS].[dbo].[licenseApplicableDates]END ;

IF EXISTS (SELECT * FROM DBO.SYSOBJECTS WHERE ID = OBJECT_ID(N'[OpenLibrary-LibraryOfCongress-PREMIS].[dbo].[licenseDocumentationIdentifierType]') AND OBJECTPROPERTY(ID, N'ISUSERTABLE') = 1) BEGIN DROP TABLE [OpenLibrary-LibraryOfCongress-PREMIS].[dbo].[licenseDocumentationIdentifierType]END ;

IF EXISTS (SELECT * FROM DBO.SYSOBJECTS WHERE ID = OBJECT_ID(N'[OpenLibrary-LibraryOfCongress-PREMIS].[dbo].[formatRegistryRole]') AND OBJECTPROPERTY(ID, N'ISUSERTABLE') = 1) BEGIN DROP TABLE [OpenLibrary-LibraryOfCongress-PREMIS].[dbo].[formatRegistryRole]END ;

IF EXISTS (SELECT * FROM DBO.SYSOBJECTS WHERE ID = OBJECT_ID(N'[OpenLibrary-LibraryOfCongress-PREMIS].[dbo].[formatRegistryKey]') AND OBJECTPROPERTY(ID, N'ISUSERTABLE') = 1) BEGIN DROP TABLE [OpenLibrary-LibraryOfCongress-PREMIS].[dbo].[formatRegistryKey]END ;

IF EXISTS (SELECT * FROM DBO.SYSOBJECTS WHERE ID = OBJECT_ID(N'[OpenLibrary-LibraryOfCongress-PREMIS].[dbo].[hwType]') AND OBJECTPROPERTY(ID, N'ISUSERTABLE') = 1) BEGIN DROP TABLE [OpenLibrary-LibraryOfCongress-PREMIS].[dbo].[hwType]END ;

IF EXISTS (SELECT * FROM DBO.SYSOBJECTS WHERE ID = OBJECT_ID(N'[OpenLibrary-LibraryOfCongress-PREMIS].[dbo].[licenseIdentifierType]') AND OBJECTPROPERTY(ID, N'ISUSERTABLE') = 1) BEGIN DROP TABLE [OpenLibrary-LibraryOfCongress-PREMIS].[dbo].[licenseIdentifierType]END ;

IF EXISTS (SELECT * FROM DBO.SYSOBJECTS WHERE ID = OBJECT_ID(N'[OpenLibrary-LibraryOfCongress-PREMIS].[dbo].[linkingObjectRole]') AND OBJECTPROPERTY(ID, N'ISUSERTABLE') = 1) BEGIN DROP TABLE [OpenLibrary-LibraryOfCongress-PREMIS].[dbo].[linkingObjectRole]END ;

IF EXISTS (SELECT * FROM DBO.SYSOBJECTS WHERE ID = OBJECT_ID(N'[OpenLibrary-LibraryOfCongress-PREMIS].[dbo].[linkingObjectIdentifier]') AND OBJECTPROPERTY(ID, N'ISUSERTABLE') = 1) BEGIN DROP TABLE [OpenLibrary-LibraryOfCongress-PREMIS].[dbo].[linkingObjectIdentifier]END ;

IF EXISTS (SELECT * FROM DBO.SYSOBJECTS WHERE ID = OBJECT_ID(N'[OpenLibrary-LibraryOfCongress-PREMIS].[dbo].[inhibitorTarget]') AND OBJECTPROPERTY(ID, N'ISUSERTABLE') = 1) BEGIN DROP TABLE [OpenLibrary-LibraryOfCongress-PREMIS].[dbo].[inhibitorTarget]END ;

IF EXISTS (SELECT * FROM DBO.SYSOBJECTS WHERE ID = OBJECT_ID(N'[OpenLibrary-LibraryOfCongress-PREMIS].[dbo].[licenseDocumentationRole]') AND OBJECTPROPERTY(ID, N'ISUSERTABLE') = 1) BEGIN DROP TABLE [OpenLibrary-LibraryOfCongress-PREMIS].[dbo].[licenseDocumentationRole]END ;

IF EXISTS (SELECT * FROM DBO.SYSOBJECTS WHERE ID = OBJECT_ID(N'[OpenLibrary-LibraryOfCongress-PREMIS].[dbo].[formatRegistry]') AND OBJECTPROPERTY(ID, N'ISUSERTABLE') = 1) BEGIN DROP TABLE [OpenLibrary-LibraryOfCongress-PREMIS].[dbo].[formatRegistry]END ;

IF EXISTS (SELECT * FROM DBO.SYSOBJECTS WHERE ID = OBJECT_ID(N'[OpenLibrary-LibraryOfCongress-PREMIS].[dbo].[licenseInformation]') AND OBJECTPROPERTY(ID, N'ISUSERTABLE') = 1) BEGIN DROP TABLE [OpenLibrary-LibraryOfCongress-PREMIS].[dbo].[licenseInformation]END ;

IF EXISTS (SELECT * FROM DBO.SYSOBJECTS WHERE ID = OBJECT_ID(N'[OpenLibrary-LibraryOfCongress-PREMIS].[dbo].[inhibitors]') AND OBJECTPROPERTY(ID, N'ISUSERTABLE') = 1) BEGIN DROP TABLE [OpenLibrary-LibraryOfCongress-PREMIS].[dbo].[inhibitors]END ;

IF EXISTS (SELECT * FROM DBO.SYSOBJECTS WHERE ID = OBJECT_ID(N'[OpenLibrary-LibraryOfCongress-PREMIS].[dbo].[formatRegistryName]') AND OBJECTPROPERTY(ID, N'ISUSERTABLE') = 1) BEGIN DROP TABLE [OpenLibrary-LibraryOfCongress-PREMIS].[dbo].[formatRegistryName]END ;

IF EXISTS (SELECT * FROM DBO.SYSOBJECTS WHERE ID = OBJECT_ID(N'[OpenLibrary-LibraryOfCongress-PREMIS].[dbo].[hwName]') AND OBJECTPROPERTY(ID, N'ISUSERTABLE') = 1) BEGIN DROP TABLE [OpenLibrary-LibraryOfCongress-PREMIS].[dbo].[hwName]END ;

IF EXISTS (SELECT * FROM DBO.SYSOBJECTS WHERE ID = OBJECT_ID(N'[OpenLibrary-LibraryOfCongress-PREMIS].[dbo].[inhibitorType]') AND OBJECTPROPERTY(ID, N'ISUSERTABLE') = 1) BEGIN DROP TABLE [OpenLibrary-LibraryOfCongress-PREMIS].[dbo].[inhibitorType]END ;

IF EXISTS (SELECT * FROM DBO.SYSOBJECTS WHERE ID = OBJECT_ID(N'[OpenLibrary-LibraryOfCongress-PREMIS].[dbo].[objectCharacteristics]') AND OBJECTPROPERTY(ID, N'ISUSERTABLE') = 1) BEGIN DROP TABLE [OpenLibrary-LibraryOfCongress-PREMIS].[dbo].[objectCharacteristics]END ;

IF EXISTS (SELECT * FROM DBO.SYSOBJECTS WHERE ID = OBJECT_ID(N'[OpenLibrary-LibraryOfCongress-PREMIS].[dbo].[messageDigestOriginator]') AND OBJECTPROPERTY(ID, N'ISUSERTABLE') = 1) BEGIN DROP TABLE [OpenLibrary-LibraryOfCongress-PREMIS].[dbo].[messageDigestOriginator]END ;

IF EXISTS (SELECT * FROM DBO.SYSOBJECTS WHERE ID = OBJECT_ID(N'[OpenLibrary-LibraryOfCongress-PREMIS].[dbo].[licenseDocumentationIdentifier]') AND OBJECTPROPERTY(ID, N'ISUSERTABLE') = 1) BEGIN DROP TABLE [OpenLibrary-LibraryOfCongress-PREMIS].[dbo].[licenseDocumentationIdentifier]END ;

IF EXISTS (SELECT * FROM DBO.SYSOBJECTS WHERE ID = OBJECT_ID(N'[OpenLibrary-LibraryOfCongress-PREMIS].[dbo].[objectIdentifier]') AND OBJECTPROPERTY(ID, N'ISUSERTABLE') = 1) BEGIN DROP TABLE [OpenLibrary-LibraryOfCongress-PREMIS].[dbo].[objectIdentifier]END ;

IF EXISTS (SELECT * FROM DBO.SYSOBJECTS WHERE ID = OBJECT_ID(N'[OpenLibrary-LibraryOfCongress-PREMIS].[dbo].[objectIdentifierType]') AND OBJECTPROPERTY(ID, N'ISUSERTABLE') = 1) BEGIN DROP TABLE [OpenLibrary-LibraryOfCongress-PREMIS].[dbo].[objectIdentifierType]END ;

IF EXISTS (SELECT * FROM DBO.SYSOBJECTS WHERE ID = OBJECT_ID(N'[OpenLibrary-LibraryOfCongress-PREMIS].[dbo].[format]') AND OBJECTPROPERTY(ID, N'ISUSERTABLE') = 1) BEGIN DROP TABLE [OpenLibrary-LibraryOfCongress-PREMIS].[dbo].[format]END ;

IF EXISTS (SELECT * FROM DBO.SYSOBJECTS WHERE ID = OBJECT_ID(N'[OpenLibrary-LibraryOfCongress-PREMIS].[dbo].[linkingAgentRole]') AND OBJECTPROPERTY(ID, N'ISUSERTABLE') = 1) BEGIN DROP TABLE [OpenLibrary-LibraryOfCongress-PREMIS].[dbo].[linkingAgentRole]END ;

IF EXISTS (SELECT * FROM DBO.SYSOBJECTS WHERE ID = OBJECT_ID(N'[OpenLibrary-LibraryOfCongress-PREMIS].[dbo].[messageDigestAlgorithm]') AND OBJECTPROPERTY(ID, N'ISUSERTABLE') = 1) BEGIN DROP TABLE [OpenLibrary-LibraryOfCongress-PREMIS].[dbo].[messageDigestAlgorithm]END ;

IF EXISTS (SELECT * FROM DBO.SYSOBJECTS WHERE ID = OBJECT_ID(N'[OpenLibrary-LibraryOfCongress-PREMIS].[dbo].[linkingObjectIdentifierType]') AND OBJECTPROPERTY(ID, N'ISUSERTABLE') = 1) BEGIN DROP TABLE [OpenLibrary-LibraryOfCongress-PREMIS].[dbo].[linkingObjectIdentifierType]END ;

IF EXISTS (SELECT * FROM DBO.SYSOBJECTS WHERE ID = OBJECT_ID(N'[OpenLibrary-LibraryOfCongress-PREMIS].[dbo].[fixity]') AND OBJECTPROPERTY(ID, N'ISUSERTABLE') = 1) BEGIN DROP TABLE [OpenLibrary-LibraryOfCongress-PREMIS].[dbo].[fixity]END ;

IF EXISTS (SELECT * FROM DBO.SYSOBJECTS WHERE ID = OBJECT_ID(N'[OpenLibrary-LibraryOfCongress-PREMIS].[dbo].[formatDesignation]') AND OBJECTPROPERTY(ID, N'ISUSERTABLE') = 1) BEGIN DROP TABLE [OpenLibrary-LibraryOfCongress-PREMIS].[dbo].[formatDesignation]END ;

IF EXISTS (SELECT * FROM DBO.SYSOBJECTS WHERE ID = OBJECT_ID(N'[OpenLibrary-LibraryOfCongress-PREMIS].[dbo].[formatName]') AND OBJECTPROPERTY(ID, N'ISUSERTABLE') = 1) BEGIN DROP TABLE [OpenLibrary-LibraryOfCongress-PREMIS].[dbo].[formatName]END ;

IF EXISTS (SELECT * FROM DBO.SYSOBJECTS WHERE ID = OBJECT_ID(N'[OpenLibrary-LibraryOfCongress-PREMIS].[dbo].[eventOutcome]') AND OBJECTPROPERTY(ID, N'ISUSERTABLE') = 1) BEGIN DROP TABLE [OpenLibrary-LibraryOfCongress-PREMIS].[dbo].[eventOutcome]END ;

IF EXISTS (SELECT * FROM DBO.SYSOBJECTS WHERE ID = OBJECT_ID(N'[OpenLibrary-LibraryOfCongress-PREMIS].[dbo].[termOfRestriction]') AND OBJECTPROPERTY(ID, N'ISUSERTABLE') = 1) BEGIN DROP TABLE [OpenLibrary-LibraryOfCongress-PREMIS].[dbo].[termOfRestriction]END ;

IF EXISTS (SELECT * FROM DBO.SYSOBJECTS WHERE ID = OBJECT_ID(N'[OpenLibrary-LibraryOfCongress-PREMIS].[dbo].[rightsGranted]') AND OBJECTPROPERTY(ID, N'ISUSERTABLE') = 1) BEGIN DROP TABLE [OpenLibrary-LibraryOfCongress-PREMIS].[dbo].[rightsGranted]END ;

IF EXISTS (SELECT * FROM DBO.SYSOBJECTS WHERE ID = OBJECT_ID(N'[OpenLibrary-LibraryOfCongress-PREMIS].[dbo].[preservationLevel]') AND OBJECTPROPERTY(ID, N'ISUSERTABLE') = 1) BEGIN DROP TABLE [OpenLibrary-LibraryOfCongress-PREMIS].[dbo].[preservationLevel]END ;

IF EXISTS (SELECT * FROM DBO.SYSOBJECTS WHERE ID = OBJECT_ID(N'[OpenLibrary-LibraryOfCongress-PREMIS].[dbo].[preservationLevelType]') AND OBJECTPROPERTY(ID, N'ISUSERTABLE') = 1) BEGIN DROP TABLE [OpenLibrary-LibraryOfCongress-PREMIS].[dbo].[preservationLevelType]END ;

IF EXISTS (SELECT * FROM DBO.SYSOBJECTS WHERE ID = OBJECT_ID(N'[OpenLibrary-LibraryOfCongress-PREMIS].[dbo].[otherRightsDocumentationRole]') AND OBJECTPROPERTY(ID, N'ISUSERTABLE') = 1) BEGIN DROP TABLE [OpenLibrary-LibraryOfCongress-PREMIS].[dbo].[otherRightsDocumentationRole]END ;

IF EXISTS (SELECT * FROM DBO.SYSOBJECTS WHERE ID = OBJECT_ID(N'[OpenLibrary-LibraryOfCongress-PREMIS].[dbo].[restriction]') AND OBJECTPROPERTY(ID, N'ISUSERTABLE') = 1) BEGIN DROP TABLE [OpenLibrary-LibraryOfCongress-PREMIS].[dbo].[restriction]END ;

IF EXISTS (SELECT * FROM DBO.SYSOBJECTS WHERE ID = OBJECT_ID(N'[OpenLibrary-LibraryOfCongress-PREMIS].[dbo].[rightsStatementIdentifier]') AND OBJECTPROPERTY(ID, N'ISUSERTABLE') = 1) BEGIN DROP TABLE [OpenLibrary-LibraryOfCongress-PREMIS].[dbo].[rightsStatementIdentifier]END ;

IF EXISTS (SELECT * FROM DBO.SYSOBJECTS WHERE ID = OBJECT_ID(N'[OpenLibrary-LibraryOfCongress-PREMIS].[dbo].[statuteDocumentationIdentifierType]') AND OBJECTPROPERTY(ID, N'ISUSERTABLE') = 1) BEGIN DROP TABLE [OpenLibrary-LibraryOfCongress-PREMIS].[dbo].[statuteDocumentationIdentifierType]END ;

IF EXISTS (SELECT * FROM DBO.SYSOBJECTS WHERE ID = OBJECT_ID(N'[OpenLibrary-LibraryOfCongress-PREMIS].[dbo].[otherRightsDocumentationIdentifierType]') AND OBJECTPROPERTY(ID, N'ISUSERTABLE') = 1) BEGIN DROP TABLE [OpenLibrary-LibraryOfCongress-PREMIS].[dbo].[otherRightsDocumentationIdentifierType]END ;

IF EXISTS (SELECT * FROM DBO.SYSOBJECTS WHERE ID = OBJECT_ID(N'[OpenLibrary-LibraryOfCongress-PREMIS].[dbo].[preservationLevelValue]') AND OBJECTPROPERTY(ID, N'ISUSERTABLE') = 1) BEGIN DROP TABLE [OpenLibrary-LibraryOfCongress-PREMIS].[dbo].[preservationLevelValue]END ;

IF EXISTS (SELECT * FROM DBO.SYSOBJECTS WHERE ID = OBJECT_ID(N'[OpenLibrary-LibraryOfCongress-PREMIS].[dbo].[otherRightsApplicableDates]') AND OBJECTPROPERTY(ID, N'ISUSERTABLE') = 1) BEGIN DROP TABLE [OpenLibrary-LibraryOfCongress-PREMIS].[dbo].[otherRightsApplicableDates]END ;

IF EXISTS (SELECT * FROM DBO.SYSOBJECTS WHERE ID = OBJECT_ID(N'[OpenLibrary-LibraryOfCongress-PREMIS].[dbo].[originalName]') AND OBJECTPROPERTY(ID, N'ISUSERTABLE') = 1) BEGIN DROP TABLE [OpenLibrary-LibraryOfCongress-PREMIS].[dbo].[originalName]END ;

IF EXISTS (SELECT * FROM DBO.SYSOBJECTS WHERE ID = OBJECT_ID(N'[OpenLibrary-LibraryOfCongress-PREMIS].[dbo].[otherRightsInformation]') AND OBJECTPROPERTY(ID, N'ISUSERTABLE') = 1) BEGIN DROP TABLE [OpenLibrary-LibraryOfCongress-PREMIS].[dbo].[otherRightsInformation]END ;

IF EXISTS (SELECT * FROM DBO.SYSOBJECTS WHERE ID = OBJECT_ID(N'[OpenLibrary-LibraryOfCongress-PREMIS].[dbo].[rightsBasis]') AND OBJECTPROPERTY(ID, N'ISUSERTABLE') = 1) BEGIN DROP TABLE [OpenLibrary-LibraryOfCongress-PREMIS].[dbo].[rightsBasis]END ;

IF EXISTS (SELECT * FROM DBO.SYSOBJECTS WHERE ID = OBJECT_ID(N'[OpenLibrary-LibraryOfCongress-PREMIS].[dbo].[statuteInformation]') AND OBJECTPROPERTY(ID, N'ISUSERTABLE') = 1) BEGIN DROP TABLE [OpenLibrary-LibraryOfCongress-PREMIS].[dbo].[statuteInformation]END ;

IF EXISTS (SELECT * FROM DBO.SYSOBJECTS WHERE ID = OBJECT_ID(N'[OpenLibrary-LibraryOfCongress-PREMIS].[dbo].[statuteCitation]') AND OBJECTPROPERTY(ID, N'ISUSERTABLE') = 1) BEGIN DROP TABLE [OpenLibrary-LibraryOfCongress-PREMIS].[dbo].[statuteCitation]END ;

IF EXISTS (SELECT * FROM DBO.SYSOBJECTS WHERE ID = OBJECT_ID(N'[OpenLibrary-LibraryOfCongress-PREMIS].[dbo].[rightsStatementIdentifierType]') AND OBJECTPROPERTY(ID, N'ISUSERTABLE') = 1) BEGIN DROP TABLE [OpenLibrary-LibraryOfCongress-PREMIS].[dbo].[rightsStatementIdentifierType]END ;

IF EXISTS (SELECT * FROM DBO.SYSOBJECTS WHERE ID = OBJECT_ID(N'[OpenLibrary-LibraryOfCongress-PREMIS].[dbo].[otherRightsDocumentationIdentifier]') AND OBJECTPROPERTY(ID, N'ISUSERTABLE') = 1) BEGIN DROP TABLE [OpenLibrary-LibraryOfCongress-PREMIS].[dbo].[otherRightsDocumentationIdentifier]END ;

IF EXISTS (SELECT * FROM DBO.SYSOBJECTS WHERE ID = OBJECT_ID(N'[OpenLibrary-LibraryOfCongress-PREMIS].[dbo].[statuteDocumentationIdentifier]') AND OBJECTPROPERTY(ID, N'ISUSERTABLE') = 1) BEGIN DROP TABLE [OpenLibrary-LibraryOfCongress-PREMIS].[dbo].[statuteDocumentationIdentifier]END ;

IF EXISTS (SELECT * FROM DBO.SYSOBJECTS WHERE ID = OBJECT_ID(N'[OpenLibrary-LibraryOfCongress-PREMIS].[dbo].[rights]') AND OBJECTPROPERTY(ID, N'ISUSERTABLE') = 1) BEGIN DROP TABLE [OpenLibrary-LibraryOfCongress-PREMIS].[dbo].[rights]END ;

IF EXISTS (SELECT * FROM DBO.SYSOBJECTS WHERE ID = OBJECT_ID(N'[OpenLibrary-LibraryOfCongress-PREMIS].[dbo].[statuteDocumentationRole]') AND OBJECTPROPERTY(ID, N'ISUSERTABLE') = 1) BEGIN DROP TABLE [OpenLibrary-LibraryOfCongress-PREMIS].[dbo].[statuteDocumentationRole]END ;

IF EXISTS (SELECT * FROM DBO.SYSOBJECTS WHERE ID = OBJECT_ID(N'[OpenLibrary-LibraryOfCongress-PREMIS].[dbo].[statuteJurisdiction]') AND OBJECTPROPERTY(ID, N'ISUSERTABLE') = 1) BEGIN DROP TABLE [OpenLibrary-LibraryOfCongress-PREMIS].[dbo].[statuteJurisdiction]END ;

IF EXISTS (SELECT * FROM DBO.SYSOBJECTS WHERE ID = OBJECT_ID(N'[OpenLibrary-LibraryOfCongress-PREMIS].[dbo].[termOfGrant]') AND OBJECTPROPERTY(ID, N'ISUSERTABLE') = 1) BEGIN DROP TABLE [OpenLibrary-LibraryOfCongress-PREMIS].[dbo].[termOfGrant]END ;

IF EXISTS (SELECT * FROM DBO.SYSOBJECTS WHERE ID = OBJECT_ID(N'[OpenLibrary-LibraryOfCongress-PREMIS].[dbo].[otherRightsBasis]') AND OBJECTPROPERTY(ID, N'ISUSERTABLE') = 1) BEGIN DROP TABLE [OpenLibrary-LibraryOfCongress-PREMIS].[dbo].[otherRightsBasis]END ;

IF EXISTS (SELECT * FROM DBO.SYSOBJECTS WHERE ID = OBJECT_ID(N'[OpenLibrary-LibraryOfCongress-PREMIS].[dbo].[premis]') AND OBJECTPROPERTY(ID, N'ISUSERTABLE') = 1) BEGIN DROP TABLE [OpenLibrary-LibraryOfCongress-PREMIS].[dbo].[premis]END ;

IF EXISTS (SELECT * FROM DBO.SYSOBJECTS WHERE ID = OBJECT_ID(N'[OpenLibrary-LibraryOfCongress-PREMIS].[dbo].[statuteApplicableDates]') AND OBJECTPROPERTY(ID, N'ISUSERTABLE') = 1) BEGIN DROP TABLE [OpenLibrary-LibraryOfCongress-PREMIS].[dbo].[statuteApplicableDates]END ;

CREATE TABLE [OpenLibrary-LibraryOfCongress-PREMIS].[dbo].[creatingApplication] ( [creatingApplicationVersion] varchar (8000)  NULL , [dateCreatedByApplication] varchar (8000)  NULL ) ;

CREATE TABLE [OpenLibrary-LibraryOfCongress-PREMIS].[dbo].[copyrightDocumentationIdentifier] ( [copyrightDocumentationIdentifierValue] varchar (8000)  NOT NULL ) ;

CREATE TABLE [OpenLibrary-LibraryOfCongress-PREMIS].[dbo].[copyrightDocumentationIdentifierType] ( [authority] varchar (8000)  NULL , [authorityURI] varchar (8000)  NULL , [valueURI] varchar (8000)  NULL ) ;

CREATE TABLE [OpenLibrary-LibraryOfCongress-PREMIS].[dbo].[copyrightJurisdiction] ( [authority] varchar (8000)  NULL , [authorityURI] varchar (8000)  NULL , [valueURI] varchar (8000)  NULL ) ;

CREATE TABLE [OpenLibrary-LibraryOfCongress-PREMIS].[dbo].[environmentCharacteristic] ( [authority] varchar (8000)  NULL , [authorityURI] varchar (8000)  NULL , [valueURI] varchar (8000)  NULL ) ;

CREATE TABLE [OpenLibrary-LibraryOfCongress-PREMIS].[dbo].[environmentDesignation] ( [environmentVersion] varchar (8000)  NULL , [environmentOrigin] varchar (8000)  NULL , [environmentDesignationNote] varchar (8000)  NULL , [environmentDesignationExtension] varchar (8000)  NULL ) ;

CREATE TABLE [OpenLibrary-LibraryOfCongress-PREMIS].[dbo].[copyrightDocumentationRole] ( [authority] varchar (8000)  NULL , [authorityURI] varchar (8000)  NULL , [valueURI] varchar (8000)  NULL ) ;

CREATE TABLE [OpenLibrary-LibraryOfCongress-PREMIS].[dbo].[creatingApplicationName] ( [authority] varchar (8000)  NULL , [authorityURI] varchar (8000)  NULL , [valueURI] varchar (8000)  NULL ) ;

CREATE TABLE [OpenLibrary-LibraryOfCongress-PREMIS].[dbo].[copyrightInformation] ( [copyrightStatusDeterminationDate] varchar (8000)  NULL , [copyrightNote] varchar (8000)  NULL ) ;

CREATE TABLE [OpenLibrary-LibraryOfCongress-PREMIS].[dbo].[copyrightStatus] ( [authority] varchar (8000)  NULL , [authorityURI] varchar (8000)  NULL , [valueURI] varchar (8000)  NULL ) ;

CREATE TABLE [OpenLibrary-LibraryOfCongress-PREMIS].[dbo].[eventOutcomeDetail] ( [eventOutcomeDetailNote] varchar (8000)  NOT NULL ) ;

CREATE TABLE [OpenLibrary-LibraryOfCongress-PREMIS].[dbo].[relatedObjectIdentifier] ( [RelObjectXmlID] varchar (8000)  NULL , [simpleLink] varchar (8000)  NULL , [relatedObjectIdentifierValue] varchar (8000)  NOT NULL , [relatedObjectSequence] bit  NULL ) ;

CREATE TABLE [OpenLibrary-LibraryOfCongress-PREMIS].[dbo].[signatureMethod] ( [authority] varchar (8000)  NULL , [authorityURI] varchar (8000)  NULL , [valueURI] varchar (8000)  NULL ) ;

CREATE TABLE [OpenLibrary-LibraryOfCongress-PREMIS].[dbo].[swType] ( [authority] varchar (8000)  NULL , [authorityURI] varchar (8000)  NULL , [valueURI] varchar (8000)  NULL ) ;

CREATE TABLE [OpenLibrary-LibraryOfCongress-PREMIS].[dbo].[relatedEnvironmentPurpose] ( [authority] varchar (8000)  NULL , [authorityURI] varchar (8000)  NULL , [valueURI] varchar (8000)  NULL ) ;

CREATE TABLE [OpenLibrary-LibraryOfCongress-PREMIS].[dbo].[significantPropertiesType] ( [authority] varchar (8000)  NULL , [authorityURI] varchar (8000)  NULL , [valueURI] varchar (8000)  NULL ) ;

CREATE TABLE [OpenLibrary-LibraryOfCongress-PREMIS].[dbo].[signer] ( [authority] varchar (8000)  NULL , [authorityURI] varchar (8000)  NULL , [valueURI] varchar (8000)  NULL ) ;

CREATE TABLE [OpenLibrary-LibraryOfCongress-PREMIS].[dbo].[relatedEventIdentifierType] ( [authority] varchar (8000)  NULL , [authorityURI] varchar (8000)  NULL , [valueURI] varchar (8000)  NULL ) ;

CREATE TABLE [OpenLibrary-LibraryOfCongress-PREMIS].[dbo].[relatedEnvironmentCharacteristic] ( [authority] varchar (8000)  NULL , [authorityURI] varchar (8000)  NULL , [valueURI] varchar (8000)  NULL ) ;

CREATE TABLE [OpenLibrary-LibraryOfCongress-PREMIS].[dbo].[signatureEncoding] ( [authority] varchar (8000)  NULL , [authorityURI] varchar (8000)  NULL , [valueURI] varchar (8000)  NULL ) ;

CREATE TABLE [OpenLibrary-LibraryOfCongress-PREMIS].[dbo].[preservationLevelRole] ( [authority] varchar (8000)  NULL , [authorityURI] varchar (8000)  NULL , [valueURI] varchar (8000)  NULL ) ;

CREATE TABLE [OpenLibrary-LibraryOfCongress-PREMIS].[dbo].[storageMedium] ( [authority] varchar (8000)  NULL , [authorityURI] varchar (8000)  NULL , [valueURI] varchar (8000)  NULL ) ;

CREATE TABLE [OpenLibrary-LibraryOfCongress-PREMIS].[dbo].[swDependency] ( [authority] varchar (8000)  NULL , [authorityURI] varchar (8000)  NULL , [valueURI] varchar (8000)  NULL ) ;

CREATE TABLE [OpenLibrary-LibraryOfCongress-PREMIS].[dbo].[relatedObjectIdentifierType] ( [authority] varchar (8000)  NULL , [authorityURI] varchar (8000)  NULL , [valueURI] varchar (8000)  NULL ) ;

CREATE TABLE [OpenLibrary-LibraryOfCongress-PREMIS].[dbo].[signature] ( [signatureValue] varchar (8000)  NOT NULL , [signatureProperties] varchar (8000)  NULL ) ;

CREATE TABLE [OpenLibrary-LibraryOfCongress-PREMIS].[dbo].[relatedEventIdentifier] ( [RelEventXmlID] varchar (8000)  NULL , [simpleLink] varchar (8000)  NULL , [relatedEventIdentifierValue] varchar (8000)  NOT NULL , [relatedEventSequence] bit  NULL ) ;

CREATE TABLE [OpenLibrary-LibraryOfCongress-PREMIS].[dbo].[signatureValidationRules] ( [authority] varchar (8000)  NULL , [authorityURI] varchar (8000)  NULL , [valueURI] varchar (8000)  NULL ) ;

CREATE TABLE [OpenLibrary-LibraryOfCongress-PREMIS].[dbo].[swName] ( [authority] varchar (8000)  NULL , [authorityURI] varchar (8000)  NULL , [valueURI] varchar (8000)  NULL ) ;

CREATE TABLE [OpenLibrary-LibraryOfCongress-PREMIS].[dbo].[significantProperties] ( [significantPropertiesValue] varchar (8000)  NULL ) ;

CREATE TABLE [OpenLibrary-LibraryOfCongress-PREMIS].[dbo].[relationshipType] ( [authority] varchar (8000)  NULL , [authorityURI] varchar (8000)  NULL , [valueURI] varchar (8000)  NULL ) ;

CREATE TABLE [OpenLibrary-LibraryOfCongress-PREMIS].[dbo].[relationshipSubType] ( [authority] varchar (8000)  NULL , [authorityURI] varchar (8000)  NULL , [valueURI] varchar (8000)  NULL ) ;

CREATE TABLE [OpenLibrary-LibraryOfCongress-PREMIS].[dbo].[linkingAgentIdentifier] ( [linkingAgentIdentifierValue] varchar (8000)  NOT NULL , [LinkAgentXmlID] varchar (8000)  NULL , [simpleLink] varchar (8000)  NULL ) ;

CREATE TABLE [OpenLibrary-LibraryOfCongress-PREMIS].[dbo].[linkingAgentIdentifierType] ( [authority] varchar (8000)  NULL , [authorityURI] varchar (8000)  NULL , [valueURI] varchar (8000)  NULL ) ;

CREATE TABLE [OpenLibrary-LibraryOfCongress-PREMIS].[dbo].[environmentPurpose] ( [authority] varchar (8000)  NULL , [authorityURI] varchar (8000)  NULL , [valueURI] varchar (8000)  NULL ) ;

CREATE TABLE [OpenLibrary-LibraryOfCongress-PREMIS].[dbo].[environmentRegistry] ( [environmentRegistryName] varchar (8000)  NOT NULL , [environmentRegistryKey] varchar (8000)  NOT NULL ) ;

CREATE TABLE [OpenLibrary-LibraryOfCongress-PREMIS].[dbo].[environmentRegistryRole] ( [authority] varchar (8000)  NULL , [authorityURI] varchar (8000)  NULL , [valueURI] varchar (8000)  NULL ) ;

CREATE TABLE [OpenLibrary-LibraryOfCongress-PREMIS].[dbo].[event] ( [xmlID] varchar (255)  NULL , [version] varchar (8000)  NULL , [eventDateTime] varchar (8000)  NOT NULL ) ;

CREATE TABLE [OpenLibrary-LibraryOfCongress-PREMIS].[dbo].[environmentFunction] ( [environmentFunctionLevel] varchar (8000)  NOT NULL ) ;

CREATE TABLE [OpenLibrary-LibraryOfCongress-PREMIS].[dbo].[environmentName] ( [authority] varchar (8000)  NULL , [authorityURI] varchar (8000)  NULL , [valueURI] varchar (8000)  NULL ) ;

CREATE TABLE [OpenLibrary-LibraryOfCongress-PREMIS].[dbo].[environmentFunctionType] ( [authority] varchar (8000)  NULL , [authorityURI] varchar (8000)  NULL , [valueURI] varchar (8000)  NULL ) ;

CREATE TABLE [OpenLibrary-LibraryOfCongress-PREMIS].[dbo].[linkingEventIdentifierType] ( [authority] varchar (8000)  NULL , [authorityURI] varchar (8000)  NULL , [valueURI] varchar (8000)  NULL ) ;

CREATE TABLE [OpenLibrary-LibraryOfCongress-PREMIS].[dbo].[linkingEnvironmentRole] ( [authority] varchar (8000)  NULL , [authorityURI] varchar (8000)  NULL , [valueURI] varchar (8000)  NULL ) ;

CREATE TABLE [OpenLibrary-LibraryOfCongress-PREMIS].[dbo].[compositionLevel] ( [unknown] varchar (8000)  NULL ) ;

CREATE TABLE [OpenLibrary-LibraryOfCongress-PREMIS].[dbo].[agent] ( [xmlID] varchar (255)  NULL , [version] varchar (8000)  NULL , [agentVersion] varchar (8000)  NULL , [agentNote] varchar (8000)  NULL ) ;

CREATE TABLE [OpenLibrary-LibraryOfCongress-PREMIS].[dbo].[agentIdentifier] ( [agentIdentifierValue] varchar (8000)  NOT NULL , [simpleLink] varchar (8000)  NULL ) ;

CREATE TABLE [OpenLibrary-LibraryOfCongress-PREMIS].[dbo].[linkingEventIdentifier] ( [linkingEventIdentifierValue] varchar (8000)  NOT NULL , [LinkEventXmlID] varchar (8000)  NULL , [simpleLink] varchar (8000)  NULL ) ;

CREATE TABLE [OpenLibrary-LibraryOfCongress-PREMIS].[dbo].[contentLocation] ( [simpleLink] varchar (8000)  NULL , [contentLocationValue] varchar (8000)  NOT NULL ) ;

CREATE TABLE [OpenLibrary-LibraryOfCongress-PREMIS].[dbo].[contentLocationType] ( [authority] varchar (8000)  NULL , [authorityURI] varchar (8000)  NULL , [valueURI] varchar (8000)  NULL ) ;

CREATE TABLE [OpenLibrary-LibraryOfCongress-PREMIS].[dbo].[copyrightApplicableDates] ( [startDate] varchar (8000)  NOT NULL , [endDate] varchar (8000)  NULL ) ;

CREATE TABLE [OpenLibrary-LibraryOfCongress-PREMIS].[dbo].[agentIdentifierType] ( [authority] varchar (8000)  NULL , [authorityURI] varchar (8000)  NULL , [valueURI] varchar (8000)  NULL ) ;

CREATE TABLE [OpenLibrary-LibraryOfCongress-PREMIS].[dbo].[agentType] ( [authority] varchar (8000)  NULL , [authorityURI] varchar (8000)  NULL , [valueURI] varchar (8000)  NULL ) ;

CREATE TABLE [OpenLibrary-LibraryOfCongress-PREMIS].[dbo].[linkingRightsStatementIdentifierType] ( [authority] varchar (8000)  NULL , [authorityURI] varchar (8000)  NULL , [valueURI] varchar (8000)  NULL ) ;

CREATE TABLE [OpenLibrary-LibraryOfCongress-PREMIS].[dbo].[agentName] ( [authority] varchar (8000)  NULL , [authorityURI] varchar (8000)  NULL , [valueURI] varchar (8000)  NULL ) ;

CREATE TABLE [OpenLibrary-LibraryOfCongress-PREMIS].[dbo].[act] ( [authority] varchar (8000)  NULL , [authorityURI] varchar (8000)  NULL , [valueURI] varchar (8000)  NULL ) ;

CREATE TABLE [OpenLibrary-LibraryOfCongress-PREMIS].[dbo].[linkingRightsStatementIdentifier] ( [linkingRightsStatementIdentifierValue] varchar (8000)  NOT NULL , [LinkPermissionStatementXmlID] varchar (8000)  NULL , [simpleLink] varchar (8000)  NULL ) ;

CREATE TABLE [OpenLibrary-LibraryOfCongress-PREMIS].[dbo].[linkingEnvironmentIdentifier] ( [linkingEnvironmentIdentifierType] varchar (8000)  NOT NULL , [linkingEnvironmentIdentifierValue] varchar (8000)  NOT NULL , [LinkEventXmlID] varchar (8000)  NULL , [simpleLink] varchar (8000)  NULL ) ;

CREATE TABLE [OpenLibrary-LibraryOfCongress-PREMIS].[dbo].[eventDetailInformation] ( [eventDetail] varchar (8000)  NULL ) ;

CREATE TABLE [OpenLibrary-LibraryOfCongress-PREMIS].[dbo].[eventIdentifier] ( [eventIdentifierValue] varchar (8000)  NOT NULL , [simpleLink] varchar (8000)  NULL ) ;

CREATE TABLE [OpenLibrary-LibraryOfCongress-PREMIS].[dbo].[eventType] ( [authority] varchar (8000)  NULL , [authorityURI] varchar (8000)  NULL , [valueURI] varchar (8000)  NULL ) ;

CREATE TABLE [OpenLibrary-LibraryOfCongress-PREMIS].[dbo].[eventIdentifierType] ( [authority] varchar (8000)  NULL , [authorityURI] varchar (8000)  NULL , [valueURI] varchar (8000)  NULL ) ;

CREATE TABLE [OpenLibrary-LibraryOfCongress-PREMIS].[dbo].[licenseApplicableDates] ( [startDate] varchar (8000)  NOT NULL , [endDate] varchar (8000)  NULL ) ;

CREATE TABLE [OpenLibrary-LibraryOfCongress-PREMIS].[dbo].[licenseDocumentationIdentifierType] ( [authority] varchar (8000)  NULL , [authorityURI] varchar (8000)  NULL , [valueURI] varchar (8000)  NULL ) ;

CREATE TABLE [OpenLibrary-LibraryOfCongress-PREMIS].[dbo].[formatRegistryRole] ( [authority] varchar (8000)  NULL , [authorityURI] varchar (8000)  NULL , [valueURI] varchar (8000)  NULL ) ;

CREATE TABLE [OpenLibrary-LibraryOfCongress-PREMIS].[dbo].[formatRegistryKey] ( [authority] varchar (8000)  NULL , [authorityURI] varchar (8000)  NULL , [valueURI] varchar (8000)  NULL ) ;

CREATE TABLE [OpenLibrary-LibraryOfCongress-PREMIS].[dbo].[hwType] ( [authority] varchar (8000)  NULL , [authorityURI] varchar (8000)  NULL , [valueURI] varchar (8000)  NULL ) ;

CREATE TABLE [OpenLibrary-LibraryOfCongress-PREMIS].[dbo].[licenseIdentifierType] ( [authority] varchar (8000)  NULL , [authorityURI] varchar (8000)  NULL , [valueURI] varchar (8000)  NULL ) ;

CREATE TABLE [OpenLibrary-LibraryOfCongress-PREMIS].[dbo].[linkingObjectRole] ( [authority] varchar (8000)  NULL , [authorityURI] varchar (8000)  NULL , [valueURI] varchar (8000)  NULL ) ;

CREATE TABLE [OpenLibrary-LibraryOfCongress-PREMIS].[dbo].[linkingObjectIdentifier] ( [linkingObjectIdentifierValue] varchar (8000)  NOT NULL , [LinkObjectXmlID] varchar (8000)  NULL , [simpleLink] varchar (8000)  NULL ) ;

CREATE TABLE [OpenLibrary-LibraryOfCongress-PREMIS].[dbo].[inhibitorTarget] ( [authority] varchar (8000)  NULL , [authorityURI] varchar (8000)  NULL , [valueURI] varchar (8000)  NULL ) ;

CREATE TABLE [OpenLibrary-LibraryOfCongress-PREMIS].[dbo].[licenseDocumentationRole] ( [authority] varchar (8000)  NULL , [authorityURI] varchar (8000)  NULL , [valueURI] varchar (8000)  NULL ) ;

CREATE TABLE [OpenLibrary-LibraryOfCongress-PREMIS].[dbo].[formatRegistry] ( [simpleLink] varchar (8000)  NULL ) ;

CREATE TABLE [OpenLibrary-LibraryOfCongress-PREMIS].[dbo].[licenseInformation] ( [licenseTerms] varchar (8000)  NULL , [licenseNote] varchar (8000)  NULL ) ;

CREATE TABLE [OpenLibrary-LibraryOfCongress-PREMIS].[dbo].[inhibitors] ( [inhibitorKey] varchar (8000)  NULL ) ;

CREATE TABLE [OpenLibrary-LibraryOfCongress-PREMIS].[dbo].[formatRegistryName] ( [authority] varchar (8000)  NULL , [authorityURI] varchar (8000)  NULL , [valueURI] varchar (8000)  NULL ) ;

CREATE TABLE [OpenLibrary-LibraryOfCongress-PREMIS].[dbo].[hwName] ( [authority] varchar (8000)  NULL , [authorityURI] varchar (8000)  NULL , [valueURI] varchar (8000)  NULL ) ;

CREATE TABLE [OpenLibrary-LibraryOfCongress-PREMIS].[dbo].[inhibitorType] ( [authority] varchar (8000)  NULL , [authorityURI] varchar (8000)  NULL , [valueURI] varchar (8000)  NULL ) ;

CREATE TABLE [OpenLibrary-LibraryOfCongress-PREMIS].[dbo].[objectCharacteristics] ( [size] bigint  NULL ) ;

CREATE TABLE [OpenLibrary-LibraryOfCongress-PREMIS].[dbo].[messageDigestOriginator] ( [authority] varchar (8000)  NULL , [authorityURI] varchar (8000)  NULL , [valueURI] varchar (8000)  NULL ) ;

CREATE TABLE [OpenLibrary-LibraryOfCongress-PREMIS].[dbo].[licenseDocumentationIdentifier] ( [licenseDocumentationIdentifierValue] varchar (8000)  NOT NULL ) ;

CREATE TABLE [OpenLibrary-LibraryOfCongress-PREMIS].[dbo].[objectIdentifier] ( [simpleLink] varchar (8000)  NULL , [objectIdentifierValue] varchar (8000)  NOT NULL ) ;

CREATE TABLE [OpenLibrary-LibraryOfCongress-PREMIS].[dbo].[objectIdentifierType] ( [authority] varchar (8000)  NULL , [authorityURI] varchar (8000)  NULL , [valueURI] varchar (8000)  NULL ) ;

CREATE TABLE [OpenLibrary-LibraryOfCongress-PREMIS].[dbo].[format] ( [formatNote] varchar (8000)  NULL ) ;

CREATE TABLE [OpenLibrary-LibraryOfCongress-PREMIS].[dbo].[linkingAgentRole] ( [authority] varchar (8000)  NULL , [authorityURI] varchar (8000)  NULL , [valueURI] varchar (8000)  NULL ) ;

CREATE TABLE [OpenLibrary-LibraryOfCongress-PREMIS].[dbo].[messageDigestAlgorithm] ( [authority] varchar (8000)  NULL , [authorityURI] varchar (8000)  NULL , [valueURI] varchar (8000)  NULL ) ;

CREATE TABLE [OpenLibrary-LibraryOfCongress-PREMIS].[dbo].[linkingObjectIdentifierType] ( [authority] varchar (8000)  NULL , [authorityURI] varchar (8000)  NULL , [valueURI] varchar (8000)  NULL ) ;

CREATE TABLE [OpenLibrary-LibraryOfCongress-PREMIS].[dbo].[fixity] ( [messageDigest] varchar (8000)  NOT NULL ) ;

CREATE TABLE [OpenLibrary-LibraryOfCongress-PREMIS].[dbo].[formatDesignation] ( [formatVersion] varchar (8000)  NULL ) ;

CREATE TABLE [OpenLibrary-LibraryOfCongress-PREMIS].[dbo].[formatName] ( [authority] varchar (8000)  NULL , [authorityURI] varchar (8000)  NULL , [valueURI] varchar (8000)  NULL ) ;

CREATE TABLE [OpenLibrary-LibraryOfCongress-PREMIS].[dbo].[eventOutcome] ( [authority] varchar (8000)  NULL , [authorityURI] varchar (8000)  NULL , [valueURI] varchar (8000)  NULL ) ;

CREATE TABLE [OpenLibrary-LibraryOfCongress-PREMIS].[dbo].[termOfRestriction] ( [startDate] varchar (8000)  NOT NULL , [endDate] varchar (8000)  NULL ) ;

CREATE TABLE [OpenLibrary-LibraryOfCongress-PREMIS].[dbo].[rightsGranted] ( [rightsGrantedNote] varchar (8000)  NULL ) ;

CREATE TABLE [OpenLibrary-LibraryOfCongress-PREMIS].[dbo].[preservationLevel] ( [preservationLevelRationale] varchar (8000)  NULL , [preservationLevelDateAssigned] varchar (8000)  NULL ) ;

CREATE TABLE [OpenLibrary-LibraryOfCongress-PREMIS].[dbo].[preservationLevelType] ( [authority] varchar (8000)  NULL , [authorityURI] varchar (8000)  NULL , [valueURI] varchar (8000)  NULL ) ;

CREATE TABLE [OpenLibrary-LibraryOfCongress-PREMIS].[dbo].[otherRightsDocumentationRole] ( [authority] varchar (8000)  NULL , [authorityURI] varchar (8000)  NULL , [valueURI] varchar (8000)  NULL ) ;

CREATE TABLE [OpenLibrary-LibraryOfCongress-PREMIS].[dbo].[restriction] ( [authority] varchar (8000)  NULL , [authorityURI] varchar (8000)  NULL , [valueURI] varchar (8000)  NULL ) ;

CREATE TABLE [OpenLibrary-LibraryOfCongress-PREMIS].[dbo].[rightsStatementIdentifier] ( [rightsStatementIdentifierValue] varchar (8000)  NOT NULL , [simpleLink] varchar (8000)  NULL ) ;

CREATE TABLE [OpenLibrary-LibraryOfCongress-PREMIS].[dbo].[statuteDocumentationIdentifierType] ( [authority] varchar (8000)  NULL , [authorityURI] varchar (8000)  NULL , [valueURI] varchar (8000)  NULL ) ;

CREATE TABLE [OpenLibrary-LibraryOfCongress-PREMIS].[dbo].[otherRightsDocumentationIdentifierType] ( [authority] varchar (8000)  NULL , [authorityURI] varchar (8000)  NULL , [valueURI] varchar (8000)  NULL ) ;

CREATE TABLE [OpenLibrary-LibraryOfCongress-PREMIS].[dbo].[preservationLevelValue] ( [authority] varchar (8000)  NULL , [authorityURI] varchar (8000)  NULL , [valueURI] varchar (8000)  NULL ) ;

CREATE TABLE [OpenLibrary-LibraryOfCongress-PREMIS].[dbo].[otherRightsApplicableDates] ( [startDate] varchar (8000)  NOT NULL , [endDate] varchar (8000)  NULL ) ;

CREATE TABLE [OpenLibrary-LibraryOfCongress-PREMIS].[dbo].[originalName] ( [simpleLink] varchar (8000)  NULL ) ;

CREATE TABLE [OpenLibrary-LibraryOfCongress-PREMIS].[dbo].[otherRightsInformation] ( [otherRightsNote] varchar (8000)  NULL ) ;

CREATE TABLE [OpenLibrary-LibraryOfCongress-PREMIS].[dbo].[rightsBasis] ( [authority] varchar (8000)  NULL , [authorityURI] varchar (8000)  NULL , [valueURI] varchar (8000)  NULL ) ;

CREATE TABLE [OpenLibrary-LibraryOfCongress-PREMIS].[dbo].[statuteInformation] ( [statuteInformationDeterminationDate] varchar (8000)  NULL , [statuteNote] varchar (8000)  NULL ) ;

CREATE TABLE [OpenLibrary-LibraryOfCongress-PREMIS].[dbo].[statuteCitation] ( [authority] varchar (8000)  NULL , [authorityURI] varchar (8000)  NULL , [valueURI] varchar (8000)  NULL ) ;

CREATE TABLE [OpenLibrary-LibraryOfCongress-PREMIS].[dbo].[rightsStatementIdentifierType] ( [authority] varchar (8000)  NULL , [authorityURI] varchar (8000)  NULL , [valueURI] varchar (8000)  NULL ) ;

CREATE TABLE [OpenLibrary-LibraryOfCongress-PREMIS].[dbo].[otherRightsDocumentationIdentifier] ( [otherRightsDocumentationIdentifierValue] varchar (8000)  NOT NULL ) ;

CREATE TABLE [OpenLibrary-LibraryOfCongress-PREMIS].[dbo].[statuteDocumentationIdentifier] ( [statuteDocumentationIdentifierValue] varchar (8000)  NOT NULL ) ;

CREATE TABLE [OpenLibrary-LibraryOfCongress-PREMIS].[dbo].[rights] ( [xmlID] varchar (255)  NULL , [version] varchar (8000)  NULL ) ;

CREATE TABLE [OpenLibrary-LibraryOfCongress-PREMIS].[dbo].[statuteDocumentationRole] ( [authority] varchar (8000)  NULL , [authorityURI] varchar (8000)  NULL , [valueURI] varchar (8000)  NULL ) ;

CREATE TABLE [OpenLibrary-LibraryOfCongress-PREMIS].[dbo].[statuteJurisdiction] ( [authority] varchar (8000)  NULL , [authorityURI] varchar (8000)  NULL , [valueURI] varchar (8000)  NULL ) ;

CREATE TABLE [OpenLibrary-LibraryOfCongress-PREMIS].[dbo].[termOfGrant] ( [startDate] varchar (8000)  NOT NULL , [endDate] varchar (8000)  NULL ) ;

CREATE TABLE [OpenLibrary-LibraryOfCongress-PREMIS].[dbo].[otherRightsBasis] ( [authority] varchar (8000)  NULL , [authorityURI] varchar (8000)  NULL , [valueURI] varchar (8000)  NULL ) ;

CREATE TABLE [OpenLibrary-LibraryOfCongress-PREMIS].[dbo].[premis] ( [version] varchar (8000)  NOT NULL ) ;

CREATE TABLE [OpenLibrary-LibraryOfCongress-PREMIS].[dbo].[statuteApplicableDates] ( [startDate] varchar (8000)  NOT NULL , [endDate] varchar (8000)  NULL ) ;

