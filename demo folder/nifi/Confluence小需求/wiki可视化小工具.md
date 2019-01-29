## 需求描述

1， 使用nifi每天跑一次，把confluence的昨天的谁写了什么题目的记录同步到一张新表
2， 使用superset设置一个dashboard，观看最近两周的每人每天的贡献度

## 相关数据 

### confluence.CONTENT

```sql
CREATE TABLE `CONTENT` (
`CONTENTID`  bigint(20) NOT NULL ,
`HIBERNATEVERSION`  int(11) NOT NULL DEFAULT 0 ,
`CONTENTTYPE`  varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL ,
`TITLE`  varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL ,
`LOWERTITLE`  varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL ,
`VERSION`  int(11) NULL DEFAULT NULL ,
`CREATOR`  varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL ,
`CREATIONDATE`  datetime NULL DEFAULT NULL ,
`LASTMODIFIER`  varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL ,
`LASTMODDATE`  datetime NULL DEFAULT NULL ,
`VERSIONCOMMENT`  mediumtext CHARACTER SET utf8 COLLATE utf8_bin NULL ,
`PREVVER`  bigint(20) NULL DEFAULT NULL ,
`CONTENT_STATUS`  varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL ,
`PAGEID`  bigint(20) NULL DEFAULT NULL ,
`SPACEID`  bigint(20) NULL DEFAULT NULL ,
`CHILD_POSITION`  int(11) NULL DEFAULT NULL ,
`PARENTID`  bigint(20) NULL DEFAULT NULL ,
`MESSAGEID`  varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL ,
`PLUGINKEY`  varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL ,
`PLUGINVER`  varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL ,
`PARENTCCID`  bigint(20) NULL DEFAULT NULL ,
`DRAFTPAGEID`  varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL ,
`DRAFTSPACEKEY`  varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL ,
`DRAFTTYPE`  varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL ,
`DRAFTPAGEVERSION`  int(11) NULL DEFAULT NULL ,
`PARENTCOMMENTID`  bigint(20) NULL DEFAULT NULL ,
`USERNAME`  varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL ,
PRIMARY KEY (`CONTENTID`)
)
ENGINE=InnoDB
DEFAULT CHARACTER SET=utf8 COLLATE=utf8_bin
ROW_FORMAT=DYNAMIC
;
```

### confluence.user_mapping

```sql
CREATE TABLE `user_mapping` (
`user_key`  varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL ,
`username`  varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL ,
`lower_username`  varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL ,
PRIMARY KEY (`user_key`),
UNIQUE INDEX `unq_lwr_username` (`lower_username`) USING BTREE 
)
ENGINE=InnoDB
DEFAULT CHARACTER SET=utf8 COLLATE=utf8_bin
ROW_FORMAT=DYNAMIC
;
```

### nifi_db.Commitments

```SQL
CREATE TABLE `Commitments` (
`ContentId`  bigint(20) NOT NULL COMMENT '内容ID' ,
`WeekOfYear`  varchar(255) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL COMMENT '年份周数' ,
`Title`  varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL COMMENT '内容抬头' ,
`Modifier`  varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL COMMENT '更新人' ,
`LastModDate`  datetime NOT NULL COMMENT '最后更新时间' ,
`Creator`  varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL COMMENT '创建人' ,
`CreateDate`  datetime NULL DEFAULT NULL COMMENT '创建时间' ,
PRIMARY KEY (`ContentId`, `LastModDate`)
)
ENGINE=InnoDB
DEFAULT CHARACTER SET=latin1 COLLATE=latin1_swedish_ci
ROW_FORMAT=DYNAMIC
;
```

## 配置服务控制器（Controller Service）

### DBCPForConfluence(DBCPConnectionPool)

#### PROPERTIES

| properties                 | values                |
| -------------------------- | --------------------- |
|Database Connection URL|jdbc:mysql://47.96.97.244:3306/confluence?useUnicode=true&characterEncoding=utf8|
|Database Driver Class Name|com.mysql.jdbc.Driver|
|Database Driver Location(s)|/usr/share/java/mysql-connector-java.jar|
|Database User|root|
|Password|***|

### DBCPForNiFi_db(DBCPConnectionPool)

#### PROPERTIES

| properties                  | values                                                       |
| --------------------------- | ------------------------------------------------------------ |
| Database Connection URL     | jdbc:mysql://gateway001:3306/nifi_db?useUnicode=true&characterEncoding=utf8 |
| Database Driver Class Name  | com.mysql.jdbc.Driver                                        |
| Database Driver Location(s) | /usr/share/java/mysql-connector-java.jar                     |
| Database User               | root                                                         |
| Password                    | ***                                                          |

## 全量导入历史贡献记录

### 获取数据（ExecuteSQL）

SCHEDULING

| Scheduling Strategy | Timer driven |
| ------------------- | ------------ |
| Run Schedule        | 1 days       |
| Execution           | Primary node |
| Concurrent Tasks    | 1            |

PROPERTIES

