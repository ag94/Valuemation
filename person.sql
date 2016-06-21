/****** Object: Table [TI].[AMA_PERSON]   Script Date: 21/06/2016 16:14:56 ******/
USE [TIDB];
GO
IF EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[TI].[AMA_PERSON]') AND type in (N'U'))
BEGIN
DROP TABLE [TIDB].[TI].[AMA_PERSON];
END
GO

SET ANSI_NULLS ON;
GO
SET QUOTED_IDENTIFIER ON;
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[TI].[AMA_PERSON]') AND type in (N'U'))
BEGIN
CREATE TABLE [TI].[AMA_PERSON] (
[PERSON_ID] int NOT NULL,
[CLIENT] char(6) COLLATE Latin1_General_CI_AS NULL,
[PERS_NO] varchar(254) COLLATE Latin1_General_CI_AS NULL,
[LASTNAME] varchar(254) COLLATE Latin1_General_CI_AS NULL,
[FIRSTNAME] varchar(254) COLLATE Latin1_General_CI_AS NULL,
[TITLE] varchar(254) COLLATE Latin1_General_CI_AS NULL,
[CODE] varchar(16) COLLATE Latin1_General_CI_AS NULL,
[PHONE_NO] varchar(254) COLLATE Latin1_General_CI_AS NULL,
[FAX_NO] varchar(254) COLLATE Latin1_General_CI_AS NULL,
[DEPARTMENT_ID] int NULL,
[SPECIALIST_AREA] varchar(254) COLLATE Latin1_General_CI_AS NULL,
[LOCATION_ID] int NULL,
[COSTCENTER_ID] int NULL,
[PERS_USERID] varchar(254) COLLATE Latin1_General_CI_AS NULL,
[VALIDFROM] datetime NULL,
[VALIDTO] datetime NULL,
[BUSINESSPART_ID] int NULL,
[SHORTTEXT] varchar(254) COLLATE Latin1_General_CI_AS NULL,
[PERS_TYPE] varchar(254) COLLATE Latin1_General_CI_AS NULL,
[CELL] varchar(254) COLLATE Latin1_General_CI_AS NULL,
[PAGER] varchar(254) COLLATE Latin1_General_CI_AS NULL,
[EMAIL] varchar(254) COLLATE Latin1_General_CI_AS NULL,
[PERS_STATUS] varchar(254) COLLATE Latin1_General_CI_AS NULL,
[MAILSTOP] varchar(254) COLLATE Latin1_General_CI_AS NULL,
[PERS_INFO] varchar(254) COLLATE Latin1_General_CI_AS NULL,
[S3USER_ID] int NULL,
[Z_CIVICO] varchar(254) COLLATE Latin1_General_CI_AS NULL,
[Z_EDIFICIO] varchar(254) COLLATE Latin1_General_CI_AS NULL,
[Z_PIANO] varchar(254) COLLATE Latin1_General_CI_AS NULL,
[Z_PADIGLIONE] varchar(254) COLLATE Latin1_General_CI_AS NULL,
[Z_STANZA] varchar(254) COLLATE Latin1_General_CI_AS NULL,
[Z_RIF_TEL] varchar(254) COLLATE Latin1_General_CI_AS NULL,
[PFLDC07] varchar(254) COLLATE Latin1_General_CI_AS NULL,
[PFLDC08] varchar(254) COLLATE Latin1_General_CI_AS NULL,
[PFLDC09] varchar(254) COLLATE Latin1_General_CI_AS NULL,
[PFLDC10] varchar(254) COLLATE Latin1_General_CI_AS NULL,
[Z_ULTIMO_IND] int NULL,
[Z_AREA_GESTITA] int NULL,
[Z_SOTTOAREA_GESTITA] int NULL,
[PFLDD04] numeric(15, 5) NULL,
[PFLDD05] numeric(15, 5) NULL,
[PFLDA01] datetime NULL,
[PFLDA02] datetime NULL,
[PFLDA03] datetime NULL,
[DATCRE] datetime NULL,
[DATCHG] datetime NULL,
[USERCRE] varchar(254) COLLATE Latin1_General_CI_AS NULL,
[USERCHG] varchar(254) COLLATE Latin1_General_CI_AS NULL,
[z_data_certif_RUN] datetime NULL,
[Z_AREA_ID] int NULL,
[LANGUAGE] varchar(40) COLLATE Latin1_General_CI_AS NULL,
[EVALUATED_ID] int NULL,
[HLQ1] int NULL,
[HLQ2] int NULL,
[CTI_CELL] varchar(50) COLLATE Latin1_General_CI_AS NULL,
[CTI_PHONE_NO] varchar(50) COLLATE Latin1_General_CI_AS NULL,
[IF_UPDATE] char(1) COLLATE Latin1_General_CI_AS NULL DEFAULT ('Y'),
[PFLDC01] varchar(254) COLLATE Latin1_General_CI_AS NULL,
[PFLDC02] varchar(254) COLLATE Latin1_General_CI_AS NULL,
[PFLDC03] varchar(254) COLLATE Latin1_General_CI_AS NULL,
[PFLDC04] varchar(254) COLLATE Latin1_General_CI_AS NULL,
[PFLDC05] varchar(254) COLLATE Latin1_General_CI_AS NULL,
[PFLDC06] varchar(254) COLLATE Latin1_General_CI_AS NULL,
[PFLDD01] numeric(15, 5) NULL,
[PFLDD02] numeric(15, 5) NULL,
[PFLDD03] numeric(15, 5) NULL,
[POSITION] varchar(254) COLLATE Latin1_General_CI_AS NULL,
[CELL_PRIV] varchar(254) COLLATE Latin1_General_CI_AS NULL,
[EMAIL_PRIV] varchar(254) COLLATE Latin1_General_CI_AS NULL,
[PHONE_NO_PRIV] varchar(254) COLLATE Latin1_General_CI_AS NULL,
[FAX_NO_PRIV] varchar(254) COLLATE Latin1_General_CI_AS NULL,
[SERVICEDOMAIN_ID] int NULL,
[LOCATION_ID1] int NULL,
[Z_EXTERNALCORPORATION_ID] int NULL,
[EXTERNALCORPORATION_ID] int NULL,
CONSTRAINT [F_PE_CC]
FOREIGN KEY ([COSTCENTER_ID])
REFERENCES [TI].[AMA_COSTCENTER] ( [COSTCENTER_ID] ),
CONSTRAINT [F_PERSON_LOCATION1]
FOREIGN KEY ([LOCATION_ID1])
REFERENCES [TI].[AMA_LOCATION] ( [LOCATION_ID] )
ON DELETE SET NULL
,
CONSTRAINT [C_PERSON_IFUPD]
CHECK ( ([IF_UPDATE] IS NULL OR ([IF_UPDATE]='N' OR [IF_UPDATE]='Y')) 
),
CONSTRAINT [PK_PERSON]
PRIMARY KEY CLUSTERED ([PERSON_ID] ASC)
WITH ( PAD_INDEX = OFF,
FILLFACTOR = 100,
IGNORE_DUP_KEY = OFF,
STATISTICS_NORECOMPUTE = OFF,
ALLOW_ROW_LOCKS = ON,
ALLOW_PAGE_LOCKS = ON,
DATA_COMPRESSION = NONE )
 ON [PRIMARY],
CONSTRAINT [F_PE_CL]
FOREIGN KEY ([CLIENT])
REFERENCES [TI].[AMT_CLIENT] ( [CLIENT] ),
CONSTRAINT [F_PE_LO]
FOREIGN KEY ([LOCATION_ID])
REFERENCES [TI].[AMA_LOCATION] ( [LOCATION_ID] ),
CONSTRAINT [F_PE_BP]
FOREIGN KEY ([BUSINESSPART_ID])
REFERENCES [TI].[AMA_BUSINESSPART] ( [BUSINESSPART_ID] ),
CONSTRAINT [F_PERSON_SRVDOMAIN]
FOREIGN KEY ([SERVICEDOMAIN_ID])
REFERENCES [TI].[AMA_SERVICEDOMAIN] ( [SERVICEDOMAIN_ID] )
ON DELETE SET NULL
,
CONSTRAINT [F_PE_DE]
FOREIGN KEY ([DEPARTMENT_ID])
REFERENCES [TI].[AMA_DEPARTMENT] ( [DEPARTMENT_ID] )
)
ON [PRIMARY];
END;
GO

