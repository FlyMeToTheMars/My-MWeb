



## 建表sql

### 收料确认表表头

```SQL
CREATE TABLE TC_WDE_FILE (
	CDANHAO VARCHAR (30) NOT NULL COMMENT '收料确认单号',
	TC_WDE20 DATE NULL COMMENT '收料确认时间',
	TC_WDE21 VARCHAR (50) COMMENT '收料人员',
	TC_WDE200 VARCHAR (1) COMMENT '状态',
	CFLAG VARCHAR (1) COMMENT '单据性质',
	TC_WDE51 VARCHAR (50) NULL COMMENT '备用字段1',
	TC_WDE52 VARCHAR (50) NULL COMMENT '备用字段2',
	TC_WDE53 VARCHAR (50) NULL COMMENT '备用字段3',
	TC_WDE54 VARCHAR (50) NULL COMMENT '备用字段4'
) COMMENT = '收料确认表表头';

ALTER TABLE TC_WDE_FILE ADD CONSTRAINT TC_WDE_PK PRIMARY KEY TC_WDE_FILE (CDANHAO);
```

### 收料确认表表体

```SQL
CREATE TABLE TC_WDF_FILE (
	CDANHAO VARCHAR (30) NOT NULL COMMENT '收料单号',
	CBARCODENO VARCHAR (128) NOT NULL COMMENT '条码信息',
	CBOXID VARCHAR (30) NULL COMMENT '箱码 ',
	CPRODUCENO VARCHAR (50) NULL COMMENT '品号 ',
	CPRODUCENAME VARCHAR (100) NULL COMMENT '品名 ',
	CGUIGE VARCHAR (200) NULL COMMENT '规格 ',
	CDC VARCHAR (12) NULL COMMENT 'DC ',
	IQTY DOUBLE(18, 4) NULL COMMENT '数量 ',
	TC_WDF20 DATE NULL COMMENT '收料确认时间',
	TC_WDF21 VARCHAR (50) NULL COMMENT '收料人员',
	TC_WDF200 VARCHAR (1) NULL COMMENT '状态',
	CFLAG VARCHAR (1) NULL COMMENT '单据性质',
	TC_WDF51 VARCHAR (50) NULL COMMENT '质检货位 ',
	TC_WDF52 VARCHAR (50) NULL COMMENT '备用字段2 ',
	TC_WDF53 VARCHAR (50) NULL COMMENT '备用字段3 ',
	TC_WDF54 VARCHAR (50) NULL COMMENT '备用字段4 '
) COMMENT = '收料确认表表身';
ALTER TABLE TC_WDF_FILE ADD CONSTRAINT TC_WDF_PK PRIMARY KEY TC_WDF_PK (CDANHAO,CBARCODENO);
alter table TC_WDF_FILE add  constraint TC_WDF_PK foreign key (CDANHAO)  references TC_WDE_FILE (CDANHAO);
CREATE INDEX index_TC_WDF_FILE ON TC_WDF_FILE (
	CDANHAO,
	CBARCODENO,
	CBOXID,
	CPRODUCENO,
	CDC ASC
);


```

### 入库表表头

```SQL
CREATE TABLE TC_WDA_FILE (
	CDANHAO VARCHAR (30) NOT NULL COMMENT '来源单号',
	CGYSNO VARCHAR (50) NULL COMMENT '供应商编码',
	CCANGKUNO VARCHAR (20) NULL COMMENT '仓库',
	CFLAG VARCHAR (20) NULL COMMENT '单据性质',
	TC_WDA20 DATE NULL COMMENT '入库时间',
	TC_WDA21 VARCHAR (50) NULL COMMENT '入库人员',
	TC_WDA200 VARCHAR (1) NULL COMMENT '状态',
	TC_WDA51 VARCHAR (50) NULL COMMENT '备用字段1',
	TC_WDA52 VARCHAR (50) NULL COMMENT '备用字段2',
	TC_WDA53 VARCHAR (50) NULL COMMENT '备用字段3',
	TC_WDA54 VARCHAR (50) NULL COMMENT '备用字段4'
) COMMENT = '入库表表头';

ALTER TABLE TC_WDA_FILE ADD CONSTRAINT TC_WDA_PK PRIMARY KEY TC_WDA_PK (CDANHAO);
```



### 入库表表体

