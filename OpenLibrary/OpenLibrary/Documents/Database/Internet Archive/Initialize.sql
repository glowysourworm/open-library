USE master;
GO

DROP DATABASE IF EXISTS [OpenLibrary-InternetArchive]
GO

CREATE DATABASE [OpenLibrary-InternetArchive]
GO

USE [OpenLibrary-InternetArchive]
GO

CREATE TABLE ItemMetadata(

	identifier varchar(100) not null,
	created datetime not null,
	updated datetime,
	uniq bigint,
	d1 varchar(max) not null,
	d2 varchar(max) not null,
	dir varchar(max) not null,
	"server" varchar(max),
	workable_servers varchar(max),
	solo bit not null,
	servers_available bit not null,
	files_count int not null,
	item_last_updated datetime not null,
	item_size bigint not null,
	is_dark bit not null,
	nodownload bit not null,
	is_collection bit not null,

	Primary Key(identifier)
);
GO

Create Table WorkableServers(

	Id int not null IDENTITY(1,1),
	"Url" varchar(max) not null,
	ItemMetadata_identifier varchar(100) not null

	Primary Key(Id),
	Foreign Key(ItemMetadata_Identifier) References ItemMetadata(identifier)

);
GO

Create Table "File"(

	  ItemMetadata_identifier varchar(100) not null,
      "name" varchar(max) not null,
      "source" varchar(100),
      "format" varchar(100),
      "mtime" datetime,
      "size" bigint,
	  summation varchar(100),
      md5 varchar(100),
      crc32 varchar(100),
      sha1 varchar(100)

	  Primary Key(ItemMetadata_identifier),
	  Foreign Key(ItemMetadata_identifier) References ItemMetadata(identifier)
);
GO

Create Table MetadataMeta(
	
	ItemMetadata_identifier varchar(100) not null,
	created datetime not null,
	updated datetime,
	uniq varchar(100),
	title varchar(max),

	Primary Key(ItemMetadata_identifier),
	Foreign Key(ItemMetadata_identifier) References ItemMetadata(identifier)
);
GO

Create Table MetadataMetaCollection(
	
	ItemMetadata_identifier varchar(100) not null,
	"Name" varchar(max) not null

	Primary Key(ItemMetadata_identifier),
	Foreign Key(ItemMetadata_identifier) References ItemMetadata(identifier)
);
GO