# Sourcing Flat Files



## 1. Control Flow

Change the Enumerator type to Foreach File Enumerator. Configure
the file enumerator by setting the Folder to the location where the CSV
files from the companion Web site are located. Change the Files wildcard
to *.csv and Retrieve file name to Name and extension



## 2. Flat File Connection Manager

## 3. Data Flow

### 3.1 Script Component

### 3.2 Derived Column Component

Table 11.23 Additional Derived Columns Required for Hashing in the Staging Process

| Derived Column Name    | Expression                                                   |
| ---------------------- | ------------------------------------------------------------ |
| LoadDate               | @[User::dLoadDate]                                           |
| RecordSource           | “BTS.OnTimeOnTimePerformance”                                |
| FlightNumHubBK         | UPPER(TRIM(REPLACENULL(Carrier,"")) + ";" +TRIM((DT_WSTR,5)REPLACENULL(FlightNum,""))) |
| OriginHubBK            | UPPER(TRIM(REPLACENULL(Origin,"")))                          |
| CarrierHubBK           | UPPER(TRIM(REPLACENULL(Carrier,"")))                         |
| TailNumHubBK           | UPPER(TRIM(REPLACENULL(TailNum,"")))                         |
| DestHubBK              | UPPER(TRIM(REPLACENULL(Dest,"")))                            |
| Div1AirportHubBK       | UPPER(TRIM(REPLACENULL(Div1Airport,"")))                     |
| Div2AirportHubBK       | UPPER(TRIM(REPLACENULL(Div2Airport,"")))                     |
| Div3AirportHubBK       | UPPER(TRIM(REPLACENULL(Div3Airport,"")))                     |
| Div4AirportHubBK       | UPPER(TRIM(REPLACENULL(Div4Airport,"")))                     |
| Div5AirportHubBK       | UPPER(TRIM(REPLACENULL(Div5Airport,"")))                     |
| FlightLinkBK           | UPPER(TRIM(REPLACENULL((DT_WSTR,2)Carrier,"")) + ";" +TRIM((DT_WSTR,5)REPLACENULL(FlightNum,"")) + ";" +TRIM(REPLACENULL((DT_WSTR,10)TailNum,"")) + ";" +TRIM(REPLACENULL((DT_WSTR,3)Origin,"")) + ";" +TRIM(REPLACENULL((DT_WSTR,3)Dest,"")) + ";" +TRIM((DT_WSTR,27)REPLACENULL(FlightDate,""))) |
| Div1FlightLinkBK       | UPPER(TRIM((DT_WSTR,5)REPLACENULL(FlightNum,"")) + ";" +TRIM((DT_WSTR,10)REPLACENULL(Div1TailNum,"")) + ";" +TRIM((DT_WSTR,3)REPLACENULL(Origin,"")) + ";" +TRIM((DT_WSTR,3)REPLACENULL(Div1Airport,"")) + ";" + "1" + ";" +TRIM((DT_WSTR,27)REPLACENULL(FlightDate,""))) |
| Div2FlightLinkBK       | UPPER(TRIM((DT_WSTR,5)REPLACENULL(FlightNum,"")) + ";" +TRIM((DT_WSTR,10)REPLACENULL(Div2TailNum,"")) + ";" +TRIM((DT_WSTR,3)REPLACENULL(Origin,"")) + ";" +TRIM((DT_WSTR,3)REPLACENULL(Div2Airport,"")) + ";" + "2" + ";" +TRIM((DT_WSTR,27)REPLACENULL(FlightDate,""))) |
| Div3FlightLinkBK       | UPPER(TRIM((DT_WSTR,5)REPLACENULL(FlightNum,"")) + ";" +TRIM((DT_WSTR,10)REPLACENULL(Div3TailNum,"")) + ";" +TRIM((DT_WSTR,3)REPLACENULL(Origin,"")) + ";" +TRIM((DT_WSTR,3)REPLACENULL(Div3Airport,"")) + ";" + "3" + ";" +TRIM((DT_WSTR,27)REPLACENULL(FlightDate,""))) |
| Div4FlightLinkBK       | UPPER(TRIM((DT_WSTR,5)REPLACENULL(FlightNum,"")) + ";" +TRIM((DT_WSTR,10)REPLACENULL(Div4TailNum,"")) + ";" +TRIM((DT_WSTR,3)REPLACENULL(Origin,"")) + ";" +TRIM((DT_WSTR,3)REPLACENULL(Div4Airport,"")) + ";" + "4" + ";" +TRIM((DT_WSTR,27)REPLACENULL(FlightDate,""))) |
| Div5FlightLinkBK       | UPPER(TRIM((DT_WSTR,5)REPLACENULL(FlightNum,"")) + ";" +TRIM((DT_WSTR,10)REPLACENULL(Div5TailNum,"")) + ";" +TRIM((DT_WSTR,3)REPLACENULL(Origin,"")) + ";" +TRIM((DT_WSTR,3)REPLACENULL(Div5Airport,"")) + ";" + "5" + ";" +TRIM((DT_WSTR,27)REPLACENULL(FlightDate,""))) |
| FlightNumCarrierLinkBK | UPPER(TRIM(REPLACENULL(Carrier,"")) + ";" +TRIM((DT_WSTR,5)REPLACENULL(FlightNum,"")) + ";" +TRIM(REPLACENULL(Carrier,""))) |
| OriginAirportSatPL     | UPPER(TRIM(REPLACENULL(Origin,""))) + ";" +TRIM(REPLACENULL(OriginCityName,"")) + ";" +TRIM(REPLACENULL(OriginState,"")) + ";" +TRIM(REPLACENULL(OriginStateName,"")) + ";" +TRIM((DT_WSTR,5)REPLACENULL(OriginCityMarketID,"")) + ";" +TRIM((DT_WSTR,3)REPLACENULL(OriginStateFips,"")) + ";" +TRIM((DT_WSTR,3)REPLACENULL(OriginWac,"")) |
| DestAirportSatPL       | UPPER(TRIM(REPLACENULL(Dest,""))) + ";" +TRIM(REPLACENULL(DestCityName,"")) + ";" +TRIM(REPLACENULL(DestState,"")) + ";" +TRIM(REPLACENULL(DestStateName,"")) + ";" +TRIM((DT_WSTR,5)REPLACENULL(DestCityMarketID,"")) + ";" +TRIM((DT_WSTR,3)REPLACENULL(DestStateFips,"")) + ";" +TRIM((DT_WSTR,3)REPLACENULL(DestWac,"")) |