```SQL
CREATE TABLE TC_WDB_FILE (
	CDANHAO VARCHAR (30) NOT NULL COMMENT '来源单号',
	CPRODUCENO VARCHAR (50) NULL COMMENT '品号',
	CPRODUCENAME VARCHAR (100) NULL COMMENT '品名',
	CWHCODE VARCHAR (10) NULL COMMENT '仓库编码',
	CHUOJIANO VARCHAR (20) NULL COMMENT '货位编码',
	CBARCODENO VARCHAR (128) NULL COMMENT '条码信息',
	CBOXID VARCHAR (30) NULL COMMENT '箱码',
	CPALLETNO VARCHAR (20) NULL COMMENT '栈板码',
	CDC VARCHAR (12) NULL COMMENT 'DC',
	IQTY DECIMAL (18, 4) NULL COMMENT '入库数量',
	CFLAG VARCHAR (20) NULL COMMENT '单据性质',
	TC_WDB20 DATE NULL COMMENT '入库时间',
	TC_WDB21 VARCHAR (20) NULL COMMENT '入库人员',
	TC_WDB200 CHAR (1) NULL COMMENT '状态',
	TC_WDB51 VARCHAR (50) NULL COMMENT '备用字段1',
	TC_WDB52 VARCHAR (50) NULL COMMENT '备用字段2',
	TC_WDB53 VARCHAR (50) NULL COMMENT '备用字段3',
	TC_WDB54 VARCHAR (50) NULL COMMENT '备用字段4'
) COMMENT = '入库表表体';
ALTER TABLE TC_WDB_FILE ADD CONSTRAINT TC_WDB_PK PRIMARY KEY TC_WDB_PK (CDANHAO,CBARCODENO);
alter table TC_WDB_FILE add  constraint TC_WDB_PK foreign key (CDANHAO)  references TC_WDA_FILE (CDANHAO);
CREATE INDEX index_TC_WDB_FILE ON TC_WDB_FILE (
	CDANHAO,
	CPRODUCENO,
	CBARCODENO,
	CBOXID,
	CPALLETNO,
	CDC,
	CHUOJIANO ASC
);


```



### 出库表表头

```SQL
CREATE TABLE TC_WDC_FILE (
	CDANHAO VARCHAR (20) NOT NULL COMMENT '单号',
	TC_WDC20 DATE COMMENT '发料时间',
	TC_WDC21 VARCHAR (50) COMMENT '发料人',
	TC_WDC200 VARCHAR (1) COMMENT '状态',
	CFLAG VARCHAR (1) COMMENT '单据性质',
	TC_WDC51 VARCHAR (50) NULL COMMENT '备用字段1',
	TC_WDC52 VARCHAR (50) NULL COMMENT '备用字段2',
	TC_WDC53 VARCHAR (50) NULL COMMENT '备用字段3',
	TC_WDC54 VARCHAR (50) NULL COMMENT '备用字段4'
) COMMENT = '出库表表头';

ALTER TABLE TC_WDC_FILE ADD CONSTRAINT TC_WDC_PK PRIMARY KEY TC_WDC_PK (CDANHAO);


```

### 出库表表体

```SQL
CREATE TABLE TC_WDD_FILE (
	CDANHAO VARCHAR (30) NOT NULL COMMENT '单号',
	CBARCODENO VARCHAR (128) NOT NULL COMMENT '条码信息',
	CBOXID VARCHAR (30) NULL COMMENT '箱码',
	CPALLETNO VARCHAR (20) NULL COMMENT '栈板码',
	CPRODUCENO VARCHAR (50) NULL COMMENT '品号',
	CPRODUCENAME VARCHAR (100) NULL COMMENT '品名',
	CGUIGE VARCHAR (200) NULL COMMENT '规格',
	CWHCODE VARCHAR (10) NULL COMMENT '仓库编码',
	CHUOJIANO VARCHAR (20) NULL COMMENT '货位编码',
	CGYS VARCHAR (200) NULL COMMENT '供应商',
	CDC VARCHAR (12) NULL COMMENT 'DC',
	IQTY DOUBLE (18, 4) NULL COMMENT '打印数量',
	TC_WDD20 DATE COMMENT '发料时间',
	TC_WDD21 VARCHAR (50) COMMENT '收料人员',
	TC_WDD200 VARCHAR (1) COMMENT '状态',
	CFLAG VARCHAR (1) COMMENT '单据性质',
	TC_WDD51 VARCHAR (50) NULL COMMENT '备用字段1',
	TC_WDD52 VARCHAR (50) NULL COMMENT '备用字段2',
	TC_WDD53 VARCHAR (50) NULL COMMENT '备用字段3',
	TC_WDD54 VARCHAR (50) NULL COMMENT '备用字段4'
) COMMENT = '出库表表体';
ALTER TABLE TC_WDD_FILE ADD CONSTRAINT TC_WDD_PK PRIMARY KEY TC_WDD_PK (CDANHAO,CBARCODENO);
alter table TC_WDD_FILE add  constraint TC_WDD_PK foreign key (CDANHAO)  references TC_WDC_FILE (CDANHAO);
CREATE INDEX index_TC_WDD_FILE ON TC_WDD_FILE (
	CDANHAO,
	CBARCODENO,
	CBOXID,
	CPALLETNO,
	CPRODUCENO,
	CDC,
	CHUOJIANO ASC
);


```

### 条码主档(库存信息)

