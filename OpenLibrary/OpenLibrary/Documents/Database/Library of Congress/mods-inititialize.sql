IF EXISTS (SELECT * FROM DBO.SYSOBJECTS WHERE ID = OBJECT_ID(N'[OpenLibrary-LibraryOfCongress-MODS].[dbo].[shelfLocator]') AND OBJECTPROPERTY(ID, N'ISUSERTABLE') = 1) BEGIN DROP TABLE [OpenLibrary-LibraryOfCongress-MODS].[dbo].[shelfLocator]END ;

IF EXISTS (SELECT * FROM DBO.SYSOBJECTS WHERE ID = OBJECT_ID(N'[OpenLibrary-LibraryOfCongress-MODS].[dbo].[continent]') AND OBJECTPROPERTY(ID, N'ISUSERTABLE') = 1) BEGIN DROP TABLE [OpenLibrary-LibraryOfCongress-MODS].[dbo].[continent]END ;

IF EXISTS (SELECT * FROM DBO.SYSOBJECTS WHERE ID = OBJECT_ID(N'[OpenLibrary-LibraryOfCongress-MODS].[dbo].[electronicLocator]') AND OBJECTPROPERTY(ID, N'ISUSERTABLE') = 1) BEGIN DROP TABLE [OpenLibrary-LibraryOfCongress-MODS].[dbo].[electronicLocator]END ;

IF EXISTS (SELECT * FROM DBO.SYSOBJECTS WHERE ID = OBJECT_ID(N'[OpenLibrary-LibraryOfCongress-MODS].[dbo].[coordinates]') AND OBJECTPROPERTY(ID, N'ISUSERTABLE') = 1) BEGIN DROP TABLE [OpenLibrary-LibraryOfCongress-MODS].[dbo].[coordinates]END ;

IF EXISTS (SELECT * FROM DBO.SYSOBJECTS WHERE ID = OBJECT_ID(N'[OpenLibrary-LibraryOfCongress-MODS].[dbo].[subLocation]') AND OBJECTPROPERTY(ID, N'ISUSERTABLE') = 1) BEGIN DROP TABLE [OpenLibrary-LibraryOfCongress-MODS].[dbo].[subLocation]END ;

IF EXISTS (SELECT * FROM DBO.SYSOBJECTS WHERE ID = OBJECT_ID(N'[OpenLibrary-LibraryOfCongress-MODS].[dbo].[classification]') AND OBJECTPROPERTY(ID, N'ISUSERTABLE') = 1) BEGIN DROP TABLE [OpenLibrary-LibraryOfCongress-MODS].[dbo].[classification]END ;

IF EXISTS (SELECT * FROM DBO.SYSOBJECTS WHERE ID = OBJECT_ID(N'[OpenLibrary-LibraryOfCongress-MODS].[dbo].[note]') AND OBJECTPROPERTY(ID, N'ISUSERTABLE') = 1) BEGIN DROP TABLE [OpenLibrary-LibraryOfCongress-MODS].[dbo].[note]END ;

IF EXISTS (SELECT * FROM DBO.SYSOBJECTS WHERE ID = OBJECT_ID(N'[OpenLibrary-LibraryOfCongress-MODS].[dbo].[city]') AND OBJECTPROPERTY(ID, N'ISUSERTABLE') = 1) BEGIN DROP TABLE [OpenLibrary-LibraryOfCongress-MODS].[dbo].[city]END ;

IF EXISTS (SELECT * FROM DBO.SYSOBJECTS WHERE ID = OBJECT_ID(N'[OpenLibrary-LibraryOfCongress-MODS].[dbo].[citySection]') AND OBJECTPROPERTY(ID, N'ISUSERTABLE') = 1) BEGIN DROP TABLE [OpenLibrary-LibraryOfCongress-MODS].[dbo].[citySection]END ;

IF EXISTS (SELECT * FROM DBO.SYSOBJECTS WHERE ID = OBJECT_ID(N'[OpenLibrary-LibraryOfCongress-MODS].[dbo].[form]') AND OBJECTPROPERTY(ID, N'ISUSERTABLE') = 1) BEGIN DROP TABLE [OpenLibrary-LibraryOfCongress-MODS].[dbo].[form]END ;

IF EXISTS (SELECT * FROM DBO.SYSOBJECTS WHERE ID = OBJECT_ID(N'[OpenLibrary-LibraryOfCongress-MODS].[dbo].[geographic]') AND OBJECTPROPERTY(ID, N'ISUSERTABLE') = 1) BEGIN DROP TABLE [OpenLibrary-LibraryOfCongress-MODS].[dbo].[geographic]END ;

IF EXISTS (SELECT * FROM DBO.SYSOBJECTS WHERE ID = OBJECT_ID(N'[OpenLibrary-LibraryOfCongress-MODS].[dbo].[internetMediaType]') AND OBJECTPROPERTY(ID, N'ISUSERTABLE') = 1) BEGIN DROP TABLE [OpenLibrary-LibraryOfCongress-MODS].[dbo].[internetMediaType]END ;

IF EXISTS (SELECT * FROM DBO.SYSOBJECTS WHERE ID = OBJECT_ID(N'[OpenLibrary-LibraryOfCongress-MODS].[dbo].[genre]') AND OBJECTPROPERTY(ID, N'ISUSERTABLE') = 1) BEGIN DROP TABLE [OpenLibrary-LibraryOfCongress-MODS].[dbo].[genre]END ;

IF EXISTS (SELECT * FROM DBO.SYSOBJECTS WHERE ID = OBJECT_ID(N'[OpenLibrary-LibraryOfCongress-MODS].[dbo].[extent]') AND OBJECTPROPERTY(ID, N'ISUSERTABLE') = 1) BEGIN DROP TABLE [OpenLibrary-LibraryOfCongress-MODS].[dbo].[extent]END ;

IF EXISTS (SELECT * FROM DBO.SYSOBJECTS WHERE ID = OBJECT_ID(N'[OpenLibrary-LibraryOfCongress-MODS].[dbo].[frequency]') AND OBJECTPROPERTY(ID, N'ISUSERTABLE') = 1) BEGIN DROP TABLE [OpenLibrary-LibraryOfCongress-MODS].[dbo].[frequency]END ;

IF EXISTS (SELECT * FROM DBO.SYSOBJECTS WHERE ID = OBJECT_ID(N'[OpenLibrary-LibraryOfCongress-MODS].[dbo].[extension]') AND OBJECTPROPERTY(ID, N'ISUSERTABLE') = 1) BEGIN DROP TABLE [OpenLibrary-LibraryOfCongress-MODS].[dbo].[extension]END ;

IF EXISTS (SELECT * FROM DBO.SYSOBJECTS WHERE ID = OBJECT_ID(N'[OpenLibrary-LibraryOfCongress-MODS].[dbo].[province]') AND OBJECTPROPERTY(ID, N'ISUSERTABLE') = 1) BEGIN DROP TABLE [OpenLibrary-LibraryOfCongress-MODS].[dbo].[province]END ;

IF EXISTS (SELECT * FROM DBO.SYSOBJECTS WHERE ID = OBJECT_ID(N'[OpenLibrary-LibraryOfCongress-MODS].[dbo].[region]') AND OBJECTPROPERTY(ID, N'ISUSERTABLE') = 1) BEGIN DROP TABLE [OpenLibrary-LibraryOfCongress-MODS].[dbo].[region]END ;

IF EXISTS (SELECT * FROM DBO.SYSOBJECTS WHERE ID = OBJECT_ID(N'[OpenLibrary-LibraryOfCongress-MODS].[dbo].[scriptTerm]') AND OBJECTPROPERTY(ID, N'ISUSERTABLE') = 1) BEGIN DROP TABLE [OpenLibrary-LibraryOfCongress-MODS].[dbo].[scriptTerm]END ;

IF EXISTS (SELECT * FROM DBO.SYSOBJECTS WHERE ID = OBJECT_ID(N'[OpenLibrary-LibraryOfCongress-MODS].[dbo].[extraTerrestrialArea]') AND OBJECTPROPERTY(ID, N'ISUSERTABLE') = 1) BEGIN DROP TABLE [OpenLibrary-LibraryOfCongress-MODS].[dbo].[extraTerrestrialArea]END ;

IF EXISTS (SELECT * FROM DBO.SYSOBJECTS WHERE ID = OBJECT_ID(N'[OpenLibrary-LibraryOfCongress-MODS].[dbo].[languageOfCataloging]') AND OBJECTPROPERTY(ID, N'ISUSERTABLE') = 1) BEGIN DROP TABLE [OpenLibrary-LibraryOfCongress-MODS].[dbo].[languageOfCataloging]END ;

IF EXISTS (SELECT * FROM DBO.SYSOBJECTS WHERE ID = OBJECT_ID(N'[OpenLibrary-LibraryOfCongress-MODS].[dbo].[originInfo]') AND OBJECTPROPERTY(ID, N'ISUSERTABLE') = 1) BEGIN DROP TABLE [OpenLibrary-LibraryOfCongress-MODS].[dbo].[originInfo]END ;

IF EXISTS (SELECT * FROM DBO.SYSOBJECTS WHERE ID = OBJECT_ID(N'[OpenLibrary-LibraryOfCongress-MODS].[dbo].[location]') AND OBJECTPROPERTY(ID, N'ISUSERTABLE') = 1) BEGIN DROP TABLE [OpenLibrary-LibraryOfCongress-MODS].[dbo].[location]END ;

IF EXISTS (SELECT * FROM DBO.SYSOBJECTS WHERE ID = OBJECT_ID(N'[OpenLibrary-LibraryOfCongress-MODS].[dbo].[island]') AND OBJECTPROPERTY(ID, N'ISUSERTABLE') = 1) BEGIN DROP TABLE [OpenLibrary-LibraryOfCongress-MODS].[dbo].[island]END ;

IF EXISTS (SELECT * FROM DBO.SYSOBJECTS WHERE ID = OBJECT_ID(N'[OpenLibrary-LibraryOfCongress-MODS].[dbo].[url]') AND OBJECTPROPERTY(ID, N'ISUSERTABLE') = 1) BEGIN DROP TABLE [OpenLibrary-LibraryOfCongress-MODS].[dbo].[url]END ;