/****** Object: Index [TI].[I_PERSON]   Script Date: 21/06/2016 16:14:56 ******/
IF EXISTS (SELECT * FROM sys.indexes WHERE object_id = OBJECT_ID(N'[TI].[AMA_PERSON]') AND name = N'I_PERSON')
BEGIN
DROP INDEX [I_PERSON] ON [TI].[AMA_PERSON];
END
GO

IF NOT EXISTS (SELECT * FROM sys.indexes WHERE object_id = OBJECT_ID(N'[TI].[AMA_PERSON]') AND name = N'I_PERSON')
BEGIN
CREATE UNIQUE NONCLUSTERED INDEX [I_PERSON]
ON [TI].[AMA_PERSON]
([PERS_NO] , [CLIENT])
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

/****** Object: Index [TI].[I_PERSON_F]   Script Date: 21/06/2016 16:14:56 ******/
IF EXISTS (SELECT * FROM sys.indexes WHERE object_id = OBJECT_ID(N'[TI].[AMA_PERSON]') AND name = N'I_PERSON_F')
BEGIN
DROP INDEX [I_PERSON_F] ON [TI].[AMA_PERSON];
END
GO

IF NOT EXISTS (SELECT * FROM sys.indexes WHERE object_id = OBJECT_ID(N'[TI].[AMA_PERSON]') AND name = N'I_PERSON_F')
BEGIN
CREATE NONCLUSTERED INDEX [I_PERSON_F]
ON [TI].[AMA_PERSON]
([EXTERNALCORPORATION_ID])
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

