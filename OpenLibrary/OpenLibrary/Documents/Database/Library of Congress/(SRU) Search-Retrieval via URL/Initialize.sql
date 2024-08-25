IF EXISTS (SELECT * FROM DBO.SYSOBJECTS WHERE ID = OBJECT_ID(N'[OpenLibrary-LibraryOfCongress-ZEEREX].[dbo].[subjects]') AND OBJECTPROPERTY(ID, N'ISUSERTABLE') = 1) BEGIN DROP TABLE [OpenLibrary-LibraryOfCongress-ZEEREX].[dbo].[subjects]END ;

IF EXISTS (SELECT * FROM DBO.SYSOBJECTS WHERE ID = OBJECT_ID(N'[OpenLibrary-LibraryOfCongress-ZEEREX].[dbo].[set]') AND OBJECTPROPERTY(ID, N'ISUSERTABLE') = 1) BEGIN DROP TABLE [OpenLibrary-LibraryOfCongress-ZEEREX].[dbo].[set]END ;

IF EXISTS (SELECT * FROM DBO.SYSOBJECTS WHERE ID = OBJECT_ID(N'[OpenLibrary-LibraryOfCongress-ZEEREX].[dbo].[langUsage]') AND OBJECTPROPERTY(ID, N'ISUSERTABLE') = 1) BEGIN DROP TABLE [OpenLibrary-LibraryOfCongress-ZEEREX].[dbo].[langUsage]END ;

IF EXISTS (SELECT * FROM DBO.SYSOBJECTS WHERE ID = OBJECT_ID(N'[OpenLibrary-LibraryOfCongress-ZEEREX].[dbo].[history]') AND OBJECTPROPERTY(ID, N'ISUSERTABLE') = 1) BEGIN DROP TABLE [OpenLibrary-LibraryOfCongress-ZEEREX].[dbo].[history]END ;

IF EXISTS (SELECT * FROM DBO.SYSOBJECTS WHERE ID = OBJECT_ID(N'[OpenLibrary-LibraryOfCongress-ZEEREX].[dbo].[map]') AND OBJECTPROPERTY(ID, N'ISUSERTABLE') = 1) BEGIN DROP TABLE [OpenLibrary-LibraryOfCongress-ZEEREX].[dbo].[map]END ;

IF EXISTS (SELECT * FROM DBO.SYSOBJECTS WHERE ID = OBJECT_ID(N'[OpenLibrary-LibraryOfCongress-ZEEREX].[dbo].[recordSyntax]') AND OBJECTPROPERTY(ID, N'ISUSERTABLE') = 1) BEGIN DROP TABLE [OpenLibrary-LibraryOfCongress-ZEEREX].[dbo].[recordSyntax]END ;

IF EXISTS (SELECT * FROM DBO.SYSOBJECTS WHERE ID = OBJECT_ID(N'[OpenLibrary-LibraryOfCongress-ZEEREX].[dbo].[link]') AND OBJECTPROPERTY(ID, N'ISUSERTABLE') = 1) BEGIN DROP TABLE [OpenLibrary-LibraryOfCongress-ZEEREX].[dbo].[link]END ;

IF EXISTS (SELECT * FROM DBO.SYSOBJECTS WHERE ID = OBJECT_ID(N'[OpenLibrary-LibraryOfCongress-ZEEREX].[dbo].[restrictions]') AND OBJECTPROPERTY(ID, N'ISUSERTABLE') = 1) BEGIN DROP TABLE [OpenLibrary-LibraryOfCongress-ZEEREX].[dbo].[restrictions]END ;

IF EXISTS (SELECT * FROM DBO.SYSOBJECTS WHERE ID = OBJECT_ID(N'[OpenLibrary-LibraryOfCongress-ZEEREX].[dbo].[name]') AND OBJECTPROPERTY(ID, N'ISUSERTABLE') = 1) BEGIN DROP TABLE [OpenLibrary-LibraryOfCongress-ZEEREX].[dbo].[name]END ;

IF EXISTS (SELECT * FROM DBO.SYSOBJECTS WHERE ID = OBJECT_ID(N'[OpenLibrary-LibraryOfCongress-ZEEREX].[dbo].[metaInfo]') AND OBJECTPROPERTY(ID, N'ISUSERTABLE') = 1) BEGIN DROP TABLE [OpenLibrary-LibraryOfCongress-ZEEREX].[dbo].[metaInfo]END ;

IF EXISTS (SELECT * FROM DBO.SYSOBJECTS WHERE ID = OBJECT_ID(N'[OpenLibrary-LibraryOfCongress-ZEEREX].[dbo].[schema]') AND OBJECTPROPERTY(ID, N'ISUSERTABLE') = 1) BEGIN DROP TABLE [OpenLibrary-LibraryOfCongress-ZEEREX].[dbo].[schema]END ;

