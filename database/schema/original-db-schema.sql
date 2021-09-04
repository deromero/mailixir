/*
    Mailixir:
    Original Db Schema
*/

    if exists (select 1 from sys.objects where object_id = OBJECT_ID(N'[FK2F7FA030A2480906]') AND parent_object_id = OBJECT_ID('Attachments'))
alter table Attachments  drop constraint FK2F7FA030A2480906


    if exists (select 1 from sys.objects where object_id = OBJECT_ID(N'[FK31817C7DBEF4E9E2]') AND parent_object_id = OBJECT_ID('Campaigns'))
alter table Campaigns  drop constraint FK31817C7DBEF4E9E2


    if exists (select 1 from sys.objects where object_id = OBJECT_ID(N'[FK1E92E797A2480906]') AND parent_object_id = OBJECT_ID('Links'))
alter table Links  drop constraint FK1E92E797A2480906


    if exists (select 1 from sys.objects where object_id = OBJECT_ID(N'[FK51742BE1BEF4E9E2]') AND parent_object_id = OBJECT_ID('Lists'))
alter table Lists  drop constraint FK51742BE1BEF4E9E2


    if exists (select 1 from sys.objects where object_id = OBJECT_ID(N'[FK4C918743A2480906]') AND parent_object_id = OBJECT_ID('MailContents'))
alter table MailContents  drop constraint FK4C918743A2480906


    if exists (select 1 from sys.objects where object_id = OBJECT_ID(N'[FK3ACB3A86A2480906]') AND parent_object_id = OBJECT_ID('Recipients'))
alter table Recipients  drop constraint FK3ACB3A86A2480906


    if exists (select 1 from sys.objects where object_id = OBJECT_ID(N'[FK8AE07ECD822C6B60]') AND parent_object_id = OBJECT_ID('Subscribers'))
alter table Subscribers  drop constraint FK8AE07ECD822C6B60


    if exists (select 1 from sys.objects where object_id = OBJECT_ID(N'[FK8AE07ECDBEF4E9E2]') AND parent_object_id = OBJECT_ID('Subscribers'))
alter table Subscribers  drop constraint FK8AE07ECDBEF4E9E2


    if exists (select 1 from sys.objects where object_id = OBJECT_ID(N'[FK817BB97BBEF4E9E2]') AND parent_object_id = OBJECT_ID('Templates'))
