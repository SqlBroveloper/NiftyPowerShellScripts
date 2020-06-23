/* simple PowerShell ETL script db objects and validation */
use StackOverflow2013;
go

drop table if exists dbo.IndexedViewMetadata
go
create table dbo.IndexedViewMetadata
(
	Id int identity(1,1) primary key clustered,
	[Owner] nvarchar(max) not null,
	[Name] nvarchar(max) not null,
	[CreateDate] datetime not null,
	[DateLastModified] datetime not null,
	[AnsiNullsStatus] bit not null
);

select *
from dbo.IndexedViewMetadata;
go