### 3.3 Script Component

#### InputColumn

#### InputAndOutputColumn

| InputColumn            | OutputColumn            |
| ---------------------- | ----------------------- |
| FlightNumHubBK         | FlightNumHashKey        |
| OriginHubBK            | OriginHashKey           |
| CarrierHubBK           | CarrierHashKey          |
| TailNumHubBK           | TailNumHashKey          |
| DestHubBK              | DestHashKey             |
| Div1AirportHubBK       | Div1AirportHashKey      |
| Div2AirportHubBK       | Div2AirportHashKey      |
| Div3AirportHubBK       | Div3AirportHashKey      |
| Div4AirportHubBK       | Div4AirportHashKey      |
| Div5AirportHubBK       | Div5AirportHashKey      |
| FlightLinkBK           | FlightHashKey           |
| Div1FlightLinkBK       | Div1FlightHashKey       |
| Div2FlightLinkBK       | Div2FlightHashKey       |
| Div3FlightLinkBK       | Div3FlightHashKey       |
| Div4FlightLinkBK       | Div4FlightHashKey       |
| Div5FlightLinkBK       | Div5FlightHashKey       |
| FlightNumCarrierLinkBK | FlightNumCarrierHashKey |
| OriginAirportSatPL     | OriginAirportHashDiff   |
| DestAirportSatPL       | DestAirportHashDiff     |

#### Script

```c++
    public override void Input0_ProcessInputRow(Input0Buffer Row)
    {
        /*
         * Add your code here
         */
        Type rowType = Row.GetType();
        String columnValue = "";
        String oColumnName = "";
        foreach (IDTSInputColumn100 iColumn in this.ComponentMetaData.InputCollection[0].InputColumnCollection)
        {
            if (iColumn.Name.EndsWith("HubBK") || iColumn.Name.EndsWith("LinkBK") || iColumn.Name.EndsWith("SatPL"))
            {
                oColumnName = iColumn.Name.Replace("HubBK", "HashKey");
                oColumnName = oColumnName.Replace("LinkBK", "HashKey");
                oColumnName = oColumnName.Replace("SatPL", "HashDiff");
                columnValue = rowType.GetProperty(iColumn.Name).GetValue(Row, null).ToString();
                columnValue = BitConverter.ToString(md5.ComputeHash(encoding.GetBytes(columnValue)));
                columnValue = columnValue.Replace("-", "");
                if (rowType.GetProperty(oColumnName)!=null)
                {
                    rowType.GetProperty(oColumnName).SetValue(Row, columnValue, null);
                }
            }
        }
    }
```



#### Create Table