/****** Object: Index [TI].[I_PERSON_FK1]   Script Date: 21/06/2016 16:14:56 ******/
IF EXISTS (SELECT * FROM sys.indexes WHERE object_id = OBJECT_ID(N'[TI].[AMA_PERSON]') AND name = N'I_PERSON_FK1')
BEGIN
DROP INDEX [I_PERSON_FK1] ON [TI].[AMA_PERSON];
END
GO

IF NOT EXISTS (SELECT * FROM sys.indexes WHERE object_id = OBJECT_ID(N'[TI].[AMA_PERSON]') AND name = N'I_PERSON_FK1')
BEGIN
CREATE NONCLUSTERED INDEX [I_PERSON_FK1]
ON [TI].[AMA_PERSON]
([DEPARTMENT_ID])
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

/****** Object: Index [TI].[I_PERSON_FK2]   Script Date: 21/06/2016 16:14:56 ******/
IF EXISTS (SELECT * FROM sys.indexes WHERE object_id = OBJECT_ID(N'[TI].[AMA_PERSON]') AND name = N'I_PERSON_FK2')
BEGIN
DROP INDEX [I_PERSON_FK2] ON [TI].[AMA_PERSON];
END
GO

IF NOT EXISTS (SELECT * FROM sys.indexes WHERE object_id = OBJECT_ID(N'[TI].[AMA_PERSON]') AND name = N'I_PERSON_FK2')
BEGIN
CREATE NONCLUSTERED INDEX [I_PERSON_FK2]
ON [TI].[AMA_PERSON]
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

/****** Object: Index [TI].[I_PERSON_FK3]   Script Date: 21/06/2016 16:14:56 ******/
IF EXISTS (SELECT * FROM sys.indexes WHERE object_id = OBJECT_ID(N'[TI].[AMA_PERSON]') AND name = N'I_PERSON_FK3')
BEGIN
DROP INDEX [I_PERSON_FK3] ON [TI].[AMA_PERSON];
END
GO

IF NOT EXISTS (SELECT * FROM sys.indexes WHERE object_id = OBJECT_ID(N'[TI].[AMA_PERSON]') AND name = N'I_PERSON_FK3')
BEGIN
CREATE NONCLUSTERED INDEX [I_PERSON_FK3]
ON [TI].[AMA_PERSON]
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