IF EXISTS (SELECT * FROM DBO.SYSOBJECTS WHERE ID = OBJECT_ID(N'[OpenLibrary-LibraryOfCongress-MODS].[dbo].[languageTerm]') AND OBJECTPROPERTY(ID, N'ISUSERTABLE') = 1) BEGIN DROP TABLE [OpenLibrary-LibraryOfCongress-MODS].[dbo].[languageTerm]END ;

IF EXISTS (SELECT * FROM DBO.SYSOBJECTS WHERE ID = OBJECT_ID(N'[OpenLibrary-LibraryOfCongress-MODS].[dbo].[language]') AND OBJECTPROPERTY(ID, N'ISUSERTABLE') = 1) BEGIN DROP TABLE [OpenLibrary-LibraryOfCongress-MODS].[dbo].[language]END ;

IF EXISTS (SELECT * FROM DBO.SYSOBJECTS WHERE ID = OBJECT_ID(N'[OpenLibrary-LibraryOfCongress-MODS].[dbo].[list]') AND OBJECTPROPERTY(ID, N'ISUSERTABLE') = 1) BEGIN DROP TABLE [OpenLibrary-LibraryOfCongress-MODS].[dbo].[list]END ;

IF EXISTS (SELECT * FROM DBO.SYSOBJECTS WHERE ID = OBJECT_ID(N'[OpenLibrary-LibraryOfCongress-MODS].[dbo].[state]') AND OBJECTPROPERTY(ID, N'ISUSERTABLE') = 1) BEGIN DROP TABLE [OpenLibrary-LibraryOfCongress-MODS].[dbo].[state]END ;

IF EXISTS (SELECT * FROM DBO.SYSOBJECTS WHERE ID = OBJECT_ID(N'[OpenLibrary-LibraryOfCongress-MODS].[dbo].[mods]') AND OBJECTPROPERTY(ID, N'ISUSERTABLE') = 1) BEGIN DROP TABLE [OpenLibrary-LibraryOfCongress-MODS].[dbo].[mods]END ;

IF EXISTS (SELECT * FROM DBO.SYSOBJECTS WHERE ID = OBJECT_ID(N'[OpenLibrary-LibraryOfCongress-MODS].[dbo].[hierarchicalGeographic]') AND OBJECTPROPERTY(ID, N'ISUSERTABLE') = 1) BEGIN DROP TABLE [OpenLibrary-LibraryOfCongress-MODS].[dbo].[hierarchicalGeographic]END ;

IF EXISTS (SELECT * FROM DBO.SYSOBJECTS WHERE ID = OBJECT_ID(N'[OpenLibrary-LibraryOfCongress-MODS].[dbo].[geographicCode]') AND OBJECTPROPERTY(ID, N'ISUSERTABLE') = 1) BEGIN DROP TABLE [OpenLibrary-LibraryOfCongress-MODS].[dbo].[geographicCode]END ;

IF EXISTS (SELECT * FROM DBO.SYSOBJECTS WHERE ID = OBJECT_ID(N'[OpenLibrary-LibraryOfCongress-MODS].[dbo].[end]') AND OBJECTPROPERTY(ID, N'ISUSERTABLE') = 1) BEGIN DROP TABLE [OpenLibrary-LibraryOfCongress-MODS].[dbo].[end]END ;

IF EXISTS (SELECT * FROM DBO.SYSOBJECTS WHERE ID = OBJECT_ID(N'[OpenLibrary-LibraryOfCongress-MODS].[dbo].[holdingExternal]') AND OBJECTPROPERTY(ID, N'ISUSERTABLE') = 1) BEGIN DROP TABLE [OpenLibrary-LibraryOfCongress-MODS].[dbo].[holdingExternal]END ;

IF EXISTS (SELECT * FROM DBO.SYSOBJECTS WHERE ID = OBJECT_ID(N'[OpenLibrary-LibraryOfCongress-MODS].[dbo].[territory]') AND OBJECTPROPERTY(ID, N'ISUSERTABLE') = 1) BEGIN DROP TABLE [OpenLibrary-LibraryOfCongress-MODS].[dbo].[territory]END ;

IF EXISTS (SELECT * FROM DBO.SYSOBJECTS WHERE ID = OBJECT_ID(N'[OpenLibrary-LibraryOfCongress-MODS].[dbo].[identifier]') AND OBJECTPROPERTY(ID, N'ISUSERTABLE') = 1) BEGIN DROP TABLE [OpenLibrary-LibraryOfCongress-MODS].[dbo].[identifier]END ;

IF EXISTS (SELECT * FROM DBO.SYSOBJECTS WHERE ID = OBJECT_ID(N'[OpenLibrary-LibraryOfCongress-MODS].[dbo].[physicalLocation]') AND OBJECTPROPERTY(ID, N'ISUSERTABLE') = 1) BEGIN DROP TABLE [OpenLibrary-LibraryOfCongress-MODS].[dbo].[physicalLocation]END ;

IF EXISTS (SELECT * FROM DBO.SYSOBJECTS WHERE ID = OBJECT_ID(N'[OpenLibrary-LibraryOfCongress-MODS].[dbo].[name]') AND OBJECTPROPERTY(ID, N'ISUSERTABLE') = 1) BEGIN DROP TABLE [OpenLibrary-LibraryOfCongress-MODS].[dbo].[name]END ;

IF EXISTS (SELECT * FROM DBO.SYSOBJECTS WHERE ID = OBJECT_ID(N'[OpenLibrary-LibraryOfCongress-MODS].[dbo].[edition]') AND OBJECTPROPERTY(ID, N'ISUSERTABLE') = 1) BEGIN DROP TABLE [OpenLibrary-LibraryOfCongress-MODS].[dbo].[edition]END ;

IF EXISTS (SELECT * FROM DBO.SYSOBJECTS WHERE ID = OBJECT_ID(N'[OpenLibrary-LibraryOfCongress-MODS].[dbo].[number]') AND OBJECTPROPERTY(ID, N'ISUSERTABLE') = 1) BEGIN DROP TABLE [OpenLibrary-LibraryOfCongress-MODS].[dbo].[number]END ;

IF EXISTS (SELECT * FROM DBO.SYSOBJECTS WHERE ID = OBJECT_ID(N'[OpenLibrary-LibraryOfCongress-MODS].[dbo].[title]') AND OBJECTPROPERTY(ID, N'ISUSERTABLE') = 1) BEGIN DROP TABLE [OpenLibrary-LibraryOfCongress-MODS].[dbo].[title]END ;

IF EXISTS (SELECT * FROM DBO.SYSOBJECTS WHERE ID = OBJECT_ID(N'[OpenLibrary-LibraryOfCongress-MODS].[dbo].[itemIdentifier]') AND OBJECTPROPERTY(ID, N'ISUSERTABLE') = 1) BEGIN DROP TABLE [OpenLibrary-LibraryOfCongress-MODS].[dbo].[itemIdentifier]END ;

IF EXISTS (SELECT * FROM DBO.SYSOBJECTS WHERE ID = OBJECT_ID(N'[OpenLibrary-LibraryOfCongress-MODS].[dbo].[country]') AND OBJECTPROPERTY(ID, N'ISUSERTABLE') = 1) BEGIN DROP TABLE [OpenLibrary-LibraryOfCongress-MODS].[dbo].[country]END ;

IF EXISTS (SELECT * FROM DBO.SYSOBJECTS WHERE ID = OBJECT_ID(N'[OpenLibrary-LibraryOfCongress-MODS].[dbo].[date]') AND OBJECTPROPERTY(ID, N'ISUSERTABLE') = 1) BEGIN DROP TABLE [OpenLibrary-LibraryOfCongress-MODS].[dbo].[date]END ;

IF EXISTS (SELECT * FROM DBO.SYSOBJECTS WHERE ID = OBJECT_ID(N'[OpenLibrary-LibraryOfCongress-MODS].[dbo].[county]') AND OBJECTPROPERTY(ID, N'ISUSERTABLE') = 1) BEGIN DROP TABLE [OpenLibrary-LibraryOfCongress-MODS].[dbo].[county]END ;

IF EXISTS (SELECT * FROM DBO.SYSOBJECTS WHERE ID = OBJECT_ID(N'[OpenLibrary-LibraryOfCongress-MODS].[dbo].[dateCaptured]') AND OBJECTPROPERTY(ID, N'ISUSERTABLE') = 1) BEGIN DROP TABLE [OpenLibrary-LibraryOfCongress-MODS].[dbo].[dateCaptured]END ;

IF EXISTS (SELECT * FROM DBO.SYSOBJECTS WHERE ID = OBJECT_ID(N'[OpenLibrary-LibraryOfCongress-MODS].[dbo].[copyrightDate]') AND OBJECTPROPERTY(ID, N'ISUSERTABLE') = 1) BEGIN DROP TABLE [OpenLibrary-LibraryOfCongress-MODS].[dbo].[copyrightDate]END ;

IF EXISTS (SELECT * FROM DBO.SYSOBJECTS WHERE ID = OBJECT_ID(N'[OpenLibrary-LibraryOfCongress-MODS].[dbo].[enumerationAndChronology]') AND OBJECTPROPERTY(ID, N'ISUSERTABLE') = 1) BEGIN DROP TABLE [OpenLibrary-LibraryOfCongress-MODS].[dbo].[enumerationAndChronology]END ;

IF EXISTS (SELECT * FROM DBO.SYSOBJECTS WHERE ID = OBJECT_ID(N'[OpenLibrary-LibraryOfCongress-MODS].[dbo].[alternativeName]') AND OBJECTPROPERTY(ID, N'ISUSERTABLE') = 1) BEGIN DROP TABLE [OpenLibrary-LibraryOfCongress-MODS].[dbo].[alternativeName]END ;

IF EXISTS (SELECT * FROM DBO.SYSOBJECTS WHERE ID = OBJECT_ID(N'[OpenLibrary-LibraryOfCongress-MODS].[dbo].[etal]') AND OBJECTPROPERTY(ID, N'ISUSERTABLE') = 1) BEGIN DROP TABLE [OpenLibrary-LibraryOfCongress-MODS].[dbo].[etal]END ;

IF EXISTS (SELECT * FROM DBO.SYSOBJECTS WHERE ID = OBJECT_ID(N'[OpenLibrary-LibraryOfCongress-MODS].[dbo].[area]') AND OBJECTPROPERTY(ID, N'ISUSERTABLE') = 1) BEGIN DROP TABLE [OpenLibrary-LibraryOfCongress-MODS].[dbo].[area]END ;

