



## Step1:数据说明

host +  metric + time + value

记录每台机器在每个尺度，每秒钟的值是多少

比如：machine001机器在2018-07-01 00:00:00时候的CPU使用率是7%

| host       | metric | time                | value |
| ---------- | ------ | ------------------- | ----- |
| machine001 | CPU    | 2018-07-01 00:00:00 | 0.07  |

测试数据量： 77760000条

10个host， 10个metric， 从2018-07-01 00:00:00 - 2018-07-10 00:00:00 每秒记录一条





## Step2: 创建数据

使用Python脚本生成csv文件数据，方便使用。共生成77760000条数据

```python
#!/usr/bin/python3.4
# coding=utf-8
import datetime
import time
import random
import csv
import os;
import sys
# define const
MACHINECOUNT = 10
MERTICCOUNT = 10
BEGIN = '2018-07-01 00:00:00'
END = '2018-07-10 00:00:00'
# define machineList
machineList = []
for i in range(MACHINECOUNT):
    machineTemp = 'machine00%s' % (i)
    machineList.append(machineTemp)
# define merticList
merticList = []
for i in range(MERTICCOUNT):
    merticTemp = 'metric00%s' % (i)
    merticList.append(merticTemp)
# generate data
# convert to timestamp
startTimeStamp = int(time.mktime(time.strptime(BEGIN, "%Y-%m-%d %H:%M:%S")))
endTimeStamp = int(time.mktime(time.strptime(END, "%Y-%m-%d %H:%M:%S")))
for machineIndex in range(len(machineList)):
    for merticIndex in range(len(merticList)):
        machineMerticData = []
        for i in range(endTimeStamp - startTimeStamp):
            dataTuple = (machineList[machineIndex], merticList[merticIndex], startTimeStamp + i, float('%.2f' % random.uniform(0, 1)))
            machineMerticData.append(dataTuple)
        print(machineMerticData)
        with open(machineList[machineIndex] + '_' + merticList[merticIndex] + '.csv', 'w') as csvout:
            writer = csv.writer(csvout)
            writer.writerows(machineMerticData)
            csvout.close()

    # csvfile = open(machineList[machineIndex] + '.csv', 'wb')
    # writer = csv.writer(csvfile)
    # writer.writerow([b'title', b'summary', b'year', b'id', b'count', b'link'])
    # writer = csv.writer(sys.stdout)
    # for item in machineData:
    #     writer.writerow(item)
    # writer.writerows(machineData)
    # csvfile.close()

```



## Step3: 将数据存储到HDFS里面

```shell
# 在hdfs中创建文件夹 mertics （在当前目录中执行，红色为文件存储目录，蓝色为目标目录）

> hadoop fs -put ./*.csv /mertics

# 给Impala赋予读取hdfs的权限

> sudo -u hdfs hadoop fs -chown -R impala:impala hdfs://gateway002:8020/mertics

```

## Step4: 创建Kudu数据库表

```sql
# 使用CDH里面的Hue或者impala-shell执行建表语句
CREATE TABLE IF NOT EXISTS metrics (
    host STRING NOT NULL,
    metric STRING NOT NULL,
    time INT NOT NULL,
    value DOUBLE NOT NULL,
    PRIMARY KEY (host, metric, time)
)
PARTITION BY HASH(host, metric) PARTITIONS 10,
RANGE(time)
(
    PARTITION VALUES < 1530374400,
    PARTITION 1530374400 <= VALUES < 1530460800,
    PARTITION 1530460800 <= VALUES < 1530547200,
    PARTITION 1530547200 <= VALUES < 1530633600,
    PARTITION 1530633600 <= VALUES < 1530720000,
    PARTITION 1530720000 <= VALUES < 1530806400
)
STORED AS KUDU;
--- 继续执行，将其他的Range Partition 添加进去
ALTER TABLE metrics ADD RANGE PARTITION 1530806400 <= VALUES < 1530892800；
ALTER TABLE metrics ADD RANGE PARTITION 1530892800 <= VALUES < 1530979200；
ALTER TABLE metrics ADD RANGE PARTITION 1530979200 <= VALUES < 1531065600；
ALTER TABLE metrics ADD RANGE PARTITION 1531065600 <= VALUES < 1531152000；
ALTER TABLE metrics ADD RANGE PARTITION 1531152000 <= VALUES < 1531238399；
ALTER TABLE metrics ADD RANGE PARTITION 1531238399 <= VALUES；
```