| Property                            | Value                                        |
| ----------------------------------- | -------------------------------------------- |
| Database Connection Pooling Service | DBCPForConfluence(见上文Controller Service） |
| SQL select query                    | 代码见下文                                   |
| Max Wait Time                       | 0 seconds                                    |
| Normalize Table/Column Names        | false                                        |
| Use Avro Logical Types              | false                                        |
| Default Decimal Precision           | 10                                           |
| Default Decimal Scale               | 0                                            |

```SQL
SELECT
	a.CONTENTID,
	a.TITLE,
	b.USERNAME AS CREATOR,
	c.USERNAME AS MODIFIER,
	a.CREATIONDATE AS CREATEDATE,
	a.LASTMODDATE,
	YEARWEEK(a.LASTMODDATE) AS WeekOfYear
FROM
	CONTENT a
LEFT JOIN user_mapping b ON a.CREATOR = b.user_key
LEFT JOIN user_mapping c ON a.LASTMODIFIER = c.user_key
WHERE
	a.CONTENTTYPE = 'PAGE'
AND a.spaceid = 98306
AND a.title IS NOT NULL
AND a.PARENTID IS NOT NULL
ORDER BY
	WeekOfYear DESC,
	modifier DESC,
	LASTMODDATE;
```

### 格式转化（ConvertAvroToJSON）

直接新增该Processor，默认配置即可。

### SQL生成（ConvertJSONToSQL）

PROPERTIES

| properties | values |
| ---------- | ------ |
|JDBC Connection Pool|DBCPForNiFi_db(见上文)|
|Statement Type|INSERT|
|Table Name|Commitments|

### SQL写入（PutSQL） 

PROPERTIES

| Property                                  | Value          |
| ----------------------------------------- | -------------- |
| JDBC Connection Pool                      | DBCPForNiFi_db |
| SQL Statement                             | 见下文         |
| Support Fragmented Transactions           | true           |
| Transaction TimeoutNo value setBatch Size | 100            |
| Obtain Generated Keys                     | false          |
| Rollback On Failure                       | true           |

#### SQL Statement

> 注：
>
> 该参数可为空， 
>
> 当为空时，则默认执行ConvertJSONToSQL处理器提供的SQL。
>
> 当该参数不为空时，则忽略ConvertJSONToSQL处理器提供的SQL，只取其数据。
>
> 本需求场景下，此处建议置空；

```SQL
REPLACE INTO Commitments (
	ContentId,
	Title,
	Creator,
	Modifier,
	CreateDate,
	LastModDate,
	WeekOfYear
)
VALUES
	(?, ?, ?, ?, ?, ?, ?)
```

### 整体流程如图：

![](https://upload-images.jianshu.io/upload_images/12325689-931d0165875a84da.png?imageMogr2/auto-orient/strip%7CimageView2/2/w/1240)

## 定期（每天）导入贡献记录

### 获取数据（ExecuteSQL）

SCHEDULING

| Scheduling Strategy | Timer driven |
| ------------------- | ------------ |
| Run Schedule        | 1 days       |
| Execution           | Primary node |
| Concurrent Tasks    | 1            |

PROPERTIES

| Property                            | Value                                        |
| ----------------------------------- | -------------------------------------------- |
| Database Connection Pooling Service | DBCPForConfluence(见上文Controller Service） |
| SQL select query                    | 代码见下文                                   |
| Max Wait Time                       | 0 seconds                                    |
| Normalize Table/Column Names        | false                                        |
| Use Avro Logical Types              | false                                        |
| Default Decimal Precision           | 10                                           |
| Default Decimal Scale               | 0                                            |

```SQL
SELECT
	a.CONTENTID,
	a.TITLE,
	b.USERNAME AS CREATOR,
	c.USERNAME AS MODIFIER,
	a.CREATIONDATE AS CREATEDATE,
	a.LASTMODDATE,
	YEARWEEK(a.LASTMODDATE) AS WeekOfYear
FROM
	CONTENT a
LEFT JOIN user_mapping b ON a.CREATOR = b.user_key
LEFT JOIN user_mapping c ON a.LASTMODIFIER = c.user_key
WHERE
	a.CONTENTTYPE = 'PAGE'
AND a.spaceid = 98306
AND a.title IS NOT NULL
AND a.PARENTID IS NOT NULL
AND WEEK (a.CREATIONDATE) = WEEK (CURRENT_DATE())
ORDER BY
	WeekOfYear DESC,
	modifier DESC,
	LASTMODDATE;
```

后续处理器配置同全量导入即可（见上文）；

整体流程如下图：

![](https://upload-images.jianshu.io/upload_images/12325689-88ab15e23944d204.png?imageMogr2/auto-orient/strip%7CimageView2/2/w/1240)



## SuperSet相关设置：

### 设置方法

> 参见[superset-数据源-数据库-Demo](http://47.96.97.244:8090/pages/viewpage.action?pageId=2457686&src=contextnavpagetreemode)

### 效果

Dashboard连接： http://192.168.1.38:8088/superset/dashboard/8/?preselect_filters=%7B%7D

账户： admin/admin     or     wiki/wiki

![1534839560(wiki可视化小工具.assets/1534839560(1)-1534839726109.jpg)](../../../../../Desktop/1534839560(1).jpg)

## 遗留问题

如图，条形图没法按照【YearWeek】逆序排列。