```mssql
USE [StageArea]
GO
/****** Object:  Schema [bts]    Script Date: 2/16/2015 9:20:08 AM ******/
CREATE SCHEMA [bts]
GO
/****** Object:  Table [bts].[OnTimeOnTimePerformance]    Script Date: 1/22/2015 9:37:08 AM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

SET ANSI_PADDING ON
GO

CREATE TABLE [bts].[OnTimeOnTimePerformance](
	[Sequence] [int] NOT NULL,
	[Year] [smallint] NULL,
	[Quarter] [smallint] NULL,
	[Month] [smallint] NULL,
	[DayofMonth] [smallint] NULL,
	[DayOfWeek] [smallint] NULL,
	[FlightDate] [datetime] NULL,
	[UniqueCarrier] [nvarchar](2) NULL,
	[AirlineID] [smallint] NULL,
	[Carrier] [nvarchar](2) NULL,
	[TailNum] [nvarchar](6) NULL,
	[FlightNum] [smallint] NULL,
	[OriginAirportID] [smallint] NULL,
	[OriginAirportSeqID] [int] NULL,
	[OriginCityMarketID] [int] NULL,
	[Origin] [nvarchar](3) NULL,
	[OriginCityName] [nvarchar](100) NULL,
	[OriginState] [nvarchar](2) NULL,
	[OriginStateFips] [smallint] NULL,
	[OriginStateName] [nvarchar](100) NULL,
	[OriginWac] [smallint] NULL,
	[DestAirportID] [smallint] NULL,
	[DestAirportSeqID] [int] NULL,
	[DestCityMarketID] [int] NULL,
	[Dest] [nvarchar](3) NULL,
	[DestCityName] [nvarchar](100) NULL,
	[DestState] [nvarchar](2) NULL,
	[DestStateFips] [smallint] NULL,
	[DestStateName] [nvarchar](100) NULL,
	[DestWac] [smallint] NULL,
	[CRSDepTime] [smallint] NULL,
	[DepTime] [smallint] NULL,
	[DepDelay] [smallint] NULL,
	[DepDelayMinutes] [smallint] NULL,
	[DepDel15] [bit] NULL,
	[DepartureDelayGroups] [smallint] NULL,
	[DepTimeBlk] [nvarchar](9) NULL,
	[TaxiOut] [smallint] NULL,
	[WheelsOff] [smallint] NULL,
	[WheelsOn] [smallint] NULL,
	[TaxiIn] [smallint] NULL,
	[CRSArrTime] [smallint] NULL,
	[ArrTime] [smallint] NULL,
	[ArrDelay] [smallint] NULL,
	[ArrDelayMinutes] [smallint] NULL,
	[ArrDel15] [bit] NULL,
	[ArrivalDelayGroups] [smallint] NULL,
	[ArrTimeBlk] [nvarchar](9) NULL,
	[Cancelled] [bit] NULL,
	[CancellationCode] [nvarchar](10) NULL,
	[Diverted] [bit] NULL,
	[CRSElapsedTime] [smallint] NULL,
	[ActualElapsedTime] [smallint] NULL,
	[AirTime] [smallint] NULL,
	[Flights] [smallint] NULL,
	[Distance] [int] NULL,
	[DistanceGroup] [int] NULL,
	[CarrierDelay] [smallint] NULL,
	[WeatherDelay] [smallint] NULL,
	[NASDelay] [smallint] NULL,
	[SecurityDelay] [smallint] NULL,
	[LateAircraftDelay] [smallint] NULL,
	[FirstDepTime] [smallint] NULL,
	[TotalAddGTime] [smallint] NULL,
	[LongestAddGTime] [smallint] NULL,
	[DivAirportLandings] [smallint] NULL,
	[DivReachedDest] [bit] NULL,
	[DivActualElapsedTime] [smallint] NULL,
	[DivArrDelay] [smallint] NULL,
	[DivDistance] [int] NULL,
	[Div1Airport] [nvarchar](3) NULL,
	[Div1AirportID] [smallint] NULL,
	[Div1AirportSeqID] [smallint] NULL,
	[Div1WheelsOn] [smallint] NULL,
	[Div1TotalGTime] [smallint] NULL,
	[Div1LongestGTime] [smallint] NULL,
	[Div1WheelsOff] [smallint] NULL,
	[Div1TailNum] [nvarchar](6) NULL,
	[Div2Airport] [nvarchar](3) NULL,
	[Div2AirportID] [smallint] NULL,
	[Div2AirportSeqID] [smallint] NULL,
	[Div2WheelsOn] [smallint] NULL,
	[Div2TotalGTime] [smallint] NULL,
	[Div2LongestGTime] [smallint] NULL,
	[Div2WheelsOff] [smallint] NULL,
	[Div2TailNum] [nvarchar](6) NULL,
	[Div3Airport] [nvarchar](3) NULL,
	[Div3AirportID] [smallint] NULL,
	[Div3AirportSeqID] [smallint] NULL,
	[Div3WheelsOn] [smallint] NULL,
	[Div3TotalGTime] [smallint] NULL,
	[Div3LongestGTime] [smallint] NULL,
	[Div3WheelsOff] [smallint] NULL,
	[Div3TailNum] [nvarchar](6) NULL,
	[Div4Airport] [nvarchar](3) NULL,
	[Div4AirportID] [smallint] NULL,
	[Div4AirportSeqID] [smallint] NULL,
	[Div4WheelsOn] [smallint] NULL,
	[Div4TotalGTime] [smallint] NULL,
	[Div4LongestGTime] [smallint] NULL,
	[Div4WheelsOff] [smallint] NULL,
	[Div4TailNum] [nvarchar](6) NULL,
	[Div5Airport] [nvarchar](3) NULL,
	[Div5AirportID] [smallint] NULL,
	[Div5AirportSeqID] [smallint] NULL,
	[Div5WheelsOn] [smallint] NULL,
	[Div5TotalGTime] [smallint] NULL,
	[Div5LongestGTime] [smallint] NULL,
	[Div5WheelsOff] [smallint] NULL,
	[Div5TailNum] [nvarchar](6) NULL,
	[LoadDate] [datetime] NOT NULL,
	[RecordSource] [nvarchar](27) NOT NULL,
	[FlightNumHashKey] [char](32) NOT NULL,
	[OriginHashKey] [char](32) NOT NULL,
	[CarrierHashKey] [char](32) NOT NULL,
	[TailNumHashKey] [char](32) NOT NULL,
	[DestHashKey] [char](32) NOT NULL,
	[Div1AirportHashKey] [char](32) NOT NULL,
	[Div2AirportHashKey] [char](32) NOT NULL,
	[Div3AirportHashKey] [char](32) NOT NULL,
	[Div4AirportHashKey] [char](32) NOT NULL,
	[Div5AirportHashKey] [char](32) NOT NULL,
	[FlightHashKey] [char](32) NOT NULL,
	[Div1FlightHashKey] [char](32) NOT NULL,
	[Div2FlightHashKey] [char](32) NOT NULL,
	[Div3FlightHashKey] [char](32) NOT NULL,
	[Div4FlightHashKey] [char](32) NOT NULL,
	[Div5FlightHashKey] [char](32) NOT NULL,
	[FlightNumCarrierHashKey] [char](32) NOT NULL,
	[OriginAirportHashDiff] [char](32) NOT NULL,
	[DestAirportHashDiff] [char](32) NOT NULL,
 CONSTRAINT [PK_OnTimeOnTimePerformance] PRIMARY KEY NONCLUSTERED 
(
	[Sequence] ASC,
	[LoadDate] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [INDEX]
) ON [DATA]
GO
SET ANSI_PADDING OFF
GO
```



