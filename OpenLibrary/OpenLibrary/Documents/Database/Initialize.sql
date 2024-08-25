USE master;
GO

DROP DATABASE IF EXISTS OpenLibrary
GO

CREATE DATABASE OpenLibrary
GO

USE OpenLibrary;
GO

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