```SQL
CREATE TABLE TC_WIA_FILE (
	CBARCODENO VARCHAR (128) NOT NULL COMMENT '条码信息',
	CBOXID VARCHAR (30) NULL COMMENT '箱码',
	CPALLETNO VARCHAR (20) NULL COMMENT '栈板码',
	CPRODUCENO VARCHAR (50) NULL COMMENT '品号',
	CPRODUCENAME VARCHAR (100) NULL COMMENT '品名',
	CGUIGE VARCHAR (200) NULL COMMENT '规格',
	CWHCODE VARCHAR (10) NULL COMMENT '仓库编码',
	CHUOJIANO VARCHAR (20) NULL COMMENT '货位编码',
	CGYS VARCHAR (200) NULL COMMENT '供应商',
	IQTY DOUBLE (18, 4) DEFAULT 0 COMMENT '打印数量',
	IQTY_SL DOUBLE (18, 4) DEFAULT 0 COMMENT '收料数量',
	IQTY_RK DOUBLE (18, 4) DEFAULT 0 COMMENT '入库数量',
	IQTY_JH DOUBLE (18, 4) DEFAULT 0 COMMENT '拣货数量',
	IQTY_CK DOUBLE (18, 4) DEFAULT 0 COMMENT '出库数量',
	CDC VARCHAR (12) NULL COMMENT 'DC',
	IYCDAYS DOUBLE DEFAULT 0 COMMENT '延长天数',
	CLOTNO VARCHAR (40) NULL COMMENT 'LOTNO',
	LOCKFLAG VARCHAR (10) DEFAULT 'N' COMMENT '锁定状态',
	TC_WIA106 VARCHAR (1) COMMENT '料件型态, 1.原料 2.半成品 3.成品  5.物料 6.客供品 7.转运用成品 (暂时不启用) ',
	TC_WIA20 DATE NULL COMMENT '创建时间',
	TC_WIA21 VARCHAR (20) NULL COMMENT '创建人原',
	TC_WIA51 VARCHAR (50) NULL COMMENT '成品箱型',
	TC_WIA52 VARCHAR (50) NULL COMMENT '单号',
	TC_WIA53 VARCHAR (50) NULL COMMENT '备注',
	TC_WIA54 DOUBLE (18, 4) DEFAULT 0 COMMENT 'HID415不良数量'
) COMMENT = '条码主档(库存信息)';

ALTER TABLE TC_WIA_FILE ADD CONSTRAINT TC_WIA_PK PRIMARY KEY TC_WIA_PK (CBARCODENO);

CREATE INDEX index_TC_WIA_FILE ON TC_WIA_FILE (
	CBARCODENO,
	CBOXID,
	CPALLETNO,
	CPRODUCENO,
	CWHCODE,
	CHUOJIANO,
	IQTY_RK,
	IQTY_CK,
	CDC,
	LOCKFLAG,
	CGYS,
	IQTY,
	TC_WIA20 ASC
);


```































### 原材料最小包装数量