IF EXISTS (SELECT * FROM DBO.SYSOBJECTS WHERE ID = OBJECT_ID(N'[OpenLibrary-LibraryOfCongress-MODS].[dbo].[caption]') AND OBJECTPROPERTY(ID, N'ISUSERTABLE') = 1) BEGIN DROP TABLE [OpenLibrary-LibraryOfCongress-MODS].[dbo].[caption]END ;

IF EXISTS (SELECT * FROM DBO.SYSOBJECTS WHERE ID = OBJECT_ID(N'[OpenLibrary-LibraryOfCongress-MODS].[dbo].[cartographicExtension]') AND OBJECTPROPERTY(ID, N'ISUSERTABLE') = 1) BEGIN DROP TABLE [OpenLibrary-LibraryOfCongress-MODS].[dbo].[cartographicExtension]END ;

IF EXISTS (SELECT * FROM DBO.SYSOBJECTS WHERE ID = OBJECT_ID(N'[OpenLibrary-LibraryOfCongress-MODS].[dbo].[displayForm]') AND OBJECTPROPERTY(ID, N'ISUSERTABLE') = 1) BEGIN DROP TABLE [OpenLibrary-LibraryOfCongress-MODS].[dbo].[displayForm]END ;

IF EXISTS (SELECT * FROM DBO.SYSOBJECTS WHERE ID = OBJECT_ID(N'[OpenLibrary-LibraryOfCongress-MODS].[dbo].[roleTerm]') AND OBJECTPROPERTY(ID, N'ISUSERTABLE') = 1) BEGIN DROP TABLE [OpenLibrary-LibraryOfCongress-MODS].[dbo].[roleTerm]END ;

IF EXISTS (SELECT * FROM DBO.SYSOBJECTS WHERE ID = OBJECT_ID(N'[OpenLibrary-LibraryOfCongress-MODS].[dbo].[namePart]') AND OBJECTPROPERTY(ID, N'ISUSERTABLE') = 1) BEGIN DROP TABLE [OpenLibrary-LibraryOfCongress-MODS].[dbo].[namePart]END ;

IF EXISTS (SELECT * FROM DBO.SYSOBJECTS WHERE ID = OBJECT_ID(N'[OpenLibrary-LibraryOfCongress-MODS].[dbo].[nameIdentifier]') AND OBJECTPROPERTY(ID, N'ISUSERTABLE') = 1) BEGIN DROP TABLE [OpenLibrary-LibraryOfCongress-MODS].[dbo].[nameIdentifier]END ;

IF EXISTS (SELECT * FROM DBO.SYSOBJECTS WHERE ID = OBJECT_ID(N'[OpenLibrary-LibraryOfCongress-MODS].[dbo].[cartographics]') AND OBJECTPROPERTY(ID, N'ISUSERTABLE') = 1) BEGIN DROP TABLE [OpenLibrary-LibraryOfCongress-MODS].[dbo].[cartographics]END ;

IF EXISTS (SELECT * FROM DBO.SYSOBJECTS WHERE ID = OBJECT_ID(N'[OpenLibrary-LibraryOfCongress-MODS].[dbo].[scale]') AND OBJECTPROPERTY(ID, N'ISUSERTABLE') = 1) BEGIN DROP TABLE [OpenLibrary-LibraryOfCongress-MODS].[dbo].[scale]END ;

IF EXISTS (SELECT * FROM DBO.SYSOBJECTS WHERE ID = OBJECT_ID(N'[OpenLibrary-LibraryOfCongress-MODS].[dbo].[projection]') AND OBJECTPROPERTY(ID, N'ISUSERTABLE') = 1) BEGIN DROP TABLE [OpenLibrary-LibraryOfCongress-MODS].[dbo].[projection]END ;

IF EXISTS (SELECT * FROM DBO.SYSOBJECTS WHERE ID = OBJECT_ID(N'[OpenLibrary-LibraryOfCongress-MODS].[dbo].[abstract]') AND OBJECTPROPERTY(ID, N'ISUSERTABLE') = 1) BEGIN DROP TABLE [OpenLibrary-LibraryOfCongress-MODS].[dbo].[abstract]END ;

IF EXISTS (SELECT * FROM DBO.SYSOBJECTS WHERE ID = OBJECT_ID(N'[OpenLibrary-LibraryOfCongress-MODS].[dbo].[affiliation]') AND OBJECTPROPERTY(ID, N'ISUSERTABLE') = 1) BEGIN DROP TABLE [OpenLibrary-LibraryOfCongress-MODS].[dbo].[affiliation]END ;

IF EXISTS (SELECT * FROM DBO.SYSOBJECTS WHERE ID = OBJECT_ID(N'[OpenLibrary-LibraryOfCongress-MODS].[dbo].[agent]') AND OBJECTPROPERTY(ID, N'ISUSERTABLE') = 1) BEGIN DROP TABLE [OpenLibrary-LibraryOfCongress-MODS].[dbo].[agent]END ;

IF EXISTS (SELECT * FROM DBO.SYSOBJECTS WHERE ID = OBJECT_ID(N'[OpenLibrary-LibraryOfCongress-MODS].[dbo].[accessCondition]') AND OBJECTPROPERTY(ID, N'ISUSERTABLE') = 1) BEGIN DROP TABLE [OpenLibrary-LibraryOfCongress-MODS].[dbo].[accessCondition]END ;

IF EXISTS (SELECT * FROM DBO.SYSOBJECTS WHERE ID = OBJECT_ID(N'[OpenLibrary-LibraryOfCongress-MODS].[dbo].[description]') AND OBJECTPROPERTY(ID, N'ISUSERTABLE') = 1) BEGIN DROP TABLE [OpenLibrary-LibraryOfCongress-MODS].[dbo].[description]END ;

IF EXISTS (SELECT * FROM DBO.SYSOBJECTS WHERE ID = OBJECT_ID(N'[OpenLibrary-LibraryOfCongress-MODS].[dbo].[dateModified]') AND OBJECTPROPERTY(ID, N'ISUSERTABLE') = 1) BEGIN DROP TABLE [OpenLibrary-LibraryOfCongress-MODS].[dbo].[dateModified]END ;

IF EXISTS (SELECT * FROM DBO.SYSOBJECTS WHERE ID = OBJECT_ID(N'[OpenLibrary-LibraryOfCongress-MODS].[dbo].[dateIssued]') AND OBJECTPROPERTY(ID, N'ISUSERTABLE') = 1) BEGIN DROP TABLE [OpenLibrary-LibraryOfCongress-MODS].[dbo].[dateIssued]END ;

IF EXISTS (SELECT * FROM DBO.SYSOBJECTS WHERE ID = OBJECT_ID(N'[OpenLibrary-LibraryOfCongress-MODS].[dbo].[dateOther]') AND OBJECTPROPERTY(ID, N'ISUSERTABLE') = 1) BEGIN DROP TABLE [OpenLibrary-LibraryOfCongress-MODS].[dbo].[dateOther]END ;

IF EXISTS (SELECT * FROM DBO.SYSOBJECTS WHERE ID = OBJECT_ID(N'[OpenLibrary-LibraryOfCongress-MODS].[dbo].[dateCreated]') AND OBJECTPROPERTY(ID, N'ISUSERTABLE') = 1) BEGIN DROP TABLE [OpenLibrary-LibraryOfCongress-MODS].[dbo].[dateCreated]END ;

IF EXISTS (SELECT * FROM DBO.SYSOBJECTS WHERE ID = OBJECT_ID(N'[OpenLibrary-LibraryOfCongress-MODS].[dbo].[dateValid]') AND OBJECTPROPERTY(ID, N'ISUSERTABLE') = 1) BEGIN DROP TABLE [OpenLibrary-LibraryOfCongress-MODS].[dbo].[dateValid]END ;

IF EXISTS (SELECT * FROM DBO.SYSOBJECTS WHERE ID = OBJECT_ID(N'[OpenLibrary-LibraryOfCongress-MODS].[dbo].[detail]') AND OBJECTPROPERTY(ID, N'ISUSERTABLE') = 1) BEGIN DROP TABLE [OpenLibrary-LibraryOfCongress-MODS].[dbo].[detail]END ;

IF EXISTS (SELECT * FROM DBO.SYSOBJECTS WHERE ID = OBJECT_ID(N'[OpenLibrary-LibraryOfCongress-MODS].[dbo].[descriptionStandard]') AND OBJECTPROPERTY(ID, N'ISUSERTABLE') = 1) BEGIN DROP TABLE [OpenLibrary-LibraryOfCongress-MODS].[dbo].[descriptionStandard]END ;

IF EXISTS (SELECT * FROM DBO.SYSOBJECTS WHERE ID = OBJECT_ID(N'[OpenLibrary-LibraryOfCongress-MODS].[dbo].[recordChangeDate]') AND OBJECTPROPERTY(ID, N'ISUSERTABLE') = 1) BEGIN DROP TABLE [OpenLibrary-LibraryOfCongress-MODS].[dbo].[recordChangeDate]END ;

IF EXISTS (SELECT * FROM DBO.SYSOBJECTS WHERE ID = OBJECT_ID(N'[OpenLibrary-LibraryOfCongress-MODS].[dbo].[recordInfo]') AND OBJECTPROPERTY(ID, N'ISUSERTABLE') = 1) BEGIN DROP TABLE [OpenLibrary-LibraryOfCongress-MODS].[dbo].[recordInfo]END ;

IF EXISTS (SELECT * FROM DBO.SYSOBJECTS WHERE ID = OBJECT_ID(N'[OpenLibrary-LibraryOfCongress-MODS].[dbo].[publisher]') AND OBJECTPROPERTY(ID, N'ISUSERTABLE') = 1) BEGIN DROP TABLE [OpenLibrary-LibraryOfCongress-MODS].[dbo].[publisher]END ;

IF EXISTS (SELECT * FROM DBO.SYSOBJECTS WHERE ID = OBJECT_ID(N'[OpenLibrary-LibraryOfCongress-MODS].[dbo].[start]') AND OBJECTPROPERTY(ID, N'ISUSERTABLE') = 1) BEGIN DROP TABLE [OpenLibrary-LibraryOfCongress-MODS].[dbo].[start]END ;