/****** Object: Index [TI].[I_PERSON_FK4]   Script Date: 21/06/2016 16:14:56 ******/
IF EXISTS (SELECT * FROM sys.indexes WHERE object_id = OBJECT_ID(N'[TI].[AMA_PERSON]') AND name = N'I_PERSON_FK4')
BEGIN
DROP INDEX [I_PERSON_FK4] ON [TI].[AMA_PERSON];
END
GO

IF NOT EXISTS (SELECT * FROM sys.indexes WHERE object_id = OBJECT_ID(N'[TI].[AMA_PERSON]') AND name = N'I_PERSON_FK4')
BEGIN
CREATE NONCLUSTERED INDEX [I_PERSON_FK4]
ON [TI].[AMA_PERSON]
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

/****** Object: Index [TI].[I_PERSON_FK4BIS]   Script Date: 21/06/2016 16:14:56 ******/
IF EXISTS (SELECT * FROM sys.indexes WHERE object_id = OBJECT_ID(N'[TI].[AMA_PERSON]') AND name = N'I_PERSON_FK4BIS')
BEGIN
DROP INDEX [I_PERSON_FK4BIS] ON [TI].[AMA_PERSON];
END
GO

IF NOT EXISTS (SELECT * FROM sys.indexes WHERE object_id = OBJECT_ID(N'[TI].[AMA_PERSON]') AND name = N'I_PERSON_FK4BIS')
BEGIN
CREATE NONCLUSTERED INDEX [I_PERSON_FK4BIS]
ON [TI].[AMA_PERSON]
([Z_AREA_ID])
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

/****** Object: Index [TI].[I_PERSON_FK5]   Script Date: 21/06/2016 16:14:56 ******/
IF EXISTS (SELECT * FROM sys.indexes WHERE object_id = OBJECT_ID(N'[TI].[AMA_PERSON]') AND name = N'I_PERSON_FK5')
BEGIN
DROP INDEX [I_PERSON_FK5] ON [TI].[AMA_PERSON];
END
GO

IF NOT EXISTS (SELECT * FROM sys.indexes WHERE object_id = OBJECT_ID(N'[TI].[AMA_PERSON]') AND name = N'I_PERSON_FK5')
BEGIN
CREATE NONCLUSTERED INDEX [I_PERSON_FK5]
ON [TI].[AMA_PERSON]
([BUSINESSPART_ID])
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

/****** Object: Index [TI].[I_PERSON_FK6]   Script Date: 21/06/2016 16:14:56 ******/
IF EXISTS (SELECT * FROM sys.indexes WHERE object_id = OBJECT_ID(N'[TI].[AMA_PERSON]') AND name = N'I_PERSON_FK6')
BEGIN
DROP INDEX [I_PERSON_FK6] ON [TI].[AMA_PERSON];
END
GO

IF NOT EXISTS (SELECT * FROM sys.indexes WHERE object_id = OBJECT_ID(N'[TI].[AMA_PERSON]') AND name = N'I_PERSON_FK6')
BEGIN
CREATE NONCLUSTERED INDEX [I_PERSON_FK6]
ON [TI].[AMA_PERSON]
([SERVICEDOMAIN_ID])
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

/****** Object: Index [TI].[I_PERSON_FK7]   Script Date: 21/06/2016 16:14:56 ******/
IF EXISTS (SELECT * FROM sys.indexes WHERE object_id = OBJECT_ID(N'[TI].[AMA_PERSON]') AND name = N'I_PERSON_FK7')
BEGIN
DROP INDEX [I_PERSON_FK7] ON [TI].[AMA_PERSON];
END
GO

IF NOT EXISTS (SELECT * FROM sys.indexes WHERE object_id = OBJECT_ID(N'[TI].[AMA_PERSON]') AND name = N'I_PERSON_FK7')
BEGIN
CREATE NONCLUSTERED INDEX [I_PERSON_FK7]
ON [TI].[AMA_PERSON]
([LOCATION_ID1])
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