```SQL
create table `原材料最小包装数量` (
`IMA01`varchar(20) not NULL,
`IMA02`varchar(20) NULL,
`IMA021`varchar(20) NULL,
`IMA03`varchar(20) NULL,
`IMA04`varchar(20) NULL,
`IMA05`varchar(20) NULL,
`IMA06`varchar(20) NULL,
`IMA07`varchar(20) NULL,
`IMA08`varchar(20) NULL,
`IMA09`varchar(20) NULL,
`IMA10`varchar(20) NULL,
`IMA11`varchar(20) NULL,
`IMA12`varchar(20) NULL,
`IMA13`varchar(20) NULL,
`IMA14`varchar(20) NULL,
`IMA15`varchar(20) NULL,
`IMA16`varchar(20) NULL,
`IMA17`varchar(20) NULL,
`IMA17_FAC`varchar(20) NULL,
`IMA18`varchar(20) NULL,
`IMA19`varchar(20) NULL,
`IMA20`varchar(20) NULL,
`IMA21`varchar(20) NULL,
`IMA22`varchar(20) NULL,
`IMA23`varchar(20) NULL,
`IMA24`varchar(20) NULL,
`IMA25`varchar(20) NULL,
`IMA26`varchar(20) NULL,
`IMA261`varchar(20) NULL,
`IMA262`varchar(20) NULL,
`IMA27`varchar(20) NULL,
`IMA271`varchar(20) NULL,
`IMA28`varchar(20) NULL,
`IMA29`varchar(20) NULL,
`IMA30`varchar(20) NULL,
`IMA31`varchar(20) NULL,
`IMA31_FAC`varchar(20) NULL,
`IMA32`varchar(20) NULL,
`IMA33`varchar(20) NULL,
`IMA34`varchar(20) NULL,
`IMA35`varchar(20) NULL,
`IMA36`varchar(20) NULL,
`IMA37`varchar(20) NULL,
`IMA38`varchar(20) NULL,
`IMA39`varchar(20) NULL,
`IMA40`varchar(20) NULL,
`IMA41`varchar(20) NULL,
`IMA42`varchar(20) NULL,
`IMA43`varchar(20) NULL,
`IMA44`varchar(20) NULL,
`IMA44_FAC`varchar(20) NULL,
`IMA45`varchar(20) NULL,
`IMA46`varchar(20) NULL,
`IMA47`varchar(20) NULL,
`IMA48`varchar(20) NULL,
`IMA49`varchar(20) NULL,
`IMA491`varchar(20) NULL,
`IMA50`varchar(20) NULL,
`IMA51`varchar(20) NULL,
`IMA52`varchar(20) NULL,
`IMA53`varchar(20) NULL,
`IMA531`varchar(20) NULL,
`IMA532`varchar(20) NULL,
`IMA54`varchar(20) NULL,
`IMA55`varchar(20) NULL,
`IMA55_FAC`varchar(20) NULL,
`IMA56`varchar(20) NULL,
`IMA561`varchar(20) NULL,
`IMA562`varchar(20) NULL,
`IMA57`varchar(20) NULL,
`IMA571`varchar(20) NULL,
`IMA58`varchar(20) NULL,
`IMA59`varchar(20) NULL,
`IMA60`varchar(20) NULL,
`IMA61`varchar(20) NULL,
`IMA62`varchar(20) NULL,
`IMA63`varchar(20) NULL,
`IMA63_FAC`varchar(20) NULL,
`IMA64`varchar(20) NULL,
`IMA641`varchar(20) NULL,
`IMA65`varchar(20) NULL,
`IMA66`varchar(20) NULL,
`IMA67`varchar(20) NULL,
`IMA68`varchar(20) NULL,
`IMA69`varchar(20) NULL,
`IMA70`varchar(20) NULL,
`IMA71`varchar(20) NULL,
`IMA72`varchar(20) NULL,
`IMA73`varchar(20) NULL,
`IMA74`varchar(20) NULL,
`IMA86`varchar(20) NULL,
`IMA86_FAC`varchar(20) NULL,
`IMA87`varchar(20) NULL,
`IMA871`varchar(20) NULL,
`IMA872`varchar(20) NULL,
`IMA873`varchar(20) NULL,
`IMA874`varchar(20) NULL,
`IMA88`varchar(20) NULL,
`IMA881`varchar(20) NULL,
`IMA89`varchar(20) NULL,
`IMA90`varchar(20) NULL,
`IMA91`varchar(20) NULL,
`IMA92`varchar(20) NULL,
`IMA93`varchar(20) NULL,
`IMA94`varchar(20) NULL,
`IMA95`varchar(20) NULL,
`IMA75`varchar(20) NULL,
`IMA76`varchar(20) NULL,
`IMA77`varchar(20) NULL,
`IMA78`varchar(20) NULL,
`IMA79`varchar(20) NULL,
`IMA80`varchar(20) NULL,
`IMA81`varchar(20) NULL,
`IMA82`varchar(20) NULL,
`IMA83`varchar(20) NULL,
`IMA84`varchar(20) NULL,
`IMA85`varchar(20) NULL,
`IMA851`varchar(20) NULL,
`IMA852`varchar(20) NULL,
`IMA853`varchar(20) NULL,
`IMA96`varchar(20) NULL,
`IMA97`varchar(20) NULL,
`IMA98`varchar(20) NULL,
`IMA99`varchar(20) NULL,
`IMA100`varchar(20) NULL,
`IMA101`varchar(20) NULL,
`IMA102`varchar(20) NULL,
`IMA103`varchar(20) NULL,
`IMA104`varchar(20) NULL,
`IMA105`varchar(20) NULL,
`IMA106`varchar(20) NULL,
`IMA107`varchar(20) NULL,
`IMA108`varchar(20) NULL,
`IMA109`varchar(20) NULL,
`IMA110`varchar(20) NULL,
`IMA111`varchar(20) NULL,
`IMA121`varchar(20) NULL,
`IMA122`varchar(20) NULL,
`IMA123`varchar(20) NULL,
`IMA124`varchar(20) NULL,
`IMA125`varchar(20) NULL,
`IMA126`varchar(20) NULL,
`IMA127`varchar(20) NULL,
`IMA128`varchar(20) NULL,
`IMA129`varchar(20) NULL,
`IMA130`varchar(20) NULL,
`IMA131`varchar(20) NULL,
`IMA132`varchar(20) NULL,
`IMA133`varchar(20) NULL,
`IMA134`varchar(20) NULL,
`IMA135`varchar(20) NULL,
`IMA136`varchar(20) NULL,
`IMA137`varchar(20) NULL,
`IMA138`varchar(20) NULL,
`IMA139`varchar(20) NULL,
`IMA140`varchar(20) NULL,
`IMA141`varchar(20) NULL,
`IMA142`varchar(20) NULL,
`IMA143`varchar(20) NULL,
`IMA144`varchar(20) NULL,
`IMA145`varchar(20) NULL,
`IMA146`varchar(20) NULL,
`IMA147`varchar(20) NULL,
`IMA148`varchar(20) NULL,
`IMA901`varchar(20) NULL,
`IMA902`varchar(20) NULL,
`IMA903`varchar(20) NULL,
`IMA904`varchar(20) NULL,
`IMA905`varchar(20) NULL,
`IMA906`varchar(20) NULL,
`IMA907`varchar(20) NULL,
`IMA908`varchar(20) NULL,
`IMA909`varchar(20) NULL,
`IMA910`varchar(20) NULL,
`IMAACTI`varchar(20) NULL,
`IMAUSER`varchar(20) NULL,
`IMAGRUP`varchar(20) NULL,
`IMAMODU`varchar(20) NULL,
`IMADATE`varchar(20) NULL,
`IMAAG`varchar(20) NULL,
`IMAAG1`varchar(20) NULL,
`IMAUD01`varchar(20) NULL,
`IMAUD02`varchar(20) NULL,
`IMAUD03`varchar(20) NULL,
`IMAUD04`varchar(20) NULL,
`IMAUD05`varchar(20) NULL,
`IMAUD06`varchar(20) NULL,
`IMAUD07`varchar(20) NULL,
`IMAUD08`varchar(20) NULL,
`IMAUD09`varchar(20) NULL,
`IMAUD10`varchar(20) NULL,
`IMAUD11`varchar(20) NULL,
`IMAUD12`varchar(20) NULL,
`IMAUD13`varchar(20) NULL,
`IMAUD14`varchar(20) NULL,
`IMAUD15`varchar(20) NULL,
`IMA1001`varchar(20) NULL,
`IMA1002`varchar(20) NULL,
`IMA1003`varchar(20) NULL,
`IMA1004`varchar(20) NULL,
`IMA1005`varchar(20) NULL,
`IMA1006`varchar(20) NULL,
`IMA1007`varchar(20) NULL,
`IMA1008`varchar(20) NULL,
`IMA1009`varchar(20) NULL,
`IMA1010`varchar(20) NULL,
`IMA1011`varchar(20) NULL,
`IMA1012`varchar(20) NULL,
`IMA1013`varchar(20) NULL,
`IMA1014`varchar(20) NULL,
`IMA1015`varchar(20) NULL,
`IMA1016`varchar(20) NULL,
`IMA1017`varchar(20) NULL,
`IMA1018`varchar(20) NULL,
`IMA1019`varchar(20) NULL,
`IMA1020`varchar(20) NULL,
`IMA1021`varchar(20) NULL,
`IMA1022`varchar(20) NULL,
`IMA1023`varchar(20) NULL,
`IMA1024`varchar(20) NULL,
`IMA1025`varchar(20) NULL,
`IMA1026`varchar(20) NULL,
`IMA1027`varchar(20) NULL,
`IMA1028`varchar(20) NULL,
`IMA1029`varchar(20) NULL,
`IMA911`varchar(20) NULL,
`IMA912`varchar(20) NULL,
`IMA913`varchar(20) NULL,
`IMA914`varchar(20) NULL,
`IMA391`varchar(20) NULL,
`IMA1321`varchar(20) NULL,
`IMA1911`varchar(20) NULL,
`IMA1912`varchar(20) NULL,
`IMA1913`varchar(20) NULL,
`IMA1914`varchar(20) NULL,
`IMA1915`varchar(20) NULL,
`IMA1916`varchar(20) NULL,
`IMA1919`varchar(20) NULL,
`IMA1401`varchar(20) NULL,
`IMA915`varchar(20) NULL,
`IMA916`varchar(20) NULL,
`IMA917`varchar(20) NULL,
`IMA150`varchar(20) NULL,
`IMA151`varchar(20) NULL,
`IMA152`varchar(20) NULL,
`IMA918`varchar(20) NULL,
`IMA919`varchar(20) NULL,
`IMA920`varchar(20) NULL,
`IMA921`varchar(20) NULL,
`IMA922`varchar(20) NULL,
`IMA923`varchar(20) NULL,
`IMA924`varchar(20) NULL,
`IMA925`varchar(20) NULL,
`IMA601`varchar(20) NULL,
`IMA153`varchar(20) NULL,
`IMA926`varchar(20) NULL,
`IMA154`varchar(20) NULL,
`IMA155`varchar(20) NULL,
`IMA149`varchar(20) NULL,
`IMA1491`varchar(20) NULL,
`IMAORIU`varchar(20) NULL,
`IMAORIG`varchar(20) NULL,
`IMA9021`varchar(20) NULL,
`IMA022`varchar(20) NULL,
`IMA251`varchar(20) NULL,
`IMA940`varchar(20) NULL,
`IMA941`varchar(20) NULL,
`IMA156`varchar(20) NULL,
`IMA157`varchar(20) NULL,
`IMA158`varchar(20) NULL,
`IMA927`varchar(20) NULL,
`IMA120`varchar(20) NULL,
`IMA159`varchar(20) NULL,
`IMA928`varchar(20) NULL,
`IMA929`varchar(20) NULL,
`IMA160`varchar(20) NULL,
`IMA161`varchar(20) NULL,
`IMA162`varchar(20) NULL,
`IMA163`varchar(20) NULL,
`IMA1631`varchar(20) NULL,
`IMA721`varchar(20) NULL,
`IMA171`varchar(20) NULL,
`IMA172`varchar(20) NULL,
`IMA1030`varchar(20) NULL,
`IMA930`varchar(20) NULL,
`IMA931`varchar(20) NULL,
`IMA932`varchar(20) NULL,
`IMA933`varchar(20) NULL,
`IMA934`varchar(20) NULL,
`IMA164`varchar(20) NULL,
`IMA1641`varchar(20) NULL,
`TB_IMA200`varchar(20) NULL,
`TB_IMA201`varchar(20) NULL,
`TB_IMA202`varchar(20) NULL,
`TB_IMA203`varchar(20) NULL,
`TB_IMA204`varchar(20) NULL,
`TB_IMA205`varchar(20) NULL,
`TB_IMA206`varchar(20) NULL,
`TB_IMA207`varchar(20) NULL,
`TB_IMA208`varchar(20) NULL,
`TB_IMA209`varchar(20) NULL,
`IMAUD16`varchar(20) NULL,
`IMAUD17`varchar(20) NULL,
`IMAUD18`varchar(20) NULL,
`IMAUD19`varchar(20) NULL,
`IMAUD20`varchar(20) NULL,
`IMAUD21`varchar(20) NULL,
`IMAUD22`varchar(20) NULL,
`TA_IMA01`varchar(20) NULL,
`TA_IMA02`varchar(20) NULL,
`TA_IMA03`varchar(20) NULL,
`TA_IMA04`varchar(20) NULL,
`TA_IMA05`varchar(20) NULL,
`TA_IMA06`varchar(20) NULL,
`TA_IMA07`varchar(20) NULL,
`TA_IMA08`varchar(20) NULL,
`TA_IMA09`varchar(20) NULL,
`TA_IMA10`varchar(20) NULL,
`TA_IMA11`varchar(20) NULL,
`TA_IMA12`varchar(20) NULL,
`TA_IMA13`varchar(20) NULL,
`TA_IMA14`varchar(20) NULL,
`TA_IMA15`varchar(20) NULL,
`TA_IMA16`varchar(20) NULL,
`TA_IMA17`varchar(20) NULL,
primary key(`IMA01`)
);
```