alter table Templates  drop constraint FK817BB97BBEF4E9E2


    if exists (select * from dbo.sysobjects where id = object_id(N'Attachments') and OBJECTPROPERTY(id, N'IsUserTable') = 1) drop table Attachments

    if exists (select * from dbo.sysobjects where id = object_id(N'Campaigns') and OBJECTPROPERTY(id, N'IsUserTable') = 1) drop table Campaigns

    if exists (select * from dbo.sysobjects where id = object_id(N'Clients') and OBJECTPROPERTY(id, N'IsUserTable') = 1) drop table Clients

    if exists (select * from dbo.sysobjects where id = object_id(N'EmailQueue') and OBJECTPROPERTY(id, N'IsUserTable') = 1) drop table EmailQueue

    if exists (select * from dbo.sysobjects where id = object_id(N'Links') and OBJECTPROPERTY(id, N'IsUserTable') = 1) drop table Links

    if exists (select * from dbo.sysobjects where id = object_id(N'Lists') and OBJECTPROPERTY(id, N'IsUserTable') = 1) drop table Lists

    if exists (select * from dbo.sysobjects where id = object_id(N'EventLog') and OBJECTPROPERTY(id, N'IsUserTable') = 1) drop table EventLog

    if exists (select * from dbo.sysobjects where id = object_id(N'MailContents') and OBJECTPROPERTY(id, N'IsUserTable') = 1) drop table MailContents

    if exists (select * from dbo.sysobjects where id = object_id(N'Recipients') and OBJECTPROPERTY(id, N'IsUserTable') = 1) drop table Recipients

    if exists (select * from dbo.sysobjects where id = object_id(N'Subscribers') and OBJECTPROPERTY(id, N'IsUserTable') = 1) drop table Subscribers

    if exists (select * from dbo.sysobjects where id = object_id(N'Templates') and OBJECTPROPERTY(id, N'IsUserTable') = 1) drop table Templates

    create table Attachments (
       Id BIGINT IDENTITY NOT NULL,
       Path NVARCHAR(MAX) default ''  not null,
       Description NVARCHAR(MAX) default ''  not null,
       WasClicked BIT null,
       ClickedCount INT null,
       CreatedOn DATETIME default getDate()  not null,
       CampaignId BIGINT not null,
       primary key (Id)
    )

    create table Campaigns (
        Id BIGINT IDENTITY NOT NULL,
       AssignedListsIds NVARCHAR(500) default ''  not null,
       CreatedOn DATETIME default getDate()  not null,
       UpdatedOn DATETIME default getDate()  not null,
       FromEmail NVARCHAR(256) not null,
       FromName NVARCHAR(255) not null,
       ReplyToEmail NVARCHAR(256) not null,
       Name NVARCHAR(50) not null,
       Subject NVARCHAR(255) not null,
       SendReportTo NVARCHAR(500) null,
       RetryStartedOn DATETIME null,
       ScheduledOn DATETIME null,
       SendingStartedOn DATETIME null,
       SentOn DATETIME null,
       Status SMALLINT default 0  not null,
       ClientId BIGINT not null,
       primary key (Id)
    )

    create table Clients (
        Id BIGINT IDENTITY NOT NULL,
       Company NVARCHAR(255) null,
       ContactName NVARCHAR(255) null,
       EmailAddress NVARCHAR(255) null,
       Country NVARCHAR(255) null,
       TimeZone NVARCHAR(255) null,
       CreatedOn DATETIME default getDate()  not null,
       primary key (Id)
    )

    create table EmailQueue (
        Id BIGINT IDENTITY NOT NULL,
       Priority SMALLINT default 1  not null,
       IsBodyHtml BIT default 0  not null,
       Subject NVARCHAR(1024) not null,
       [From] NVARCHAR(256) not null,
       [To] NVARCHAR(1024) not null,
       Cc NVARCHAR(256) null,
       Bcc NVARCHAR(256) null,
       [Body] NVARCHAR(MAX) null,
       NextTryTime DATETIME null,
       NumberOfTries INT not null,
       CreatedOn DATETIME not null,
       primary key (Id)
    )

    create table Links (
        Id BIGINT IDENTITY NOT NULL,
       Url NVARCHAR(MAX) default ''  not null,
       Description NVARCHAR(MAX) default ''  not null,
       WasClicked BIT null,
       ClickedCount INT null,
       CreatedOn DATETIME default getDate()  not null,
       CampaignId BIGINT not null,
       primary key (Id)
    )

    create table Lists (
        Id BIGINT IDENTITY NOT NULL,
       Name NVARCHAR(255) not null,
       ListType SMALLINT null,
       CreatedOn DATETIME default getDate()  not null,
       UpdatedOn DATETIME default getDate()  not null,
       AttributesNames NVARCHAR(MAX) null,
       AttributesValues NVARCHAR(MAX) null,
       ClientId BIGINT not null,
       primary key (Id)
    )

    create table MailContents (
        Id BIGINT IDENTITY NOT NULL,
       ContentType SMALLINT not null,
       Content NVARCHAR(MAX) not null,
       CampaignId BIGINT not null,
       primary key (Id)
    )

    create table Recipients (
        Id BIGINT IDENTITY NOT NULL,
       Email NVARCHAR(256) not null,
       Name NVARCHAR(256) not null,
       WasFailed BIT not null,
       WasSent BIT not null,
       SentOn DATETIME null,
       WasOpened BIT not null,
       OpenedOn DATETIME null,
       OpenedCount INT not null,
       WasBounced BIT not null,
       BouncedOn DATETIME null,
       WasClicked BIT not null,
       ClickedOn DATETIME null,
       ClickedCount INT not null,
       Comments NVARCHAR(MAX) null,
       Dsn NVARCHAR(MAX) null,
       CreatedOn DATETIME default getDate()  not null,
       WasParsed BIT not null,
       ParsedOn DATETIME default getDate()  null,
       AttributesNames NVARCHAR(MAX) null,
       AttributesValues NVARCHAR(MAX) null,
       CampaignId BIGINT not null,
       primary key (Id)
    )

    create table Subscribers (
        Id BIGINT IDENTITY NOT NULL,
       Name NVARCHAR(255) not null,
       EmailAddress NVARCHAR(255) not null,
       CreatedOn DATETIME default getDate()  not null,
       UpdatedOn DATETIME default getDate()  not null,
       IsActive BIT default 1  not null,
       BounceCount INT default 0  not null,
       BounceComments NVARCHAR(MAX) null,
       AttributesNames NVARCHAR(MAX) null,
       AttributesValues NVARCHAR(MAX) null,
       ListId BIGINT not null,
       ClientId BIGINT not null,
       primary key (Id)
    )

    create table Templates (
        Id BIGINT IDENTITY NOT NULL,
       Name NVARCHAR(50) not null,
       Content NVARCHAR(MAX) not null,
       CreatedOn DATETIME default getDate()  not null,
       UpdatedOn DATETIME default getDate()  not null,
       ClientId BIGINT not null,
       primary key (Id)
    )

    alter table Attachments 
        add constraint FK2F7FA030A2480906 
        foreign key (CampaignId) 
        references Campaigns

    alter table Campaigns 
        add constraint FK31817C7DBEF4E9E2 
        foreign key (ClientId) 
        references Clients

    alter table Links 
        add constraint FK1E92E797A2480906 
        foreign key (CampaignId) 
        references Campaigns

    alter table Lists 
        add constraint FK51742BE1BEF4E9E2 
        foreign key (ClientId) 
        references Clients

    alter table MailContents 
        add constraint FK4C918743A2480906 
        foreign key (CampaignId) 
        references Campaigns

    alter table Recipients 
        add constraint FK3ACB3A86A2480906 
        foreign key (CampaignId) 
        references Campaigns

    alter table Subscribers 
        add constraint FK8AE07ECD822C6B60 
        foreign key (ListId) 
        references Lists

    alter table Subscribers 
        add constraint FK8AE07ECDBEF4E9E2 
        foreign key (ClientId) 
        references Clients

    alter table Templates 
        add constraint FK817BB97BBEF4E9E2 
        foreign key (ClientId) 
        references Clients