IF EXISTS (SELECT * FROM DBO.SYSOBJECTS WHERE ID = OBJECT_ID(N'[OpenLibrary-LibraryOfCongress-MODS].[dbo].[part]') AND OBJECTPROPERTY(ID, N'ISUSERTABLE') = 1) BEGIN DROP TABLE [OpenLibrary-LibraryOfCongress-MODS].[dbo].[part]END ;

IF EXISTS (SELECT * FROM DBO.SYSOBJECTS WHERE ID = OBJECT_ID(N'[OpenLibrary-LibraryOfCongress-MODS].[dbo].[subject]') AND OBJECTPROPERTY(ID, N'ISUSERTABLE') = 1) BEGIN DROP TABLE [OpenLibrary-LibraryOfCongress-MODS].[dbo].[subject]END ;

IF EXISTS (SELECT * FROM DBO.SYSOBJECTS WHERE ID = OBJECT_ID(N'[OpenLibrary-LibraryOfCongress-MODS].[dbo].[temporal]') AND OBJECTPROPERTY(ID, N'ISUSERTABLE') = 1) BEGIN DROP TABLE [OpenLibrary-LibraryOfCongress-MODS].[dbo].[temporal]END ;

IF EXISTS (SELECT * FROM DBO.SYSOBJECTS WHERE ID = OBJECT_ID(N'[OpenLibrary-LibraryOfCongress-MODS].[dbo].[titleInfo]') AND OBJECTPROPERTY(ID, N'ISUSERTABLE') = 1) BEGIN DROP TABLE [OpenLibrary-LibraryOfCongress-MODS].[dbo].[titleInfo]END ;

IF EXISTS (SELECT * FROM DBO.SYSOBJECTS WHERE ID = OBJECT_ID(N'[OpenLibrary-LibraryOfCongress-MODS].[dbo].[partName]') AND OBJECTPROPERTY(ID, N'ISUSERTABLE') = 1) BEGIN DROP TABLE [OpenLibrary-LibraryOfCongress-MODS].[dbo].[partName]END ;

IF EXISTS (SELECT * FROM DBO.SYSOBJECTS WHERE ID = OBJECT_ID(N'[OpenLibrary-LibraryOfCongress-MODS].[dbo].[topic]') AND OBJECTPROPERTY(ID, N'ISUSERTABLE') = 1) BEGIN DROP TABLE [OpenLibrary-LibraryOfCongress-MODS].[dbo].[topic]END ;

IF EXISTS (SELECT * FROM DBO.SYSOBJECTS WHERE ID = OBJECT_ID(N'[OpenLibrary-LibraryOfCongress-MODS].[dbo].[subTitle]') AND OBJECTPROPERTY(ID, N'ISUSERTABLE') = 1) BEGIN DROP TABLE [OpenLibrary-LibraryOfCongress-MODS].[dbo].[subTitle]END ;

IF EXISTS (SELECT * FROM DBO.SYSOBJECTS WHERE ID = OBJECT_ID(N'[OpenLibrary-LibraryOfCongress-MODS].[dbo].[partNumber]') AND OBJECTPROPERTY(ID, N'ISUSERTABLE') = 1) BEGIN DROP TABLE [OpenLibrary-LibraryOfCongress-MODS].[dbo].[partNumber]END ;

IF EXISTS (SELECT * FROM DBO.SYSOBJECTS WHERE ID = OBJECT_ID(N'[OpenLibrary-LibraryOfCongress-MODS].[dbo].[recordContentSource]') AND OBJECTPROPERTY(ID, N'ISUSERTABLE') = 1) BEGIN DROP TABLE [OpenLibrary-LibraryOfCongress-MODS].[dbo].[recordContentSource]END ;

IF EXISTS (SELECT * FROM DBO.SYSOBJECTS WHERE ID = OBJECT_ID(N'[OpenLibrary-LibraryOfCongress-MODS].[dbo].[recordIdentifier]') AND OBJECTPROPERTY(ID, N'ISUSERTABLE') = 1) BEGIN DROP TABLE [OpenLibrary-LibraryOfCongress-MODS].[dbo].[recordIdentifier]END ;

IF EXISTS (SELECT * FROM DBO.SYSOBJECTS WHERE ID = OBJECT_ID(N'[OpenLibrary-LibraryOfCongress-MODS].[dbo].[physicalDescription]') AND OBJECTPROPERTY(ID, N'ISUSERTABLE') = 1) BEGIN DROP TABLE [OpenLibrary-LibraryOfCongress-MODS].[dbo].[physicalDescription]END ;

IF EXISTS (SELECT * FROM DBO.SYSOBJECTS WHERE ID = OBJECT_ID(N'[OpenLibrary-LibraryOfCongress-MODS].[dbo].[recordCreationDate]') AND OBJECTPROPERTY(ID, N'ISUSERTABLE') = 1) BEGIN DROP TABLE [OpenLibrary-LibraryOfCongress-MODS].[dbo].[recordCreationDate]END ;

IF EXISTS (SELECT * FROM DBO.SYSOBJECTS WHERE ID = OBJECT_ID(N'[OpenLibrary-LibraryOfCongress-MODS].[dbo].[nonSort]') AND OBJECTPROPERTY(ID, N'ISUSERTABLE') = 1) BEGIN DROP TABLE [OpenLibrary-LibraryOfCongress-MODS].[dbo].[nonSort]END ;

IF EXISTS (SELECT * FROM DBO.SYSOBJECTS WHERE ID = OBJECT_ID(N'[OpenLibrary-LibraryOfCongress-MODS].[dbo].[targetAudience]') AND OBJECTPROPERTY(ID, N'ISUSERTABLE') = 1) BEGIN DROP TABLE [OpenLibrary-LibraryOfCongress-MODS].[dbo].[targetAudience]END ;

IF EXISTS (SELECT * FROM DBO.SYSOBJECTS WHERE ID = OBJECT_ID(N'[OpenLibrary-LibraryOfCongress-MODS].[dbo].[typeOfResource]') AND OBJECTPROPERTY(ID, N'ISUSERTABLE') = 1) BEGIN DROP TABLE [OpenLibrary-LibraryOfCongress-MODS].[dbo].[typeOfResource]END ;

IF EXISTS (SELECT * FROM DBO.SYSOBJECTS WHERE ID = OBJECT_ID(N'[OpenLibrary-LibraryOfCongress-MODS].[dbo].[occupation]') AND OBJECTPROPERTY(ID, N'ISUSERTABLE') = 1) BEGIN DROP TABLE [OpenLibrary-LibraryOfCongress-MODS].[dbo].[occupation]END ;

IF EXISTS (SELECT * FROM DBO.SYSOBJECTS WHERE ID = OBJECT_ID(N'[OpenLibrary-LibraryOfCongress-MODS].[dbo].[text]') AND OBJECTPROPERTY(ID, N'ISUSERTABLE') = 1) BEGIN DROP TABLE [OpenLibrary-LibraryOfCongress-MODS].[dbo].[text]END ;

IF EXISTS (SELECT * FROM DBO.SYSOBJECTS WHERE ID = OBJECT_ID(N'[OpenLibrary-LibraryOfCongress-MODS].[dbo].[place]') AND OBJECTPROPERTY(ID, N'ISUSERTABLE') = 1) BEGIN DROP TABLE [OpenLibrary-LibraryOfCongress-MODS].[dbo].[place]END ;

IF EXISTS (SELECT * FROM DBO.SYSOBJECTS WHERE ID = OBJECT_ID(N'[OpenLibrary-LibraryOfCongress-MODS].[dbo].[placeTerm]') AND OBJECTPROPERTY(ID, N'ISUSERTABLE') = 1) BEGIN DROP TABLE [OpenLibrary-LibraryOfCongress-MODS].[dbo].[placeTerm]END ;

IF EXISTS (SELECT * FROM DBO.SYSOBJECTS WHERE ID = OBJECT_ID(N'[OpenLibrary-LibraryOfCongress-MODS].[dbo].[recordOrigin]') AND OBJECTPROPERTY(ID, N'ISUSERTABLE') = 1) BEGIN DROP TABLE [OpenLibrary-LibraryOfCongress-MODS].[dbo].[recordOrigin]END ;

IF EXISTS (SELECT * FROM DBO.SYSOBJECTS WHERE ID = OBJECT_ID(N'[OpenLibrary-LibraryOfCongress-MODS].[dbo].[recordInfoNote]') AND OBJECTPROPERTY(ID, N'ISUSERTABLE') = 1) BEGIN DROP TABLE [OpenLibrary-LibraryOfCongress-MODS].[dbo].[recordInfoNote]END ;

IF EXISTS (SELECT * FROM DBO.SYSOBJECTS WHERE ID = OBJECT_ID(N'[OpenLibrary-LibraryOfCongress-MODS].[dbo].[relatedItem]') AND OBJECTPROPERTY(ID, N'ISUSERTABLE') = 1) BEGIN DROP TABLE [OpenLibrary-LibraryOfCongress-MODS].[dbo].[relatedItem]END ;

IF EXISTS (SELECT * FROM DBO.SYSOBJECTS WHERE ID = OBJECT_ID(N'[OpenLibrary-LibraryOfCongress-MODS].[dbo].[tableOfContents]') AND OBJECTPROPERTY(ID, N'ISUSERTABLE') = 1) BEGIN DROP TABLE [OpenLibrary-LibraryOfCongress-MODS].[dbo].[tableOfContents]END ;

CREATE TABLE [OpenLibrary-LibraryOfCongress-MODS].[dbo].[shelfLocator] ( [lang] varchar (8000)  NULL , [script] varchar (8000)  NULL , [transliteration] varchar (8000)  NULL ) ;

CREATE TABLE [OpenLibrary-LibraryOfCongress-MODS].[dbo].[continent] ( [lang] varchar (8000)  NULL , [script] varchar (8000)  NULL , [transliteration] varchar (8000)  NULL , [level] varchar (8000)  NULL , [period] varchar (8000)  NULL , [authority] varchar (8000)  NULL , [authorityURI] varchar (8000)  NULL , [valueURI] varchar (8000)  NULL ) ;

CREATE TABLE [OpenLibrary-LibraryOfCongress-MODS].[dbo].[electronicLocator] ( [lang] varchar (8000)  NULL , [script] varchar (8000)  NULL , [transliteration] varchar (8000)  NULL ) ;

CREATE TABLE [OpenLibrary-LibraryOfCongress-MODS].[dbo].[coordinates] ( [lang] varchar (8000)  NULL , [script] varchar (8000)  NULL , [transliteration] varchar (8000)  NULL ) ;

