USE master;

DROP DATABASE IF EXISTS OpenLibrary

CREATE DATABASE OpenLibrary
GO

USE OpenLibrary;

CREATE TABLE Sitemap(

	Id int not null IDENTITY(1,1),
	ParentId int null,
	"Name" varchar(max) not null,
	"Url" varchar(max) not null,
	LastUpdate datetime null,
	LastExpanded datetime null

	Primary Key(Id),
	Foreign Key(ParentId) References Sitemap(Id)
);

CREATE TABLE "Library"(
	
	"Name" varchar(100) not null

	Primary Key("Name")

);

CREATE TABLE WebService(
	
	Id int not null IDENTITY(1,1),
	LibraryName varchar(100) not null,
	"Name" varchar(max) not null,
	"Description" varchar(max) not null,
	"System" varchar(max) null,
	"Subsystem" varchar(max) null,
	ReferenceUrl varchar(max) not null

	Primary Key(Id)
	Foreign Key(LibraryName) References "Library"("Name")
);

CREATE TABLE WebServiceEndpoint(
	
	Id int not null IDENTITY(1,1),
	WebServiceId int not null,
	"Name" varchar(max) not null,
	"Description" varchar(max) not null,
	"Endpoint" varchar(max) not null,
	ReferenceUrl varchar(max) null,
	SSLRequired bit not null,

	Primary Key(Id),
	Foreign Key(WebServiceId) References WebService(Id)
);

CREATE TABLE WebServiceEndpointUrlRequestTask(
	
	Id int not null IDENTITY(1,1),
	WebServiceEndpointId int not null,
	"Name" varchar(max) not null,
	"Description" varchar(max) not null,
	Host varchar(max) not null,
	Method varchar(10) not null,
	TimeoutMilliseconds int not null,
	RequestUrl varchar(max) not null,
	RequestUrlTokenized bit not null,		 -- curly brackets used for parameter value tokens

	Primary Key(Id),
	Foreign Key(WebServiceEndpointId) References WebServiceEndpoint(Id)
);

CREATE TABLE WebServiceEndpointTaskEvent(
	
	Id int not null IDENTITY(1,1),
	WebServiceEndpointUrlRequestTaskId int not null,
	TaskStatus int not null,
	"Time" datetime not null,
	IsError bit not null,
    LogMessage varchar(max),
    LogExceptionMessage varchar(max),
    LogExceptionDetail varchar(max),
    LogInnerExceptionMessage varchar(max),
    LogInnerExceptionDetail varchar(max),
    LogMessageType int not null,
    LogSeverity int not null

	Primary Key(Id),
	Foreign Key(WebServiceEndpointUrlRequestTaskId) References WebServiceEndpointUrlRequestTask(Id)
);

CREATE TABLE WebServiceParameter(

	Id int not null IDENTITY(1,1),
	ParentId int null,
	WebServiceEndpointId int not null,
	"Name" varchar(50),
	"DefaultValue" varchar(50),
	"DefaultSearchField" bit not null,
	"Required" bit not null,
	CommaDelimited bit not null,
	ArrayParameter bit not null,
	"Description" varchar(max) null

	Primary Key(Id),
	Foreign Key(ParentId) References WebServiceParameter(Id),
	Foreign Key(WebServiceEndpointId) References WebServiceEndpoint(Id)
);

CREATE TABLE WebServiceParameterSetting(

	Id int not null IDENTITY(1,1),
	WebServiceParameterId int not null,
	"PossibleValue" varchar(50) not null,
	Explanation varchar(max) not null,

	Primary Key(Id),
	Foreign Key(WebServiceParameterId) References WebServiceParameter(Id)
);

-- Load Default Web Services

/*

	Library of Congress:  SRU Online Catalog, 

*/

INSERT INTO "Library"
VALUES ('Library of Congress'), ('Internet Archive')

SET IDENTITY_INSERT WebService ON

INSERT INTO WebService (Id, LibraryName, "Name", "Description", "System", Subsystem, ReferenceUrl)
VALUES 

