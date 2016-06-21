/****** Object: Table [TI].[AMA_REQUISITION]   Script Date: 21/06/2016 16:22:50 ******/
USE [TIDB];
GO
IF EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[TI].[AMA_REQUISITION]') AND type in (N'U'))
BEGIN
DROP TABLE [TIDB].[TI].[AMA_REQUISITION];
END
GO

SET ANSI_NULLS ON;
GO
SET QUOTED_IDENTIFIER ON;
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[TI].[AMA_REQUISITION]') AND type in (N'U'))
BEGIN
CREATE TABLE [TI].[AMA_REQUISITION] (
[REQUISITION_ID] int NOT NULL,
[CLIENT] char(6) COLLATE Latin1_General_CI_AS NULL,
[REQUISITION] varchar(254) COLLATE Latin1_General_CI_AS NULL,
[PERSON_ID] int NULL,
[PROJECT_ID] int NULL,
[COSTCENTER_ID] int NULL,
[LOCATION_ID] int NULL,
[DAT_REQUISITION] datetime NULL,
[PERSON_ID_REQBY] int NULL,
[SYSTEM_ID] int NULL,
[DAT_SUPPLY] datetime NULL,
[STATUS] char(2) COLLATE Latin1_General_CI_AS NULL,
[DESCRIPTION] varchar(254) COLLATE Latin1_General_CI_AS NULL,
[TOTALNETPRICE] numeric(20, 7) NULL,
[TOTALGROSSPRICE] numeric(20, 7) NULL,
[CURRTOTALNET] varchar(254) COLLATE Latin1_General_CI_AS NULL,
[CURRTOTALGROSS] varchar(254) COLLATE Latin1_General_CI_AS NULL,
[TOTALNETPRICE2] numeric(20, 7) NULL,
[TOTALGROSSPRICE2] numeric(20, 7) NULL,
[CURRTOTALNET2] varchar(254) COLLATE Latin1_General_CI_AS NULL,
[CURRTOTALGROSS2] varchar(254) COLLATE Latin1_General_CI_AS NULL,
[SHORTTEXT] varchar(1000) COLLATE Latin1_General_CI_AS NULL,
[DATCRE] datetime NULL,
[DATCHG] datetime NULL,
[USERCRE] varchar(254) COLLATE Latin1_General_CI_AS NULL,
[USERCHG] varchar(254) COLLATE Latin1_General_CI_AS NULL,
[Z_NOME_UTENTE] varchar(254) COLLATE Latin1_General_CI_AS NULL,
[Z_COGNOME_UTENTE] varchar(254) COLLATE Latin1_General_CI_AS NULL,
[Z_CID_UTENTE] varchar(254) COLLATE Latin1_General_CI_AS NULL,
[Z_DATA_INOLTRO] datetime NULL,
[Z_DATA_APP_TECN] datetime NULL,
[Z_DATA_APP_ECON] datetime NULL,
[Z_DATA_PIANIFICAZIONE] datetime NULL,
[Z_DATA_EVASIONE] datetime NULL,
[Z_DATA_CHIUSURA] datetime NULL,
[Z_PRIORITA] int NULL,
[Z_TIPO_INST] varchar(10) COLLATE Latin1_General_CI_AS NULL,
[Z_AREA_TERRITORIALE] int NULL,
[Z_LINEA_ANOMALA] int NULL,
[Z_SOTTOAREA_ID] int NULL,
[Z_CIVICO] varchar(254) COLLATE Latin1_General_CI_AS NULL,
[Z_EDIFICIO] varchar(254) COLLATE Latin1_General_CI_AS NULL,
[Z_PIANO] varchar(254) COLLATE Latin1_General_CI_AS NULL,
[Z_PADIGLIONE] varchar(254) COLLATE Latin1_General_CI_AS NULL,
[Z_STANZA] varchar(254) COLLATE Latin1_General_CI_AS NULL,
[Z_RIF_TEL] varchar(254) COLLATE Latin1_General_CI_AS NULL,
[HLQ1] int NULL,
[HLQ2] int NULL,
[PERSON_ID_APPR] int NULL,
[STATUS_EXTENSION] varchar(254) COLLATE Latin1_General_CI_AS NULL,
[Z_ANNO_REQ] varchar(254) COLLATE Latin1_General_CI_AS NULL,
[Z_PM_WBE] varchar(254) COLLATE Latin1_General_CI_AS NULL,
[Z_PM_ID] int NULL,
[Z_NETWORK] varchar(254) COLLATE Latin1_General_CI_AS NULL,
[Z_POSIZIONE_NETWORK] varchar(254) COLLATE Latin1_General_CI_AS NULL,
[Z_DESC_POSIZIONE_NETWORK] varchar(254) COLLATE Latin1_General_CI_AS NULL,
[Z_COSTCENTER_PM_ID] varchar(254) COLLATE Latin1_General_CI_AS NULL,
[Z_STRUTTURA] varchar(254) COLLATE Latin1_General_CI_AS NULL,
[Z_DIVISIONE] varchar(254) COLLATE Latin1_General_CI_AS NULL,
[Z_PM] char(1) COLLATE Latin1_General_CI_AS NULL,
[DAT_EXPECTED] datetime NULL,
[EVALUATED_ID] int NULL,
[DAT_APPROVED] datetime NULL,
[DAT_FULFILLED] datetime NULL,
[TOP_RI_COUNT] int NULL,
[RI_COUNT] int NULL,
[DESCRIPTION_AUTO] varchar(2000) COLLATE Latin1_General_CI_AS NULL,
[DESCRIPTION_ADDITIONAL_AUTO] varchar(2000) COLLATE Latin1_General_CI_AS NULL,
[IMPACT] numeric(1, 0) NULL DEFAULT ((3)),
[URGENCY] numeric(1, 0) NULL DEFAULT ((3)),
[PRIORITY] numeric(1, 0) NULL DEFAULT ((5)),
[REQTYPE_ID] int NULL,
[REQGROUP_ID] int NULL,
[REQUISITION_ID_ORIG] int NULL,
[POSITION_IN_GROUP] smallint NULL,
[DAT_SUBMITTED] datetime NULL,
[DAT_CLOSED] datetime NULL,
[DAT_REOPEN_TIMEOUT] datetime NULL,
[Z_INVESTMENT_PROJECT] int NULL,
CONSTRAINT [F_REQUISTN_EVALTED]
FOREIGN KEY ([EVALUATED_ID])
REFERENCES [TI].[AMA_EVALUATED] ( [EVALUATED_ID] )
ON DELETE SET NULL
,
CONSTRAINT [PK_REQUISITION]
PRIMARY KEY CLUSTERED ([REQUISITION_ID] ASC)
WITH ( PAD_INDEX = OFF,
FILLFACTOR = 100,
IGNORE_DUP_KEY = OFF,
STATISTICS_NORECOMPUTE = OFF,
ALLOW_ROW_LOCKS = ON,
ALLOW_PAGE_LOCKS = ON,
DATA_COMPRESSION = NONE )
 ON [PRIMARY],
CONSTRAINT [F_REQUISITION_INVESTMENT_PROJECT]
FOREIGN KEY ([Z_INVESTMENT_PROJECT])
REFERENCES [TI].[XAMA_INVESTMENT_PROJECT] ( [INVESTMENT_PROJECT_ID] ),
CONSTRAINT [F_REQUISITION_RQTP]
FOREIGN KEY ([REQTYPE_ID])
REFERENCES [TI].[AMA_REQTYPE] ( [REQTYPE_ID] ),
CONSTRAINT [F_REQUISTN_RQGROUP]
FOREIGN KEY ([REQGROUP_ID])
REFERENCES [TI].[AMA_REQGROUP] ( [REQGROUP_ID] ),
CONSTRAINT [F_REQUISTN_REQSTN]
FOREIGN KEY ([REQUISITION_ID_ORIG])
REFERENCES [TI].[AMA_REQUISITION] ( [REQUISITION_ID] ),
CONSTRAINT [F_REQUISITION_PRSN]
FOREIGN KEY ([PERSON_ID_APPR])
REFERENCES [TI].[AMA_PERSON] ( [PERSON_ID] )
)
ON [PRIMARY];
END;
GO