CREATE TABLE [OpenLibrary-LibraryOfCongress-MODS].[dbo].[subLocation] ( [lang] varchar (8000)  NULL , [script] varchar (8000)  NULL , [transliteration] varchar (8000)  NULL ) ;

CREATE TABLE [OpenLibrary-LibraryOfCongress-MODS].[dbo].[classification] ( [lang] varchar (8000)  NULL , [script] varchar (8000)  NULL , [transliteration] varchar (8000)  NULL , [authority] varchar (8000)  NULL , [authorityURI] varchar (8000)  NULL , [valueURI] varchar (8000)  NULL , [edition] varchar (8000)  NULL , [displayLabel] varchar (8000)  NULL , [altRepGroup] varchar (8000)  NULL , [usage] varchar (8000)  NULL , [generator] varchar (8000)  NULL , [ID] varchar (255)  NULL , [IDREF] varchar (8000)  NULL ) ;

CREATE TABLE [OpenLibrary-LibraryOfCongress-MODS].[dbo].[note] ( [lang] varchar (8000)  NULL , [script] varchar (8000)  NULL , [transliteration] varchar (8000)  NULL , [displayLabel] varchar (8000)  NULL , [type] varchar (8000)  NULL , [href] varchar (8000)  NULL , [role] varchar (8000)  NULL , [arcrole] varchar (8000)  NULL , [title] varchar (8000)  NULL , [show] varchar (8000)  NULL , [actuate] varchar (8000)  NULL , [ID] varchar (255)  NULL , [IDREF] varchar (8000)  NULL , [typeURI] varchar (8000)  NULL , [altRepGroup] varchar (8000)  NULL ) ;

CREATE TABLE [OpenLibrary-LibraryOfCongress-MODS].[dbo].[city] ( [lang] varchar (8000)  NULL , [script] varchar (8000)  NULL , [transliteration] varchar (8000)  NULL , [level] varchar (8000)  NULL , [period] varchar (8000)  NULL , [authority] varchar (8000)  NULL , [authorityURI] varchar (8000)  NULL , [valueURI] varchar (8000)  NULL ) ;

CREATE TABLE [OpenLibrary-LibraryOfCongress-MODS].[dbo].[citySection] ( [lang] varchar (8000)  NULL , [script] varchar (8000)  NULL , [transliteration] varchar (8000)  NULL , [level] varchar (8000)  NULL , [period] varchar (8000)  NULL , [authority] varchar (8000)  NULL , [authorityURI] varchar (8000)  NULL , [valueURI] varchar (8000)  NULL , [citySectionType] varchar (8000)  NULL ) ;

CREATE TABLE [OpenLibrary-LibraryOfCongress-MODS].[dbo].[form] ( [lang] varchar (8000)  NULL , [script] varchar (8000)  NULL , [transliteration] varchar (8000)  NULL , [authority] varchar (8000)  NULL , [authorityURI] varchar (8000)  NULL , [valueURI] varchar (8000)  NULL , [type] varchar (8000)  NULL ) ;

CREATE TABLE [OpenLibrary-LibraryOfCongress-MODS].[dbo].[geographic] ( [lang] varchar (8000)  NULL , [script] varchar (8000)  NULL , [transliteration] varchar (8000)  NULL , [authority] varchar (8000)  NULL , [authorityURI] varchar (8000)  NULL , [valueURI] varchar (8000)  NULL ) ;

CREATE TABLE [OpenLibrary-LibraryOfCongress-MODS].[dbo].[internetMediaType] ( [lang] varchar (8000)  NULL , [script] varchar (8000)  NULL , [transliteration] varchar (8000)  NULL ) ;

CREATE TABLE [OpenLibrary-LibraryOfCongress-MODS].[dbo].[genre] ( [lang] varchar (8000)  NULL , [script] varchar (8000)  NULL , [transliteration] varchar (8000)  NULL , [authority] varchar (8000)  NULL , [authorityURI] varchar (8000)  NULL , [valueURI] varchar (8000)  NULL , [type] varchar (8000)  NULL , [displayLabel] varchar (8000)  NULL , [altRepGroup] varchar (8000)  NULL , [usage] varchar (8000)  NULL , [ID] varchar (255)  NULL , [IDREF] varchar (8000)  NULL ) ;

CREATE TABLE [OpenLibrary-LibraryOfCongress-MODS].[dbo].[extent] ( [lang] varchar (8000)  NULL , [script] varchar (8000)  NULL , [transliteration] varchar (8000)  NULL , [supplied] varchar (8000)  NULL , [unit] varchar (8000)  NULL ) ;

CREATE TABLE [OpenLibrary-LibraryOfCongress-MODS].[dbo].[frequency] ( [lang] varchar (8000)  NULL , [script] varchar (8000)  NULL , [transliteration] varchar (8000)  NULL , [authority] varchar (8000)  NULL , [authorityURI] varchar (8000)  NULL , [valueURI] varchar (8000)  NULL ) ;

CREATE TABLE [OpenLibrary-LibraryOfCongress-MODS].[dbo].[extension] ( [displayLabel] varchar (8000)  NULL , [type] varchar (8000)  NULL , [ID] varchar (255)  NULL , [IDREF] varchar (8000)  NULL ) ;

CREATE TABLE [OpenLibrary-LibraryOfCongress-MODS].[dbo].[province] ( [lang] varchar (8000)  NULL , [script] varchar (8000)  NULL , [transliteration] varchar (8000)  NULL ) ;

CREATE TABLE [OpenLibrary-LibraryOfCongress-MODS].[dbo].[region] ( [lang] varchar (8000)  NULL , [script] varchar (8000)  NULL , [transliteration] varchar (8000)  NULL , [level] varchar (8000)  NULL , [period] varchar (8000)  NULL , [authority] varchar (8000)  NULL , [authorityURI] varchar (8000)  NULL , [valueURI] varchar (8000)  NULL , [regionType] varchar (8000)  NULL ) ;

CREATE TABLE [OpenLibrary-LibraryOfCongress-MODS].[dbo].[scriptTerm] ( [lang] varchar (8000)  NULL , [script] varchar (8000)  NULL , [transliteration] varchar (8000)  NULL , [authority] varchar (8000)  NULL , [authorityURI] varchar (8000)  NULL , [valueURI] varchar (8000)  NULL , [type] varchar (8000)  NULL ) ;

CREATE TABLE [OpenLibrary-LibraryOfCongress-MODS].[dbo].[extraTerrestrialArea] ( [lang] varchar (8000)  NULL , [script] varchar (8000)  NULL , [transliteration] varchar (8000)  NULL , [level] varchar (8000)  NULL , [period] varchar (8000)  NULL , [authority] varchar (8000)  NULL , [authorityURI] varchar (8000)  NULL , [valueURI] varchar (8000)  NULL ) ;

CREATE TABLE [OpenLibrary-LibraryOfCongress-MODS].[dbo].[languageOfCataloging] ( [objectPart] varchar (8000)  NULL , [lang] varchar (8000)  NULL , [script] varchar (8000)  NULL , [transliteration] varchar (8000)  NULL , [displayLabel] varchar (8000)  NULL , [altRepGroup] varchar (8000)  NULL , [usage] varchar (8000)  NULL , [ID] varchar (255)  NULL , [IDREF] varchar (8000)  NULL ) ;

CREATE TABLE [OpenLibrary-LibraryOfCongress-MODS].[dbo].[originInfo] ( [displayDate] varchar (8000)  NOT NULL , [issuance] varchar (8000)  NOT NULL , [lang] varchar (8000)  NULL , [script] varchar (8000)  NULL , [transliteration] varchar (8000)  NULL , [displayLabel] varchar (8000)  NULL , [altRepGroup] varchar (8000)  NULL , [eventType] varchar (8000)  NULL , [eventTypeURI] varchar (8000)  NULL , [ID] varchar (255)  NULL , [IDREF] varchar (8000)  NULL ) ;

CREATE TABLE [OpenLibrary-LibraryOfCongress-MODS].[dbo].[location] ( [lang] varchar (8000)  NULL , [script] varchar (8000)  NULL , [transliteration] varchar (8000)  NULL , [displayLabel] varchar (8000)  NULL , [altRepGroup] varchar (8000)  NULL , [ID] varchar (255)  NULL , [IDREF] varchar (8000)  NULL ) ;

CREATE TABLE [OpenLibrary-LibraryOfCongress-MODS].[dbo].[island] ( [lang] varchar (8000)  NULL , [script] varchar (8000)  NULL , [transliteration] varchar (8000)  NULL , [level] varchar (8000)  NULL , [period] varchar (8000)  NULL , [authority] varchar (8000)  NULL , [authorityURI] varchar (8000)  NULL , [valueURI] varchar (8000)  NULL ) ;

CREATE TABLE [OpenLibrary-LibraryOfCongress-MODS].[dbo].[url] ( [dateLastAccessed] varchar (8000)  NULL , [displayLabel] varchar (8000)  NULL , [note] varchar (8000)  NULL , [access] varchar (8000)  NULL , [usage] varchar (8000)  NULL ) ;

CREATE TABLE [OpenLibrary-LibraryOfCongress-MODS].[dbo].[languageTerm] ( [lang] varchar (8000)  NULL , [script] varchar (8000)  NULL , [transliteration] varchar (8000)  NULL , [authority] varchar (8000)  NULL , [authorityURI] varchar (8000)  NULL , [valueURI] varchar (8000)  NULL , [type] varchar (8000)  NULL ) ;

CREATE TABLE [OpenLibrary-LibraryOfCongress-MODS].[dbo].[language] ( [objectPart] varchar (8000)  NULL , [lang] varchar (8000)  NULL , [script] varchar (8000)  NULL , [transliteration] varchar (8000)  NULL , [displayLabel] varchar (8000)  NULL , [altRepGroup] varchar (8000)  NULL , [usage] varchar (8000)  NULL , [ID] varchar (255)  NULL , [IDREF] varchar (8000)  NULL ) ;

CREATE TABLE [OpenLibrary-LibraryOfCongress-MODS].[dbo].[list] ( [lang] varchar (8000)  NULL , [script] varchar (8000)  NULL , [transliteration] varchar (8000)  NULL ) ;