IF EXISTS (SELECT * FROM DBO.SYSOBJECTS WHERE ID = OBJECT_ID(N'[OpenLibrary-LibraryOfCongress-ZEEREX].[dbo].[index]') AND OBJECTPROPERTY(ID, N'ISUSERTABLE') = 1) BEGIN DROP TABLE [OpenLibrary-LibraryOfCongress-ZEEREX].[dbo].[index]END ;

IF EXISTS (SELECT * FROM DBO.SYSOBJECTS WHERE ID = OBJECT_ID(N'[OpenLibrary-LibraryOfCongress-ZEEREX].[dbo].[elementSet]') AND OBJECTPROPERTY(ID, N'ISUSERTABLE') = 1) BEGIN DROP TABLE [OpenLibrary-LibraryOfCongress-ZEEREX].[dbo].[elementSet]END ;

IF EXISTS (SELECT * FROM DBO.SYSOBJECTS WHERE ID = OBJECT_ID(N'[OpenLibrary-LibraryOfCongress-ZEEREX].[dbo].[indexInfo]') AND OBJECTPROPERTY(ID, N'ISUSERTABLE') = 1) BEGIN DROP TABLE [OpenLibrary-LibraryOfCongress-ZEEREX].[dbo].[indexInfo]END ;

IF EXISTS (SELECT * FROM DBO.SYSOBJECTS WHERE ID = OBJECT_ID(N'[OpenLibrary-LibraryOfCongress-ZEEREX].[dbo].[explain]') AND OBJECTPROPERTY(ID, N'ISUSERTABLE') = 1) BEGIN DROP TABLE [OpenLibrary-LibraryOfCongress-ZEEREX].[dbo].[explain]END ;

IF EXISTS (SELECT * FROM DBO.SYSOBJECTS WHERE ID = OBJECT_ID(N'[OpenLibrary-LibraryOfCongress-ZEEREX].[dbo].[serverInfo]') AND OBJECTPROPERTY(ID, N'ISUSERTABLE') = 1) BEGIN DROP TABLE [OpenLibrary-LibraryOfCongress-ZEEREX].[dbo].[serverInfo]END ;

IF EXISTS (SELECT * FROM DBO.SYSOBJECTS WHERE ID = OBJECT_ID(N'[OpenLibrary-LibraryOfCongress-ZEEREX].[dbo].[implementation]') AND OBJECTPROPERTY(ID, N'ISUSERTABLE') = 1) BEGIN DROP TABLE [OpenLibrary-LibraryOfCongress-ZEEREX].[dbo].[implementation]END ;

IF EXISTS (SELECT * FROM DBO.SYSOBJECTS WHERE ID = OBJECT_ID(N'[OpenLibrary-LibraryOfCongress-ZEEREX].[dbo].[extent]') AND OBJECTPROPERTY(ID, N'ISUSERTABLE') = 1) BEGIN DROP TABLE [OpenLibrary-LibraryOfCongress-ZEEREX].[dbo].[extent]END ;

IF EXISTS (SELECT * FROM DBO.SYSOBJECTS WHERE ID = OBJECT_ID(N'[OpenLibrary-LibraryOfCongress-ZEEREX].[dbo].[supports]') AND OBJECTPROPERTY(ID, N'ISUSERTABLE') = 1) BEGIN DROP TABLE [OpenLibrary-LibraryOfCongress-ZEEREX].[dbo].[supports]END ;

IF EXISTS (SELECT * FROM DBO.SYSOBJECTS WHERE ID = OBJECT_ID(N'[OpenLibrary-LibraryOfCongress-ZEEREX].[dbo].[contact]') AND OBJECTPROPERTY(ID, N'ISUSERTABLE') = 1) BEGIN DROP TABLE [OpenLibrary-LibraryOfCongress-ZEEREX].[dbo].[contact]END ;

IF EXISTS (SELECT * FROM DBO.SYSOBJECTS WHERE ID = OBJECT_ID(N'[OpenLibrary-LibraryOfCongress-ZEEREX].[dbo].[default]') AND OBJECTPROPERTY(ID, N'ISUSERTABLE') = 1) BEGIN DROP TABLE [OpenLibrary-LibraryOfCongress-ZEEREX].[dbo].[default]END ;

IF EXISTS (SELECT * FROM DBO.SYSOBJECTS WHERE ID = OBJECT_ID(N'[OpenLibrary-LibraryOfCongress-ZEEREX].[dbo].[setting]') AND OBJECTPROPERTY(ID, N'ISUSERTABLE') = 1) BEGIN DROP TABLE [OpenLibrary-LibraryOfCongress-ZEEREX].[dbo].[setting]END ;

