# Kudu架构介绍及其在小米的应用实践

Kudu是Cloudera在15年9月开源的分布式数据存储引擎，其结合了Hbase和HDFS的优势，可以同时提供高效的随机访问以及数据扫描能力。**Kudu支持数据的实时插入和分析，为实时的OLAP计算提供了另外一种选择**。小米是Kudu在中国最早的一批用户，目前内部已经有较大规模的业务在使用，并且在不断探索新的应用场景。张震，曾就职于曾就职于老牌BI厂商MicroStrategy，15年加入小米云平台计算组，先后负责Impala，Hive，Kudu的维护和及内部需求开发。在分布式计算和存储领域有多年的积累和实战经验。

## 内容简介

本次演讲将会**介绍Kudu的大致技术架构**，新版本的新增功能，以及未来的开发计划。同时会介绍Kudu在小米计算架构中所扮演的角色，分享一些Kudu**在实际使用中的经验**，希望可以促进Kudu在中国的发展和使用。



![Kudu架构介绍及其在小米的应用实践](http://p3.pstatp.com/large/288f00048ec571f62f34)

![Kudu架构介绍及其在小米的应用实践](http://p3.pstatp.com/large/288f00048ec4ae33d3ee)

![Kudu架构介绍及其在小米的应用实践](http://p99.pstatp.com/large/28940003138d299dcc45)

## Kudu介绍

### Kudu设计目标

![Kudu架构介绍及其在小米的应用实践](http://p1.pstatp.com/large/289400031388ff468bf2)

![Kudu架构介绍及其在小米的应用实践](http://p3.pstatp.com/large/2894000313893af5d82d)



### Kudu数据模型及分区设计

![Kudu架构介绍及其在小米的应用实践](http://p3.pstatp.com/large/289100031db5eec78e05)

![Kudu架构介绍及其在小米的应用实践](http://p3.pstatp.com/large/28940003138bfa8ae4f7)

![Kudu架构介绍及其在小米的应用实践](http://p3.pstatp.com/large/28940003138c4941cdc6)



### Kudu数据写入过程

![Kudu架构介绍及其在小米的应用实践](http://p99.pstatp.com/large/28950001812dc10e89e9)

![Kudu架构介绍及其在小米的应用实践](http://p1.pstatp.com/large/2897000110bfbb68403e)

### Kudu整体架构

![Kudu架构介绍及其在小米的应用实践](http://p99.pstatp.com/large/28940003138e621a7347)



### Master

![Kudu架构介绍及其在小米的应用实践](http://p3.pstatp.com/large/2897000110c0c8fd475c)

![Kudu架构介绍及其在小米的应用实践](http://p99.pstatp.com/large/28940003138f74cb2d6b)

### Tablet

![Kudu架构介绍及其在小米的应用实践](http://p3.pstatp.com/large/288f00048ec791b88556)

### MVCC 及数据储存

Multi-Version Concurrency Control 多版本并发控制，*MVCC* 是一种并发控制的方法



![Kudu架构介绍及其在小米的应用实践](http://p3.pstatp.com/large/288f00048ec69ca1b3ae)

![Kudu架构介绍及其在小米的应用实践](http://p3.pstatp.com/large/28900003b2dd07fe9358)

![Kudu架构介绍及其在小米的应用实践](http://p99.pstatp.com/large/28900003b2db11205409)

### Delta Compaction

![Kudu架构介绍及其在小米的应用实践](http://p99.pstatp.com/large/28900003b2dcaab81fd0)

![Kudu架构介绍及其在小米的应用实践](http://p3.pstatp.com/large/2897000110c1851d6c8d)





## 整合Spark

![Kudu架构介绍及其在小米的应用实践](http://p99.pstatp.com/large/2893000317f58fff997c)

### MoSQL API

![Kudu架构介绍及其在小米的应用实践](http://p9.pstatp.com/large/28940003139093449ebc)

### Spark DataFrame

![Kudu架构介绍及其在小米的应用实践](http://p3.pstatp.com/large/288f00048ec8d1be60d4)

### KuduRDD的实现

![Kudu架构介绍及其在小米的应用实践](http://p3.pstatp.com/large/2893000317f7d69efd59)



### Spark SQL on Kudu

![Kudu架构介绍及其在小米的应用实践](http://p3.pstatp.com/large/2897000110c23e4d9e0a)

#### Spark SQL on Kudu 增删改等操作

![Kudu架构介绍及其在小米的应用实践](http://p3.pstatp.com/large/2893000317f626cae4e8)

![Kudu架构介绍及其在小米的应用实践](http://p3.pstatp.com/large/28900003b2dec820891c)

## 小米实践

### 小米的实时数据仓库

![Kudu架构介绍及其在小米的应用实践](http://p3.pstatp.com/large/28900003b2df67219931)

![Kudu架构介绍及其在小米的应用实践](http://p3.pstatp.com/large/2893000317f817703af6)

![Kudu架构介绍及其在小米的应用实践](http://p99.pstatp.com/large/2897000110c397fcd02d)

![Kudu架构介绍及其在小米的应用实践](http://p99.pstatp.com/large/2897000110c416d671e2)

 