CREATE TABLE [OpenLibrary-LibraryOfCongress-MODS].[dbo].[state] ( [lang] varchar (8000)  NULL , [script] varchar (8000)  NULL , [transliteration] varchar (8000)  NULL , [level] varchar (8000)  NULL , [period] varchar (8000)  NULL , [authority] varchar (8000)  NULL , [authorityURI] varchar (8000)  NULL , [valueURI] varchar (8000)  NULL , [stateType] varchar (8000)  NULL ) ;

CREATE TABLE [OpenLibrary-LibraryOfCongress-MODS].[dbo].[mods] ( [ID] varchar (255)  NULL , [IDREF] varchar (8000)  NULL , [version] varchar (8000)  NULL ) ;

CREATE TABLE [OpenLibrary-LibraryOfCongress-MODS].[dbo].[hierarchicalGeographic] ( [authority] varchar (8000)  NULL , [authorityURI] varchar (8000)  NULL , [valueURI] varchar (8000)  NULL ) ;

CREATE TABLE [OpenLibrary-LibraryOfCongress-MODS].[dbo].[geographicCode] ( [lang] varchar (8000)  NULL , [script] varchar (8000)  NULL , [transliteration] varchar (8000)  NULL , [authority] varchar (8000)  NULL , [authorityURI] varchar (8000)  NULL , [valueURI] varchar (8000)  NULL ) ;

CREATE TABLE [OpenLibrary-LibraryOfCongress-MODS].[dbo].[end] ( [lang] varchar (8000)  NULL , [script] varchar (8000)  NULL , [transliteration] varchar (8000)  NULL ) ;

CREATE TABLE [OpenLibrary-LibraryOfCongress-MODS].[dbo].[holdingExternal] ( [displayLabel] varchar (8000)  NULL , [type] varchar (8000)  NULL , [ID] varchar (255)  NULL , [IDREF] varchar (8000)  NULL ) ;

CREATE TABLE [OpenLibrary-LibraryOfCongress-MODS].[dbo].[territory] ( [lang] varchar (8000)  NULL , [script] varchar (8000)  NULL , [transliteration] varchar (8000)  NULL , [level] varchar (8000)  NULL , [period] varchar (8000)  NULL , [authority] varchar (8000)  NULL , [authorityURI] varchar (8000)  NULL , [valueURI] varchar (8000)  NULL ) ;

CREATE TABLE [OpenLibrary-LibraryOfCongress-MODS].[dbo].[identifier] ( [lang] varchar (8000)  NULL , [script] varchar (8000)  NULL , [transliteration] varchar (8000)  NULL , [displayLabel] varchar (8000)  NULL , [type] varchar (8000)  NULL , [typeURI] varchar (8000)  NULL , [invalid] varchar (8000)  NULL , [altRepGroup] varchar (8000)  NULL , [ID] varchar (255)  NULL , [IDREF] varchar (8000)  NULL ) ;

CREATE TABLE [OpenLibrary-LibraryOfCongress-MODS].[dbo].[physicalLocation] ( [lang] varchar (8000)  NULL , [script] varchar (8000)  NULL , [transliteration] varchar (8000)  NULL , [authority] varchar (8000)  NULL , [authorityURI] varchar (8000)  NULL , [valueURI] varchar (8000)  NULL , [type] varchar (8000)  NULL , [href] varchar (8000)  NULL , [role] varchar (8000)  NULL , [arcrole] varchar (8000)  NULL , [title] varchar (8000)  NULL , [show] varchar (8000)  NULL , [actuate] varchar (8000)  NULL , [displayLabel] varchar (8000)  NULL ) ;

CREATE TABLE [OpenLibrary-LibraryOfCongress-MODS].[dbo].[name] ( [ID] varchar (255)  NULL , [IDREF] varchar (8000)  NULL , [authority] varchar (8000)  NULL , [authorityURI] varchar (8000)  NULL , [valueURI] varchar (8000)  NULL , [type] varchar (8000)  NULL , [href] varchar (8000)  NULL , [role] varchar (8000)  NULL , [arcrole] varchar (8000)  NULL , [title] varchar (8000)  NULL , [show] varchar (8000)  NULL , [actuate] varchar (8000)  NULL , [lang] varchar (8000)  NULL , [script] varchar (8000)  NULL , [transliteration] varchar (8000)  NULL , [displayLabel] varchar (8000)  NULL , [altRepGroup] varchar (8000)  NULL , [nameTitleGroup] varchar (8000)  NULL , [usage] varchar (8000)  NULL , [supplied] varchar (8000)  NULL ) ;

CREATE TABLE [OpenLibrary-LibraryOfCongress-MODS].[dbo].[edition] ( [lang] varchar (8000)  NULL , [script] varchar (8000)  NULL , [transliteration] varchar (8000)  NULL , [supplied] varchar (8000)  NULL ) ;

CREATE TABLE [OpenLibrary-LibraryOfCongress-MODS].[dbo].[number] ( [lang] varchar (8000)  NULL , [script] varchar (8000)  NULL , [transliteration] varchar (8000)  NULL ) ;

CREATE TABLE [OpenLibrary-LibraryOfCongress-MODS].[dbo].[title] ( [lang] varchar (8000)  NULL , [script] varchar (8000)  NULL , [transliteration] varchar (8000)  NULL ) ;

CREATE TABLE [OpenLibrary-LibraryOfCongress-MODS].[dbo].[itemIdentifier] ( [lang] varchar (8000)  NULL , [script] varchar (8000)  NULL , [transliteration] varchar (8000)  NULL , [type] varchar (8000)  NULL ) ;

CREATE TABLE [OpenLibrary-LibraryOfCongress-MODS].[dbo].[country] ( [lang] varchar (8000)  NULL , [script] varchar (8000)  NULL , [transliteration] varchar (8000)  NULL , [level] varchar (8000)  NULL , [period] varchar (8000)  NULL , [authority] varchar (8000)  NULL , [authorityURI] varchar (8000)  NULL , [valueURI] varchar (8000)  NULL ) ;

CREATE TABLE [OpenLibrary-LibraryOfCongress-MODS].[dbo].[date] ( [lang] varchar (8000)  NULL , [script] varchar (8000)  NULL , [transliteration] varchar (8000)  NULL , [encoding] varchar (8000)  NULL , [qualifier] varchar (8000)  NULL , [point] varchar (8000)  NULL , [keyDate] varchar (8000)  NULL , [calendar] varchar (8000)  NULL ) ;

CREATE TABLE [OpenLibrary-LibraryOfCongress-MODS].[dbo].[county] ( [lang] varchar (8000)  NULL , [script] varchar (8000)  NULL , [transliteration] varchar (8000)  NULL , [level] varchar (8000)  NULL , [period] varchar (8000)  NULL , [authority] varchar (8000)  NULL , [authorityURI] varchar (8000)  NULL , [valueURI] varchar (8000)  NULL ) ;

CREATE TABLE [OpenLibrary-LibraryOfCongress-MODS].[dbo].[dateCaptured] ( [lang] varchar (8000)  NULL , [script] varchar (8000)  NULL , [transliteration] varchar (8000)  NULL , [encoding] varchar (8000)  NULL , [qualifier] varchar (8000)  NULL , [point] varchar (8000)  NULL , [keyDate] varchar (8000)  NULL , [calendar] varchar (8000)  NULL ) ;

CREATE TABLE [OpenLibrary-LibraryOfCongress-MODS].[dbo].[copyrightDate] ( [lang] varchar (8000)  NULL , [script] varchar (8000)  NULL , [transliteration] varchar (8000)  NULL , [encoding] varchar (8000)  NULL , [qualifier] varchar (8000)  NULL , [point] varchar (8000)  NULL , [keyDate] varchar (8000)  NULL , [calendar] varchar (8000)  NULL ) ;

CREATE TABLE [OpenLibrary-LibraryOfCongress-MODS].[dbo].[enumerationAndChronology] ( [lang] varchar (8000)  NULL , [script] varchar (8000)  NULL , [transliteration] varchar (8000)  NULL , [unitType] varchar (8000)  NULL ) ;

CREATE TABLE [OpenLibrary-LibraryOfCongress-MODS].[dbo].[alternativeName] ( [type] varchar (8000)  NULL , [href] varchar (8000)  NULL , [role] varchar (8000)  NULL , [arcrole] varchar (8000)  NULL , [title] varchar (8000)  NULL , [show] varchar (8000)  NULL , [actuate] varchar (8000)  NULL , [lang] varchar (8000)  NULL , [script] varchar (8000)  NULL , [transliteration] varchar (8000)  NULL , [displayLabel] varchar (8000)  NULL , [altType] varchar (8000)  NULL ) ;

CREATE TABLE [OpenLibrary-LibraryOfCongress-MODS].[dbo].[etal] ( [lang] varchar (8000)  NULL , [script] varchar (8000)  NULL , [transliteration] varchar (8000)  NULL ) ;

CREATE TABLE [OpenLibrary-LibraryOfCongress-MODS].[dbo].[area] ( [lang] varchar (8000)  NULL , [script] varchar (8000)  NULL , [transliteration] varchar (8000)  NULL , [level] varchar (8000)  NULL , [period] varchar (8000)  NULL , [authority] varchar (8000)  NULL , [authorityURI] varchar (8000)  NULL , [valueURI] varchar (8000)  NULL , [areaType] varchar (8000)  NULL ) ;

CREATE TABLE [OpenLibrary-LibraryOfCongress-MODS].[dbo].[caption] ( [lang] varchar (8000)  NULL , [script] varchar (8000)  NULL , [transliteration] varchar (8000)  NULL ) ;

CREATE TABLE [OpenLibrary-LibraryOfCongress-MODS].[dbo].[cartographicExtension] ( [displayLabel] varchar (8000)  NULL , [type] varchar (8000)  NULL , [ID] varchar (255)  NULL , [IDREF] varchar (8000)  NULL ) ;

CREATE TABLE [OpenLibrary-LibraryOfCongress-MODS].[dbo].[displayForm] ( [lang] varchar (8000)  NULL , [script] varchar (8000)  NULL , [transliteration] varchar (8000)  NULL ) ;

CREATE TABLE [OpenLibrary-LibraryOfCongress-MODS].[dbo].[roleTerm] ( [lang] varchar (8000)  NULL , [script] varchar (8000)  NULL , [transliteration] varchar (8000)  NULL , [authority] varchar (8000)  NULL , [authorityURI] varchar (8000)  NULL , [valueURI] varchar (8000)  NULL , [type] varchar (8000)  NULL ) ;

