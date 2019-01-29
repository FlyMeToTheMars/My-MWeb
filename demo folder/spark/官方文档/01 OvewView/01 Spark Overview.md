# Spark Overview

Apache Spark is a fast and general-purpose cluster computing system. It provides high-level APIs in Java, Scala, Python and R, and an optimized engine that supports general execution graphs. It also supports a rich set of higher-level tools including [Spark SQL](http://spark.apache.org/docs/2.1.3/sql-programming-guide.html) for SQL and structured data processing, [MLlib](http://spark.apache.org/docs/2.1.3/ml-guide.html) for machine learning, [GraphX](http://spark.apache.org/docs/2.1.3/graphx-programming-guide.html) for graph processing, and [Spark Streaming](http://spark.apache.org/docs/2.1.3/streaming-programming-guide.html).

# Downloading

Get Spark from the [downloads page](http://spark.apache.org/downloads.html) of the project website. This documentation is for Spark version 2.1.3. Spark uses Hadoop’s client libraries for HDFS and YARN. Downloads are pre-packaged for a handful of popular Hadoop versions. Users can also download a “Hadoop free” binary and run Spark with any Hadoop version [by augmenting Spark’s classpath](http://spark.apache.org/docs/2.1.3/hadoop-provided.html). Scala and Java users can include Spark in their projects using its maven cooridnates and in the future Python users can also install Spark from PyPI.

If you’d like to build Spark from source, visit [Building Spark](http://spark.apache.org/docs/2.1.3/building-spark.html).

Spark runs on both Windows and UNIX-like systems (e.g. Linux, Mac OS). It’s easy to run locally on one machine — all you need is to have `java`installed on your system `PATH`, or the `JAVA_HOME` environment variable pointing to a Java installation.

Spark runs on Java 7+, Python 2.6+/3.4+ and R 3.1+. For the Scala API, Spark 2.1.3 uses Scala 2.11. You will need to use a compatible Scala version (2.11.x).

Note that support for Java 7 and Python 2.6 are deprecated as of Spark 2.0.0, and support for Scala 2.10 and versions of Hadoop before 2.6 are deprecated as of Spark 2.1.0, and may be removed in Spark 2.2.0.

# Running the Examples and Shell

Spark comes with several sample programs. Scala, Java, Python and R examples are in the `examples/src/main` directory. To run one of the Java or Scala sample programs, use `bin/run-example <class> [params]` in the top-level Spark directory. (Behind the scenes, this invokes the more general [`spark-submit` script](http://spark.apache.org/docs/2.1.3/submitting-applications.html) for launching applications). For example,

```
./bin/run-example SparkPi 10
```

You can also run Spark interactively through a modified version of the Scala shell. This is a great way to learn the framework.

```
./bin/spark-shell --master local[2]
```

The `--master` option specifies the [master URL for a distributed cluster](http://spark.apache.org/docs/2.1.3/submitting-applications.html#master-urls), or `local` to run locally with one thread, or `local[N]` to run locally with N threads. You should start by using `local` for testing. For a full list of options, run Spark shell with the `--help` option.

Spark also provides a Python API. To run Spark interactively in a Python interpreter, use `bin/pyspark`:

```
./bin/pyspark --master local[2]
```

Example applications are also provided in Python. For example,

```
./bin/spark-submit examples/src/main/python/pi.py 10
```

Spark also provides an experimental [R API](http://spark.apache.org/docs/2.1.3/sparkr.html) since 1.4 (only DataFrames APIs included). To run Spark interactively in a R interpreter, use `bin/sparkR`:

```
./bin/sparkR --master local[2]
```

Example applications are also provided in R. For example,

```
./bin/spark-submit examples/src/main/r/dataframe.R
```

# Launching on a Cluster

The Spark [cluster mode overview](http://spark.apache.org/docs/2.1.3/cluster-overview.html) explains the key concepts in running on a cluster. Spark can run both by itself, or over several existing cluster managers. It currently provides several options for deployment:

- [Standalone Deploy Mode](http://spark.apache.org/docs/2.1.3/spark-standalone.html): simplest way to deploy Spark on a private cluster
- [Apache Mesos](http://spark.apache.org/docs/2.1.3/running-on-mesos.html)
- [Hadoop YARN](http://spark.apache.org/docs/2.1.3/running-on-yarn.html)

# Where to Go from Here

**Programming Guides:**

- [Quick Start](http://spark.apache.org/docs/2.1.3/quick-start.html): a quick introduction to the Spark API; start here!
- [Spark Programming Guide](http://spark.apache.org/docs/2.1.3/programming-guide.html): detailed overview of Spark in all supported languages (Scala, Java, Python, R)
- Modules built on Spark:
  - [Spark Streaming](http://spark.apache.org/docs/2.1.3/streaming-programming-guide.html): processing real-time data streams
  - [Spark SQL, Datasets, and DataFrames](http://spark.apache.org/docs/2.1.3/sql-programming-guide.html): support for structured data and relational queries
  - [MLlib](http://spark.apache.org/docs/2.1.3/ml-guide.html): built-in machine learning library
  - [GraphX](http://spark.apache.org/docs/2.1.3/graphx-programming-guide.html): Spark’s new API for graph processing

**API Docs:**

- [Spark Scala API (Scaladoc)](http://spark.apache.org/docs/2.1.3/api/scala/index.html#org.apache.spark.package)
- [Spark Java API (Javadoc)](http://spark.apache.org/docs/2.1.3/api/java/index.html)
- [Spark Python API (Sphinx)](http://spark.apache.org/docs/2.1.3/api/python/index.html)
- [Spark R API (Roxygen2)](http://spark.apache.org/docs/2.1.3/api/R/index.html)

**Deployment Guides:**

- [Cluster Overview](http://spark.apache.org/docs/2.1.3/cluster-overview.html): overview of concepts and components when running on a cluster
- [Submitting Applications](http://spark.apache.org/docs/2.1.3/submitting-applications.html): packaging and deploying applications
- Deployment modes:
  - [Amazon EC2](https://github.com/amplab/spark-ec2): scripts that let you launch a cluster on EC2 in about 5 minutes
  - [Standalone Deploy Mode](http://spark.apache.org/docs/2.1.3/spark-standalone.html): launch a standalone cluster quickly without a third-party cluster manager
  - [Mesos](http://spark.apache.org/docs/2.1.3/running-on-mesos.html): deploy a private cluster using [Apache Mesos](http://mesos.apache.org/)
  - [YARN](http://spark.apache.org/docs/2.1.3/running-on-yarn.html): deploy Spark on top of Hadoop NextGen (YARN)

**Other Documents:**

- [Configuration](http://spark.apache.org/docs/2.1.3/configuration.html): customize Spark via its configuration system
- [Monitoring](http://spark.apache.org/docs/2.1.3/monitoring.html): track the behavior of your applications
- [Tuning Guide](http://spark.apache.org/docs/2.1.3/tuning.html): best practices to optimize performance and memory use
- [Job Scheduling](http://spark.apache.org/docs/2.1.3/job-scheduling.html): scheduling resources across and within Spark applications
- [Security](http://spark.apache.org/docs/2.1.3/security.html): Spark security support
- [Hardware Provisioning](http://spark.apache.org/docs/2.1.3/hardware-provisioning.html): recommendations for cluster hardware
- Integration with other storage systems:
  - [OpenStack Swift](http://spark.apache.org/docs/2.1.3/storage-openstack-swift.html)
- [Building Spark](http://spark.apache.org/docs/2.1.3/building-spark.html): build Spark using the Maven system
- [Contributing to Spark](http://spark.apache.org/contributing.html)
- [Third Party Projects](http://spark.apache.org/third-party-projects.html): related third party Spark projects

**External Resources:**

- [Spark Homepage](http://spark.apache.org/)
- [Spark Community](http://spark.apache.org/community.html) resources, including local meetups
- [StackOverflow tag `apache-spark`](http://stackoverflow.com/questions/tagged/apache-spark)
- [Mailing Lists](http://spark.apache.org/mailing-lists.html): ask questions about Spark here
- [AMP Camps](http://ampcamp.berkeley.edu/): a series of training camps at UC Berkeley that featured talks and exercises about Spark, Spark Streaming, Mesos, and more. [Videos](http://ampcamp.berkeley.edu/6/), [slides](http://ampcamp.berkeley.edu/6/) and [exercises](http://ampcamp.berkeley.edu/6/exercises/) are available online for free.
- [Code Examples](http://spark.apache.org/examples.html): more are also available in the `examples` subfolder of Spark ([Scala](https://github.com/apache/spark/tree/master/examples/src/main/scala/org/apache/spark/examples), [Java](https://github.com/apache/spark/tree/master/examples/src/main/java/org/apache/spark/examples), [Python](https://github.com/apache/spark/tree/master/examples/src/main/python), [R](https://github.com/apache/spark/tree/master/examples/src/main/r))