(1, 'Library of Congress', 'Online Catalog', '(SRU v1.2) Online Catalog - Record search / retrieve', 'SRU v1.2', 'Online Catalog', 'https://www.loc.gov/standards/sru/sru-1-2.html'),
(2, 'Library of Congress', 'Subject Authority File (SAF)', '(SRU v1.2) Subject Authority File', 'SRU v1.2', 'Subject Authority File', 'https://www.loc.gov/standards/sru/sru-1-2.html'),
(3, 'Library of Congress', 'Name Authority File (NAF)', '(SRU v1.2) Name Authority File', 'SRU v1.2', 'Name Authority File', 'https://www.loc.gov/standards/sru/sru-1-2.html'),
(4, 'Library of Congress', 'Handbook of Latin American Studies (HLAS)', '(SRU v1.2) Handbook of Latin American Studies', 'SRU v1.2', 'Handbook of Latin American Studies', 'https://www.loc.gov/standards/sru/sru-1-2.html'),
(5, 'Library of Congress', 'National Library Service for the Blind and Print Disabled (NLSBPH)', '(SRU v1.2) National Library Service for the Blind and Print Disabled', 'SRU v1.2', 'National Library Service for the Blind and Print Disabled', 'https://www.loc.gov/standards/sru/sru-1-2.html'),
(6, 'Internet Archive', 'Search', 'Searches item metadata at the Internet Archive', NULL, NULL, 'https://archive.org/developers/'),
(7, 'Internet Archive', 'Advanced Search', 'Advanced search feature of the Internet Archive', NULL, NULL, 'https://archive.org/developers/')

SET IDENTITY_INSERT WebService OFF

SET IDENTITY_INSERT WebServiceEndpoint ON

INSERT INTO WebServiceEndpoint (Id, WebServiceId, "Name", "Description", "Endpoint", ReferenceUrl, SSLRequired)
VALUES

(1, 1, 'Library of Congress (SRU v1.2) Online Catalog - Voyager', 'Updated endpoint for the SRU service', 'http://z3950.loc.gov:7090/voyager', 'https://www.loc.gov/z3950/lcserver.html', 0),
(2, 1, 'Library of Congress (SRU v1.2) Online Catalog - Legacy (Http)', 'Updated endpoint for the SRU service', 'http://lx2.loc.gov:210/lcdb', 'https://www.loc.gov/z3950/lcserver.html', 0),
(3, 1, 'Library of Congress (SRU v1.2) Online Catalog - Legacy (Https)', 'Updated endpoint for the SRU service', 'https://lx2.loc.gov/sru/lcdb', 'https://www.loc.gov/z3950/lcserver.html', 1),

(4, 2, 'Library of Congress (SRU v1.2) Online Catalog - Voyager', 'Updated endpoint for the SRU service', 'http://z3950.loc.gov:7090/voyager', 'https://www.loc.gov/z3950/lcserver.html', 0),
(5, 2, 'Library of Congress (SRU v1.2) Online Catalog - Legacy (Http)', 'Updated endpoint for the SRU service', 'http://lx2.loc.gov:210/lcdb', 'https://www.loc.gov/z3950/lcserver.html', 0),
(6, 2, 'Library of Congress (SRU v1.2) Online Catalog - Legacy (Https)', 'Updated endpoint for the SRU service', 'https://lx2.loc.gov/sru/lcdb', 'https://www.loc.gov/z3950/lcserver.html', 1),

(7, 3, 'Library of Congress (SRU v1.2) Online Catalog - Voyager', 'Updated endpoint for the SRU service', 'http://z3950.loc.gov:7090/voyager', 'https://www.loc.gov/z3950/lcserver.html', 0),
(8, 3, 'Library of Congress (SRU v1.2) Online Catalog - Legacy (Http)', 'Updated endpoint for the SRU service', 'http://lx2.loc.gov:210/lcdb', 'https://www.loc.gov/z3950/lcserver.html', 0),
(9, 3, 'Library of Congress (SRU v1.2) Online Catalog - Legacy (Https)', 'Updated endpoint for the SRU service', 'https://lx2.loc.gov/sru/lcdb', 'https://www.loc.gov/z3950/lcserver.html', 1),

(10, 4, 'Library of Congress (SRU v1.2) Online Catalog - Voyager', 'Updated endpoint for the SRU service', 'http://z3950.loc.gov:7090/voyager', 'https://www.loc.gov/z3950/lcserver.html', 0),
(11, 4, 'Library of Congress (SRU v1.2) Online Catalog - Legacy (Http)', 'Updated endpoint for the SRU service', 'http://lx2.loc.gov:210/lcdb', 'https://www.loc.gov/z3950/lcserver.html', 0),
(12, 4, 'Library of Congress (SRU v1.2) Online Catalog - Legacy (Https)', 'Updated endpoint for the SRU service', 'https://lx2.loc.gov/sru/lcdb', 'https://www.loc.gov/z3950/lcserver.html', 1),