/****** Object: Index [TI].[I_REQPERS_FK]   Script Date: 21/06/2016 16:22:50 ******/
IF EXISTS (SELECT * FROM sys.indexes WHERE object_id = OBJECT_ID(N'[TI].[AMA_REQUISITION]') AND name = N'I_REQPERS_FK')
BEGIN
DROP INDEX [I_REQPERS_FK] ON [TI].[AMA_REQUISITION];
END
GO

IF NOT EXISTS (SELECT * FROM sys.indexes WHERE object_id = OBJECT_ID(N'[TI].[AMA_REQUISITION]') AND name = N'I_REQPERS_FK')
BEGIN
CREATE NONCLUSTERED INDEX [I_REQPERS_FK]
ON [TI].[AMA_REQUISITION]
([PERSON_ID] , [PERSON_ID_REQBY])
WITH
(
PAD_INDEX = OFF,
FILLFACTOR = 100,
IGNORE_DUP_KEY = OFF,
STATISTICS_NORECOMPUTE = OFF,
ONLINE = OFF,
ALLOW_ROW_LOCKS = ON,
ALLOW_PAGE_LOCKS = ON,
DATA_COMPRESSION = NONE
)
ON [PRIMARY];
END
GO

/****** Object: Index [TI].[I_REQUISITION]   Script Date: 21/06/2016 16:22:50 ******/
IF EXISTS (SELECT * FROM sys.indexes WHERE object_id = OBJECT_ID(N'[TI].[AMA_REQUISITION]') AND name = N'I_REQUISITION')
BEGIN
DROP INDEX [I_REQUISITION] ON [TI].[AMA_REQUISITION];
END
GO