CREATE TABLE [OpenLibrary-LibraryOfCongress-MODS].[dbo].[namePart] ( [lang] varchar (8000)  NULL , [script] varchar (8000)  NULL , [transliteration] varchar (8000)  NULL , [type] varchar (8000)  NULL ) ;

CREATE TABLE [OpenLibrary-LibraryOfCongress-MODS].[dbo].[nameIdentifier] ( [lang] varchar (8000)  NULL , [script] varchar (8000)  NULL , [transliteration] varchar (8000)  NULL , [displayLabel] varchar (8000)  NULL , [type] varchar (8000)  NULL , [typeURI] varchar (8000)  NULL , [invalid] varchar (8000)  NULL , [altRepGroup] varchar (8000)  NULL , [ID] varchar (255)  NULL , [IDREF] varchar (8000)  NULL ) ;

CREATE TABLE [OpenLibrary-LibraryOfCongress-MODS].[dbo].[cartographics] ( [authority] varchar (8000)  NULL , [authorityURI] varchar (8000)  NULL , [valueURI] varchar (8000)  NULL ) ;

CREATE TABLE [OpenLibrary-LibraryOfCongress-MODS].[dbo].[scale] ( [lang] varchar (8000)  NULL , [script] varchar (8000)  NULL , [transliteration] varchar (8000)  NULL ) ;

CREATE TABLE [OpenLibrary-LibraryOfCongress-MODS].[dbo].[projection] ( [lang] varchar (8000)  NULL , [script] varchar (8000)  NULL , [transliteration] varchar (8000)  NULL ) ;

CREATE TABLE [OpenLibrary-LibraryOfCongress-MODS].[dbo].[abstract] ( [lang] varchar (8000)  NULL , [script] varchar (8000)  NULL , [transliteration] varchar (8000)  NULL , [displayLabel] varchar (8000)  NULL , [type] varchar (8000)  NULL , [href] varchar (8000)  NULL , [role] varchar (8000)  NULL , [arcrole] varchar (8000)  NULL , [title] varchar (8000)  NULL , [show] varchar (8000)  NULL , [actuate] varchar (8000)  NULL , [shareable] varchar (8000)  NULL , [altRepGroup] varchar (8000)  NULL , [altFormat] varchar (8000)  NULL , [contentType] varchar (8000)  NULL , [ID] varchar (255)  NULL , [IDREF] varchar (8000)  NULL ) ;

CREATE TABLE [OpenLibrary-LibraryOfCongress-MODS].[dbo].[affiliation] ( [lang] varchar (8000)  NULL , [script] varchar (8000)  NULL , [transliteration] varchar (8000)  NULL , [authority] varchar (8000)  NULL , [authorityURI] varchar (8000)  NULL , [valueURI] varchar (8000)  NULL ) ;

CREATE TABLE [OpenLibrary-LibraryOfCongress-MODS].[dbo].[agent] ( [ID] varchar (255)  NULL , [IDREF] varchar (8000)  NULL , [authority] varchar (8000)  NULL , [authorityURI] varchar (8000)  NULL , [valueURI] varchar (8000)  NULL , [type] varchar (8000)  NULL , [href] varchar (8000)  NULL , [role] varchar (8000)  NULL , [arcrole] varchar (8000)  NULL , [title] varchar (8000)  NULL , [show] varchar (8000)  NULL , [actuate] varchar (8000)  NULL , [lang] varchar (8000)  NULL , [script] varchar (8000)  NULL , [transliteration] varchar (8000)  NULL , [displayLabel] varchar (8000)  NULL , [altRepGroup] varchar (8000)  NULL , [nameTitleGroup] varchar (8000)  NULL , [usage] varchar (8000)  NULL , [supplied] varchar (8000)  NULL ) ;

CREATE TABLE [OpenLibrary-LibraryOfCongress-MODS].[dbo].[accessCondition] ( [displayLabel] varchar (8000)  NULL , [type] varchar (8000)  NULL , [ID] varchar (255)  NULL , [IDREF] varchar (8000)  NULL , [href] varchar (8000)  NULL , [role] varchar (8000)  NULL , [arcrole] varchar (8000)  NULL , [title] varchar (8000)  NULL , [show] varchar (8000)  NULL , [actuate] varchar (8000)  NULL , [lang] varchar (8000)  NULL , [script] varchar (8000)  NULL , [transliteration] varchar (8000)  NULL , [altRepGroup] varchar (8000)  NULL , [altFormat] varchar (8000)  NULL , [contentType] varchar (8000)  NULL , [authority] varchar (8000)  NULL , [authorityURI] varchar (8000)  NULL , [valueURI] varchar (8000)  NULL ) ;

CREATE TABLE [OpenLibrary-LibraryOfCongress-MODS].[dbo].[description] ( [lang] varchar (8000)  NULL , [script] varchar (8000)  NULL , [transliteration] varchar (8000)  NULL ) ;

CREATE TABLE [OpenLibrary-LibraryOfCongress-MODS].[dbo].[dateModified] ( [lang] varchar (8000)  NULL , [script] varchar (8000)  NULL , [transliteration] varchar (8000)  NULL , [encoding] varchar (8000)  NULL , [qualifier] varchar (8000)  NULL , [point] varchar (8000)  NULL , [keyDate] varchar (8000)  NULL , [calendar] varchar (8000)  NULL ) ;

CREATE TABLE [OpenLibrary-LibraryOfCongress-MODS].[dbo].[dateIssued] ( [lang] varchar (8000)  NULL , [script] varchar (8000)  NULL , [transliteration] varchar (8000)  NULL , [encoding] varchar (8000)  NULL , [qualifier] varchar (8000)  NULL , [point] varchar (8000)  NULL , [keyDate] varchar (8000)  NULL , [calendar] varchar (8000)  NULL ) ;

CREATE TABLE [OpenLibrary-LibraryOfCongress-MODS].[dbo].[dateOther] ( [lang] varchar (8000)  NULL , [script] varchar (8000)  NULL , [transliteration] varchar (8000)  NULL , [encoding] varchar (8000)  NULL , [qualifier] varchar (8000)  NULL , [point] varchar (8000)  NULL , [keyDate] varchar (8000)  NULL , [calendar] varchar (8000)  NULL , [type] varchar (8000)  NULL ) ;

CREATE TABLE [OpenLibrary-LibraryOfCongress-MODS].[dbo].[dateCreated] ( [lang] varchar (8000)  NULL , [script] varchar (8000)  NULL , [transliteration] varchar (8000)  NULL , [encoding] varchar (8000)  NULL , [qualifier] varchar (8000)  NULL , [point] varchar (8000)  NULL , [keyDate] varchar (8000)  NULL , [calendar] varchar (8000)  NULL ) ;

CREATE TABLE [OpenLibrary-LibraryOfCongress-MODS].[dbo].[dateValid] ( [lang] varchar (8000)  NULL , [script] varchar (8000)  NULL , [transliteration] varchar (8000)  NULL , [encoding] varchar (8000)  NULL , [qualifier] varchar (8000)  NULL , [point] varchar (8000)  NULL , [keyDate] varchar (8000)  NULL , [calendar] varchar (8000)  NULL ) ;

CREATE TABLE [OpenLibrary-LibraryOfCongress-MODS].[dbo].[detail] ( [type] varchar (8000)  NULL , [level] bit  NULL ) ;

CREATE TABLE [OpenLibrary-LibraryOfCongress-MODS].[dbo].[descriptionStandard] ( [lang] varchar (8000)  NULL , [script] varchar (8000)  NULL , [transliteration] varchar (8000)  NULL , [authority] varchar (8000)  NULL , [authorityURI] varchar (8000)  NULL , [valueURI] varchar (8000)  NULL ) ;

CREATE TABLE [OpenLibrary-LibraryOfCongress-MODS].[dbo].[recordChangeDate] ( [lang] varchar (8000)  NULL , [script] varchar (8000)  NULL , [transliteration] varchar (8000)  NULL , [encoding] varchar (8000)  NULL , [qualifier] varchar (8000)  NULL , [point] varchar (8000)  NULL , [keyDate] varchar (8000)  NULL , [calendar] varchar (8000)  NULL ) ;

CREATE TABLE [OpenLibrary-LibraryOfCongress-MODS].[dbo].[recordInfo] ( [lang] varchar (8000)  NULL , [script] varchar (8000)  NULL , [transliteration] varchar (8000)  NULL , [displayLabel] varchar (8000)  NULL , [altRepGroup] varchar (8000)  NULL , [usage] varchar (8000)  NULL , [ID] varchar (255)  NULL , [IDREF] varchar (8000)  NULL ) ;

CREATE TABLE [OpenLibrary-LibraryOfCongress-MODS].[dbo].[publisher] ( [lang] varchar (8000)  NULL , [script] varchar (8000)  NULL , [transliteration] varchar (8000)  NULL , [supplied] varchar (8000)  NULL , [authority] varchar (8000)  NULL , [authorityURI] varchar (8000)  NULL , [valueURI] varchar (8000)  NULL ) ;

CREATE TABLE [OpenLibrary-LibraryOfCongress-MODS].[dbo].[start] ( [lang] varchar (8000)  NULL , [script] varchar (8000)  NULL , [transliteration] varchar (8000)  NULL ) ;

CREATE TABLE [OpenLibrary-LibraryOfCongress-MODS].[dbo].[part] ( [type] varchar (8000)  NULL , [order] bit  NULL , [lang] varchar (8000)  NULL , [script] varchar (8000)  NULL , [transliteration] varchar (8000)  NULL , [displayLabel] varchar (8000)  NULL , [altRepGroup] varchar (8000)  NULL , [ID] varchar (255)  NULL , [IDREF] varchar (8000)  NULL ) ;

CREATE TABLE [OpenLibrary-LibraryOfCongress-MODS].[dbo].[subject] ( [authority] varchar (8000)  NULL , [authorityURI] varchar (8000)  NULL , [valueURI] varchar (8000)  NULL , [lang] varchar (8000)  NULL , [script] varchar (8000)  NULL , [transliteration] varchar (8000)  NULL , [type] varchar (8000)  NULL , [href] varchar (8000)  NULL , [role] varchar (8000)  NULL , [arcrole] varchar (8000)  NULL , [title] varchar (8000)  NULL , [show] varchar (8000)  NULL , [actuate] varchar (8000)  NULL , [displayLabel] varchar (8000)  NULL , [altRepGroup] varchar (8000)  NULL , [ID] varchar (255)  NULL , [IDREF] varchar (8000)  NULL , [usage] varchar (8000)  NULL ) ;

