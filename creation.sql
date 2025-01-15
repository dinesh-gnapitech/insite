-------------------------------------------------------------------------------------------------------------------
USE [DMK]
GO

/****** Object:  Table [dbo].[TRANSMISSION_LINE]    Script Date: 1/15/2025 2:50:40 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[TRANSMISSION_LINE](
	[GDB_ARCHIVE_OID] [int] NOT NULL,
	[Shape] [geometry] NULL,
	[TL_GUID] [uniqueidentifier] NULL,
	[LINE_ID] [nvarchar](255) NULL,
	[LINE_NAME] [nvarchar](255) NULL,
	[NUM_CIRCUITS] [int] NULL,
	[LINE_NAME_ALT] [nvarchar](255) NULL,
	[LINE_MILEAGE] [numeric](38, 8) NULL,
	[OPERATING_VOLTAGE] [int] NULL,
	[DESIGN_VOLTAGE] [int] NULL,
	[STATUS] [nvarchar](255) NULL,
	[LINE_TYPE] [nvarchar](255) NULL,
	[IN_SERVICE] [datetime2](7) NULL,
	[RETIRED] [datetime2](7) NULL,
	[TL_MAINT] [nvarchar](255) NULL,
	[ACCURACY] [nvarchar](255) NULL,
	[ACCURACY_SOURCE] [nvarchar](255) NULL,
	[REFERENCE] [nvarchar](255) NULL,
	[OWNER] [nvarchar](255) NULL,
	[COUNTY] [nvarchar](255) NULL,
	[REGION] [nvarchar](255) NULL,
	[LABEL] [nvarchar](255) NULL,
	[COMMENTS] [nvarchar](255) NULL,
	[PROGRESS_STATUS] [nvarchar](50) NULL,
	[TEXT1] [nvarchar](255) NULL,
	[TEXT2] [nvarchar](255) NULL,
	[TEXT3] [nvarchar](255) NULL,
	[TEXT4] [nvarchar](255) NULL,
	[TEXT5] [nvarchar](255) NULL,
	[NUMBER1] [numeric](38, 8) NULL,
	[NUMBER2] [numeric](38, 8) NULL,
	[NUMBER3] [numeric](38, 8) NULL,
	[DATE1] [datetime2](7) NULL,
	[DATE2] [datetime2](7) NULL,
	[GlobalID] [uniqueidentifier] NOT NULL,
	[LOAD_ID] [nvarchar](50) NULL,
	[GDB_FROM_DATE] [datetime2](7) NOT NULL,
	[GDB_TO_DATE] [datetime2](7) NOT NULL,
	[OBJECTID] [int] NOT NULL,
	[CR_RuleID] [int] NULL,
	[CR_Override] [varbinary](max) NULL,
	[CR_OFFSET1] [numeric](38, 8) NULL,
 CONSTRAINT [R21_pk] PRIMARY KEY CLUSTERED 
(
	[GDB_ARCHIVE_OID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, FILLFACTOR = 80) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO

ALTER TABLE [dbo].[TRANSMISSION_LINE] ADD  DEFAULT ('{00000000-0000-0000-0000-000000000000}') FOR [GlobalID]
GO

ALTER TABLE [dbo].[TRANSMISSION_LINE] ADD  CONSTRAINT [GDB_FROM_DATE21_def]  DEFAULT (getutcdate()) FOR [GDB_FROM_DATE]
GO

ALTER TABLE [dbo].[TRANSMISSION_LINE] ADD  CONSTRAINT [GDB_TO_DATE21_def]  DEFAULT (CONVERT([datetime2],'9999-12-31 23:59:59.000000')) FOR [GDB_TO_DATE]
GO

ALTER TABLE [dbo].[TRANSMISSION_LINE]  WITH CHECK ADD  CONSTRAINT [g16_ck] CHECK  (([SHAPE].[STSrid]=(3857)))
GO

ALTER TABLE [dbo].[TRANSMISSION_LINE] CHECK CONSTRAINT [g16_ck]
GO

-------------------------------------------------------------------------------------------------------------------------------------------------------
USE [DMK]
GO

/****** Object:  Table [dbo].[SPAN_CONDUCTOR]    Script Date: 1/15/2025 2:51:41 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[SPAN_CONDUCTOR](
	[GDB_ARCHIVE_OID] [int] NOT NULL,
	[SPAN_GUID] [uniqueidentifier] NULL,
	[SPAN_ID] [nvarchar](255) NULL,
	[COND_MAT] [nvarchar](255) NULL,
	[COND_CONFIG] [nvarchar](255) NULL,
	[COND_SIZE] [nvarchar](255) NULL,
	[COND_INS] [nvarchar](255) NULL,
	[BUNDLE_QTY] [nvarchar](255) NULL,
	[INS_TYPE] [nvarchar](255) NULL,
	[INS_VOLTAGE] [nvarchar](255) NULL,
	[GlobalID] [uniqueidentifier] NOT NULL,
	[GDB_FROM_DATE] [datetime2](7) NOT NULL,
	[GDB_TO_DATE] [datetime2](7) NOT NULL,
	[OBJECTID] [int] NOT NULL,
	[SW1_MAT] [nvarchar](255) NULL,
	[SW1_SIZE] [nvarchar](255) NULL,
	[SW1_STRAND] [nvarchar](255) NULL,
	[SW2_MAT] [nvarchar](255) NULL,
	[SW2_SIZE] [nvarchar](255) NULL,
	[SW2_STRAND] [nvarchar](255) NULL
) ON [PRIMARY]
GO

ALTER TABLE [dbo].[SPAN_CONDUCTOR] ADD  DEFAULT ('{00000000-0000-0000-0000-000000000000}') FOR [GlobalID]
GO

ALTER TABLE [dbo].[SPAN_CONDUCTOR] ADD  CONSTRAINT [GDB_FROM_DATE67_def]  DEFAULT (getutcdate()) FOR [GDB_FROM_DATE]
GO

ALTER TABLE [dbo].[SPAN_CONDUCTOR] ADD  CONSTRAINT [GDB_TO_DATE67_def]  DEFAULT (CONVERT([datetime2],'9999-12-31 23:59:59.000000')) FOR [GDB_TO_DATE]
GO

------------------------------------------------------------------------------------------------------------------------------------------
USE [DMK]
GO

/****** Object:  Table [dbo].[STRUCTURE]    Script Date: 1/15/2025 2:52:30 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[STRUCTURE](
	[GDB_ARCHIVE_OID] [int] NOT NULL,
	[Shape] [geometry] NULL,
	[STR_NUM] [nvarchar](255) NULL,
	[LINEID_1] [nvarchar](255) NULL,
	[LINE_NAME1] [nvarchar](255) NULL,
	[NUM_CIRCUITS] [nvarchar](255) NULL,
	[STR_MAT] [nvarchar](255) NULL,
	[STR_TYPE] [nvarchar](255) NULL,
	[HEIGHT] [nvarchar](255) NULL,
	[LINE_ANGLE] [numeric](38, 8) NULL,
	[ELEVATION] [numeric](38, 8) NULL,
	[LATITUDE] [numeric](38, 8) NULL,
	[LONGITUDE] [numeric](38, 8) NULL,
	[STATUS] [nvarchar](255) NULL,
	[COMMENTS] [nvarchar](255) NULL,
	[STR_ID] [uniqueidentifier] NULL,
	[OWNER] [nvarchar](255) NULL,
	[COUNTY] [nvarchar](255) NULL,
	[REGION] [nvarchar](255) NULL,
	[UND_BUILT] [nvarchar](255) NULL,
	[PPNO] [nvarchar](255) NULL,
	[INSTALL_DATE] [datetime2](7) NULL,
	[INSERVICE] [datetime2](7) NULL,
	[RETIRED] [datetime2](7) NULL,
	[ACCURACY] [nvarchar](255) NULL,
	[ACCURACY_SOURCE] [nvarchar](255) NULL,
	[PROGRESS_STATUS] [nvarchar](50) NULL,
	[PRIORITY] [nvarchar](50) NULL,
	[ORD] [smallint] NULL,
	[POLE_COUNT] [smallint] NULL,
	[SWITCH_PRESENT] [nvarchar](10) NULL,
	[INSP_STATUS] [nvarchar](50) NULL,
	[INSP_MAINTENANCE] [nvarchar](50) NULL,
	[LAST_INSPECT_DATE] [datetime2](7) NULL,
	[STR_GEOTAG] [nvarchar](255) NULL,
	[INS_MAT] [nvarchar](255) NULL,
	[ARRESTORS] [nvarchar](255) NULL,
	[NUM_ARREST] [int] NULL,
	[NUM_SHIELD_WIRES] [smallint] NULL,
	[GUYS] [nvarchar](255) NULL,
	[TEMP_STR_ID] [nvarchar](255) NULL,
	[ADDED_IN_FIELD] [nvarchar](10) NULL,
	[ADDED_BY] [nvarchar](255) NULL,
	[PMD] [nvarchar](255) NULL,
	[VOLTAGE] [smallint] NULL,
	[DIVISION] [nvarchar](255) NULL,
	[CITY] [nvarchar](255) NULL,
	[IS_VELB] [nvarchar](10) NULL,
	[IS_SRA] [nvarchar](10) NULL,
	[IS_HCP] [nvarchar](10) NULL,
	[HCP_AREA_NAME] [nvarchar](255) NULL,
	[TEXT1] [nvarchar](255) NULL,
	[TEXT2] [nvarchar](255) NULL,
	[TEXT3] [nvarchar](255) NULL,
	[TEXT4] [nvarchar](255) NULL,
	[TEXT5] [nvarchar](255) NULL,
	[NUMBER1] [numeric](38, 8) NULL,
	[NUMBER2] [numeric](38, 8) NULL,
	[NUMBER3] [numeric](38, 8) NULL,
	[DATE1] [datetime2](7) NULL,
	[DATE2] [datetime2](7) NULL,
	[GlobalID] [uniqueidentifier] NOT NULL,
	[XML_EXPORT] [nvarchar](50) NULL,
	[PENDING_MAINTENANCE] [nvarchar](250) NULL,
	[FRAME_SET] [nvarchar](250) NULL,
	[STEEL_FINISH] [nvarchar](50) NULL,
	[MATERIAL] [nvarchar](50) NULL,
	[UNITS] [int] NULL,
	[GDB_FROM_DATE] [datetime2](7) NOT NULL,
	[GDB_TO_DATE] [datetime2](7) NOT NULL,
	[OBJECTID] [int] NOT NULL,
	[LOCATION_GUID] [uniqueidentifier] NULL,
	[ARM_TYPE] [nvarchar](50) NULL,
	[GRADE] [nvarchar](10) NULL,
 CONSTRAINT [R19_pk] PRIMARY KEY CLUSTERED 
(
	[GDB_ARCHIVE_OID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, FILLFACTOR = 80) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO

ALTER TABLE [dbo].[STRUCTURE] ADD  DEFAULT ('{00000000-0000-0000-0000-000000000000}') FOR [GlobalID]
GO

ALTER TABLE [dbo].[STRUCTURE] ADD  CONSTRAINT [GDB_FROM_DATE19_def]  DEFAULT (getutcdate()) FOR [GDB_FROM_DATE]
GO

ALTER TABLE [dbo].[STRUCTURE] ADD  CONSTRAINT [GDB_TO_DATE19_def]  DEFAULT (CONVERT([datetime2],'9999-12-31 23:59:59.000000')) FOR [GDB_TO_DATE]
GO

ALTER TABLE [dbo].[STRUCTURE]  WITH CHECK ADD  CONSTRAINT [g14_ck] CHECK  (([SHAPE].[STSrid]=(3857)))
GO

ALTER TABLE [dbo].[STRUCTURE] CHECK CONSTRAINT [g14_ck]
GO

------------------------------------------------------------------------------------------------------------------------------------------
USE [DMK]
GO

/****** Object:  Table [dbo].[POLE]    Script Date: 1/15/2025 2:53:36 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[POLE](
	[GDB_ARCHIVE_OID] [int] NOT NULL,
	[Shape] [geometry] NULL,
	[POLE_GUID] [uniqueidentifier] NULL,
	[STR_GUID] [uniqueidentifier] NULL,
	[POLE_NUM] [nvarchar](255) NULL,
	[LINE_REF_ID] [nvarchar](255) NULL,
	[STATION_ID] [nvarchar](255) NULL,
	[LATITUDE] [numeric](38, 8) NULL,
	[LONGITUDE] [numeric](38, 8) NULL,
	[ELEVATION] [numeric](38, 8) NULL,
	[STATUS] [nvarchar](255) NULL,
	[LINEANGLE] [numeric](38, 8) NULL,
	[POLE_TYPE] [nvarchar](255) NULL,
	[POLE_SUB_TYPE] [nvarchar](255) NULL,
	[POLE_MATERIAL] [nvarchar](255) NULL,
	[HEIGHT] [numeric](38, 8) NULL,
	[FOUNDATION] [nvarchar](255) NULL,
	[DIRECTION] [nvarchar](255) NULL,
	[AHEAD_SPAN_LENGTH] [numeric](38, 8) NULL,
	[TREATMENT] [nvarchar](255) NULL,
	[GROUND_LINE_INSPECTION] [datetime2](7) NULL,
	[LAST_INSPECTION_YEAR] [nvarchar](255) NULL,
	[REINFORCED_POLES] [nvarchar](255) NULL,
	[OFFSETADJUST] [numeric](38, 8) NULL,
	[PI] [nvarchar](255) NULL,
	[POLE_COUNT] [int] NULL,
	[SOURCE] [nvarchar](255) NULL,
	[SOURCE_ACCURACY] [nvarchar](255) NULL,
	[REFERENCE] [nvarchar](255) NULL,
	[ERROR_COMMENT] [nvarchar](255) NULL,
	[PARENT_POLE_ID] [uniqueidentifier] NULL,
	[TEXT1] [nvarchar](255) NULL,
	[TEXT2] [nvarchar](255) NULL,
	[TEXT3] [nvarchar](255) NULL,
	[TEXT4] [nvarchar](255) NULL,
	[TEXT5] [nvarchar](255) NULL,
	[NUMBER1] [numeric](38, 8) NULL,
	[NUMBER2] [numeric](38, 8) NULL,
	[NUMBER3] [numeric](38, 8) NULL,
	[DATE1] [datetime2](7) NULL,
	[DATE2] [datetime2](7) NULL,
	[GlobalID] [uniqueidentifier] NOT NULL,
	[GDB_FROM_DATE] [datetime2](7) NOT NULL,
	[GDB_TO_DATE] [datetime2](7) NOT NULL,
	[OBJECTID] [int] NOT NULL,
	[VINTAGEYEAR] [nvarchar](255) NULL,
	[PERCENT_STEEL_LOSS] [smallint] NULL,
	[SUBSTR_TYPE] [nvarchar](50) NULL,
	[GRADE] [nvarchar](10) NULL,
 CONSTRAINT [R27_pk] PRIMARY KEY CLUSTERED 
(
	[GDB_ARCHIVE_OID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, FILLFACTOR = 80) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO

ALTER TABLE [dbo].[POLE] ADD  DEFAULT ('{00000000-0000-0000-0000-000000000000}') FOR [GlobalID]
GO

ALTER TABLE [dbo].[POLE] ADD  CONSTRAINT [GDB_FROM_DATE27_def]  DEFAULT (getutcdate()) FOR [GDB_FROM_DATE]
GO

ALTER TABLE [dbo].[POLE] ADD  CONSTRAINT [GDB_TO_DATE27_def]  DEFAULT (CONVERT([datetime2],'9999-12-31 23:59:59.000000')) FOR [GDB_TO_DATE]
GO

ALTER TABLE [dbo].[POLE]  WITH CHECK ADD  CONSTRAINT [g22_ck] CHECK  (([SHAPE].[STSrid]=(3857)))
GO

ALTER TABLE [dbo].[POLE] CHECK CONSTRAINT [g22_ck]
GO

------------------------------------------------------------------------------------------------------------------------------------------
USE [DMK]
GO

/****** Object:  Table [dbo].[SUPPORTSTRUCTURE]    Script Date: 1/15/2025 2:54:21 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[SUPPORTSTRUCTURE](
	[GDB_ARCHIVE_OID] [int] NOT NULL,
	[STR_ID] [uniqueidentifier] NULL,
	[STR_SUBTYPE] [nvarchar](255) NULL,
	[STEEL_FINISH] [nvarchar](255) NULL,
	[DEADEND_TYPE] [nvarchar](255) NULL,
	[STR_ARM] [nvarchar](255) NULL,
	[HFRAME_VEE] [nvarchar](255) NULL,
	[HFRAME_KNEE] [nvarchar](255) NULL,
	[X_BRACE] [nvarchar](255) NULL,
	[INS_MANF] [nvarchar](255) NULL,
	[MANF_DATE] [datetime2](7) NULL,
	[STR_SHL] [nvarchar](255) NULL,
	[STR_SHL2] [nvarchar](255) NULL,
	[SPLICE] [nvarchar](255) NULL,
	[STR_GRN_L] [nvarchar](255) NULL,
	[STR_GRN_D] [nvarchar](255) NULL,
	[STR_GNDOH] [numeric](38, 8) NULL,
	[MARK_BALL] [nvarchar](255) NULL,
	[BIRD_GUARDS] [nvarchar](255) NULL,
	[BIRD_DETERRENT] [nvarchar](255) NULL,
	[BIRD_DIVERTER] [nvarchar](255) NULL,
	[ANTIGALLOP] [nvarchar](255) NULL,
	[DANGER_SIGN] [nvarchar](255) NULL,
	[CLIMBING_GUARD] [nvarchar](255) NULL,
	[CORONA_RING] [nvarchar](255) NULL,
	[POT_HEAD] [nvarchar](255) NULL,
	[ANCHORS_NUMBER] [smallint] NULL,
	[DWNGUY_NUMBER] [smallint] NULL,
	[INS_NUMBER] [smallint] NULL,
	[INS_TYPE] [nvarchar](255) NULL,
	[STUB_NUMBER] [smallint] NULL,
	[NUM_ARMS] [smallint] NULL,
	[NUM_SWITCH] [smallint] NULL,
	[TEXT1] [nvarchar](255) NULL,
	[TEXT2] [nvarchar](255) NULL,
	[TEXT3] [nvarchar](255) NULL,
	[TEXT4] [nvarchar](255) NULL,
	[TEXT5] [nvarchar](255) NULL,
	[NUMBER1] [numeric](38, 8) NULL,
	[NUMBER2] [numeric](38, 8) NULL,
	[NUMBER3] [numeric](38, 8) NULL,
	[DATE1] [datetime2](7) NULL,
	[DATE2] [datetime2](7) NULL,
	[GlobalID] [uniqueidentifier] NOT NULL,
	[GDB_FROM_DATE] [datetime2](7) NOT NULL,
	[GDB_TO_DATE] [datetime2](7) NOT NULL,
	[OBJECTID] [int] NOT NULL
) ON [PRIMARY]
GO

ALTER TABLE [dbo].[SUPPORTSTRUCTURE] ADD  DEFAULT ('{00000000-0000-0000-0000-000000000000}') FOR [GlobalID]
GO

ALTER TABLE [dbo].[SUPPORTSTRUCTURE] ADD  CONSTRAINT [GDB_FROM_DATE60_def]  DEFAULT (getutcdate()) FOR [GDB_FROM_DATE]
GO

ALTER TABLE [dbo].[SUPPORTSTRUCTURE] ADD  CONSTRAINT [GDB_TO_DATE60_def]  DEFAULT (CONVERT([datetime2],'9999-12-31 23:59:59.000000')) FOR [GDB_TO_DATE]
GO

------------------------------------------------------------------------------------------------------------------------------------------
USE [DMK]
GO

/****** Object:  Table [dbo].[ARM]    Script Date: 1/15/2025 3:01:15 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[ARM](
	[GDB_ARCHIVE_OID] [int] NOT NULL,
	[ARM_ID] [uniqueidentifier] NOT NULL,
	[STR_ID] [uniqueidentifier] NOT NULL,
	[ARM_TYPE] [nvarchar](50) NOT NULL,
	[GDB_FROM_DATE] [datetime2](7) NOT NULL,
	[GDB_TO_DATE] [datetime2](7) NOT NULL,
	[OBJECTID] [int] NOT NULL,
	[GlobalID] [uniqueidentifier] NOT NULL
) ON [PRIMARY]
GO

ALTER TABLE [dbo].[ARM] ADD  DEFAULT ('{00000000-0000-0000-0000-000000000000}') FOR [ARM_ID]
GO

ALTER TABLE [dbo].[ARM] ADD  DEFAULT ('{00000000-0000-0000-0000-000000000000}') FOR [STR_ID]
GO

ALTER TABLE [dbo].[ARM] ADD  CONSTRAINT [GDB_FROM_DATE87_def]  DEFAULT (getutcdate()) FOR [GDB_FROM_DATE]
GO

ALTER TABLE [dbo].[ARM] ADD  CONSTRAINT [GDB_TO_DATE87_def]  DEFAULT (CONVERT([datetime2],'9999-12-31 23:59:59.000000')) FOR [GDB_TO_DATE]
GO

ALTER TABLE [dbo].[ARM] ADD  DEFAULT ('{00000000-0000-0000-0000-000000000000}') FOR [GlobalID]
GO
------------------------------------------------------------------------------------------------------------------------------------------
USE [DMK]
GO

/****** Object:  Table [dbo].[STRFOUNDATION]    Script Date: 1/15/2025 3:02:46 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[STRFOUNDATION](
	[GDB_ARCHIVE_OID] [int] NOT NULL,
	[STR_ID] [uniqueidentifier] NULL,
	[FND_TYPE] [nvarchar](255) NULL,
	[FND_ELEV] [numeric](38, 8) NULL,
	[FND_REVEAL] [numeric](38, 8) NULL,
	[DEPTH_ROCK] [nvarchar](255) NULL,
	[GlobalID] [uniqueidentifier] NOT NULL,
	[GDB_FROM_DATE] [datetime2](7) NOT NULL,
	[GDB_TO_DATE] [datetime2](7) NOT NULL,
	[OBJECTID] [int] NOT NULL
) ON [PRIMARY]
GO

ALTER TABLE [dbo].[STRFOUNDATION] ADD  DEFAULT ('{00000000-0000-0000-0000-000000000000}') FOR [GlobalID]
GO

ALTER TABLE [dbo].[STRFOUNDATION] ADD  CONSTRAINT [GDB_FROM_DATE56_def]  DEFAULT (getutcdate()) FOR [GDB_FROM_DATE]
GO

ALTER TABLE [dbo].[STRFOUNDATION] ADD  CONSTRAINT [GDB_TO_DATE56_def]  DEFAULT (CONVERT([datetime2],'9999-12-31 23:59:59.000000')) FOR [GDB_TO_DATE]
GO
------------------------------------------------------------------------------------------------------------------------------------------
USE [DMK]
GO

/****** Object:  Table [dbo].[SWITCH]    Script Date: 1/15/2025 3:03:21 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[SWITCH](
	[GDB_ARCHIVE_OID] [int] NOT NULL,
	[Shape] [geometry] NULL,
	[SWITCH_GUID] [uniqueidentifier] NULL,
	[SWITCH_ID] [nvarchar](255) NULL,
	[SWITCH_ID_ALT] [nvarchar](255) NULL,
	[STRUCTURE_GUID] [uniqueidentifier] NULL,
	[NORMALLY_OPEN] [nvarchar](255) NULL,
	[OWNER] [nvarchar](255) NULL,
	[COUNTY] [nvarchar](255) NULL,
	[REGION] [nvarchar](255) NULL,
	[SWITCH_TYPE] [nvarchar](255) NULL,
	[IN_SERVICE] [datetime2](7) NULL,
	[OUT_SERVICE] [datetime2](7) NULL,
	[OPERATING_VOLTAGE] [int] NULL,
	[DESIGN_VOLTAGE] [int] NULL,
	[FROM_ROAD] [nvarchar](255) NULL,
	[LATITUDE] [numeric](38, 8) NULL,
	[LONGITUDE] [numeric](38, 8) NULL,
	[ELEVATION] [numeric](38, 8) NULL,
	[TL_MAINT] [nvarchar](255) NULL,
	[RATING] [nvarchar](255) NULL,
	[RCMOS_CTRL] [nvarchar](255) NULL,
	[SCADA_TYPE] [nvarchar](255) NULL,
	[BIL] [numeric](38, 8) NULL,
	[CONTINUOUS_AMP] [numeric](38, 8) NULL,
	[SWITCH_GANG_INDICATOR] [nvarchar](255) NULL,
	[SWITCH_MOD_TYPE] [nvarchar](255) NULL,
	[SWITCH_MOTOR_OP] [nvarchar](255) NULL,
	[ACCURACY] [nvarchar](255) NULL,
	[ACCURACY_SOURCE] [nvarchar](255) NULL,
	[REFERENCE] [nvarchar](255) NULL,
	[TEXT1] [nvarchar](255) NULL,
	[TEXT2] [nvarchar](255) NULL,
	[TEXT3] [nvarchar](255) NULL,
	[NUMBER1] [numeric](38, 8) NULL,
	[NUMBER2] [numeric](38, 8) NULL,
	[DATE1] [datetime2](7) NULL,
	[GlobalID] [uniqueidentifier] NOT NULL,
	[PROGRESS_STATUS] [nvarchar](50) NULL,
	[DATE2] [datetime2](7) NULL,
	[INTERRUPTERS] [nvarchar](50) NULL,
	[LAST_INSPECT_DATE] [datetime2](7) NULL,
	[MANUFACTURER] [nvarchar](50) NULL,
	[CATALOG_NUMBER] [nvarchar](50) NULL,
	[SERIAL_NUMBER] [nvarchar](50) NULL,
	[DOUBLE_LOCKED] [nvarchar](50) NULL,
	[SWITCH_NUM] [nvarchar](50) NULL,
	[PRIORITY] [nvarchar](50) NULL,
	[INSP_STATUS] [nvarchar](50) NULL,
	[LINE_ID] [nvarchar](255) NULL,
	[GDB_FROM_DATE] [datetime2](7) NOT NULL,
	[GDB_TO_DATE] [datetime2](7) NOT NULL,
	[OBJECTID] [int] NOT NULL,
	[CR_RuleID] [int] NULL,
	[CR_Override] [varbinary](max) NULL,
	[CR_UnA_RuleID] [int] NULL,
	[CR_UnA_Override] [varbinary](max) NULL,
	[CR_A_RuleID] [int] NULL,
	[CR_A_Override] [varbinary](max) NULL,
	[CR_Sav_RuleID] [int] NULL,
	[CR_Sav_Override] [varbinary](max) NULL,
	[CR_Sub_RuleID] [int] NULL,
	[CR_Sub_Override] [varbinary](max) NULL,
	[CR_X_OFFSET1] [numeric](38, 8) NULL,
	[CR_Y_OFFSET1] [numeric](38, 8) NULL,
	[MFG_SWITCH_TYPE] [nvarchar](50) NULL,
	[LOCATION_GUID] [uniqueidentifier] NULL,
	[COMMENTS] [nvarchar](1024) NULL,
 CONSTRAINT [R24_pk] PRIMARY KEY CLUSTERED 
(
	[GDB_ARCHIVE_OID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, FILLFACTOR = 80) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO

ALTER TABLE [dbo].[SWITCH] ADD  DEFAULT ('{00000000-0000-0000-0000-000000000000}') FOR [GlobalID]
GO

ALTER TABLE [dbo].[SWITCH] ADD  CONSTRAINT [GDB_FROM_DATE24_def]  DEFAULT (getutcdate()) FOR [GDB_FROM_DATE]
GO

ALTER TABLE [dbo].[SWITCH] ADD  CONSTRAINT [GDB_TO_DATE24_def]  DEFAULT (CONVERT([datetime2],'9999-12-31 23:59:59.000000')) FOR [GDB_TO_DATE]
GO

ALTER TABLE [dbo].[SWITCH]  WITH CHECK ADD  CONSTRAINT [g19_ck] CHECK  (([SHAPE].[STSrid]=(3857)))
GO

ALTER TABLE [dbo].[SWITCH] CHECK CONSTRAINT [g19_ck]
GO
------------------------------------------------------------------------------------------------------------------------------------------
USE [DMK]
GO

/****** Object:  Table [dbo].[MOTOR]    Script Date: 1/15/2025 3:04:12 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[MOTOR](
	[GDB_ARCHIVE_OID] [int] NOT NULL,
	[MOTOR_ID] [uniqueidentifier] NOT NULL,
	[SWITCH_ID] [uniqueidentifier] NOT NULL,
	[MOTOR_TYPE] [nvarchar](50) NULL,
	[CATALOG_NUMBER] [nvarchar](50) NULL,
	[MANUFACTURER] [nvarchar](50) NULL,
	[SERIAL_NUMBER] [nvarchar](50) NULL,
	[MFG_DATE] [datetime2](7) NULL,
	[ROTATION] [nvarchar](50) NULL,
	[INSTALL_DATE] [datetime2](7) NULL,
	[REMOVAL_DATE] [datetime2](7) NULL,
	[MOTOR_NUM] [nvarchar](50) NULL,
	[GDB_FROM_DATE] [datetime2](7) NOT NULL,
	[GDB_TO_DATE] [datetime2](7) NOT NULL,
	[OBJECTID] [int] NOT NULL,
	[VOLTAGE] [nvarchar](255) NULL,
	[BATTERY_DATE] [datetime2](7) NULL,
	[GlobalID] [uniqueidentifier] NOT NULL
) ON [PRIMARY]
GO

ALTER TABLE [dbo].[MOTOR] ADD  DEFAULT ('{00000000-0000-0000-0000-000000000000}') FOR [MOTOR_ID]
GO

ALTER TABLE [dbo].[MOTOR] ADD  DEFAULT ('{00000000-0000-0000-0000-000000000000}') FOR [SWITCH_ID]
GO

ALTER TABLE [dbo].[MOTOR] ADD  CONSTRAINT [GDB_FROM_DATE73_def]  DEFAULT (getutcdate()) FOR [GDB_FROM_DATE]
GO

ALTER TABLE [dbo].[MOTOR] ADD  CONSTRAINT [GDB_TO_DATE73_def]  DEFAULT (CONVERT([datetime2],'9999-12-31 23:59:59.000000')) FOR [GDB_TO_DATE]
GO

ALTER TABLE [dbo].[MOTOR] ADD  DEFAULT ('{00000000-0000-0000-0000-000000000000}') FOR [GlobalID]
GO
------------------------------------------------------------------------------------------------------------------------------------------
USE [DMK]
GO

/****** Object:  Table [dbo].[INTERRUPTER]    Script Date: 1/15/2025 3:05:10 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[INTERRUPTER](
	[GDB_ARCHIVE_OID] [int] NOT NULL,
	[INTERRUPTER_ID] [uniqueidentifier] NOT NULL,
	[INTERRUPTER_NUM] [nvarchar](50) NULL,
	[RATING] [nvarchar](50) NULL,
	[CATALOG_NUMBER] [nvarchar](50) NULL,
	[SERIAL_NUMBER] [nvarchar](50) NULL,
	[INSTALL_DATE] [datetime2](7) NULL,
	[MANUFACTURER] [nvarchar](50) NULL,
	[REMOVAL_DATE] [datetime2](7) NULL,
	[GDB_FROM_DATE] [datetime2](7) NOT NULL,
	[GDB_TO_DATE] [datetime2](7) NOT NULL,
	[OBJECTID] [int] NOT NULL,
	[GlobalID] [uniqueidentifier] NOT NULL
) ON [PRIMARY]
GO

ALTER TABLE [dbo].[INTERRUPTER] ADD  DEFAULT ('{00000000-0000-0000-0000-000000000000}') FOR [INTERRUPTER_ID]
GO

ALTER TABLE [dbo].[INTERRUPTER] ADD  CONSTRAINT [GDB_FROM_DATE74_def]  DEFAULT (getutcdate()) FOR [GDB_FROM_DATE]
GO

ALTER TABLE [dbo].[INTERRUPTER] ADD  CONSTRAINT [GDB_TO_DATE74_def]  DEFAULT (CONVERT([datetime2],'9999-12-31 23:59:59.000000')) FOR [GDB_TO_DATE]
GO

ALTER TABLE [dbo].[INTERRUPTER] ADD  DEFAULT ('{00000000-0000-0000-0000-000000000000}') FOR [GlobalID]
GO
------------------------------------------------------------------------------------------------------------------------------------------
USE [DMK]
GO

/****** Object:  Table [dbo].[SUBSWITCH]    Script Date: 1/15/2025 3:05:50 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[SUBSWITCH](
	[GDB_ARCHIVE_OID] [int] NOT NULL,
	[SWITCH_ID] [uniqueidentifier] NOT NULL,
	[INTERRUPTER_ID] [uniqueidentifier] NOT NULL,
	[SUBSWITCH_LOC] [nvarchar](50) NOT NULL,
	[GDB_FROM_DATE] [datetime2](7) NOT NULL,
	[GDB_TO_DATE] [datetime2](7) NOT NULL,
	[OBJECTID] [int] NOT NULL,
	[GlobalID] [uniqueidentifier] NOT NULL,
	[SUBSWITCH_GUID] [uniqueidentifier] NULL
) ON [PRIMARY]
GO

ALTER TABLE [dbo].[SUBSWITCH] ADD  DEFAULT ('{00000000-0000-0000-0000-000000000000}') FOR [SWITCH_ID]
GO

ALTER TABLE [dbo].[SUBSWITCH] ADD  DEFAULT ('{00000000-0000-0000-0000-000000000000}') FOR [INTERRUPTER_ID]
GO

ALTER TABLE [dbo].[SUBSWITCH] ADD  CONSTRAINT [GDB_FROM_DATE75_def]  DEFAULT (getutcdate()) FOR [GDB_FROM_DATE]
GO

ALTER TABLE [dbo].[SUBSWITCH] ADD  CONSTRAINT [GDB_TO_DATE75_def]  DEFAULT (CONVERT([datetime2],'9999-12-31 23:59:59.000000')) FOR [GDB_TO_DATE]
GO

ALTER TABLE [dbo].[SUBSWITCH] ADD  DEFAULT ('{00000000-0000-0000-0000-000000000000}') FOR [GlobalID]
GO
------------------------------------------------------------------------------------------------------------------------------------------
USE [DMK]
GO

/****** Object:  Table [dbo].[LOCATION_INSPECTION]    Script Date: 1/15/2025 3:06:22 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[LOCATION_INSPECTION](
	[GDB_ARCHIVE_OID] [int] NOT NULL,
	[LOCATION_GUID] [uniqueidentifier] NOT NULL,
	[STREET_NUM] [nvarchar](255) NULL,
	[STREET] [nvarchar](255) NULL,
	[CITY] [nvarchar](255) NULL,
	[STATE] [nvarchar](50) NULL,
	[ZIP] [nvarchar](50) NULL,
	[COUNTY] [nvarchar](255) NULL,
	[OWNER] [nvarchar](255) NULL,
	[OWNER_PHONE] [nvarchar](50) NULL,
	[RESIDENT] [nvarchar](255) NULL,
	[RESIDENT_PHONE] [nvarchar](50) NULL,
	[COMMENTS] [nvarchar](1024) NULL,
	[ACCESS_COMMENTS] [nvarchar](1024) NULL,
	[ROUTE_NUMBER] [int] NULL,
	[CUSTOMER_AT_LOC] [nvarchar](10) NULL,
	[CROSS_STREET] [nvarchar](255) NULL,
	[CUSTOMER_NOTIFICATION_ID] [uniqueidentifier] NULL,
	[DOCUMENT_ID] [nvarchar](255) NULL,
	[MODIFIED_BY] [uniqueidentifier] NOT NULL,
	[MODIFIED_DATE] [datetime2](7) NOT NULL,
	[MAIL_STREET_NUM] [nvarchar](255) NULL,
	[MAIL_STREET] [nvarchar](255) NULL,
	[MAIL_CITY] [nvarchar](255) NULL,
	[MAIL_STATE] [nvarchar](255) NULL,
	[MAIL_ZIP] [nvarchar](255) NULL,
	[DAMAGE_TYPE] [nvarchar](255) NULL,
	[CLAIM_AMOUNT] [numeric](10, 2) NULL,
	[CLAIM_DATE] [datetime2](7) NULL,
	[PAYMENT_ISSUED_DATE] [datetime2](7) NULL,
	[DAMAGE_COMMENTS] [nvarchar](1024) NULL,
	[DAMAGE_DATE] [datetime2](7) NULL,
	[GlobalID] [uniqueidentifier] NOT NULL,
	[GDB_FROM_DATE] [datetime2](7) NOT NULL,
	[GDB_TO_DATE] [datetime2](7) NOT NULL,
	[OBJECTID] [int] NOT NULL
) ON [PRIMARY]
GO

ALTER TABLE [dbo].[LOCATION_INSPECTION] ADD  DEFAULT ('{00000000-0000-0000-0000-000000000000}') FOR [LOCATION_GUID]
GO

ALTER TABLE [dbo].[LOCATION_INSPECTION] ADD  DEFAULT ('{00000000-0000-0000-0000-000000000000}') FOR [MODIFIED_BY]
GO

ALTER TABLE [dbo].[LOCATION_INSPECTION] ADD  DEFAULT ('{00000000-0000-0000-0000-000000000000}') FOR [GlobalID]
GO

ALTER TABLE [dbo].[LOCATION_INSPECTION] ADD  CONSTRAINT [GDB_FROM_DATE109_def]  DEFAULT (getutcdate()) FOR [GDB_FROM_DATE]
GO

ALTER TABLE [dbo].[LOCATION_INSPECTION] ADD  CONSTRAINT [GDB_TO_DATE109_def]  DEFAULT (CONVERT([datetime2],'9999-12-31 23:59:59.000000')) FOR [GDB_TO_DATE]
GO
------------------------------------------------------------------------------------------------------------------------------------------
USE [DMK]
GO

/****** Object:  Table [dbo].[STATION]    Script Date: 1/15/2025 3:07:05 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[STATION](
	[GDB_ARCHIVE_OID] [int] NOT NULL,
	[Shape] [geometry] NULL,
	[STATION_GUID] [uniqueidentifier] NULL,
	[STATION_ID] [nvarchar](255) NULL,
	[STATION_NAME] [nvarchar](255) NULL,
	[OWNER] [nvarchar](255) NULL,
	[ADDRESS] [nvarchar](255) NULL,
	[CITY] [nvarchar](255) NULL,
	[STATE] [nvarchar](255) NULL,
	[ZIP] [nvarchar](255) NULL,
	[COUNTY] [nvarchar](255) NULL,
	[REGION] [nvarchar](255) NULL,
	[LATITUDE] [numeric](38, 8) NULL,
	[LONGITUDE] [numeric](38, 8) NULL,
	[ELEVATION] [numeric](38, 8) NULL,
	[STATUS] [nvarchar](255) NULL,
	[TYPE] [nvarchar](255) NULL,
	[DESCRIP] [nvarchar](255) NULL,
	[MIN_VOLT] [nvarchar](25) NULL,
	[MAX_VOLT] [nvarchar](25) NULL,
	[IN_SERVICE] [datetime2](7) NULL,
	[OUT_SERVICE] [datetime2](7) NULL,
	[METER_PT] [nvarchar](255) NULL,
	[FIT] [nvarchar](255) NULL,
	[STATION_MAINT] [nvarchar](255) NULL,
	[ACCURACY] [nvarchar](255) NULL,
	[ACCURACY_SOURCE] [nvarchar](255) NULL,
	[REFERENCE] [nvarchar](255) NULL,
	[COMMENTS] [nvarchar](255) NULL,
	[TEXT1] [nvarchar](255) NULL,
	[TEXT2] [nvarchar](255) NULL,
	[TEXT3] [nvarchar](255) NULL,
	[TEXT4] [nvarchar](255) NULL,
	[TEXT5] [nvarchar](255) NULL,
	[NUMBER1] [numeric](38, 8) NULL,
	[NUMBER2] [numeric](38, 8) NULL,
	[NUMBER3] [numeric](38, 8) NULL,
	[DATE1] [datetime2](7) NULL,
	[DATE2] [datetime2](7) NULL,
	[GlobalID] [uniqueidentifier] NOT NULL,
	[GDB_FROM_DATE] [datetime2](7) NOT NULL,
	[GDB_TO_DATE] [datetime2](7) NOT NULL,
	[OBJECTID] [int] NOT NULL,
 CONSTRAINT [R25_pk] PRIMARY KEY CLUSTERED 
(
	[GDB_ARCHIVE_OID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, FILLFACTOR = 80) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO

ALTER TABLE [dbo].[STATION] ADD  DEFAULT ('{00000000-0000-0000-0000-000000000000}') FOR [GlobalID]
GO

ALTER TABLE [dbo].[STATION] ADD  CONSTRAINT [GDB_FROM_DATE25_def]  DEFAULT (getutcdate()) FOR [GDB_FROM_DATE]
GO

ALTER TABLE [dbo].[STATION] ADD  CONSTRAINT [GDB_TO_DATE25_def]  DEFAULT (CONVERT([datetime2],'9999-12-31 23:59:59.000000')) FOR [GDB_TO_DATE]
GO

ALTER TABLE [dbo].[STATION]  WITH CHECK ADD  CONSTRAINT [g20_ck] CHECK  (([SHAPE].[STSrid]=(3857)))
GO

ALTER TABLE [dbo].[STATION] CHECK CONSTRAINT [g20_ck]
GO
------------------------------------------------------------------------------------------------------------------------------------------
USE [DMK]
GO

/****** Object:  Table [dbo].[STRSURVENG]    Script Date: 1/15/2025 3:08:03 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[STRSURVENG](
	[GDB_ARCHIVE_OID] [int] NOT NULL,
	[STR_ID] [uniqueidentifier] NULL,
	[STR_ACCESS] [nvarchar](255) NULL,
	[STR_DESCRIPTION] [nvarchar](255) NULL,
	[MILE] [nvarchar](255) NULL,
	[AHEADSPAN] [numeric](38, 8) NULL,
	[STATION] [numeric](38, 8) NULL,
	[OFFSET] [numeric](38, 8) NULL,
	[TOP_ELEV] [numeric](38, 8) NULL,
	[WEIGHT] [int] NULL,
	[OP_KV] [nvarchar](255) NULL,
	[DESIGN_KV] [nvarchar](255) NULL,
	[NORTHING] [numeric](38, 8) NULL,
	[EASTING] [numeric](38, 8) NULL,
	[GlobalID] [uniqueidentifier] NOT NULL,
	[GDB_FROM_DATE] [datetime2](7) NOT NULL,
	[GDB_TO_DATE] [datetime2](7) NOT NULL,
	[OBJECTID] [int] NOT NULL
) ON [PRIMARY]
GO

ALTER TABLE [dbo].[STRSURVENG] ADD  DEFAULT ('{00000000-0000-0000-0000-000000000000}') FOR [GlobalID]
GO

ALTER TABLE [dbo].[STRSURVENG] ADD  CONSTRAINT [GDB_FROM_DATE59_def]  DEFAULT (getutcdate()) FOR [GDB_FROM_DATE]
GO

ALTER TABLE [dbo].[STRSURVENG] ADD  CONSTRAINT [GDB_TO_DATE59_def]  DEFAULT (CONVERT([datetime2],'9999-12-31 23:59:59.000000')) FOR [GDB_TO_DATE]
GO
------------------------------------------------------------------------------------------------------------------------------------------
USE [DMK]
GO

/****** Object:  Table [dbo].[FACILITYRELATION]    Script Date: 1/15/2025 3:08:46 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[FACILITYRELATION](
	[GDB_ARCHIVE_OID] [int] NOT NULL,
	[STR_ID] [uniqueidentifier] NULL,
	[LINEID_2] [nvarchar](255) NULL,
	[LINEID_3] [nvarchar](255) NULL,
	[LINEID_4] [nvarchar](255) NULL,
	[SWITCH_ID] [nvarchar](255) NULL,
	[STATION_ID] [nvarchar](255) NULL,
	[ADJACENT] [nvarchar](255) NULL,
	[GlobalID] [uniqueidentifier] NOT NULL,
	[GDB_FROM_DATE] [datetime2](7) NOT NULL,
	[GDB_TO_DATE] [datetime2](7) NOT NULL,
	[OBJECTID] [int] NOT NULL
) ON [PRIMARY]
GO

ALTER TABLE [dbo].[FACILITYRELATION] ADD  DEFAULT ('{00000000-0000-0000-0000-000000000000}') FOR [GlobalID]
GO

ALTER TABLE [dbo].[FACILITYRELATION] ADD  CONSTRAINT [GDB_FROM_DATE55_def]  DEFAULT (getutcdate()) FOR [GDB_FROM_DATE]
GO

ALTER TABLE [dbo].[FACILITYRELATION] ADD  CONSTRAINT [GDB_TO_DATE55_def]  DEFAULT (CONVERT([datetime2],'9999-12-31 23:59:59.000000')) FOR [GDB_TO_DATE]
GO
------------------------------------------------------------------------------------------------------------------------------------------
USE [DMK]
GO

/****** Object:  Table [dbo].[WORKORDER]    Script Date: 1/15/2025 3:09:33 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[WORKORDER](
	[WO_NAME] [nvarchar](255) NULL,
	[WO_TYPE] [nvarchar](255) NULL,
	[AMBIT_ID] [nvarchar](255) NULL,
	[DUE_DATE] [datetime2](7) NULL,
	[WO_STATUS] [nvarchar](255) NULL,
	[WO_STATUS_DATE] [datetime2](7) NULL,
	[ASSIGNED_USER_ID] [uniqueidentifier] NULL,
	[ASSIGNED_DATE] [datetime2](7) NULL,
	[WO_TAGS] [nvarchar](255) NULL,
	[CREATED_BY] [uniqueidentifier] NULL,
	[CREATED_DATE] [datetime2](7) NULL,
	[IS_DELETED] [bit] NOT NULL,
	[NUM_OBJECTS] [int] NULL,
	[ID] [uniqueidentifier] NOT NULL,
	[WO_NUMBER] [nvarchar](255) NULL,
	[PARENT_WO_ID] [uniqueidentifier] NULL,
	[WO_TYPE_ID] [uniqueidentifier] NOT NULL,
	[WO_STATUS_ID] [uniqueidentifier] NULL,
	[MODIFIED_BY] [uniqueidentifier] NULL,
	[MODIFIED_DATE] [datetime2](7) NULL,
	[INSPECT_TYPE_ID] [uniqueidentifier] NULL,
	[VENDOR] [nvarchar](255) NULL,
	[CLIENT_ID] [uniqueidentifier] NULL,
	[INSPECTION_PROGRAM_ID] [uniqueidentifier] NOT NULL,
	[FEATURE_INSPECTION_PROGRAM_ID] [uniqueidentifier] NULL,
 CONSTRAINT [PK_VEGMGMT_WORKORDER] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, FILLFACTOR = 80) ON [PRIMARY]
) ON [PRIMARY]
GO

ALTER TABLE [dbo].[WORKORDER] ADD  CONSTRAINT [DF_VEGMGMT_WORKORDER_ISDELETED]  DEFAULT ((0)) FOR [IS_DELETED]
GO

ALTER TABLE [dbo].[WORKORDER]  WITH CHECK ADD  CONSTRAINT [FK_WORKORDER_FEATURE_INSPECTION_PROGRAM_ID] FOREIGN KEY([FEATURE_INSPECTION_PROGRAM_ID])
REFERENCES [dbo].[FEATUREINSPECTIONPROGRAM] ([ID])
GO

ALTER TABLE [dbo].[WORKORDER] CHECK CONSTRAINT [FK_WORKORDER_FEATURE_INSPECTION_PROGRAM_ID]
GO

ALTER TABLE [dbo].[WORKORDER]  WITH CHECK ADD  CONSTRAINT [FK_WORKORDER_INSPECTION_PROGRAM_ID] FOREIGN KEY([INSPECTION_PROGRAM_ID])
REFERENCES [dbo].[INSPECTIONPROGRAM] ([ID])
GO

ALTER TABLE [dbo].[WORKORDER] CHECK CONSTRAINT [FK_WORKORDER_INSPECTION_PROGRAM_ID]
GO

ALTER TABLE [dbo].[WORKORDER]  WITH CHECK ADD  CONSTRAINT [FK_WORKORDER_InspectType] FOREIGN KEY([INSPECT_TYPE_ID])
REFERENCES [dbo].[INSPECTTYPE] ([ID])
GO

ALTER TABLE [dbo].[WORKORDER] CHECK CONSTRAINT [FK_WORKORDER_InspectType]
GO

ALTER TABLE [dbo].[WORKORDER]  WITH NOCHECK ADD  CONSTRAINT [FK_WORKORDER_WORKORDER] FOREIGN KEY([PARENT_WO_ID])
REFERENCES [dbo].[WORKORDER] ([ID])
GO

ALTER TABLE [dbo].[WORKORDER] CHECK CONSTRAINT [FK_WORKORDER_WORKORDER]
GO

ALTER TABLE [dbo].[WORKORDER]  WITH CHECK ADD  CONSTRAINT [FK_WORKORDER_WORKORDERSTATUS] FOREIGN KEY([WO_STATUS_ID])
REFERENCES [dbo].[WORKORDERSTATUS] ([ID])
GO

ALTER TABLE [dbo].[WORKORDER] CHECK CONSTRAINT [FK_WORKORDER_WORKORDERSTATUS]
GO

ALTER TABLE [dbo].[WORKORDER]  WITH CHECK ADD  CONSTRAINT [FK_WORKORDER_WORKORDERTYPE] FOREIGN KEY([WO_TYPE_ID])
REFERENCES [dbo].[WORKORDERTYPE] ([ID])
GO

ALTER TABLE [dbo].[WORKORDER] CHECK CONSTRAINT [FK_WORKORDER_WORKORDERTYPE]
GO
------------------------------------------------------------------------------------------------------------------------------------------
USE [DMK]
GO

/****** Object:  Table [dbo].[REGION]    Script Date: 1/15/2025 3:12:35 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[REGION](
	[ID] [uniqueidentifier] NULL,
	[NAME] [nvarchar](255) NULL,
	[CODE] [nvarchar](255) NULL,
	[REGION] [nvarchar](255) NULL,
	[STATES] [nvarchar](255) NULL,
	[AMBIT_ID] [nvarchar](255) NULL,
	[COMMENTS] [nvarchar](255) NULL,
	[AREA_SQMI] [numeric](38, 8) NULL,
	[GlobalID] [uniqueidentifier] NOT NULL,
	[OBJECTID] [int] NOT NULL,
	[Shape] [geometry] NULL,
 CONSTRAINT [R101_pk] PRIMARY KEY CLUSTERED 
(
	[OBJECTID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, FILLFACTOR = 80) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO

ALTER TABLE [dbo].[REGION]  WITH CHECK ADD  CONSTRAINT [g65_ck] CHECK  (([SHAPE].[STSrid]=(3857)))
GO

ALTER TABLE [dbo].[REGION] CHECK CONSTRAINT [g65_ck]
GO
------------------------------------------------------------------------------------------------------------------------------------------
USE [DMK]
GO

/****** Object:  Table [dbo].[INSPECTIONSTATUS]    Script Date: 1/15/2025 3:13:08 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[INSPECTIONSTATUS](
	[STATUS] [nvarchar](255) NOT NULL,
	[ID] [uniqueidentifier] NOT NULL,
 CONSTRAINT [PK_INSPECTIONSTATUS] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, FILLFACTOR = 80) ON [PRIMARY]
) ON [PRIMARY]
GO
------------------------------------------------------------------------------------------------------------------------------------------
USE [DMK]
GO

/****** Object:  Table [dbo].[INSPECTIONATTRIBUTE]    Script Date: 1/15/2025 3:13:37 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[INSPECTIONATTRIBUTE](
	[NAME] [nvarchar](255) NOT NULL,
	[ID] [uniqueidentifier] NOT NULL,
	[OBJECT_TYPE_ID] [uniqueidentifier] NULL,
 CONSTRAINT [PK_INSPECTIONATTRIBUTE] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, FILLFACTOR = 80) ON [PRIMARY]
) ON [PRIMARY]
GO
------------------------------------------------------------------------------------------------------------------------------------------
USE [DMK]
GO

/****** Object:  Table [dbo].[INSPECTIONATTRIBUTEPROPERTY]    Script Date: 1/15/2025 3:14:03 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[INSPECTIONATTRIBUTEPROPERTY](
	[ID] [uniqueidentifier] NOT NULL,
	[NAME] [nvarchar](255) NULL,
	[PROBLEM_CODE] [smallint] NULL,
	[DESCRIPTION] [nvarchar](255) NULL,
	[REPORTING_DESC] [nvarchar](255) NULL,
 CONSTRAINT [PK_INSPECTIONATTRIBUTEPROPERTY] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, FILLFACTOR = 80) ON [PRIMARY]
) ON [PRIMARY]
GO
------------------------------------------------------------------------------------------------------------------------------------------
USE [DMK]
GO

/****** Object:  Table [dbo].[STRUCTUREINSPECTION]    Script Date: 1/15/2025 3:14:55 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[STRUCTUREINSPECTION](
	[ID] [uniqueidentifier] NOT NULL,
	[WO_ID] [uniqueidentifier] NOT NULL,
	[STR_ID] [uniqueidentifier] NOT NULL,
	[ATTRIBUTE_ID] [uniqueidentifier] NOT NULL,
	[STATUS_ID] [uniqueidentifier] NULL,
	[COMMENTS] [nvarchar](1024) NULL,
	[PROPERTY_ID] [uniqueidentifier] NULL,
	[PROPERTY_VALUE] [nvarchar](255) NULL,
	[INSPECTION_DATE] [datetime2](7) NOT NULL,
	[CREATED_BY] [uniqueidentifier] NULL,
	[CREATED_DATE] [datetime2](7) NULL,
	[MODIFIED_BY] [uniqueidentifier] NULL,
	[MODIFIED_DATE] [datetime2](7) NULL,
	[KEY] [nvarchar](255) NULL,
	[VALUE] [nvarchar](255) NULL,
 CONSTRAINT [PK_StructureInspection] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, FILLFACTOR = 80) ON [PRIMARY]
) ON [PRIMARY]
GO

ALTER TABLE [dbo].[STRUCTUREINSPECTION]  WITH CHECK ADD  CONSTRAINT [FK_StructureInspection_INSPECTIONATTRIBUTE] FOREIGN KEY([ATTRIBUTE_ID])
REFERENCES [dbo].[INSPECTIONATTRIBUTE] ([ID])
GO

ALTER TABLE [dbo].[STRUCTUREINSPECTION] CHECK CONSTRAINT [FK_StructureInspection_INSPECTIONATTRIBUTE]
GO

ALTER TABLE [dbo].[STRUCTUREINSPECTION]  WITH CHECK ADD  CONSTRAINT [FK_StructureInspection_INSPECTIONATTRIBUTEPROPERTY] FOREIGN KEY([PROPERTY_ID])
REFERENCES [dbo].[INSPECTIONATTRIBUTEPROPERTY] ([ID])
GO

ALTER TABLE [dbo].[STRUCTUREINSPECTION] CHECK CONSTRAINT [FK_StructureInspection_INSPECTIONATTRIBUTEPROPERTY]
GO

ALTER TABLE [dbo].[STRUCTUREINSPECTION]  WITH CHECK ADD  CONSTRAINT [FK_StructureInspection_INSPECTIONSTATUS] FOREIGN KEY([STATUS_ID])
REFERENCES [dbo].[INSPECTIONSTATUS] ([ID])
GO

ALTER TABLE [dbo].[STRUCTUREINSPECTION] CHECK CONSTRAINT [FK_StructureInspection_INSPECTIONSTATUS]
GO

ALTER TABLE [dbo].[STRUCTUREINSPECTION]  WITH CHECK ADD  CONSTRAINT [FK_StructureInspection_WORKORDER] FOREIGN KEY([WO_ID])
REFERENCES [dbo].[WORKORDER] ([ID])
GO

ALTER TABLE [dbo].[STRUCTUREINSPECTION] CHECK CONSTRAINT [FK_StructureInspection_WORKORDER]
GO
------------------------------------------------------------------------------------------------------------------------------------------
USE [DMK]
GO

/****** Object:  Table [dbo].[SWITCHINSPECTION]    Script Date: 1/15/2025 3:15:40 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[SWITCHINSPECTION](
	[ID] [uniqueidentifier] NOT NULL,
	[WO_ID] [uniqueidentifier] NOT NULL,
	[SWITCH_ID] [uniqueidentifier] NOT NULL,
	[ATTRIBUTE_ID] [uniqueidentifier] NOT NULL,
	[STATUS_ID] [uniqueidentifier] NULL,
	[COMMENTS] [nvarchar](1024) NULL,
	[PROPERTY_ID] [uniqueidentifier] NULL,
	[INSPECTION_DATE] [datetime2](7) NOT NULL,
	[CREATED_BY] [uniqueidentifier] NULL,
	[CREATED_DATE] [datetime2](7) NULL,
	[MODIFIED_BY] [uniqueidentifier] NULL,
	[MODIFIED_DATE] [datetime2](7) NULL,
	[KEY] [nvarchar](255) NULL,
	[VALUE] [nvarchar](255) NULL,
	[PROPERTY_STATUS_ID] [uniqueidentifier] NULL,
	[PROPERTY_PREREPAIR_STATUS] [uniqueidentifier] NULL,
PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, FILLFACTOR = 80) ON [PRIMARY]
) ON [PRIMARY]
GO

ALTER TABLE [dbo].[SWITCHINSPECTION]  WITH CHECK ADD  CONSTRAINT [FK_ATTRIBUTE_ID] FOREIGN KEY([ATTRIBUTE_ID])
REFERENCES [dbo].[INSPECTIONATTRIBUTE] ([ID])
GO

ALTER TABLE [dbo].[SWITCHINSPECTION] CHECK CONSTRAINT [FK_ATTRIBUTE_ID]
GO

ALTER TABLE [dbo].[SWITCHINSPECTION]  WITH CHECK ADD  CONSTRAINT [FK_PROPERTY_ID] FOREIGN KEY([PROPERTY_ID])
REFERENCES [dbo].[INSPECTIONATTRIBUTEPROPERTY] ([ID])
GO

ALTER TABLE [dbo].[SWITCHINSPECTION] CHECK CONSTRAINT [FK_PROPERTY_ID]
GO

ALTER TABLE [dbo].[SWITCHINSPECTION]  WITH CHECK ADD  CONSTRAINT [FK_STATUS_ID] FOREIGN KEY([STATUS_ID])
REFERENCES [dbo].[INSPECTIONSTATUS] ([ID])
GO

ALTER TABLE [dbo].[SWITCHINSPECTION] CHECK CONSTRAINT [FK_STATUS_ID]
GO

ALTER TABLE [dbo].[SWITCHINSPECTION]  WITH CHECK ADD  CONSTRAINT [FK_WO_ID] FOREIGN KEY([WO_ID])
REFERENCES [dbo].[WORKORDER] ([ID])
GO

ALTER TABLE [dbo].[SWITCHINSPECTION] CHECK CONSTRAINT [FK_WO_ID]
GO
------------------------------------------------------------------------------------------------------------------------------------------
USE [DMK]
GO

/****** Object:  Table [dbo].[GRADE]    Script Date: 1/15/2025 3:16:28 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[GRADE](
	[GDB_ARCHIVE_OID] [int] NOT NULL,
	[GRADE_ID] [uniqueidentifier] NOT NULL,
	[POLE_GUID] [uniqueidentifier] NULL,
	[STR_ID] [uniqueidentifier] NOT NULL,
	[POST_STEEL] [nvarchar](50) NULL,
	[DIAGONAL_STEEL] [nvarchar](50) NULL,
	[BASE_STEEL] [nvarchar](50) NULL,
	[WALL_STEEL] [nvarchar](50) NULL,
	[OTHER_STEEL] [nvarchar](50) NULL,
	[POST_LEG_MECHANICAL] [nvarchar](50) NULL,
	[DIAGONAL_MECHANICAL] [nvarchar](50) NULL,
	[BASE_MECHANICAL] [nvarchar](50) NULL,
	[WALL_MECHANICAL] [nvarchar](50) NULL,
	[OTHER_MECHANICAL] [nvarchar](50) NULL,
	[CONCRETE_FND_GRADE] [nvarchar](50) NULL,
	[COATING_GRADE] [nvarchar](50) NULL,
	[BELOW_COATING] [nvarchar](50) NULL,
	[ANCHOR_GRADE] [nvarchar](50) NULL,
	[SOIL_CONDITIONS] [nvarchar](50) NULL,
	[OVERALL_GRADE] [nvarchar](50) NULL,
	[INSPECTION_DATE] [datetime2](7) NULL,
	[GDB_FROM_DATE] [datetime2](7) NOT NULL,
	[GDB_TO_DATE] [datetime2](7) NOT NULL,
	[OBJECTID] [int] NOT NULL,
	[PERCENT_STEEL_LOSS] [smallint] NULL,
	[POLE_NUM] [nvarchar](255) NULL,
	[GlobalID] [uniqueidentifier] NOT NULL
) ON [PRIMARY]
GO

ALTER TABLE [dbo].[GRADE] ADD  DEFAULT ('{00000000-0000-0000-0000-000000000000}') FOR [GRADE_ID]
GO

ALTER TABLE [dbo].[GRADE] ADD  DEFAULT ('{00000000-0000-0000-0000-000000000000}') FOR [STR_ID]
GO

ALTER TABLE [dbo].[GRADE] ADD  CONSTRAINT [GDB_FROM_DATE88_def]  DEFAULT (getutcdate()) FOR [GDB_FROM_DATE]
GO

ALTER TABLE [dbo].[GRADE] ADD  CONSTRAINT [GDB_TO_DATE88_def]  DEFAULT (CONVERT([datetime2],'9999-12-31 23:59:59.000000')) FOR [GDB_TO_DATE]
GO

ALTER TABLE [dbo].[GRADE] ADD  DEFAULT ('{00000000-0000-0000-0000-000000000000}') FOR [GlobalID]
GO
------------------------------------------------------------------------------------------------------------------------------------------