/****** Object: Index [TI].[I_PERSON_S3U]   Script Date: 21/06/2016 16:14:56 ******/
IF EXISTS (SELECT * FROM sys.indexes WHERE object_id = OBJECT_ID(N'[TI].[AMA_PERSON]') AND name = N'I_PERSON_S3U')
BEGIN
DROP INDEX [I_PERSON_S3U] ON [TI].[AMA_PERSON];
END
GO

IF NOT EXISTS (SELECT * FROM sys.indexes WHERE object_id = OBJECT_ID(N'[TI].[AMA_PERSON]') AND name = N'I_PERSON_S3U')
BEGIN
CREATE NONCLUSTERED INDEX [I_PERSON_S3U]
ON [TI].[AMA_PERSON]
([S3USER_ID])
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
/****** Object: Trigger [TI].[td_ama_person]   Script Date: 21/06/2016 16:14:56 ******/
IF EXISTS (SELECT * FROM sys.triggers WHERE object_id = OBJECT_ID(N'[TI].[td_ama_person]'))
BEGIN
DROP TRIGGER [TI].[td_ama_person];
END
GO

SET ANSI_NULLS ON;
GO
SET QUOTED_IDENTIFIER ON;
GO
IF NOT EXISTS (SELECT * FROM sys.triggers WHERE object_id = OBJECT_ID(N'[TI].[td_ama_person]'))
EXEC [sys].[sp_executesql] @statement = N'

/*  Delete trigger "TI.td_ama_person" for table "TI.AMA_PERSON"  */
create trigger TI.td_ama_person on TI.AMA_PERSON for delete as
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

    /*  Delete all children in "TI.AMA_PERSPERS"  */
    delete TI.AMA_PERSPERS
    from   TI.AMA_PERSPERS t2, deleted t1
    where  t2.PERSON_ID_SUBST = t1.PERSON_ID

    /*  Set parent code of "TI.AMA_PERSON" to NULL in child "TI.AMA_PLANPAYSCHED"  */
    update TI.AMA_PLANPAYSCHED
     set   PERSON_ID = NULL
    from   TI.AMA_PLANPAYSCHED t2, deleted t1
    where  t2.PERSON_ID = t1.PERSON_ID

    /*  Set parent code of "TI.AMA_PERSON" to NULL in child "TI.AMT_S3USER"  */
    update TI.AMT_S3USER
     set   PERSON_ID = NULL
    from   TI.AMT_S3USER t2, deleted t1
    where  t2.PERSON_ID = t1.PERSON_ID

    /*  Set parent code of "TI.AMA_PERSON" to NULL in child "TI.AMA_ERIGHT"  */
    update TI.AMA_ERIGHT
     set   PERSON2_ID = NULL
    from   TI.AMA_ERIGHT t2, deleted t1
    where  t2.PERSON2_ID = t1.PERSON_ID

    /*  Set parent code of "TI.AMA_PERSON" to NULL in child "TI.AMA_ERIGHT"  */
    update TI.AMA_ERIGHT
     set   PERSON3_ID = NULL
    from   TI.AMA_ERIGHT t2, deleted t1
    where  t2.PERSON3_ID = t1.PERSON_ID

    /*  Set parent code of "TI.AMA_PERSON" to NULL in child "TI.AMA_ERIGHT"  */
    update TI.AMA_ERIGHT
     set   PERSON4_ID = NULL
    from   TI.AMA_ERIGHT t2, deleted t1
    where  t2.PERSON4_ID = t1.PERSON_ID

    /*  Set parent code of "TI.AMA_PERSON" to NULL in child "TI.AMA_ERIGHT"  */
    update TI.AMA_ERIGHT
     set   PERSON5_ID = NULL
    from   TI.AMA_ERIGHT t2, deleted t1
    where  t2.PERSON5_ID = t1.PERSON_ID

    /*  Set parent code of "TI.AMA_PERSON" to NULL in child "TI.AMA_CHGDERIGHT"  */
    update TI.AMA_CHGDERIGHT
     set   PERSON_ID = NULL
    from   TI.AMA_CHGDERIGHT t2, deleted t1
    where  t2.PERSON_ID = t1.PERSON_ID

    
    raiserror (''Existence of child not important'',1,1)
    return