CREATE TABLE [OpenLibrary-LibraryOfCongress-MODS].[dbo].[temporal] ( [lang] varchar (8000)  NULL , [script] varchar (8000)  NULL , [transliteration] varchar (8000)  NULL , [encoding] varchar (8000)  NULL , [qualifier] varchar (8000)  NULL , [point] varchar (8000)  NULL , [keyDate] varchar (8000)  NULL , [calendar] varchar (8000)  NULL , [authority] varchar (8000)  NULL , [authorityURI] varchar (8000)  NULL , [valueURI] varchar (8000)  NULL ) ;

CREATE TABLE [OpenLibrary-LibraryOfCongress-MODS].[dbo].[titleInfo] ( [ID] varchar (255)  NULL , [IDREF] varchar (8000)  NULL , [authority] varchar (8000)  NULL , [authorityURI] varchar (8000)  NULL , [valueURI] varchar (8000)  NULL , [type] varchar (8000)  NULL , [href] varchar (8000)  NULL , [role] varchar (8000)  NULL , [arcrole] varchar (8000)  NULL , [title] varchar (8000)  NULL , [show] varchar (8000)  NULL , [actuate] varchar (8000)  NULL , [lang] varchar (8000)  NULL , [script] varchar (8000)  NULL , [transliteration] varchar (8000)  NULL , [displayLabel] varchar (8000)  NULL , [otherType] varchar (8000)  NULL , [otherTypeAuth] varchar (8000)  NULL , [otherTypeAuthURI] varchar (8000)  NULL , [otherTypeURI] varchar (8000)  NULL , [supplied] varchar (8000)  NULL , [altRepGroup] varchar (8000)  NULL , [altFormat] varchar (8000)  NULL , [contentType] varchar (8000)  NULL , [nameTitleGroup] varchar (8000)  NULL , [usage] varchar (8000)  NULL ) ;

CREATE TABLE [OpenLibrary-LibraryOfCongress-MODS].[dbo].[partName] ( [lang] varchar (8000)  NULL , [script] varchar (8000)  NULL , [transliteration] varchar (8000)  NULL ) ;

CREATE TABLE [OpenLibrary-LibraryOfCongress-MODS].[dbo].[topic] ( [lang] varchar (8000)  NULL , [script] varchar (8000)  NULL , [transliteration] varchar (8000)  NULL , [authority] varchar (8000)  NULL , [authorityURI] varchar (8000)  NULL , [valueURI] varchar (8000)  NULL ) ;

CREATE TABLE [OpenLibrary-LibraryOfCongress-MODS].[dbo].[subTitle] ( [lang] varchar (8000)  NULL , [script] varchar (8000)  NULL , [transliteration] varchar (8000)  NULL ) ;

CREATE TABLE [OpenLibrary-LibraryOfCongress-MODS].[dbo].[partNumber] ( [lang] varchar (8000)  NULL , [script] varchar (8000)  NULL , [transliteration] varchar (8000)  NULL ) ;

CREATE TABLE [OpenLibrary-LibraryOfCongress-MODS].[dbo].[recordContentSource] ( [lang] varchar (8000)  NULL , [script] varchar (8000)  NULL , [transliteration] varchar (8000)  NULL , [authority] varchar (8000)  NULL , [authorityURI] varchar (8000)  NULL , [valueURI] varchar (8000)  NULL ) ;

CREATE TABLE [OpenLibrary-LibraryOfCongress-MODS].[dbo].[recordIdentifier] ( [lang] varchar (8000)  NULL , [script] varchar (8000)  NULL , [transliteration] varchar (8000)  NULL , [source] varchar (8000)  NULL ) ;

CREATE TABLE [OpenLibrary-LibraryOfCongress-MODS].[dbo].[physicalDescription] ( [reformattingQuality] varchar (8000)  NOT NULL , [digitalOrigin] varchar (8000)  NOT NULL , [lang] varchar (8000)  NULL , [script] varchar (8000)  NULL , [transliteration] varchar (8000)  NULL , [displayLabel] varchar (8000)  NULL , [altRepGroup] varchar (8000)  NULL , [ID] varchar (255)  NULL , [IDREF] varchar (8000)  NULL ) ;

CREATE TABLE [OpenLibrary-LibraryOfCongress-MODS].[dbo].[recordCreationDate] ( [lang] varchar (8000)  NULL , [script] varchar (8000)  NULL , [transliteration] varchar (8000)  NULL , [encoding] varchar (8000)  NULL , [qualifier] varchar (8000)  NULL , [point] varchar (8000)  NULL , [keyDate] varchar (8000)  NULL , [calendar] varchar (8000)  NULL ) ;

CREATE TABLE [OpenLibrary-LibraryOfCongress-MODS].[dbo].[nonSort] ( [lang] varchar (8000)  NULL , [script] varchar (8000)  NULL , [transliteration] varchar (8000)  NULL , [space] varchar (8000)  NULL ) ;

CREATE TABLE [OpenLibrary-LibraryOfCongress-MODS].[dbo].[targetAudience] ( [lang] varchar (8000)  NULL , [script] varchar (8000)  NULL , [transliteration] varchar (8000)  NULL , [authority] varchar (8000)  NULL , [authorityURI] varchar (8000)  NULL , [valueURI] varchar (8000)  NULL , [displayLabel] varchar (8000)  NULL , [altRepGroup] varchar (8000)  NULL , [ID] varchar (255)  NULL , [IDREF] varchar (8000)  NULL ) ;

CREATE TABLE [OpenLibrary-LibraryOfCongress-MODS].[dbo].[typeOfResource] ( [lang] varchar (8000)  NULL , [script] varchar (8000)  NULL , [transliteration] varchar (8000)  NULL , [authority] varchar (8000)  NULL , [authorityURI] varchar (8000)  NULL , [valueURI] varchar (8000)  NULL , [collection] varchar (8000)  NULL , [manuscript] varchar (8000)  NULL , [usage] varchar (8000)  NULL , [displayLabel] varchar (8000)  NULL , [altRepGroup] varchar (8000)  NULL , [ID] varchar (255)  NULL , [IDREF] varchar (8000)  NULL ) ;

CREATE TABLE [OpenLibrary-LibraryOfCongress-MODS].[dbo].[occupation] ( [lang] varchar (8000)  NULL , [script] varchar (8000)  NULL , [transliteration] varchar (8000)  NULL , [authority] varchar (8000)  NULL , [authorityURI] varchar (8000)  NULL , [valueURI] varchar (8000)  NULL ) ;

CREATE TABLE [OpenLibrary-LibraryOfCongress-MODS].[dbo].[text] ( [lang] varchar (8000)  NULL , [script] varchar (8000)  NULL , [transliteration] varchar (8000)  NULL , [displayLabel] varchar (8000)  NULL , [type] varchar (8000)  NULL , [href] varchar (8000)  NULL , [role] varchar (8000)  NULL , [arcrole] varchar (8000)  NULL , [title] varchar (8000)  NULL , [show] varchar (8000)  NULL , [actuate] varchar (8000)  NULL ) ;

CREATE TABLE [OpenLibrary-LibraryOfCongress-MODS].[dbo].[place] ( [placeIdentifier] varchar (8000)  NOT NULL , [supplied] varchar (8000)  NULL ) ;

CREATE TABLE [OpenLibrary-LibraryOfCongress-MODS].[dbo].[placeTerm] ( [lang] varchar (8000)  NULL , [script] varchar (8000)  NULL , [transliteration] varchar (8000)  NULL , [authority] varchar (8000)  NULL , [authorityURI] varchar (8000)  NULL , [valueURI] varchar (8000)  NULL , [type] varchar (8000)  NULL ) ;

CREATE TABLE [OpenLibrary-LibraryOfCongress-MODS].[dbo].[recordOrigin] ( [lang] varchar (8000)  NULL , [script] varchar (8000)  NULL , [transliteration] varchar (8000)  NULL ) ;

CREATE TABLE [OpenLibrary-LibraryOfCongress-MODS].[dbo].[recordInfoNote] ( [lang] varchar (8000)  NULL , [script] varchar (8000)  NULL , [transliteration] varchar (8000)  NULL , [displayLabel] varchar (8000)  NULL , [type] varchar (8000)  NULL , [typeURI] varchar (8000)  NULL , [href] varchar (8000)  NULL , [role] varchar (8000)  NULL , [arcrole] varchar (8000)  NULL , [title] varchar (8000)  NULL , [show] varchar (8000)  NULL , [actuate] varchar (8000)  NULL , [ID] varchar (255)  NULL , [IDREF] varchar (8000)  NULL , [altRepGroup] varchar (8000)  NULL ) ;

CREATE TABLE [OpenLibrary-LibraryOfCongress-MODS].[dbo].[relatedItem] ( [type] varchar (8000)  NULL , [otherType] varchar (8000)  NULL , [otherTypeAuth] varchar (8000)  NULL , [otherTypeAuthURI] varchar (8000)  NULL , [otherTypeURI] varchar (8000)  NULL , [displayLabel] varchar (8000)  NULL , [href] varchar (8000)  NULL , [role] varchar (8000)  NULL , [arcrole] varchar (8000)  NULL , [title] varchar (8000)  NULL , [show] varchar (8000)  NULL , [actuate] varchar (8000)  NULL , [ID] varchar (255)  NULL , [IDREF] varchar (8000)  NULL ) ;

CREATE TABLE [OpenLibrary-LibraryOfCongress-MODS].[dbo].[tableOfContents] ( [lang] varchar (8000)  NULL , [script] varchar (8000)  NULL , [transliteration] varchar (8000)  NULL , [displayLabel] varchar (8000)  NULL , [type] varchar (8000)  NULL , [href] varchar (8000)  NULL , [role] varchar (8000)  NULL , [arcrole] varchar (8000)  NULL , [title] varchar (8000)  NULL , [show] varchar (8000)  NULL , [actuate] varchar (8000)  NULL , [shareable] varchar (8000)  NULL , [altRepGroup] varchar (8000)  NULL , [altFormat] varchar (8000)  NULL , [contentType] varchar (8000)  NULL , [ID] varchar (255)  NULL , [IDREF] varchar (8000)  NULL ) ;