(13, 5, 'Library of Congress (SRU v1.2) Online Catalog - Voyager', 'Updated endpoint for the SRU service', 'http://z3950.loc.gov:7090/voyager', 'https://www.loc.gov/z3950/lcserver.html', 0),
(14, 5, 'Library of Congress (SRU v1.2) Online Catalog - Legacy (Http)', 'Updated endpoint for the SRU service', 'http://lx2.loc.gov:210/lcdb', 'https://www.loc.gov/z3950/lcserver.html', 0),
(15, 5, 'Library of Congress (SRU v1.2) Online Catalog - Legacy (Https)', 'Updated endpoint for the SRU service', 'https://lx2.loc.gov/sru/lcdb', 'https://www.loc.gov/z3950/lcserver.html', 1),

(16, 6, 'Internet Archive - Scrape', 'Recommended service for deep-paging the Internet Archive', 'https://archive.org/services/search/v1/scrape', 'https://archive.org/help/aboutsearch.htm', 0),
(17, 7, 'Internet Archive - Advanced Search', 'Heavily parameterized search endpoint', 'https://archive.org/advancedsearch.php', 'https://archive.org/advancedsearch.php', 0)

SET IDENTITY_INSERT WebServiceEndpoint OFF

-- Run Cursor:  [1, 15] (Library of Congress)
DECLARE @EndpointId int;
DECLARE @EndpointIdCursor as CURSOR;

SET @EndpointIdCursor = CURSOR FOR
SELECT Id
FROM WebServiceEndpoint
WHERE Id BETWEEN 1 AND 15

OPEN @EndpointIdCursor;
FETCH NEXT FROM @EndpointIdCursor INTO @EndpointId;

WHILE @@Fetch_Status = 0
BEGIN

	INSERT INTO WebServiceParameter (ParentId, WebServiceEndpointId, "Name", "DefaultValue", "DefaultSearchField", "Required", CommaDelimited, ArrayParameter, "Description")
	VALUES
	/*
		Id int not null IDENTITY(1,1),
		ParentId int null,
		WebServiceEndpointId int not null,
		"Name" varchar(50),
		"DefaultValue" varchar(50),
		"DefaultSearchField" bit not null,
		"Required" bit not null,
		CommaDelimited bit not null,
		ArrayParameter bit not null,
		"Description" varchar(max) null
	*/
	(NULL, @EndpointId, 'version', '1.1', 0, 1, 0, 0, 'SRU version. This might refer to SRW wrapper!'),
	(NULL, @EndpointId, 'operation', 'searchRetrieve', 0, 1, 0, 0, 'Uncertain about other values'),
	(NULL, @EndpointId, 'query', '<enter query>', 1, 1, 0, 0, 'Query string for the operation'),
	(NULL, @EndpointId, 'startRecord', null, 0, 0, 0, 0, 'Start record position (indexed from 1)'),
	(NULL, @EndpointId, 'maximumRecords', null, 0, 0, 0, 0, 'Maximum number of records to return'),
	(NULL, @EndpointId, 'recordPacking', null, 0, 0,0,  0, 'Supported types are xml / json'),
	(NULL, @EndpointId, 'recordSchema', null, 0, 0, 0, 0, 'See Library of Congress for details:  dc, mads, mods, marcxml, opacxml'),
	(NULL, @EndpointId, 'recordXPath', null, 0, 0,  0, 0, 'Uncertain about usage'),
	(NULL, @EndpointId, 'resultSetTTL', null, 0, 0,  0, 0, 'Uncertain about usage'),
	(NULL, @EndpointId, 'stylesheet', null, 0, 0, 0, 0, 'Uncertain about usage'),
	(NULL, @EndpointId, 'extraRequestData', null, 0, 0,  0, 0, 'Uncertain about usage')

    FETCH NEXT FROM @EndpointIdCursor INTO @EndpointId

END

Close @EndpointIdCursor;
Deallocate @EndpointIdCursor;

INSERT INTO WebServiceParameter (ParentId, WebServiceEndpointId, "Name", "DefaultValue", "DefaultSearchField", "Required", CommaDelimited, ArrayParameter, "Description")
VALUES

/*

    q: the query (using the same query Lucene-like queries supported by Internet Archive Advanced Search.
    fields: Metadata fields to return, comma delimited
    sorts: Fields to sort on, comma delimited (if identifier is specified, it must be last)
    count: Number of results to return (minimum of 100)
    cursor: A cursor, if any (otherwise, search starts at the beginning)
    total_only: if this is set to true, then only the number of results is returned.

*/