IF EXISTS (SELECT * FROM DBO.SYSOBJECTS WHERE ID = OBJECT_ID(N'[OpenLibrary-LibraryOfCongress-ZEEREX].[dbo].[attr]') AND OBJECTPROPERTY(ID, N'ISUSERTABLE') = 1) BEGIN DROP TABLE [OpenLibrary-LibraryOfCongress-ZEEREX].[dbo].[attr]END ;

IF EXISTS (SELECT * FROM DBO.SYSOBJECTS WHERE ID = OBJECT_ID(N'[OpenLibrary-LibraryOfCongress-ZEEREX].[dbo].[authentication]') AND OBJECTPROPERTY(ID, N'ISUSERTABLE') = 1) BEGIN DROP TABLE [OpenLibrary-LibraryOfCongress-ZEEREX].[dbo].[authentication]END ;

IF EXISTS (SELECT * FROM DBO.SYSOBJECTS WHERE ID = OBJECT_ID(N'[OpenLibrary-LibraryOfCongress-ZEEREX].[dbo].[author]') AND OBJECTPROPERTY(ID, N'ISUSERTABLE') = 1) BEGIN DROP TABLE [OpenLibrary-LibraryOfCongress-ZEEREX].[dbo].[author]END ;

IF EXISTS (SELECT * FROM DBO.SYSOBJECTS WHERE ID = OBJECT_ID(N'[OpenLibrary-LibraryOfCongress-ZEEREX].[dbo].[description]') AND OBJECTPROPERTY(ID, N'ISUSERTABLE') = 1) BEGIN DROP TABLE [OpenLibrary-LibraryOfCongress-ZEEREX].[dbo].[description]END ;

IF EXISTS (SELECT * FROM DBO.SYSOBJECTS WHERE ID = OBJECT_ID(N'[OpenLibrary-LibraryOfCongress-ZEEREX].[dbo].[database]') AND OBJECTPROPERTY(ID, N'ISUSERTABLE') = 1) BEGIN DROP TABLE [OpenLibrary-LibraryOfCongress-ZEEREX].[dbo].[database]END ;

IF EXISTS (SELECT * FROM DBO.SYSOBJECTS WHERE ID = OBJECT_ID(N'[OpenLibrary-LibraryOfCongress-ZEEREX].[dbo].[title]') AND OBJECTPROPERTY(ID, N'ISUSERTABLE') = 1) BEGIN DROP TABLE [OpenLibrary-LibraryOfCongress-ZEEREX].[dbo].[title]END ;

CREATE TABLE [OpenLibrary-LibraryOfCongress-ZEEREX].[dbo].[subjects] ( [subject] varchar (8000)  NOT NULL ) ;

CREATE TABLE [OpenLibrary-LibraryOfCongress-ZEEREX].[dbo].[set] ( [name] varchar (8000)  NOT NULL , [identifier] varchar (8000)  NOT NULL ) ;

CREATE TABLE [OpenLibrary-LibraryOfCongress-ZEEREX].[dbo].[langUsage] ( [codes] varchar (8000)  NULL , [primary] varchar (8000)  NULL , [lang] varchar (8000)  NULL ) ;

CREATE TABLE [OpenLibrary-LibraryOfCongress-ZEEREX].[dbo].[history] ( [primary] varchar (8000)  NULL , [lang] varchar (8000)  NULL ) ;

CREATE TABLE [OpenLibrary-LibraryOfCongress-ZEEREX].[dbo].[map] ( [primary] varchar (8000)  CONSTRAINT [CK_map_primary_default] DEFAULT ('false') NULL ) ;

CREATE TABLE [OpenLibrary-LibraryOfCongress-ZEEREX].[dbo].[recordSyntax] ( [name] varchar (8000)  NULL , [identifier] varchar (8000)  NULL ) ;

CREATE TABLE [OpenLibrary-LibraryOfCongress-ZEEREX].[dbo].[link] ( [type] varchar (8000)  NULL ) ;

CREATE TABLE [OpenLibrary-LibraryOfCongress-ZEEREX].[dbo].[restrictions] ( [primary] varchar (8000)  NULL , [lang] varchar (8000)  NULL ) ;

CREATE TABLE [OpenLibrary-LibraryOfCongress-ZEEREX].[dbo].[name] ( [set] varchar (8000)  NULL ) ;

CREATE TABLE [OpenLibrary-LibraryOfCongress-ZEEREX].[dbo].[metaInfo] ( [dateModified] varchar (8000)  NOT NULL , [aggregatedFrom] varchar (8000)  NOT NULL , [dateAggregated] varchar (8000)  NOT NULL ) ;