/*  Errors handling  */
error:
    RAISERROR(@errmsg, @severity, @state)
    rollback  transaction
end
';
GO
/****** Object: Trigger [TI].[ti_ama_person]   Script Date: 21/06/2016 16:14:56 ******/
IF EXISTS (SELECT * FROM sys.triggers WHERE object_id = OBJECT_ID(N'[TI].[ti_ama_person]'))
BEGIN
DROP TRIGGER [TI].[ti_ama_person];
END
GO

SET ANSI_NULLS ON;
GO
SET QUOTED_IDENTIFIER ON;
GO
IF NOT EXISTS (SELECT * FROM sys.triggers WHERE object_id = OBJECT_ID(N'[TI].[ti_ama_person]'))
EXEC [sys].[sp_executesql] @statement = N'

create trigger TI.ti_ama_person on TI.AMA_PERSON for insert as
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

    if update(EVALUATED_ID)
    begin
       select @numnull = (select count(*)
                          from   inserted
                          where  EVALUATED_ID is null)
       if @numnull != @numrows
          if (select count(*)
              from   TI.AMA_EVALUATED t1, inserted t2
              where  t1.EVALUATED_ID = t2.EVALUATED_ID) != @numrows - @numnull
        begin
           select @errno  = 50002, @severity = 10, @state = 1,
                  @errmsg = ltrim(str(@errno)) + '': '' + ''Parent does not exist in "TI.AMA_EVALUATED". Cannot create child in "TI.AMA_PERSON","F_PE_EVD".''
          goto error
        end
    end
    if update(S3USER_ID)
    begin
       select @numnull = (select count(*)
                          from   inserted
                          where  S3USER_ID is null)
       if @numnull != @numrows
          if (select count(*)
              from   TI.AMT_S3USER t1, inserted t2
              where  t1.S3USER_ID = t2.S3USER_ID) != @numrows - @numnull
        begin
           select @errno  = 50002, @severity = 10, @state = 1,
                  @errmsg = ltrim(str(@errno)) + '': '' + ''Parent does not exist in "TI.AMT_S3USER". Cannot create child in "TI.AMA_PERSON","F_PE_SU".''
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
/****** Object: Trigger [TI].[TR_PERS_USERID]   Script Date: 21/06/2016 16:14:56 ******/
IF EXISTS (SELECT * FROM sys.triggers WHERE object_id = OBJECT_ID(N'[TI].[TR_PERS_USERID]'))
BEGIN
DROP TRIGGER [TI].[TR_PERS_USERID];
END
GO

SET ANSI_NULLS ON;
GO
SET QUOTED_IDENTIFIER ON;
GO
IF NOT EXISTS (SELECT * FROM sys.triggers WHERE object_id = OBJECT_ID(N'[TI].[TR_PERS_USERID]'))
EXEC [sys].[sp_executesql] @statement = N'
CREATE TRIGGER TI.TR_PERS_USERID ON TI.AMA_PERSON
   FOR UPDATE