(NULL, 16, 'q', '<enter query>',1, 1, 0,  0, 'The query string: uses the same query Lucene-like queries supported by Internet Archive Advanced Search'),
(NULL, 16, 'fields', 'identifier', 0, 0, 1,  0, 'Metadata fields to return, comma delimited'),
(NULL, 16, 'sorts', null, 0, 0, 1,  0, 'Fields to sort on, comma delimited (if identifier is specified, it must be last)'),
(NULL, 16, 'count', null, 0, 0, 0,  0, 'Number of results to return (minimum of 100)'),
(NULL, 16, 'cursor', null, 0, 0, 0,  0, 'A cursor, if any (otherwise, search starts at the beginning)'),
(NULL, 16, 'total_only', null, 0, 0, 0,  0, 'Set to true for retrieving only the specified count'),


/*

	Internet Archive Advanced Search:  https://archive.org/advancedsearch.php

	avg_rating, backup_location, btih, call_number, collection, contributor, coverage, creator
	date, description, downloads, external-identifier, foldoutcount, format, genre, identifier
	imagecount, indexflag, item_size, language, licenseurl, mediatype, members, month, name
	noindex, num_reviews, oai_updatedate, publicdate, publisher, related-external-id
	reviewdate, rights, scanningcentre, source, stripped_tags, subject, title, type
	volume, week, year

*/

(NULL, 17, 'avg_rating', NULL, 0, 0, 0,  1, 'Internet Archive Advanced Search Parameter'),
(NULL, 17, 'backup_location', NULL, 0, 0, 0, 1, 'Internet Archive Advanced Search Parameter'),
(NULL, 17, 'btih', NULL,0, 0, 0, 1, 'Internet Archive Advanced Search Parameter'),
(NULL, 17, 'call_number', NULL,0, 0, 0, 1, 'Internet Archive Advanced Search Parameter'),
(NULL, 17, 'collection', NULL,0, 0, 0, 1, 'Internet Archive Advanced Search Parameter'),
(NULL, 17, 'contributor', NULL,0, 0, 0, 1, 'Internet Archive Advanced Search Parameter'),
(NULL, 17, 'coverage', NULL, 0,0, 0, 1, 'Internet Archive Advanced Search Parameter'),
(NULL, 17, 'creator', NULL, 0,0, 0, 1, 'Internet Archive Advanced Search Parameter'),
(NULL, 17, 'date', NULL, 0, 0,0, 1, 'Internet Archive Advanced Search Parameter'),
(NULL, 17, 'description', NULL,0, 0, 0, 1, 'Internet Archive Advanced Search Parameter'),
(NULL, 17, 'downloads', NULL, 0,0, 0, 1, 'Internet Archive Advanced Search Parameter'),
(NULL, 17, 'external-identifier', NULL,0, 0, 0, 1, 'Internet Archive Advanced Search Parameter'),
(NULL, 17, 'foldoutcount', NULL, 0,0, 0, 1, 'Internet Archive Advanced Search Parameter'),
(NULL, 17, 'format', NULL, 0, 0,0, 1, 'Internet Archive Advanced Search Parameter'),
(NULL, 17, 'genre', NULL, 0,0, 0, 1, 'Internet Archive Advanced Search Parameter'),
(NULL, 17, 'identifier', NULL,1, 0, 0, 1, 'Internet Archive Advanced Search Parameter'),
(NULL, 17, 'imagecount', NULL,0, 0, 0, 1, 'Internet Archive Advanced Search Parameter'),
(NULL, 17, 'indexflag', NULL,0, 0, 0, 1, 'Internet Archive Advanced Search Parameter'),
(NULL, 17, 'item_size', NULL,0, 0, 0, 1, 'Internet Archive Advanced Search Parameter'),
(NULL, 17, 'language', NULL,0, 0, 0, 1, 'Internet Archive Advanced Search Parameter'),
(NULL, 17, 'licenseurl', NULL,0, 0, 0, 1, 'Internet Archive Advanced Search Parameter'),
(NULL, 17, 'mediatype', NULL,0, 0, 0, 1, 'Internet Archive Advanced Search Parameter'),
(NULL, 17, 'members', NULL,0, 0, 0, 1, 'Internet Archive Advanced Search Parameter'),
(NULL, 17, 'month', NULL,0, 0, 0, 1, 'Internet Archive Advanced Search Parameter'),
(NULL, 17, 'name', NULL, 0,0, 0, 1, 'Internet Archive Advanced Search Parameter'),
(NULL, 17, 'noindex', NULL,0, 0, 0, 1, 'Internet Archive Advanced Search Parameter'),
(NULL, 17, 'num_reviews', NULL,0, 0, 0, 1, 'Internet Archive Advanced Search Parameter'),
(NULL, 17, 'oai_updatedate', NULL,0, 0, 0, 1, 'Internet Archive Advanced Search Parameter'),
(NULL, 17, 'publicdate', NULL, 0,0, 0, 1, 'Internet Archive Advanced Search Parameter'),
(NULL, 17, 'publisher', NULL, 0,0, 0, 1, 'Internet Archive Advanced Search Parameter'),
(NULL, 17, 'related-external-id', NULL,0, 0, 0, 1, 'Internet Archive Advanced Search Parameter'),
(NULL, 17, 'reviewdate', NULL, 0,0, 0, 1, 'Internet Archive Advanced Search Parameter'),
(NULL, 17, 'rights', NULL, 0,0, 0, 1, 'Internet Archive Advanced Search Parameter'),
(NULL, 17, 'scanningcentre', NULL,0, 0, 0, 1, 'Internet Archive Advanced Search Parameter'),
(NULL, 17, 'source', NULL, 0,0, 0, 1, 'Internet Archive Advanced Search Parameter'),
(NULL, 17, 'stripped_tags', NULL,0, 0, 0, 1, 'Internet Archive Advanced Search Parameter'),
(NULL, 17, 'subject', NULL, 0,0, 0, 1, 'Internet Archive Advanced Search Parameter'),
(NULL, 17, 'title', NULL, 0,0, 0, 1, 'Internet Archive Advanced Search Parameter'),
(NULL, 17, 'type', NULL, 0,0, 0, 1, 'Internet Archive Advanced Search Parameter'),
(NULL, 17, 'volume', NULL,0, 0, 0, 1, 'Internet Archive Advanced Search Parameter'),
(NULL, 17, 'week', NULL, 0,0, 0, 1, 'Internet Archive Advanced Search Parameter'),
(NULL, 17, 'year', NULL, 0,0, 0, 1, 'Internet Archive Advanced Search Parameter')

