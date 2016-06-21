/****** Object: Table [TI].[XAMA_EXTERNALCORPORATION]   Script Date: 21/06/2016 16:12:22 ******/
USE [TIDB];
GO
IF EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[TI].[XAMA_EXTERNALCORPORATION]') AND type in (N'U'))
BEGIN
DROP TABLE [TIDB].[TI].[XAMA_EXTERNALCORPORATION];
END
GO

SET ANSI_NULLS ON;
GO
SET QUOTED_IDENTIFIER ON;
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[TI].[XAMA_EXTERNALCORPORATION]') AND type in (N'U'))
BEGIN
CREATE TABLE [TI].[XAMA_EXTERNALCORPORATION] (
[EXTERNALCORPORATION_ID] int NOT NULL,
[CORPORATION] varchar(254) COLLATE Latin1_General_CI_AS NULL,
[DESCRIPTION] varchar(254) COLLATE Latin1_General_CI_AS NULL,
[VALID] char(1) COLLATE Latin1_General_CI_AS NULL,
[CLIENT] char(6) COLLATE Latin1_General_CI_AS NULL,
[DATCRE] datetime NULL,
[DATCHG] datetime NULL,
[USERCRE] varchar(254) COLLATE Latin1_General_CI_AS NULL,
[USERCHG] varchar(254) COLLATE Latin1_General_CI_AS NULL,
[HLQ1] int NULL,
[HLQ2] int NULL,
[PERSON_ID] int NULL,
CONSTRAINT [PK_TI_XAMA_EXTERNALCORPORATION_1]
PRIMARY KEY CLUSTERED ([EXTERNALCORPORATION_ID] ASC)
WITH ( PAD_INDEX = OFF,
FILLFACTOR = 100,
IGNORE_DUP_KEY = OFF,
STATISTICS_NORECOMPUTE = OFF,
ALLOW_ROW_LOCKS = ON,
ALLOW_PAGE_LOCKS = ON,
DATA_COMPRESSION = NONE )
 ON [PRIMARY],
CONSTRAINT [CK__XAMA_EXTE__VALID__3B384243]
CHECK ( ([VALID] IS NULL OR ([VALID]='N' OR [VALID]='Y')) 
),
CONSTRAINT [CC]
FOREIGN KEY ([CLIENT])
REFERENCES [TI].[AMT_CLIENT] ( [CLIENT] )
)
ON [PRIMARY];
END;
GO