IF NOT EXISTS (SELECT * FROM sys.indexes WHERE object_id = OBJECT_ID(N'[TI].[AMA_REQUISITION]') AND name = N'I_REQUISITION')
BEGIN
CREATE UNIQUE NONCLUSTERED INDEX [I_REQUISITION]
ON [TI].[AMA_REQUISITION]
([REQUISITION] , [CLIENT])
WITH
(
PAD_INDEX = OFF,
FILLFACTOR = 100,
IGNORE_DUP_KEY = OFF,
STATISTICS_NORECOMPUTE = OFF,
ALLOW_ROW_LOCKS = ON,
ALLOW_PAGE_LOCKS = ON,
DATA_COMPRESSION = NONE
)
ON [PRIMARY];
END
GO

/****** Object: Index [TI].[I_REQUISITION_FK1]   Script Date: 21/06/2016 16:22:50 ******/
IF EXISTS (SELECT * FROM sys.indexes WHERE object_id = OBJECT_ID(N'[TI].[AMA_REQUISITION]') AND name = N'I_REQUISITION_FK1')
BEGIN
DROP INDEX [I_REQUISITION_FK1] ON [TI].[AMA_REQUISITION];
END
GO

IF NOT EXISTS (SELECT * FROM sys.indexes WHERE object_id = OBJECT_ID(N'[TI].[AMA_REQUISITION]') AND name = N'I_REQUISITION_FK1')
BEGIN
CREATE NONCLUSTERED INDEX [I_REQUISITION_FK1]
ON [TI].[AMA_REQUISITION]
([PROJECT_ID])
WITH
(
PAD_INDEX = OFF,
FILLFACTOR = 100,
IGNORE_DUP_KEY = OFF,
STATISTICS_NORECOMPUTE = OFF,
ONLINE = OFF,
ALLOW_ROW_LOCKS = ON,
ALLOW_PAGE_LOCKS = ON,
DATA_COMPRESSION = NONE
)
ON [PRIMARY];
END
GO

/****** Object: Index [TI].[I_REQUISITION_FK2]   Script Date: 21/06/2016 16:22:50 ******/
IF EXISTS (SELECT * FROM sys.indexes WHERE object_id = OBJECT_ID(N'[TI].[AMA_REQUISITION]') AND name = N'I_REQUISITION_FK2')
BEGIN
DROP INDEX [I_REQUISITION_FK2] ON [TI].[AMA_REQUISITION];
END
GO

IF NOT EXISTS (SELECT * FROM sys.indexes WHERE object_id = OBJECT_ID(N'[TI].[AMA_REQUISITION]') AND name = N'I_REQUISITION_FK2')
BEGIN
CREATE NONCLUSTERED INDEX [I_REQUISITION_FK2]
ON [TI].[AMA_REQUISITION]
([COSTCENTER_ID])
WITH
(
PAD_INDEX = OFF,
FILLFACTOR = 100,
IGNORE_DUP_KEY = OFF,
STATISTICS_NORECOMPUTE = OFF,
ONLINE = OFF,
ALLOW_ROW_LOCKS = ON,
ALLOW_PAGE_LOCKS = ON,
DATA_COMPRESSION = NONE
)
ON [PRIMARY];
END
GO

