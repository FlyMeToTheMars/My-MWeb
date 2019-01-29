## Apache Spark FAQ

How does Spark relate to Apache Hadoop?

Spark is a fast and general processing engine compatible with Hadoop data. It can run in Hadoop clusters through YARN or Spark's standalone mode, and it can process data in HDFS, HBase, Cassandra, Hive, and any Hadoop InputFormat. It is designed to perform both batch processing (similar to MapReduce) and new workloads like streaming, interactive queries, and machine learning.

Who is using Spark in production?

As of 2016, surveys show that more than 1000 organizations are using Spark in production. Some of them are listed on the [Powered By page](http://spark.apache.org/powered-by.html) and at the [Spark Summit](https://spark-summit.org/).

How large a cluster can Spark scale to?

Many organizations run Spark on clusters of thousands of nodes. The largest cluster we know has 8000 of them. In terms of data size, Spark has been shown to work well up to petabytes. It has been used to sort 100 TB of data 3X faster than Hadoop MapReduce on 1/10th of the machines, [winning the 2014 Daytona GraySort Benchmark](https://databricks.com/blog/2014/11/05/spark-officially-sets-a-new-record-in-large-scale-sorting.html), as well as to [sort 1 PB](https://databricks.com/blog/2014/10/10/spark-petabyte-sort.html). Several production workloads [use Spark to do ETL and data analysis on PBs of data](https://databricks.com/blog/2014/08/14/mining-graph-data-with-spark-at-alibaba-taobao.html).

Does my data need to fit in memory to use Spark?

No. Spark's operators spill data to disk if it does not fit in memory, allowing it to run well on any sized data. Likewise, cached datasets that do not fit in memory are either spilled to disk or recomputed on the fly when needed, as determined by the RDD's [storage level](http://spark.apache.org/docs/latest/rdd-programming-guide.html#rdd-persistence).

How can I run Spark on a cluster?

You can use either the [standalone deploy mode](http://spark.apache.org/docs/latest/spark-standalone.html), which only needs Java to be installed on each node, or the [Mesos](http://spark.apache.org/docs/latest/running-on-mesos.html) and [YARN](http://spark.apache.org/docs/latest/running-on-yarn.html) cluster managers. If you'd like to run on Amazon EC2, AMPLab provides [EC2 scripts](https://github.com/amplab/spark-ec2#readme) to automatically launch a cluster.

Note that you can also run Spark locally (possibly on multiple cores) without any special setup by just passing `local[N]` as the master URL, where `N` is the number of parallel threads you want.

Do I need Hadoop to run Spark?

No, but if you run on a cluster, you will need some form of shared file system (for example, NFS mounted at the same path on each node). If you have this type of filesystem, you can just deploy Spark in standalone mode.

Does Spark require modified versions of Scala or Python?

No. Spark requires no changes to Scala or compiler plugins. The Python API uses the standard CPython implementation, and can call into existing C libraries for Python such as NumPy.

I understand Spark Streaming uses micro-batching. Does this increase latency?

While Spark does use a micro-batch execution model, this does not have much impact on applications, because the batches can be as short as 0.5 seconds. In most applications of streaming big data, the analytics is done over a larger window (say 10 minutes), or the latency to get data in is higher (e.g. sensors collect readings every 10 seconds). Spark's model enables [exactly-once semantics and consistency](http://people.csail.mit.edu/matei/papers/2013/sosp_spark_streaming.pdf), meaning the system gives correct results despite slow nodes or failures.

Where can I find high-resolution versions of the Spark logo?

We provide versions here: [black logo](http://spark.apache.org/images/spark-logo.eps), [white logo](http://spark.apache.org/images/spark-logo-reverse.eps). Please be aware that Spark, Apache Spark and the Spark logo are trademarks of the Apache Software Foundation, and follow the Foundation's [trademark policy](https://www.apache.org/foundation/marks/) in all uses of these logos.

Can I provide commercial software or services based on Spark?

Yes, as long as you respect the Apache Software Foundation's [software license](https://www.apache.org/licenses/) and [trademark policy](https://www.apache.org/foundation/marks/). In particular, note that there are strong restrictions about how third-party products use the "Spark" name (names based on Spark are generally not allowed). Please also refer to our [trademark policy summary](http://spark.apache.org/trademarks.html).

How can I contribute to Spark?

See the [Contributing to Spark wiki](http://spark.apache.org/contributing.html) for more information.

Where can I get more help?

Please post on StackOverflow's [`apache-spark`](https://stackoverflow.com/questions/tagged/apache-spark) tag or [Spark Users](http://apache-spark-user-list.1001560.n3.nabble.com/) mailing list. For more information, please refer to [Have Questions?](https://spark.apache.org/community.html#have-questions). We'll be glad to help!