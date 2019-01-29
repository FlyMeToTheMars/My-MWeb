

# Kudu +SparkSQL 集成实践

## SparkShell方式

### SparkShell启动方式

进入spark集群，执行以下命令：

Use the kudu-spark_2.10 artifact if using Spark with Scala 2.10

```
spark-shell --packages org.apache.kudu:kudu-spark_2.10:1.1.0
```

Use kudu-spark2_2.11 artifact if using Spark 2 with Scala 2.11

```
spark-shell --packages org.apache.kudu:kudu-spark2_2.11:1.1.0
```

> 具体执行那个语句，可以先启动`spark-shell`,查看版本号，然后`quit`,再选用上述命令；
>
> CZCluster中运行的Spark1.6时基于Scala2.10，故执行第一条命令即可；

### Spark SQL操作kudu：

```
import org.apache.kudu.spark.kudu._
import org.apache.kudu.client._
import collection.JavaConverters._

// Read a table from Kudu
val df = sqlContext.read.options(Map("kudu.master" -> "kudu.master:7051","kudu.table" -> "kudu_table")).kudu

// Query using the Spark API...
df.select("id").filter("id" >= 5).show()

// ...or register a temporary table and use SQL
df.registerTempTable("kudu_table")
val filteredDF = sqlContext.sql("select id from kudu_table where id >= 5").show()

// Use KuduContext to create, delete, or write to Kudu tables
val kuduContext = new KuduContext("kudu.master:7051", sqlContext.sparkContext)

// Create a new Kudu table from a dataframe schema
// NB: No rows from the dataframe are inserted into the table
kuduContext.createTable(
    "test_table", df.schema, Seq("key"),
    new CreateTableOptions()
        .setNumReplicas(1)
        .addHashPartitions(List("key").asJava, 3))

// Insert data
kuduContext.insertRows(df, "test_table")

// Delete data
kuduContext.deleteRows(filteredDF, "test_table")

// Upsert data
kuduContext.upsertRows(df, "test_table")

// Update data
val alteredDF = df.select("id", $"count" + 1)
kuduContext.updateRows(filteredRows, "test_table"

// Data can also be inserted into the Kudu table using the data source, though the methods on KuduContext are preferred
// NB: The default is to upsert rows; to perform standard inserts instead, set operation = insert in the options map
// NB: Only mode Append is supported
df.write.options(Map("kudu.master"-> "kudu.master:7051", "kudu.table"-> "test_table")).mode("append").kudu

// Check for the existence of a Kudu table
kuduContext.tableExists("another_table")

// Delete a Kudu table
kuduContext.deleteTable("unwanted_table")
```

> 进一步了解，参阅以下连接：
>
> [【Spark Summit EU 2016】Apache Kudu&Spark SQL](https://yq.aliyun.com/articles/69507)
>
> [Spark Summit EU 2016演讲](https://databricks.com/session/apache-kudu-and-spark-sql-for-fast-analytics-on-fast-data)



## 开发Spark应用，操作kudu

> 参考：
>
> [Up and running with Apache Spark on Apache Kudu](https://blog.cloudera.com/blog/2017/02/up-and-running-with-apache-spark-on-apache-kudu/)





## 注意事项：



### 问题3

`df.select("id").filter("id" >= 5).show()`

执行该代码时，可能报错，具体原因为找到， 但是通过查阅Spark SQL官方文档， 可以调整成以下执行方式： 

`df.select("id").filter($"id" >= 5).show()`




### 问题1 

```shell
ERROR spark.SparkContext: Error initializing SparkContext. java.lang.IllegalArgumentException: Required executor memory (1024+384 MB) is above the max threshold (1024 MB) of this cluster! Please check the values of 'yarn.scheduler.maximum-allocation-mb' and/or 'yarn.nodemanager.resource.memory-mb'.
```

解决方法：

进入CDH管理页面，调整Yarn中以下两个配置参数：

`yarn.scheduler.maximum-allocation-mb=2G`

`yarn.nodemanager.resource.memory-mb=2G`

### 问题2

```SHELL
Permission denied: user=root, access=WRITE, inode="/user":hdfs:supergroup:drwxr-xr-x
```

解决方法：

>其实是这样的，/这是文件的所有者是HDFS  权限为755  也就是只有HDFS才能对这个文件进行sudo的操作
>那么接下来我们便可以这样操作文件
>
>````SHELL
>sudo -u hdfs hadoop fs -mkdir /user/root
>
>sudo -u hdfs hadoop fs -chmod 777 /user/root 
>
>````
>
>我们可以以hdfs的身份对文件进行操作