/****** Object: Index [TI].[I_REQUISITION_FK3]   Script Date: 21/06/2016 16:22:50 ******/
IF EXISTS (SELECT * FROM sys.indexes WHERE object_id = OBJECT_ID(N'[TI].[AMA_REQUISITION]') AND name = N'I_REQUISITION_FK3')
BEGIN
DROP INDEX [I_REQUISITION_FK3] ON [TI].[AMA_REQUISITION];
END
GO

IF NOT EXISTS (SELECT * FROM sys.indexes WHERE object_id = OBJECT_ID(N'[TI].[AMA_REQUISITION]') AND name = N'I_REQUISITION_FK3')
BEGIN
CREATE NONCLUSTERED INDEX [I_REQUISITION_FK3]
ON [TI].[AMA_REQUISITION]
([LOCATION_ID])
WITH
(
PAD_INDEX = OFF,
FILLFACTOR = 100,
IGNORE_DUP_KEY = OFF,
STATISTICS_NORECOMPUTE = OFF,
ONLINE = OFF,
ALLOW_ROW_LOCKS = ON,
ALLOW_PAGE_LOCKS = ON,
DATA_COMPRESSION = NONE
)
ON [PRIMARY];
END
GO

/****** Object: Index [TI].[I_REQUISITION_FK4]   Script Date: 21/06/2016 16:22:50 ******/
IF EXISTS (SELECT * FROM sys.indexes WHERE object_id = OBJECT_ID(N'[TI].[AMA_REQUISITION]') AND name = N'I_REQUISITION_FK4')
BEGIN
DROP INDEX [I_REQUISITION_FK4] ON [TI].[AMA_REQUISITION];
END
GO

IF NOT EXISTS (SELECT * FROM sys.indexes WHERE object_id = OBJECT_ID(N'[TI].[AMA_REQUISITION]') AND name = N'I_REQUISITION_FK4')
BEGIN
CREATE NONCLUSTERED INDEX [I_REQUISITION_FK4]
ON [TI].[AMA_REQUISITION]
([SYSTEM_ID])
WITH
(
PAD_INDEX = OFF,
FILLFACTOR = 100,
IGNORE_DUP_KEY = OFF,
STATISTICS_NORECOMPUTE = OFF,
ONLINE = OFF,
ALLOW_ROW_LOCKS = ON,
ALLOW_PAGE_LOCKS = ON,
DATA_COMPRESSION = NONE
)
ON [PRIMARY];
END
GO

/****** Object: Index [TI].[I_REQUISITION_FK5]   Script Date: 21/06/2016 16:22:50 ******/
IF EXISTS (SELECT * FROM sys.indexes WHERE object_id = OBJECT_ID(N'[TI].[AMA_REQUISITION]') AND name = N'I_REQUISITION_FK5')
BEGIN
DROP INDEX [I_REQUISITION_FK5] ON [TI].[AMA_REQUISITION];
END
GO

IF NOT EXISTS (SELECT * FROM sys.indexes WHERE object_id = OBJECT_ID(N'[TI].[AMA_REQUISITION]') AND name = N'I_REQUISITION_FK5')
BEGIN
CREATE NONCLUSTERED INDEX [I_REQUISITION_FK5]
ON [TI].[AMA_REQUISITION]
([EVALUATED_ID])
WITH
(
PAD_INDEX = OFF,
FILLFACTOR = 100,
IGNORE_DUP_KEY = OFF,
STATISTICS_NORECOMPUTE = OFF,
ONLINE = OFF,
ALLOW_ROW_LOCKS = ON,
ALLOW_PAGE_LOCKS = ON,
DATA_COMPRESSION = NONE
)
ON [PRIMARY];
END
GO

/****** Object: Index [TI].[I_REQUISITION_FK6]   Script Date: 21/06/2016 16:22:50 ******/
IF EXISTS (SELECT * FROM sys.indexes WHERE object_id = OBJECT_ID(N'[TI].[AMA_REQUISITION]') AND name = N'I_REQUISITION_FK6')
BEGIN
DROP INDEX [I_REQUISITION_FK6] ON [TI].[AMA_REQUISITION];
END
GO