## Staging

调用ESB接口，将数据文件拉到Staging；

> ESB接口提供的数据格式？是文件下载？还是数据对象？ staging数据拉到HDFS或者通过NiFi拉到集群本地目录？还是可以直接写入Mysql？
>
> 本Demo假设已经通过ESB调用获取到了csv数据文件并存入本地文件系统
>
>

### ESB数据获取接口定义

#### master data(基础数据)

#### operational data(运营数据)





### NiFi导入mysql

#### 方式一：ConvertJsonToSQL --> PutSQL

整体流程： 

GetFile--InferAvroSchema--ConvertCSVToAvro--SpliteAvro--ConvertRecord--ConvertJsonToSQL--PutSQL

| 处理器           | 用途说明                                                     |
| ---------------- | ------------------------------------------------------------ |
| GetFile          | 获取源数据，本案例为CSV文件，可替换为其他Get处理器或者使用List+Fetch处理器替代 |
| InferAvroSchema  | 向FlowFile写入schema信息，此处可以根据文件首行来确定字段信息（注：字段以`,`分割，不要加双引号！） |
| ConvertCSVToAvro | 文件格式转化，将CSV转化为Avro文件，后续操作需要              |
| SpliteAvro       | 切分Avro文件，减轻后续任务的压力，另外细化数据粒度，可以更好的跟踪处理失败的数据切片 |
| ConvertRecord    | 将Avro数据文件转化为Json格式，为ConvertJsonToSQL做准备       |
| ConvertJsonToSQL | 将Json文件转化为SQL语句，并将参数写入到FlowFile的Attribute中（注：本方式中，该环节特别容易出现内存溢出错误！使用时需要多注意，详见：注意事项-->问题4） |
| PutSQL           | 执行SQL语句，将数据写入数据库                                |