### 3.4 OLE DB Destination Component

newConnectionManager --> 手动输入 ServerName（比如我的是：`DESKTOP-ESFFQMJ`）



































# Loading Data Vault

## 1. Hub





> Template for loading hub tables.
>
> ![1536062117774](assets/1536062117774.png)





> Combining business keys from multiple sources.
>
> ![1536062211259](assets/1536062211259.png)





![1536062311989](assets/1536062311989.png)















































## 注意事项： 

### 4 问题

字段长度很容易导致流程出错，可以结合官方文档做调整：

[the companion site for Book DV2.0](http://booksite.elsevier.com/9780128025109)



### 3 问题 

警告: 无法打开全局共享内存以与性能 DLL 通信；数据流性能计数器不可用。若要解决此问题，请以管理员的身份或在系统控制台上运行此包。



### 2 问题

场景：此系统中没有安装 LocaleID 9

处理方式：语言环境冲突导致，调整properties中的localID



### 1 环境准备

安装MSSQL Server(需要包含SSIS相关服务！)、SSMS、SSDT。

本案例中：SQL Server为数据库， SSMS用于管理数据库，SSDT用于创建ETL项目工作流

[SQL Server系列文件下载](https://docs.microsoft.com/zh-cn/sql/?view=sql-server-2017)

## Reference

 [SSIS Tutorial: Creating a Simple ETL Package](https://docs.microsoft.com/en-us/sql/integration-services/ssis-how-to-create-an-etl-package?view=sql-server-2017)