IF NOT EXISTS (SELECT * FROM sys.indexes WHERE object_id = OBJECT_ID(N'[TI].[AMA_REQUISITION]') AND name = N'I_REQUISITION_FK6')
BEGIN
CREATE NONCLUSTERED INDEX [I_REQUISITION_FK6]
ON [TI].[AMA_REQUISITION]
([REQTYPE_ID])
WITH
(
PAD_INDEX = OFF,
FILLFACTOR = 100,
IGNORE_DUP_KEY = OFF,
STATISTICS_NORECOMPUTE = OFF,
ONLINE = OFF,
ALLOW_ROW_LOCKS = ON,
ALLOW_PAGE_LOCKS = ON,
DATA_COMPRESSION = NONE
)
ON [PRIMARY];
END
GO

/****** Object: Index [TI].[I_REQUISITION_FK7]   Script Date: 21/06/2016 16:22:50 ******/
IF EXISTS (SELECT * FROM sys.indexes WHERE object_id = OBJECT_ID(N'[TI].[AMA_REQUISITION]') AND name = N'I_REQUISITION_FK7')
BEGIN
DROP INDEX [I_REQUISITION_FK7] ON [TI].[AMA_REQUISITION];
END
GO

IF NOT EXISTS (SELECT * FROM sys.indexes WHERE object_id = OBJECT_ID(N'[TI].[AMA_REQUISITION]') AND name = N'I_REQUISITION_FK7')
BEGIN
CREATE NONCLUSTERED INDEX [I_REQUISITION_FK7]
ON [TI].[AMA_REQUISITION]
([REQGROUP_ID])
WITH
(
PAD_INDEX = OFF,
FILLFACTOR = 100,
IGNORE_DUP_KEY = OFF,
STATISTICS_NORECOMPUTE = OFF,
ONLINE = OFF,
ALLOW_ROW_LOCKS = ON,
ALLOW_PAGE_LOCKS = ON,
DATA_COMPRESSION = NONE
)
ON [PRIMARY];
END
GO

/****** Object: Index [TI].[I_REQUISITION_FK8]   Script Date: 21/06/2016 16:22:50 ******/
IF EXISTS (SELECT * FROM sys.indexes WHERE object_id = OBJECT_ID(N'[TI].[AMA_REQUISITION]') AND name = N'I_REQUISITION_FK8')
BEGIN
DROP INDEX [I_REQUISITION_FK8] ON [TI].[AMA_REQUISITION];
END
GO

IF NOT EXISTS (SELECT * FROM sys.indexes WHERE object_id = OBJECT_ID(N'[TI].[AMA_REQUISITION]') AND name = N'I_REQUISITION_FK8')
BEGIN
CREATE NONCLUSTERED INDEX [I_REQUISITION_FK8]
ON [TI].[AMA_REQUISITION]
([REQUISITION_ID_ORIG])
WITH
(
PAD_INDEX = OFF,
FILLFACTOR = 100,
IGNORE_DUP_KEY = OFF,
STATISTICS_NORECOMPUTE = OFF,
ONLINE = OFF,
ALLOW_ROW_LOCKS = ON,
ALLOW_PAGE_LOCKS = ON,
DATA_COMPRESSION = NONE
)
ON [PRIMARY];
END
GO

/****** Object: Index [TI].[I_REQUISITION_FK9]   Script Date: 21/06/2016 16:22:50 ******/
IF EXISTS (SELECT * FROM sys.indexes WHERE object_id = OBJECT_ID(N'[TI].[AMA_REQUISITION]') AND name = N'I_REQUISITION_FK9')
BEGIN
DROP INDEX [I_REQUISITION_FK9] ON [TI].[AMA_REQUISITION];
END
GO