#### 方式二：PutDatabaseRecord











## DataWarehouse



### 数据模型构建

本例中只有两张表：

分别为：

收料确认表表头

```SQL
CREATE TABLE TC_WDE_FILE (
	CDANHAO VARCHAR (30) NOT NULL COMMENT '收料确认单号',
	TC_WDE20 DATE NULL COMMENT '收料确认时间',
	TC_WDE21 VARCHAR (50) COMMENT '收料人员',
	TC_WDE200 VARCHAR (1) COMMENT '状态',
	CFLAG VARCHAR (1) COMMENT '单据性质',
	TC_WDE51 VARCHAR (50) NULL COMMENT '备用字段1',
	TC_WDE52 VARCHAR (50) NULL COMMENT '备用字段2',
	TC_WDE53 VARCHAR (50) NULL COMMENT '备用字段3',
	TC_WDE54 VARCHAR (50) NULL COMMENT '备用字段4'
) COMMENT = '收料确认表表头';
ALTER TABLE TC_WDE_FILE ADD CONSTRAINT TC_WDE_PK PRIMARY KEY TC_WDE_FILE (CDANHAO);
```

收料确认表表体

```SQL
CREATE TABLE TC_WDF_FILE (
	CDANHAO VARCHAR (30) NOT NULL COMMENT '收料单号',
	CBARCODENO VARCHAR (128) NOT NULL COMMENT '条码信息',
	CBOXID VARCHAR (30) NULL COMMENT '箱码 ',
	CPRODUCENO VARCHAR (50) NULL COMMENT '品号 ',
	CPRODUCENAME VARCHAR (100) NULL COMMENT '品名 ',
	CGUIGE VARCHAR (200) NULL COMMENT '规格 ',
	CDC VARCHAR (12) NULL COMMENT 'DC ',
	IQTY DOUBLE(18, 4) NULL COMMENT '数量 ',
	TC_WDF20 DATE NULL COMMENT '收料确认时间',
	TC_WDF21 VARCHAR (50) NULL COMMENT '收料人员',
	TC_WDF200 VARCHAR (1) NULL COMMENT '状态',
	CFLAG VARCHAR (1) NULL COMMENT '单据性质',
	TC_WDF51 VARCHAR (50) NULL COMMENT '质检货位 ',
	TC_WDF52 VARCHAR (50) NULL COMMENT '备用字段2 ',
	TC_WDF53 VARCHAR (50) NULL COMMENT '备用字段3 ',
	TC_WDF54 VARCHAR (50) NULL COMMENT '备用字段4 '
) COMMENT = '收料确认表表身';
alter table TC_WDF_FILE add  constraint TC_WDF_PK foreign key (CDANHAO)  references TC_WDE_FILE (CDANHAO);
CREATE INDEX index_TC_WDF_FILE ON TC_WDF_FILE (CDANHAO,CBARCODENO,CBOXID,CPRODUCENO,CDC ASC);
```

