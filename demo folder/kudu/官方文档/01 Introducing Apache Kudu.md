# Introducing Apache Kudu

Kudu is a columnar storage manager developed for the Apache Hadoop platform. Kudu shares the common technical properties of Hadoop ecosystem applications: it runs on commodity hardware, is horizontally scalable, and supports highly available operation.

Kudu’s design sets it apart. Some of Kudu’s benefits include:

- Fast processing of OLAP workloads.

- Integration with MapReduce, Spark and other Hadoop ecosystem components.

- Tight integration with Apache Impala, making it a good, mutable alternative to using HDFS with Apache Parquet.

- Strong but flexible consistency model, allowing you to choose consistency requirements on a per-request basis, including the option for strict-serializable consistency.

- Strong performance for running sequential and random workloads simultaneously.

- Easy to administer and manage with Cloudera Manager.

- High availability. Tablet Servers and Masters use the [Raft Consensus Algorithm](http://kudu.apache.org/docs/index.html#raft), which ensures that as long as more than half the total number of replicas is available, the tablet is available for reads and writes. For instance, if 2 out of 3 replicas or 3 out of 5 replicas are available, the tablet is available.

  Reads can be serviced by read-only follower tablets, even in the event of a leader tablet failure.

- Structured data model.

By combining all of these properties, Kudu targets support for families of applications that are difficult or impossible to implement on current generation Hadoop storage technologies. A few examples of applications for which Kudu is a great solution are:

- Reporting applications where newly-arrived data needs to be immediately available for end users
- Time-series applications that must simultaneously support:
  - queries across large amounts of historic data
  - granular queries about an individual entity that must return very quickly
- Applications that use predictive models to make real-time decisions with periodic refreshes of the predictive model based on all historic data

For more information about these and other scenarios, see [Example Use Cases](http://kudu.apache.org/docs/index.html#kudu_use_cases).

## [Kudu-Impala Integration Features](http://kudu.apache.org/docs/index.html#_kudu_impala_integration_features)

- `CREATE/ALTER/DROP TABLE`

  Impala supports creating, altering, and dropping tables using Kudu as the persistence layer. The tables follow the same internal / external approach as other tables in Impala, allowing for flexible data ingestion and querying.

- `INSERT`

  Data can be inserted into Kudu tables in Impala using the same syntax as any other Impala table like those using HDFS or HBase for persistence.

- `UPDATE` / `DELETE`

  Impala supports the `UPDATE` and `DELETE` SQL commands to modify existing data in a Kudu table row-by-row or as a batch. The syntax of the SQL commands is chosen to be as compatible as possible with existing standards. In addition to simple `DELETE` or `UPDATE` commands, you can specify complex joins with a `FROM` clause in a subquery.

- Flexible Partitioning

  Similar to partitioning of tables in Hive, Kudu allows you to dynamically pre-split tables by hash or range into a predefined number of tablets, in order to distribute writes and queries evenly across your cluster. You can partition by any number of primary key columns, by any number of hashes, and an optional list of split rows. See [Schema Design](http://kudu.apache.org/docs/schema_design.html).

- Parallel Scan

  To achieve the highest possible performance on modern hardware, the Kudu client used by Impala parallelizes scans across multiple tablets.

- High-efficiency queries

  Where possible, Impala pushes down predicate evaluation to Kudu, so that predicates are evaluated as close as possible to the data. Query performance is comparable to Parquet in many workloads.

For more details regarding querying data stored in Kudu using Impala, please refer to the Impala documentation.

## [Concepts and Terms](http://kudu.apache.org/docs/index.html#_concepts_and_terms)

Columnar Data Store

Kudu is a *columnar data store*. A columnar data store stores data in strongly-typed columns. With a proper design, it is superior for analytical or data warehousing workloads for several reasons.

- Read Efficiency

  For analytical queries, you can read a single column, or a portion of that column, while ignoring other columns. This means you can fulfill your query while reading a minimal number of blocks on disk. With a row-based store, you need to read the entire row, even if you only return values from a few columns.

- Data Compression

  Because a given column contains only one type of data, pattern-based compression can be orders of magnitude more efficient than compressing mixed data types, which are used in row-based solutions. Combined with the efficiencies of reading data from columns, compression allows you to fulfill your query while reading even fewer blocks from disk. See [Data Compression](http://kudu.apache.org/docs/schema_design.html#encoding)

Table

A *table* is where your data is stored in Kudu. A table has a schema and a totally ordered primary key. A table is split into segments called tablets.

Tablet

A *tablet* is a contiguous segment of a table, similar to a *partition* in other data storage engines or relational databases. A given tablet is replicated on multiple tablet servers, and at any given point in time, one of these replicas is considered the leader tablet. Any replica can service reads, and writes require consensus among the set of tablet servers serving the tablet.

Tablet Server

A *tablet server* stores and serves tablets to clients. For a given tablet, one tablet server acts as a leader, and the others act as follower replicas of that tablet. Only leaders service write requests, while leaders or followers each service read requests. Leaders are elected using [Raft Consensus Algorithm](http://kudu.apache.org/docs/index.html#raft). One tablet server can serve multiple tablets, and one tablet can be served by multiple tablet servers.

Master

The *master* keeps track of all the tablets, tablet servers, the [Catalog Table](http://kudu.apache.org/docs/index.html#catalog_table), and other metadata related to the cluster. At a given point in time, there can only be one acting master (the leader). If the current leader disappears, a new master is elected using [Raft Consensus Algorithm](http://kudu.apache.org/docs/index.html#raft).

The master also coordinates metadata operations for clients. For example, when creating a new table, the client internally sends the request to the master. The master writes the metadata for the new table into the catalog table, and coordinates the process of creating tablets on the tablet servers.

All the master’s data is stored in a tablet, which can be replicated to all the other candidate masters.

Tablet servers heartbeat to the master at a set interval (the default is once per second).

Raft Consensus Algorithm

Kudu uses the [Raft consensus algorithm](https://raft.github.io/) as a means to guarantee fault-tolerance and consistency, both for regular tablets and for master data. Through Raft, multiple replicas of a tablet elect a *leader*, which is responsible for accepting and replicating writes to *follower*replicas. Once a write is persisted in a majority of replicas it is acknowledged to the client. A given group of `N` replicas (usually 3 or 5) is able to accept writes with at most `(N - 1)/2` faulty replicas.

Catalog Table

The *catalog table* is the central location for metadata of Kudu. It stores information about tables and tablets. The catalog table may not be read or written directly. Instead, it is accessible only via metadata operations exposed in the client API.

The catalog table stores two categories of metadata:

- Tables

  table schemas, locations, and states

- Tablets

  the list of existing tablets, which tablet servers have replicas of each tablet, the tablet’s current state, and start and end keys.

Logical Replication

Kudu replicates operations, not on-disk data. This is referred to as *logical replication*, as opposed to *physical replication*. This has several advantages:

- Although inserts and updates do transmit data over the network, deletes do not need to move any data. The delete operation is sent to each tablet server, which performs the delete locally.
- Physical operations, such as compaction, do not need to transmit the data over the network in Kudu. This is different from storage systems that use HDFS, where the blocks need to be transmitted over the network to fulfill the required number of replicas.
- Tablets do not need to perform compactions at the same time or on the same schedule, or otherwise remain in sync on the physical storage layer. This decreases the chances of all tablet servers experiencing high latency at the same time, due to compactions or heavy write loads.

## [Architectural Overview](http://kudu.apache.org/docs/index.html#_architectural_overview)

The following diagram shows a Kudu cluster with three masters and multiple tablet servers, each serving multiple tablets. It illustrates how Raft consensus is used to allow for both leaders and followers for both the masters and tablet servers. In addition, a tablet server can be a leader for some tablets, and a follower for others. Leaders are shown in gold, while followers are shown in blue.

![Kudu Architecture](http://kudu.apache.org/docs/images/kudu-architecture-2.png)

## [Example Use Cases](http://kudu.apache.org/docs/index.html#kudu_use_cases)

Streaming Input with Near Real Time Availability

A common challenge in data analysis is one where new data arrives rapidly and constantly, and the same data needs to be available in near real time for reads, scans, and updates. Kudu offers the powerful combination of fast inserts and updates with efficient columnar scans to enable real-time analytics use cases on a single storage layer.

Time-series application with widely varying access patterns

A time-series schema is one in which data points are organized and keyed according to the time at which they occurred. This can be useful for investigating the performance of metrics over time or attempting to predict future behavior based on past data. For instance, time-series customer data might be used both to store purchase click-stream history and to predict future purchases, or for use by a customer support representative. While these different types of analysis are occurring, inserts and mutations may also be occurring individually and in bulk, and become available immediately to read workloads. Kudu can handle all of these access patterns simultaneously in a scalable and efficient manner.

Kudu is a good fit for time-series workloads for several reasons. With Kudu’s support for hash-based partitioning, combined with its native support for compound row keys, it is simple to set up a table spread across many servers without the risk of "hotspotting" that is commonly observed when range partitioning is used. Kudu’s columnar storage engine is also beneficial in this context, because many time-series workloads read only a few columns, as opposed to the whole row.

In the past, you might have needed to use multiple data stores to handle different data access patterns. This practice adds complexity to your application and operations, and duplicates your data, doubling (or worse) the amount of storage required. Kudu can handle all of these access patterns natively and efficiently, without the need to off-load work to other data stores.

Predictive Modeling

Data scientists often develop predictive learning models from large sets of data. The model and the data may need to be updated or modified often as the learning takes place or as the situation being modeled changes. In addition, the scientist may want to change one or more factors in the model to see what happens over time. Updating a large set of data stored in files in HDFS is resource-intensive, as each file needs to be completely rewritten. In Kudu, updates happen in near real time. The scientist can tweak the value, re-run the query, and refresh the graph in seconds or minutes, rather than hours or days. In addition, batch or incremental algorithms can be run across the data at any time, with near-real-time results.

Combining Data In Kudu With Legacy Systems

Companies generate data from multiple sources and store it in a variety of systems and formats. For instance, some of your data may be stored in Kudu, some in a traditional RDBMS, and some in files in HDFS. You can access and query all of these sources and formats using Impala, without the need to change your legacy systems.

## [Next Steps](http://kudu.apache.org/docs/index.html#_next_steps)

- [Get Started With Kudu](http://kudu.apache.org/docs/quickstart.html)
- [Installing Kudu](http://kudu.apache.org/docs/installation.html)