IF NOT EXISTS (SELECT * FROM sys.indexes WHERE object_id = OBJECT_ID(N'[TI].[AMA_REQUISITION]') AND name = N'I_REQUISITION_FK9')
BEGIN
CREATE NONCLUSTERED INDEX [I_REQUISITION_FK9]
ON [TI].[AMA_REQUISITION]
([PERSON_ID_APPR])
WITH
(
PAD_INDEX = OFF,
FILLFACTOR = 100,
IGNORE_DUP_KEY = OFF,
STATISTICS_NORECOMPUTE = OFF,
ONLINE = OFF,
ALLOW_ROW_LOCKS = ON,
ALLOW_PAGE_LOCKS = ON,
DATA_COMPRESSION = NONE
)
ON [PRIMARY];
END
GO
/****** Object: Trigger [TI].[fs_history_insert_req]   Script Date: 21/06/2016 16:22:50 ******/
IF EXISTS (SELECT * FROM sys.triggers WHERE object_id = OBJECT_ID(N'[TI].[fs_history_insert_req]'))
BEGIN
DROP TRIGGER [TI].[fs_history_insert_req];
END
GO

SET ANSI_NULLS ON;
GO
SET QUOTED_IDENTIFIER ON;
GO
IF NOT EXISTS (SELECT * FROM sys.triggers WHERE object_id = OBJECT_ID(N'[TI].[fs_history_insert_req]'))
EXEC [sys].[sp_executesql] @statement = N'
CREATE trigger [TI].[fs_history_insert_req] on [TI].[AMA_REQUISITION] for insert as
begin
	declare
		@old_val  varchar(254),
		@new_val  varchar(254),
		@user    int,
		@userName varchar(254),
		@reqID   int, 
		@annoReq int

	select @old_val = null
	select @new_val = status,@userName=USERCHG,@reqID=REQUISITION_ID, @annoReq = YEAR(DAT_REQUISITION) from INSERTED;
	select @user=S3USER_ID FROM TI.AMT_S3USER where USERID=@userName;

	IF @new_val=''DC'' and (@old_val=''NW'' or @old_val is null)
	BEGIN
	   	UPDATE  [AMA_REQUISITION] SET Z_DATA_INOLTRO=getDate() 
		FROM inserted i INNER JOIN [AMA_REQUISITION] r
		ON i.requisition_id = r.requisition_id
	END
	IF @new_val=''SP'' and (@old_val=''DC'' OR @old_val=''SU'' or @old_val is null)
	BEGIN
	    	UPDATE  [AMA_REQUISITION] SET Z_DATA_APP_TECN=getDate() 
		FROM inserted i INNER JOIN [AMA_REQUISITION] r
		ON i.requisition_id = r.requisition_id
	END
	IF @new_val=''BF'' and (@old_val=''SP'' or @old_val is null)
	BEGIN
	    	UPDATE  [AMA_REQUISITION] SET Z_DATA_APP_ECON=getDate() 
		FROM inserted i INNER JOIN [AMA_REQUISITION] r
		ON i.requisition_id = r.requisition_id
		END
	IF @new_val=''IF'' and @old_val=''BF''
	BEGIN
	    	UPDATE  [AMA_REQUISITION] SET Z_DATA_PIANIFICAZIONE=getDate() 
		FROM inserted i INNER JOIN [AMA_REQUISITION] r
		ON i.requisition_id = r.requisition_id
	END
	IF @new_val=''FF'' and @old_val<>''FF''
	BEGIN
	   	UPDATE  [AMA_REQUISITION] SET Z_DATA_CHIUSURA=getDate() 
		FROM inserted i INNER JOIN [AMA_REQUISITION] r
		ON i.requisition_id = r.requisition_id
	END
	UPDATE AMA_REQUISITION SET Z_ANNO_REQ = @annoReq WHERE REQUISITION_ID = @reqID
	return
END
';
GO
/****** Object: Trigger [TI].[fs_history_req]   Script Date: 21/06/2016 16:22:50 ******/
IF EXISTS (SELECT * FROM sys.triggers WHERE object_id = OBJECT_ID(N'[TI].[fs_history_req]'))
BEGIN
DROP TRIGGER [TI].[fs_history_req];
END
GO