> Tips
>
> ?为什么不直接在建表语句中直接添加全部的Range Partition？
>
> 因为Kudu1.4版本对tablet做了限制，不能超过 60 个，所以需要分开建
>
> Tablet 数量 = Hash Partition * Range Partition = 10 * 6 = 60
>
> 最终Table数量 = Hash Partition * Range Partition = 10 * 12 = 120

## Step5: 创建metric_raw表

用来存储HDFS中的数据，然后从metric_raw表直接往metric中插入

将HDFS中的数据先导入到Impala的External表中


```sql
 --- 创建metric_raw表并将HDFS中的数据直接导入到该表中
CREATE EXTERNAL TABLE metrics_raw (
    host STRING,
    metric STRING,    time INT,    value DOUBLE
)ROW FORMAT DELIMITED
FIELDS TERMINATED BY ','
 LOCATION '/mertics/'
TBLPROPERTIES ('skip.header.line.count'='0');

```

## Step6: 分批导入Kudu

将metric_raw表中的数据，查询出来之后，插入到metric表中

> ###### -- kudu 受限于内存大小，所以无法一次性插入大批量的数据，此处执行分批插入
>
> ###### insert into metrics select * from metrics_raw where host = 'machine000' and time >= 1530850000;
>
> ###### insert into metrics select * from metrics_raw where host = 'machine000' and time < 1530850000;
>
> ###### insert into metrics select * from metrics_raw where host = 'machine001' and time >= 1530850000;
>
> ###### insert into metrics select * from metrics_raw where host = 'machine001' and time < 1530850000;
>
> ###### insert into metrics select * from metrics_raw where host = 'machine002' and time < 1530850000;
>
> ###### insert into metrics select * from metrics_raw where host = 'machine002' and time >= 1530850000
>
> ###### insert into metrics select * from metrics_raw where host = 'machine003' and time < 1530850000;
>
> ###### insert into metrics select * from metrics_raw where host = 'machine003' and time >= 1530850000;
>
> ###### insert into metrics select * from metrics_raw where host = 'machine004' and time < 1530850000;
>
> ###### insert into metrics select * from metrics_raw where host = 'machine004' and time >= 1530850000;
>
> ###### insert into metrics select * from metrics_raw where host = 'machine005' and time < 1530850000;
>
> ###### insert into metrics select * from metrics_raw where host = 'machine005' and time >= 1530850000;
>
> ###### insert into metrics select * from metrics_raw where host = 'machine006' and time < 1530850000;
>
> ###### insert into metrics select * from metrics_raw where host = 'machine006' and time >= 1530850000;
>
> ###### insert into metrics select * from metrics_raw where host = 'machine007' and time < 1530850000;
>
> ###### insert into metrics select * from metrics_raw where host = 'machine007' and time >= 1530850000;
>
> ###### insert into metrics select * from metrics_raw where host = 'machine008' and time < 1530850000;
>
> ###### insert into metrics select * from metrics_raw where host = 'machine008' and time >= 1530850000;
>
> ###### insert into metrics select * from metrics_raw where host = 'machine009' and time < 1530850000;
>
> ###### insert into metrics select * from metrics_raw where host = 'machine009' and time >= 1530850000;

## Step7: 测试数据是否已经完全导入

全部数据导入完毕，然后可以通过执行查询语句，进行性能测试

如下图：性能测试表



 