CREATE TABLE [OpenLibrary-LibraryOfCongress-ZEEREX].[dbo].[schema] ( [identifier] varchar (8000)  NOT NULL , [name] varchar (8000)  NOT NULL , [location] varchar (8000)  NULL , [sort] varchar (8000)  CONSTRAINT [CK_schema_sort_default] DEFAULT ('false') NULL , [retrieve] varchar (8000)  CONSTRAINT [CK_schema_retrieve_default] DEFAULT ('true') NULL ) ;

CREATE TABLE [OpenLibrary-LibraryOfCongress-ZEEREX].[dbo].[index] ( [id] varchar (8000)  NULL , [search] varchar (8000)  NULL , [scan] varchar (8000)  NULL , [sort] varchar (8000)  NULL ) ;

CREATE TABLE [OpenLibrary-LibraryOfCongress-ZEEREX].[dbo].[elementSet] ( [name] varchar (8000)  NOT NULL ) ;

CREATE TABLE [OpenLibrary-LibraryOfCongress-ZEEREX].[dbo].[indexInfo] ( [sortKeyword] varchar (8000)  NOT NULL ) ;

CREATE TABLE [OpenLibrary-LibraryOfCongress-ZEEREX].[dbo].[explain] ( [authoritative] varchar (8000)  CONSTRAINT [CK_explain_authoritative_default] DEFAULT ('false') NULL , [id] varchar (8000)  NULL ) ;

CREATE TABLE [OpenLibrary-LibraryOfCongress-ZEEREX].[dbo].[serverInfo] ( [host] varchar (8000)  NOT NULL , [port] varchar (8000)  NOT NULL , [protocol] varchar (8000)  CONSTRAINT [CK_serverInfo_protocol_default] DEFAULT ('Z39.50') NULL , [version] varchar (8000)  CONSTRAINT [CK_serverInfo_version_default] DEFAULT ('3') NULL , [transport] varchar (8000)  CONSTRAINT [CK_serverInfo_transport_default] DEFAULT ('http') NULL , [wsdl] varchar (8000)  NULL ) ;

CREATE TABLE [OpenLibrary-LibraryOfCongress-ZEEREX].[dbo].[implementation] ( [identifier] varchar (8000)  NULL , [version] varchar (8000)  NULL ) ;

CREATE TABLE [OpenLibrary-LibraryOfCongress-ZEEREX].[dbo].[extent] ( [primary] varchar (8000)  NULL , [lang] varchar (8000)  NULL ) ;

CREATE TABLE [OpenLibrary-LibraryOfCongress-ZEEREX].[dbo].[supports] ( [type] varchar (8000)  NOT NULL ) ;

CREATE TABLE [OpenLibrary-LibraryOfCongress-ZEEREX].[dbo].[contact] ( [primary] varchar (8000)  NULL , [lang] varchar (8000)  NULL ) ;

CREATE TABLE [OpenLibrary-LibraryOfCongress-ZEEREX].[dbo].[default] ( [type] varchar (8000)  NOT NULL ) ;

CREATE TABLE [OpenLibrary-LibraryOfCongress-ZEEREX].[dbo].[setting] ( [type] varchar (8000)  NOT NULL ) ;

CREATE TABLE [OpenLibrary-LibraryOfCongress-ZEEREX].[dbo].[attr] ( [type] varchar (8000)  NOT NULL , [set] varchar (8000)  CONSTRAINT [CK_attr_set_default] DEFAULT ('1.2.840.10003.3.1') NULL ) ;

CREATE TABLE [OpenLibrary-LibraryOfCongress-ZEEREX].[dbo].[authentication] ( [required] varchar (8000)  CONSTRAINT [CK_authentication_required_default] DEFAULT ('true') NULL , [open] varchar (8000)  NOT NULL , [user] varchar (8000)  NULL , [group] varchar (8000)  NULL , [password] varchar (8000)  NULL ) ;

CREATE TABLE [OpenLibrary-LibraryOfCongress-ZEEREX].[dbo].[author] ( [primary] varchar (8000)  NULL , [lang] varchar (8000)  NULL ) ;

CREATE TABLE [OpenLibrary-LibraryOfCongress-ZEEREX].[dbo].[description] ( [primary] varchar (8000)  NULL , [lang] varchar (8000)  NULL ) ;

CREATE TABLE [OpenLibrary-LibraryOfCongress-ZEEREX].[dbo].[database] ( [numRecs] varchar (8000)  NULL , [lastUpdate] varchar (8000)  NULL ) ;

CREATE TABLE [OpenLibrary-LibraryOfCongress-ZEEREX].[dbo].[title] ( [primary] varchar (8000)  NULL , [lang] varchar (8000)  NULL ) ;