SET ANSI_NULLS ON;
GO
SET QUOTED_IDENTIFIER ON;
GO
IF NOT EXISTS (SELECT * FROM sys.triggers WHERE object_id = OBJECT_ID(N'[TI].[fs_history_req]'))
EXEC [sys].[sp_executesql] @statement = N'
CREATE trigger [TI].[fs_history_req] on [TI].[AMA_REQUISITION] for update as
begin
	declare
		@old_val  varchar(254),
		@new_val  varchar(254),
		@user    int,
		@userName varchar(254),
		@reqID   int, 
		@annoReq int
		
	if UPDATE(status)
	BEGIN
		select @old_val = status from DELETED;
		select @new_val = status,@userName=USERCHG,@reqID=REQUISITION_ID, @annoReq = YEAR(DAT_REQUISITION) from INSERTED;
		select @user=S3USER_ID FROM TI.AMT_S3USER where USERID=@userName;
		insert into TI.XAMA_HISTORY_REQUISITION (OLD_VALUE,NEW_VALUE,S3USER,REQUISITION_ID) VALUES (@old_val,@new_val,@user,@reqID);
		IF @new_val=''DC'' and (@old_val=''NW'' or @old_val is null)
		BEGIN
		   	UPDATE  [AMA_REQUISITION] SET Z_DATA_INOLTRO=getDate() 
			FROM inserted i INNER JOIN [AMA_REQUISITION] r
			ON i.requisition_id = r.requisition_id
		END
		IF @new_val=''SP'' and (@old_val=''DC'' OR @old_val=''SU'')
		BEGIN
		    	UPDATE  [AMA_REQUISITION] SET Z_DATA_APP_TECN=getDate() 
			FROM inserted i INNER JOIN [AMA_REQUISITION] r
			ON i.requisition_id = r.requisition_id
		END
		IF @new_val=''BF'' and @old_val=''SP''
		BEGIN
		    	UPDATE  [AMA_REQUISITION] SET Z_DATA_APP_ECON=getDate() 
			FROM inserted i INNER JOIN [AMA_REQUISITION] r
			ON i.requisition_id = r.requisition_id
		END
		IF @new_val=''IF'' and @old_val=''BF''
		BEGIN
		    	UPDATE  [AMA_REQUISITION] SET Z_DATA_PIANIFICAZIONE=getDate() 
			FROM inserted i INNER JOIN [AMA_REQUISITION] r
			ON i.requisition_id = r.requisition_id
		END
		IF @new_val=''FF'' and @old_val<>''FF''
		BEGIN
		   	UPDATE  [AMA_REQUISITION] SET Z_DATA_CHIUSURA=getDate() 
			FROM inserted i INNER JOIN [AMA_REQUISITION] r
			ON i.requisition_id = r.requisition_id
		END
	END
	--UPDATE AMA_REQUISITION SET Z_ANNO_REQ = @annoReq WHERE REQUISITION_ID = @reqID
	return
END
';
GO
/****** Object: Trigger [TI].[td_ama_requisition]   Script Date: 21/06/2016 16:22:50 ******/
IF EXISTS (SELECT * FROM sys.triggers WHERE object_id = OBJECT_ID(N'[TI].[td_ama_requisition]'))
BEGIN
DROP TRIGGER [TI].[td_ama_requisition];
END
GO

SET ANSI_NULLS ON;
GO
SET QUOTED_IDENTIFIER ON;
GO
IF NOT EXISTS (SELECT * FROM sys.triggers WHERE object_id = OBJECT_ID(N'[TI].[td_ama_requisition]'))
EXEC [sys].[sp_executesql] @statement = N'/*  Delete trigger "TI.td_ama_requisition" for table "TI.AMA_REQUISITION"  */
create trigger TI.td_ama_requisition on TI.AMA_REQUISITION for delete as
begin
    declare
       @numrows  int,
       @errno    int,
       @errmsg   varchar(255),
       @severity tinyint,
       @state    tinyint

    select  @numrows = @@rowcount
    if @numrows = 0
      begin
       raiserror (''Existence of child not important'',1,1)
       return
      end 

    /*  Delete all children in "TI.AMA_REQCOMMENT"  */
    delete TI.AMA_REQCOMMENT
    from   TI.AMA_REQCOMMENT t2, deleted t1
    where  t2.REQUISITION_ID = t1.REQUISITION_ID

    
    raiserror (''Existence of child not important'',1,1)
    return

/*  Errors handling  */
error:
    RAISERROR(@errmsg, @severity, @state)
    rollback  transaction
end
';
GO
/****** Object: Trigger [TI].[ti_ama_requisition]   Script Date: 21/06/2016 16:22:50 ******/
IF EXISTS (SELECT * FROM sys.triggers WHERE object_id = OBJECT_ID(N'[TI].[ti_ama_requisition]'))
BEGIN
DROP TRIGGER [TI].[ti_ama_requisition];
END
GO