#### Hub实体表

| 实体                  | 业务主键                                |
| --------------------- | --------------------------------------- |
| hub_wde收料确认表表头 | CDANHAO收料确认单号                     |
| hub_wdf收料确认表表体 | CDANHAO收料单号<br />CBARCODENO条码信息 |

#### Link链接表

| **链接表**   | **被链接的中心表**     |
| ------------ | ---------------------- |
| link_wde_wdf | hub_tc_wde，hub_tc_wdf |

#### Sat附属表

| **附属表** | **描述**             |
| ---------- | -------------------- |
| sat_wde    | 收料确认表表头附属表 |
| sat_wdf    | 收料确认表表体附属表 |

#### Data Vault数据库表脚本

```SQL
-- 新建中心表
CREATE TABLE hub_wde (
	hub_wde_id INT auto_increment PRIMARY KEY,
	CDANHAO VARCHAR (30),
	load_dts TIMESTAMP,
	record_source VARCHAR (255)
);

CREATE TABLE hub_wdf (
	hub_wdf_id INT auto_increment PRIMARY KEY,
	CDANHAO VARCHAR (30),
	CBARCODENO VARCHAR (128),
	load_dts TIMESTAMP,
	record_source VARCHAR (255)
);

-- 新建链接表
CREATE TABLE link_wde_wdf (
	link_wde_wdf_id INT auto_increment PRIMARY KEY,
	hub_wde_id INT,
	hub_wdf_id INT,
	load_dts TIMESTAMP,
	record_source VARCHAR (255),
	FOREIGN KEY (hub_wde_id) REFERENCES hub_wde (hub_wde_id),
	FOREIGN KEY (hub_wdf_id) REFERENCES hub_wdf (hub_wdf_id)
);

-- 新建附属表
CREATE TABLE sat_wde (
	sat_wde_id INT auto_increment PRIMARY KEY,
	hub_wde_id INT,
	load_dts TIMESTAMP NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP COMMENT '入库时间',
	load_end_dts TIMESTAMP NULL,
	record_source VARCHAR (255),
	CDANHAO VARCHAR (30) NOT NULL COMMENT '收料确认单号',
	TC_WDE20 DATE NULL COMMENT '收料确认时间',
	TC_WDE21 VARCHAR (50) COMMENT '收料人员',
	TC_WDE200 VARCHAR (1) COMMENT '状态',
	CFLAG VARCHAR (1) COMMENT '单据性质',
	TC_WDE51 VARCHAR (50) NULL COMMENT '备用字段1',
	TC_WDE52 VARCHAR (50) NULL COMMENT '备用字段2',
	TC_WDE53 VARCHAR (50) NULL COMMENT '备用字段3',
	TC_WDE54 VARCHAR (50) NULL COMMENT '备用字段4',
	FOREIGN KEY (hub_wde_id) REFERENCES hub_wde (hub_wde_id)
);

CREATE TABLE sat_wdf (
	sat_wdf_id INT auto_increment PRIMARY KEY,
	hub_wdf_id INT,
	load_dts TIMESTAMP NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP COMMENT '入库时间',
	load_end_dts TIMESTAMP NULL,
	record_source VARCHAR (100),
	product_catagory_name VARCHAR (20),
	CDANHAO VARCHAR (30) NOT NULL COMMENT '收料单号',
	CBARCODENO VARCHAR (128) NOT NULL COMMENT '条码信息',
	CBOXID VARCHAR (30) NULL COMMENT '箱码 ',
	CPRODUCENO VARCHAR (50) NULL COMMENT '品号 ',
	CPRODUCENAME VARCHAR (100) NULL COMMENT '品名 ',
	CGUIGE VARCHAR (200) NULL COMMENT '规格 ',
	CDC VARCHAR (12) NULL COMMENT 'DC ',
	IQTY DOUBLE (18, 4) NULL COMMENT '数量 ',
	TC_WDF20 DATE NULL COMMENT '收料确认时间',
	TC_WDF21 VARCHAR (50) NULL COMMENT '收料人员',
	TC_WDF200 VARCHAR (1) NULL COMMENT '状态',
	CFLAG VARCHAR (1) NULL COMMENT '单据性质',
	TC_WDF51 VARCHAR (50) NULL COMMENT '质检货位 ',
	TC_WDF52 VARCHAR (50) NULL COMMENT '备用字段2 ',
	TC_WDF53 VARCHAR (50) NULL COMMENT '备用字段3 ',
	TC_WDF54 VARCHAR (50) NULL COMMENT '备用字段4 ',
	FOREIGN KEY (hub_wdf_id) REFERENCES hub_wdf (hub_wdf_id)
);
```