AS 
BEGIN
DECLARE
 @VUSERID VARCHAR(254),  
 @NEWS3USER_ID INT,
 @ID INT
 IF @@ROWCOUNT = 0 RETURN
 IF UPDATE(S3USER_ID)
 BEGIN
 SELECT @ID = PERSON_ID FROM INSERTED
 SELECT @NEWS3USER_ID = S3USER_ID FROM INSERTED 
    IF (@NEWS3USER_ID IS NULL or @NEWS3USER_ID = '''')
        UPDATE TI.AMA_PERSON SET TI.AMA_PERSON.PERS_USERID = NULL WHERE TI.AMA_PERSON.PERSON_ID = @ID
    ELSE
        BEGIN
        SELECT @VUSERID = USERID           
            FROM TI.AMT_S3USER
              WHERE S3USER_ID = @NEWS3USER_ID
        UPDATE TI.AMA_PERSON SET TI.AMA_PERSON.PERS_USERID = @VUSERID WHERE TI.AMA_PERSON.PERSON_ID = @ID
        END
 END     
 RETURN
END
';
GO
/****** Object: Trigger [TI].[tu_ama_person]   Script Date: 21/06/2016 16:14:56 ******/
IF EXISTS (SELECT * FROM sys.triggers WHERE object_id = OBJECT_ID(N'[TI].[tu_ama_person]'))
BEGIN
DROP TRIGGER [TI].[tu_ama_person];
END
GO

SET ANSI_NULLS ON;
GO
SET QUOTED_IDENTIFIER ON;
GO
IF NOT EXISTS (SELECT * FROM sys.triggers WHERE object_id = OBJECT_ID(N'[TI].[tu_ama_person]'))
EXEC [sys].[sp_executesql] @statement = N'

/*  Update trigger "TI.tu_ama_person" for table "TI.AMA_PERSON"  */
create trigger TI.tu_ama_person on TI.AMA_PERSON for update as
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

      /*  Parent "TI.AMA_EVALUATED" must exist when updating a child in "TI.AMA_PERSON"  */
      if update(EVALUATED_ID)
      begin
         select @numnull = (select count(*)
                            from   inserted
                            where  EVALUATED_ID is null)
         if @numnull != @numrows
            if (select count(*)
                from   TI.AMA_EVALUATED t1, inserted t2
                where  t1.EVALUATED_ID = t2.EVALUATED_ID) != @numrows - @numnull
          begin
             select @errno  = 50003, @severity = 10, @state = 1, 
                    @errmsg = ltrim(str(@errno)) + '': '' + ''Data in "TI.AMA_EVALUATED" does not exist. Cannot modify child in "TI.AMA_PERSON","F_PE_EVD".''
            goto error
          end
      end
      /*  Parent "TI.AMT_S3USER" must exist when updating a child in "TI.AMA_PERSON"  */
      if update(S3USER_ID)
      begin
         select @numnull = (select count(*)
                            from   inserted
                            where  S3USER_ID is null)
         if @numnull != @numrows
            if (select count(*)
                from   TI.AMT_S3USER t1, inserted t2
                where  t1.S3USER_ID = t2.S3USER_ID) != @numrows - @numnull
          begin
             select @errno  = 50003, @severity = 10, @state = 1, 
                    @errmsg = ltrim(str(@errno)) + '': '' + ''Data in "TI.AMT_S3USER" does not exist. Cannot modify child in "TI.AMA_PERSON","F_PE_SU".''
            goto error
          end
      end
      /*  Cannot modify parent code in "TI.AMA_PERSON" if children still exist in "TI.AMA_PLANPAYSCHED"  */
      if update(PERSON_ID)
      begin
         if exists (select 1
                    from   TI.AMA_PLANPAYSCHED t2, inserted i1, deleted d1
                    where  t2.PERSON_ID = d1.PERSON_ID
                     and  (i1.PERSON_ID != d1.PERSON_ID))
          begin
             select @errno  = 50005, @severity = 10, @state = 1, 
                    @errmsg = ltrim(str(@errno)) + '': '' + ''Children still exist in "TI.AMA_PLANPAYSCHED". Cannot modify parent code in "TI.AMA_PERSON","F_PP_PE".''
            goto error
          end
      end

      /*  Cannot modify parent code in "TI.AMA_PERSON" if children still exist in "TI.AMT_S3USER"  */
      if update(PERSON_ID)
      begin
         if exists (select 1
                    from   TI.AMT_S3USER t2, inserted i1, deleted d1
                    where  t2.PERSON_ID = d1.PERSON_ID
                     and  (i1.PERSON_ID != d1.PERSON_ID))
          begin
             select @errno  = 50005, @severity = 10, @state = 1, 
                    @errmsg = ltrim(str(@errno)) + '': '' + ''Children still exist in "TI.AMT_S3USER". Cannot modify parent code in "TI.AMA_PERSON","F_SU_PE".''
            goto error
          end
      end

      /*  Cannot modify parent code in "TI.AMA_PERSON" if children still exist in "TI.AMA_ERIGHT"  */
      if update(PERSON_ID)
      begin
         if exists (select 1
                    from   TI.AMA_ERIGHT t2, inserted i1, deleted d1
                    where  t2.PERSON2_ID = d1.PERSON_ID
                     and  (i1.PERSON_ID != d1.PERSON_ID))
          begin
             select @errno  = 50005, @severity = 10, @state = 1, 
                    @errmsg = ltrim(str(@errno)) + '': '' + ''Children still exist in "TI.AMA_ERIGHT". Cannot modify parent code in "TI.AMA_PERSON","F_ERI_P2".''
            goto error
          end
      end

      /*  Cannot modify parent code in "TI.AMA_PERSON" if children still exist in "TI.AMA_ERIGHT"  */
      if update(PERSON_ID)
      begin
         if exists (select 1
                    from   TI.AMA_ERIGHT t2, inserted i1, deleted d1
                    where  t2.PERSON3_ID = d1.PERSON_ID
                     and  (i1.PERSON_ID != d1.PERSON_ID))
          begin
             select @errno  = 50005, @severity = 10, @state = 1, 
                    @errmsg = ltrim(str(@errno)) + '': '' + ''Children still exist in "TI.AMA_ERIGHT". Cannot modify parent code in "TI.AMA_PERSON","F_ERI_P3".''
            goto error
          end
      end

      /*  Cannot modify parent code in "TI.AMA_PERSON" if children still exist in "TI.AMA_ERIGHT"  */
      if update(PERSON_ID)
      begin
         if exists (select 1
                    from   TI.AMA_ERIGHT t2, inserted i1, deleted d1
                    where  t2.PERSON4_ID = d1.PERSON_ID
                     and  (i1.PERSON_ID != d1.PERSON_ID))
          begin
             select @errno  = 50005, @severity = 10, @state = 1, 
                    @errmsg = ltrim(str(@errno)) + '': '' + ''Children still exist in "TI.AMA_ERIGHT". Cannot modify parent code in "TI.AMA_PERSON","F_ERI_P4".''
            goto error
          end
      end

      /*  Cannot modify parent code in "TI.AMA_PERSON" if children still exist in "TI.AMA_ERIGHT"  */
      if update(PERSON_ID)
      begin
         if exists (select 1
                    from   TI.AMA_ERIGHT t2, inserted i1, deleted d1
                    where  t2.PERSON5_ID = d1.PERSON_ID
                     and  (i1.PERSON_ID != d1.PERSON_ID))
          begin
             select @errno  = 50005, @severity = 10, @state = 1, 
                    @errmsg = ltrim(str(@errno)) + '': '' + ''Children still exist in "TI.AMA_ERIGHT". Cannot modify parent code in "TI.AMA_PERSON","F_ERI_P5".''
            goto error
          end
      end

      /*  Cannot modify parent code in "TI.AMA_PERSON" if children still exist in "TI.AMA_CHGDERIGHT"  */
      if update(PERSON_ID)
      begin
         if exists (select 1
                    from   TI.AMA_CHGDERIGHT t2, inserted i1, deleted d1
                    where  t2.PERSON_ID = d1.PERSON_ID
                     and  (i1.PERSON_ID != d1.PERSON_ID))
          begin
             select @errno  = 50005, @severity = 10, @state = 1, 
                    @errmsg = ltrim(str(@errno)) + '': '' + ''Children still exist in "TI.AMA_CHGDERIGHT". Cannot modify parent code in "TI.AMA_PERSON","F_CER_PE".''
            goto error
          end
      end

      /*  Cannot modify parent code in "TI.AMA_PERSON" if children still exist in "TI.AMA_PERSPERS"  */
      if update(PERSON_ID)
      begin
         if exists (select 1
                    from   TI.AMA_PERSPERS t2, inserted i1, deleted d1
                    where  t2.PERSON_ID_SUBST = d1.PERSON_ID
                     and  (i1.PERSON_ID != d1.PERSON_ID))
          begin
             select @errno  = 50005, @severity = 10, @state = 1, 
                    @errmsg = ltrim(str(@errno)) + '': '' + ''Children still exist in "TI.AMA_PERSPERS". Cannot modify parent code in "TI.AMA_PERSON","F_PEP_PS".''
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