SET ANSI_NULLS ON;
GO
SET QUOTED_IDENTIFIER ON;
GO
IF NOT EXISTS (SELECT * FROM sys.triggers WHERE object_id = OBJECT_ID(N'[TI].[ti_ama_requisition]'))
EXEC [sys].[sp_executesql] @statement = N'

create trigger TI.ti_ama_requisition on TI.AMA_REQUISITION for insert as
begin
    declare
       @numrows  int,
       @numnull  int,
       @errno    int,
       @errmsg   varchar(255),
       @severity tinyint,
       @state    tinyint

    select  @numrows = @@rowcount
    if @numrows = 0
       return

    if update(SYSTEM_ID)
    begin
       select @numnull = (select count(*)
                          from   inserted
                          where  SYSTEM_ID is null)
       if @numnull != @numrows
          if (select count(*)
              from   TI.AMA_SYSTEM t1, inserted t2
              where  t1.SYSTEM_ID = t2.SYSTEM_ID) != @numrows - @numnull
        begin
           select @errno  = 50002, @severity = 10, @state = 1,
                  @errmsg = ltrim(str(@errno)) + '': '' + ''Parent does not exist in "TI.AMA_SYSTEM". Cannot create child in "TI.AMA_REQUISITION","F_RQ_SYS".''
          goto error
        end
    end

    return


error:
    RAISERROR(@errmsg, @severity, @state)
    rollback  transaction
end
';
GO
/****** Object: Trigger [TI].[tu_ama_requisition]   Script Date: 21/06/2016 16:22:50 ******/
IF EXISTS (SELECT * FROM sys.triggers WHERE object_id = OBJECT_ID(N'[TI].[tu_ama_requisition]'))
BEGIN
DROP TRIGGER [TI].[tu_ama_requisition];
END
GO

SET ANSI_NULLS ON;
GO
SET QUOTED_IDENTIFIER ON;
GO
IF NOT EXISTS (SELECT * FROM sys.triggers WHERE object_id = OBJECT_ID(N'[TI].[tu_ama_requisition]'))
EXEC [sys].[sp_executesql] @statement = N'/*  Update trigger "TI.tu_ama_requisition" for table "TI.AMA_REQUISITION"  */
create trigger TI.tu_ama_requisition on TI.AMA_REQUISITION for update as
begin
   declare
      @numrows  int,
      @numnull  int,
      @errno    int,
      @errmsg   varchar(255),
       @severity tinyint,
       @state    tinyint

      select  @numrows = @@rowcount
      if @numrows = 0
         return

      /*  Parent "TI.AMA_SYSTEM" must exist when updating a child in "TI.AMA_REQUISITION"  */
      if update(SYSTEM_ID)
      begin
         select @numnull = (select count(*)
                            from   inserted
                            where  SYSTEM_ID is null)
         if @numnull != @numrows
            if (select count(*)
                from   TI.AMA_SYSTEM t1, inserted t2
                where  t1.SYSTEM_ID = t2.SYSTEM_ID) != @numrows - @numnull
          begin
             select @errno  = 50003, @severity = 10, @state = 1, 
                    @errmsg = ltrim(str(@errno)) + '': '' + ''Data in "TI.AMA_SYSTEM" does not exist. Cannot modify child in "TI.AMA_REQUISITION","F_RQ_SYS".''
            goto error
          end
      end
      /*  Cannot modify parent code in "TI.AMA_REQUISITION" if children still exist in "TI.AMA_REQCOMMENT"  */
      if update(REQUISITION_ID)
      begin
         if exists (select 1
                    from   TI.AMA_REQCOMMENT t2, inserted i1, deleted d1
                    where  t2.REQUISITION_ID = d1.REQUISITION_ID
                     and  (i1.REQUISITION_ID != d1.REQUISITION_ID))
          begin
             select @errno  = 50005, @severity = 10, @state = 1, 
                    @errmsg = ltrim(str(@errno)) + '': '' + ''Children still exist in "TI.AMA_REQCOMMENT". Cannot modify parent code in "TI.AMA_REQUISITION","F_REQCOMM_REQUISIT".''
            goto error
          end
      end


      return

/*  Errors handling  */
error:
    RAISERROR(@errmsg, @severity, @state)
    rollback  transaction
end
';
GO