### 装载数据









## 注意事项：

### 问题5 

CSV文件头行中字段的双引号需要去除，这样才能当表头！



### 问题4

在处理完问题3之后，可能出现文件数量过大导致仓库更新失败， 可以通过调整ConvertJsonToSQL的shedule属性解决。 本案例中设置为： `Run Schedule 2 sec ; Run Duration 50ms`

### 问题3

#### 场景

当数据量太大时，比如一个Jason文件三四百M，容易导致ConvertJsonToSQL处理器报内存溢出错误，导致节点挂掉。

#### 解决方法
首先需要先让该节点的nifi服务启动起来，处理方式参考问题2，重启完成后，调整ConvertJsonToSQL的输入流。


调整思路: 在ConvertJsonToSQL之前，将Json切分，既先调用splitJson切分好了再调用ConvertJsonToSQL，然而，这个时候还是出现OOM错误，原因应该还是json文件过大导致，切分过程生成几十万个json仍然出现内存溢出问题。

改变思路: 在转化成json之前就把文件切分好，即avro阶段就进行记录切分，可调用splitAvro处理器。切分完后，按照正常流程即可，整体流程为:
GetFile--InferAvroSchema--ConvertCSVToAvro--SpliteAvro--ConvertRecord--ConvertJsonToSQL--PutSQL





### 问题2

#### 场景

当处理数据过多，且配置不合理时，容易出现集群中某些节点出现OutOfMemory..

#### 处理方法（可能出现数据丢失）

找到内存溢出的节点，执行`rm -rf /opt/nifi-1.6.0/*repository` && `rm -rf /opt/nifi-1.6.0/logs`删除nifi数据仓库，然后执行：`/opt/nifi-1.6.0/bin/nifi.sh restart && tail -f /opt/nifi-1.6.0/logs/nifi-app.log`重启服务；



### 问题1:

#### 场景

当文件被getFile、或者ListFile以后，再次将文件放到input文件夹时，可能因为NiFi仓库已存在相应文件，导致如下错误

```
20:26:59 CSTERROR802d1fa3-0165-1000-ffff-ffffff13d5dd
machine001:9443GetFile[id=802d1fa3-0165-1000-ffff-ffffff13d5dd] Failed to retrieve files due to org.apache.nifi.processor.exception.ProcessException: FlowFile Repository failed to update: FlowFile Repository failed to update
```

处理方法： 

删除数据仓库：`rm -rf /opt/nifi-1.6.0/*repository`





## TIPS

1. 在DataVault2.0中，所有表的id改用hashkey（MD5生成或者SHA等其他算法生成， 这样做便于跨系统跨库时，保证hashKey不会变，而且生成的hashKey是定长字符串，有join等效率有优化效果！）

   > 详见《DataVault2.0》4.3.2.1小节