/* 
	recordSchema parameters: 7, 18, 29, 40, 51

    values:  dc, mads, mods, marcxml, opacxml

    comma delimited

*/

INSERT INTO WebServiceParameterSetting (WebServiceParameterId, PossibleValue, Explanation)
VALUES

(7, 'mods', 'Returns the MODS schema in the result set'),
(18, 'mods', 'Returns the MODS schema in the result set'),
(29, 'mods', 'Returns the MODS schema in the result set'),
(40, 'mods', 'Returns the MODS schema in the result set'),
(51, 'mods', 'Returns the MODS schema in the result set'),

(7, 'mads', 'Returns the MADS schema in the result set'),
(18, 'mads', 'Returns the MADS schema in the result set'),
(29, 'mads', 'Returns the MADS schema in the result set'),
(40, 'mads', 'Returns the MADS schema in the result set'),
(51, 'mads', 'Returns the MADS schema in the result set'),

(7, 'dc', 'Returns the Dublin-Core schema in the result set'),
(18, 'dc', 'Returns the Dublin-Core schema in the result set'),
(29, 'dc', 'Returns the Dublin-Core schema in the result set'),
(40, 'dc', 'Returns the Dublin-Core schema in the result set'),
(51, 'dc', 'Returns the Dublin-Core schema in the result set'),

(7, 'marcxml', 'Returns the MARCXML schema in the result set'),
(18, 'marcxml', 'Returns the MARCXML schema in the result set'),
(29, 'marcxml', 'Returns the MARCXML schema in the result set'),
(40, 'marcxml', 'Returns the MARCXML schema in the result set'),
(51, 'marcxml', 'Returns the MARCXML schema in the result set'),

(7, 'opacxml', 'Returns the OPACXML schema in the result set'),
(18, 'opacxml', 'Returns the OPACXML schema in the result set'),
(29, 'opacxml', 'Returns the OPACXML schema in the result set'),
(40, 'opacxml', 'Returns the OPACXML schema in the result set'),
(51, 'opacxml', 'Returns the OPACXML schema in the result set')