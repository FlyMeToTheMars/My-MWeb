# Using Apache Kudu with Apache Impala

Kudu has tight integration with Apache Impala, allowing you to use Impala to insert, query, update, and delete data from Kudu tablets using Impala’s SQL syntax, as an alternative to using the [Kudu APIs](http://kudu.apache.org/docs/installation.html#view_api) to build a custom Kudu application. In addition, you can use JDBC or ODBC to connect existing or new applications written in any language, framework, or business intelligence tool to your Kudu data, using Impala as the broker.

## [Requirements](http://kudu.apache.org/docs/kudu_impala_integration.html#_requirements)

- This documentation is specific to the certain versions of Impala. The syntax described will work only in the following releases:
  - The version of Impala 2.7.0 that ships with CDH 5.10. `SELECT VERSION()` will report `impalad version 2.7.0-cdh5.10.0`.
  - Apache Impala 2.8.0 releases compiled from source. `SELECT VERSION()` will report `impalad version 2.8.0`.

Older versions of Impala 2.7 (including the special `IMPALA_KUDU` releases previously available) have incompatible syntax. Future versions are likely to be compatible with this syntax, but we recommend checking that this is the latest available documentation corresponding to the appropriate version you have installed.

- This documentation does not describe Impala installation procedures. Please refer to the Impala documentation and be sure that you are able to run simple queries against Impala tables on HDFS before proceeding.

## [Configuration](http://kudu.apache.org/docs/kudu_impala_integration.html#_configuration)

No configuration changes are required within Kudu to enable access from Impala.

Although not strictly necessary, it is recommended to configure Impala with the locations of the Kudu Master servers:

- Set the `--kudu_master_hosts=<master1>[:port],<master2>[:port],<master3>[:port]` flag in the Impala service configuration. If you are using Cloudera Manager, please refer to the appropriate Cloudera Manager documentation to do so.

If this flag is not set within the Impala service, it will be necessary to manually provide this configuration each time you create a table by specifying the `kudu_master_addresses` property inside a `TBLPROPERTIES` clause.

The rest of this guide assumes that the configuration has been set.

## [Using the Impala Shell](http://kudu.apache.org/docs/kudu_impala_integration.html#_using_the_impala_shell)

|      | This is only a small sub-set of Impala Shell functionality. For more details, see the [Impala Shell](http://www.cloudera.com/content/cloudera/en/documentation/core/latest/topics/impala_impala_shell.html) documentation. |
| ---- | ------------------------------------------------------------ |
|      |                                                              |

- Start Impala Shell using the `impala-shell` command. By default, `impala-shell` attempts to connect to the Impala daemon on `localhost` on port 21000. To connect to a different host,, use the `-i <host:port>` option. To automatically connect to a specific Impala database, use the `-d <database>` option. For instance, if all your Kudu tables are in Impala in the database `impala_kudu`, use `-d impala_kudu` to use this database.
- To quit the Impala Shell, use the following command: `quit;`

### [Internal and External Impala Tables](http://kudu.apache.org/docs/kudu_impala_integration.html#_internal_and_external_impala_tables)

When creating a new Kudu table using Impala, you can create the table as an internal table or an external table.

- Internal

  An internal table is managed by Impala, and when you drop it from Impala, the data and the table truly are dropped. When you create a new table using Impala, it is generally a internal table.

- External

  An external table (created by `CREATE EXTERNAL TABLE`) is not managed by Impala, and dropping such a table does not drop the table from its source location (here, Kudu). Instead, it only removes the mapping between Impala and Kudu. This is the mode used in the syntax provided by Kudu for mapping an existing table to Impala.

See the [Impala documentation](http://www.cloudera.com/content/cloudera/en/documentation/core/latest/topics/impala_tables.html) for more information about internal and external tables.

### [Querying an Existing Kudu Table In Impala](http://kudu.apache.org/docs/kudu_impala_integration.html#_querying_an_existing_kudu_table_in_impala)

Tables created through the Kudu API or other integrations such as Apache Spark are not automatically visible in Impala. To query them, you must first create an external table within Impala to map the Kudu table into an Impala database:

```sql
CREATE EXTERNAL TABLE my_mapping_table
STORED AS KUDU
TBLPROPERTIES (
  'kudu.table_name' = 'my_kudu_table'
);
```

### [Creating a New Kudu Table From Impala](http://kudu.apache.org/docs/kudu_impala_integration.html#kudu_impala_create_table)

Creating a new table in Kudu from Impala is similar to mapping an existing Kudu table to an Impala table, except that you need to specify the schema and partitioning information yourself.

Use the following example as a guideline. Impala first creates the table, then creates the mapping.

```sql
CREATE TABLE my_first_table
(
  id BIGINT,
  name STRING,
  PRIMARY KEY(id)
)
PARTITION BY HASH PARTITIONS 16
STORED AS KUDU;
```

In the `CREATE TABLE` statement, the columns that comprise the primary key must be listed first. Additionally, primary key columns are implicitly marked `NOT NULL`.

When creating a new Kudu table, you are required to specify a distribution scheme. See [Partitioning Tables](http://kudu.apache.org/docs/kudu_impala_integration.html#partitioning_tables). The table creation example above is distributed into 16 partitions by hashing the `id` column, for simplicity. See [Partitioning Rules of Thumb](http://kudu.apache.org/docs/kudu_impala_integration.html#partitioning_rules_of_thumb) for guidelines on partitioning.

#### [`CREATE TABLE AS SELECT`](http://kudu.apache.org/docs/kudu_impala_integration.html#_code_create_table_as_select_code)

You can create a table by querying any other table or tables in Impala, using a `CREATE TABLE … AS SELECT` statement. The following example imports all rows from an existing table `old_table` into a Kudu table `new_table`. The names and types of columns in `new_table` will determined from the columns in the result set of the `SELECT` statement. Note that you must additionally specify the primary key and partitioning.

```sql
CREATE TABLE new_table
PRIMARY KEY (ts, name)
PARTITION BY HASH(name) PARTITIONS 8
STORED AS KUDU
AS SELECT ts, name, value FROM old_table;
```

#### [Specifying Tablet Partitioning](http://kudu.apache.org/docs/kudu_impala_integration.html#_specifying_tablet_partitioning)

Tables are divided into tablets which are each served by one or more tablet servers. Ideally, tablets should split a table’s data relatively equally. Kudu currently has no mechanism for automatically (or manually) splitting a pre-existing tablet. Until this feature has been implemented, **you must specify your partitioning when creating a table**. When designing your table schema, consider primary keys that will allow you to split your table into partitions which grow at similar rates. You can designate partitions using a `PARTITION BY` clause when creating a table using Impala:

|      | Impala keywords, such as `group`, are enclosed by back-tick characters when they are not used in their keyword sense. |
| ---- | ------------------------------------------------------------ |
|      |                                                              |

```sql
CREATE TABLE cust_behavior (
  _id BIGINT PRIMARY KEY,
  salary STRING,
  edu_level INT,
  usergender STRING,
  `group` STRING,
  city STRING,
  postcode STRING,
  last_purchase_price FLOAT,
  last_purchase_date BIGINT,
  category STRING,
  sku STRING,
  rating INT,
  fulfilled_date BIGINT
)
PARTITION BY RANGE (_id)
(
    PARTITION VALUES < 1439560049342,
    PARTITION 1439560049342 <= VALUES < 1439566253755,
    PARTITION 1439566253755 <= VALUES < 1439572458168,
    PARTITION 1439572458168 <= VALUES < 1439578662581,
    PARTITION 1439578662581 <= VALUES < 1439584866994,
    PARTITION 1439584866994 <= VALUES < 1439591071407,
    PARTITION 1439591071407 <= VALUES
)
STORED AS KUDU;
```

If you have multiple primary key columns, you can specify partition bounds using tuple syntax: `('va',1), ('ab',2)`. The expression must be valid JSON.

#### [Impala Databases and Kudu](http://kudu.apache.org/docs/kudu_impala_integration.html#_impala_databases_and_kudu)

Every Impala table is contained within a namespace called a *database*. The default database is called `default`, and users may create and drop additional databases as desired.

When a managed Kudu table is created from within Impala, the corresponding Kudu table will be named `my_database::table_name`.

#### [Impala Keywords Not Supported for Kudu Tables](http://kudu.apache.org/docs/kudu_impala_integration.html#_impala_keywords_not_supported_for_kudu_tables)

The following Impala keywords are not supported when creating Kudu tables: - `PARTITIONED` - `LOCATION` - `ROWFORMAT`

### [Optimizing Performance for Evaluating SQL Predicates](http://kudu.apache.org/docs/kudu_impala_integration.html#_optimizing_performance_for_evaluating_sql_predicates)

If the `WHERE` clause of your query includes comparisons with the operators `=`, `<=`, '\<', '\>', `>=`, `BETWEEN`, or `IN`, Kudu evaluates the condition directly and only returns the relevant results. This provides optimum performance, because Kudu only returns the relevant results to Impala. For predicates `!=`, `LIKE`, or any other predicate type supported by Impala, Kudu does not evaluate the predicates directly, but returns all results to Impala and relies on Impala to evaluate the remaining predicates and filter the results accordingly. This may cause differences in performance, depending on the delta of the result set before and after evaluating the `WHERE` clause.

### [Partitioning Tables](http://kudu.apache.org/docs/kudu_impala_integration.html#partitioning_tables)

Tables are partitioned into tablets according to a partition schema on the primary key columns. Each tablet is served by at least one tablet server. Ideally, a table should be split into tablets that are distributed across a number of tablet servers to maximize parallel operations. The details of the partitioning schema you use will depend entirely on the type of data you store and how you access it. For a full discussion of schema design in Kudu, see [Schema Design](http://kudu.apache.org/docs/schema_design.html).

Kudu currently has no mechanism for splitting or merging tablets after the table has been created. You must provide a partition schema for your table when you create it. When designing your tables, consider using primary keys that will allow you to partition your table into tablets which grow at similar rates.

You can partition your table using Impala’s `PARTITION BY` keyword, which supports distribution by `RANGE` or `HASH`. The partition scheme can contain zero or more `HASH` definitions, followed by an optional `RANGE` definition. The `RANGE` definition can refer to one or more primary key columns. Examples of [basic](http://kudu.apache.org/docs/kudu_impala_integration.html#basic_partitioning) and [advanced](http://kudu.apache.org/docs/kudu_impala_integration.html#advanced_partitioning) partitioning are shown below.

#### [Basic Partitioning](http://kudu.apache.org/docs/kudu_impala_integration.html#basic_partitioning)

```
PARTITION BY RANGE
```

You can specify range partitions for one or more primary key columns. Range partitioning in Kudu allows splitting a table based based on specific values or ranges of values of the chosen partition keys. This allows you to balance parallelism in writes with scan efficiency.

Suppose you have a table that has columns `state`, `name`, and `purchase_count`. The following example creates 50 tablets, one per US state.

|      | Monotonically Increasing ValuesIf you partition by range on a column whose values are monotonically increasing, the last tablet will grow much larger than the others. Additionally, all data being inserted will be written to a single tablet at a time, limiting the scalability of data ingest. In that case, consider distributing by `HASH` instead of, or in addition to, `RANGE`. |
| ---- | ------------------------------------------------------------ |
|      |                                                              |

```sql
CREATE TABLE customers (
  state STRING,
  name STRING,
  purchase_count int,
  PRIMARY KEY (state, name)
)
PARTITION BY RANGE (state)
(
  PARTITION VALUE = 'al',
  PARTITION VALUE = 'ak',
  PARTITION VALUE = 'ar',
  -- ... etc ...
  PARTITION VALUE = 'wv',
  PARTITION VALUE = 'wy'
)
STORED AS KUDU;
PARTITION BY HASH
```

Instead of distributing by an explicit range, or in combination with range distribution, you can distribute into a specific number of 'buckets' by hash. You specify the primary key columns you want to partition by, and the number of buckets you want to use. Rows are distributed by hashing the specified key columns. Assuming that the values being hashed do not themselves exhibit significant skew, this will serve to distribute the data evenly across buckets.

You can specify multiple definitions, and you can specify definitions which use compound primary keys. However, one column cannot be mentioned in multiple hash definitions. Consider two columns, `a` and `b`: *  `HASH(a)`, `HASH(b)` *  `HASH(a,b)` * `HASH(a), HASH(a,b)`

|      | `PARTITION BY HASH` with no column specified is a shortcut to create the desired number of buckets by hashing all primary key columns. |
| ---- | ------------------------------------------------------------ |
|      |                                                              |

Hash partitioning is a reasonable approach if primary key values are evenly distributed in their domain and no data skew is apparent, such as timestamps or serial IDs.

The following example creates 16 tablets by hashing the `id` and `sku` columns. This spreads writes across all 16 tablets. In this example, a query for a range of `sku` values is likely to need to read all 16 tablets, so this may not be the optimum schema for this table. See [Advanced Partitioning](http://kudu.apache.org/docs/kudu_impala_integration.html#advanced_partitioning) for an extended example.

```sql
CREATE TABLE cust_behavior (
  id BIGINT,
  sku STRING,
  salary STRING,
  edu_level INT,
  usergender STRING,
  `group` STRING,
  city STRING,
  postcode STRING,
  last_purchase_price FLOAT,
  last_purchase_date BIGINT,
  category STRING,
  rating INT,
  fulfilled_date BIGINT,
  PRIMARY KEY (id, sku)
)
PARTITION BY HASH PARTITIONS 16
STORED AS KUDU;
```

#### [Advanced Partitioning](http://kudu.apache.org/docs/kudu_impala_integration.html#advanced_partitioning)

You can combine `HASH` and `RANGE` partitioning to create more complex partition schemas. You can specify zero or more `HASH`definitions, followed by zero or one `RANGE` definitions. Each definition can encompass one or more columns. While enumerating every possible distribution schema is out of the scope of this document, a few examples illustrate some of the possibilities.

#### [`PARTITION BY HASH` and `RANGE`](http://kudu.apache.org/docs/kudu_impala_integration.html#_code_partition_by_hash_code_and_code_range_code)

Consider the [simple hashing](http://kudu.apache.org/docs/kudu_impala_integration.html#distribute_by_hash) example above, If you often query for a range of `sku` values, you can optimize the example by combining hash partitioning with range partitioning.

The following example still creates 16 tablets, by first hashing the `id` column into 4 buckets, and then applying range partitioning to split each bucket into four tablets, based upon the value of the `sku` string. Writes are spread across at least four tablets (and possibly up to 16). When you query for a contiguous range of `sku` values, you have a good chance of only needing to read from a quarter of the tablets to fulfill the query.

|      | By default, the entire primary key is hashed when you use `PARTITION BY HASH`. To hash on only part of the primary key, specify it by using syntax like `PARTITION BY HASH (id, sku)`. |
| ---- | ------------------------------------------------------------ |
|      |                                                              |

```sql
CREATE TABLE cust_behavior (
  id BIGINT,
  sku STRING,
  salary STRING,
  edu_level INT,
  usergender STRING,
  `group` STRING,
  city STRING,
  postcode STRING,
  last_purchase_price FLOAT,
  last_purchase_date BIGINT,
  category STRING,
  rating INT,
  fulfilled_date BIGINT,
  PRIMARY KEY (id, sku)
)
PARTITION BY HASH (id) PARTITIONS 4,
RANGE (sku)
(
  PARTITION VALUES < 'g',
  PARTITION 'g' <= VALUES < 'o',
  PARTITION 'o' <= VALUES < 'u',
  PARTITION 'u' <= VALUES
)
STORED AS KUDU;
```

Multiple `PARTITION BY HASH` Definitions

Again expanding the example above, suppose that the query pattern will be unpredictable, but you want to ensure that writes are spread across a large number of tablets You can achieve maximum distribution across the entire primary key by hashing on both primary key columns.

```sql
CREATE TABLE cust_behavior (
  id BIGINT,
  sku STRING,
  salary STRING,
  edu_level INT,
  usergender STRING,
  `group` STRING,
  city STRING,
  postcode STRING,
  last_purchase_price FLOAT,
  last_purchase_date BIGINT,
  category STRING,
  rating INT,
  fulfilled_date BIGINT,
  PRIMARY KEY (id, sku)
)
PARTITION BY HASH (id) PARTITIONS 4,
             HASH (sku) PARTITIONS 4
STORED AS KUDU;
```

The example creates 16 partitions. You could also use `HASH (id, sku) PARTITIONS 16`. However, a scan for `sku` values would almost always impact all 16 partitions, rather than possibly being limited to 4.

Non-Covering Range Partitions

Kudu 1.0 and higher supports the use of non-covering range partitions, which address scenarios like the following:

- Without non-covering range partitions, in the case of time-series data or other schemas which need to account for constantly-increasing primary keys, tablets serving old data will be relatively fixed in size, while tablets receiving new data will grow without bounds.
- In cases where you want to partition data based on its category, such as sales region or product type, without non-covering range partitions you must know all of the partitions ahead of time or manually recreate your table if partitions need to be added or removed, such as the introduction or elimination of a product type.

Non-covering range partitions have some caveats. Be sure to read the link:/docs/schema_design.html [Schema Design guide].

This example creates a tablet per year (5 tablets total), for storing log data. The table only accepts data from 2012 to 2016. Keys outside of these ranges will be rejected.

```sql
CREATE TABLE sales_by_year (
  year INT, sale_id INT, amount INT,
  PRIMARY KEY (sale_id, year)
)
PARTITION BY RANGE (year) (
  PARTITION VALUE = 2012,
  PARTITION VALUE = 2013,
  PARTITION VALUE = 2014,
  PARTITION VALUE = 2015,
  PARTITION VALUE = 2016
)
STORED AS KUDU;
```

When records start coming in for 2017, they will be rejected. At that point, the `2017` range should be added as follows:

```sql
ALTER TABLE sales_by_year ADD RANGE PARTITION VALUE = 2017;
```

In use cases where a rolling window of data retention is required, range partitions may also be dropped. For example, if data from 2012 should no longer be retained, it may be deleted in bulk:

```sql
ALTER TABLE sales_by_year DROP RANGE PARTITION VALUE = 2012;
```

Note that, just like dropping a table, this irrecoverably deletes all data stored in the dropped partition.

#### [Partitioning Rules of Thumb](http://kudu.apache.org/docs/kudu_impala_integration.html#partitioning_rules_of_thumb)

- For large tables, such as fact tables, aim for as many tablets as you have cores in the cluster.
- For small tables, such as dimension tables, ensure that each tablet is at least 1 GB in size.

In general, be mindful the number of tablets limits the parallelism of reads, in the current implementation. Increasing the number of tablets significantly beyond the number of cores is likely to have diminishing returns.

### [Inserting Data Into Kudu Tables](http://kudu.apache.org/docs/kudu_impala_integration.html#_inserting_data_into_kudu_tables)

Impala allows you to use standard SQL syntax to insert data into Kudu.

#### [Inserting Single Values](http://kudu.apache.org/docs/kudu_impala_integration.html#_inserting_single_values)

This example inserts a single row.

```sql
INSERT INTO my_first_table VALUES (99, "sarah");
```

This example inserts three rows using a single statement.

```sql
INSERT INTO my_first_table VALUES (1, "john"), (2, "jane"), (3, "jim");
```

#### [Inserting In Bulk](http://kudu.apache.org/docs/kudu_impala_integration.html#kudu_impala_insert_bulk)

When inserting in bulk, there are at least three common choices. Each may have advantages and disadvantages, depending on your data and circumstances.

- Multiple single `INSERT` statements

  This approach has the advantage of being easy to understand and implement. This approach is likely to be inefficient because Impala has a high query start-up cost compared to Kudu’s insertion performance. This will lead to relatively high latency and poor throughput.

- Single `INSERT` statement with multiple `VALUES`

  If you include more than 1024 `VALUES` statements, Impala batches them into groups of 1024 (or the value of `batch_size`) before sending the requests to Kudu. This approach may perform slightly better than multiple sequential `INSERT` statements by amortizing the query start-up penalties on the Impala side. To set the batch size for the current Impala Shell session, use the following syntax: `set batch_size=10000;`Increasing the Impala batch size causes Impala to use more memory. You should verify the impact on your cluster and tune accordingly.

- Batch Insert

  The approach that usually performs best, from the standpoint of both Impala and Kudu, is usually to import the data using a `SELECT FROM` statement in Impala.If your data is not already in Impala, one strategy is to [import it from a text file](http://www.cloudera.com/content/cloudera/en/documentation/core/latest/topics/impala_txtfile.html), such as a TSV or CSV file.[Create the Kudu table](http://kudu.apache.org/docs/kudu_impala_integration.html#kudu_impala_create_table), being mindful that the columns designated as primary keys cannot have null values.Insert values into the Kudu table by querying the table containing the original data, as in the following example:`INSERT INTO my_kudu_table   SELECT * FROM legacy_data_import_table;`

- Ingest using the C++ or Java API

  In many cases, the appropriate ingest path is to use the C++ or Java API to insert directly into Kudu tables. Unlike other Impala tables, data inserted into Kudu tables via the API becomes available for query in Impala without the need for any `INVALIDATE METADATA`statements or other statements needed for other Impala storage types.

#### [`INSERT` and Primary Key Uniqueness Violations](http://kudu.apache.org/docs/kudu_impala_integration.html#insert_ignore)

In most relational databases, if you try to insert a row that has already been inserted, the insertion will fail because the primary key would be duplicated. See [Failures During `INSERT`, `UPDATE`, and `DELETE` Operations](http://kudu.apache.org/docs/kudu_impala_integration.html#impala_insertion_caveat). Impala, however, will not fail the query. Instead, it will generate a warning, but continue to execute the remainder of the insert statement.

If the inserted rows are meant to replace existing rows, `UPSERT` may be used instead of `INSERT`.

```sql
INSERT INTO my_first_table VALUES (99, "sarah");
UPSERT INTO my_first_table VALUES (99, "zoe");
-- the current value of the row is 'zoe'
```

### [Updating a Row](http://kudu.apache.org/docs/kudu_impala_integration.html#_updating_a_row)

```sql
UPDATE my_first_table SET name="bob" where id = 3;
```

|      | The `UPDATE` statement only works in Impala when the target table is in Kudu. |
| ---- | ------------------------------------------------------------ |
|      |                                                              |

#### [Updating In Bulk](http://kudu.apache.org/docs/kudu_impala_integration.html#_updating_in_bulk)

You can update in bulk using the same approaches outlined in [Inserting In Bulk](http://kudu.apache.org/docs/kudu_impala_integration.html#kudu_impala_insert_bulk).

```sql
UPDATE my_first_table SET name="bob" where age > 10;
```

### [Deleting a Row](http://kudu.apache.org/docs/kudu_impala_integration.html#_deleting_a_row)

```sql
DELETE FROM my_first_table WHERE id < 3;
```

You can also delete using more complex syntax. A comma in the `FROM` sub-clause is one way that Impala specifies a join query. For more information about Impala joins, see <http://www.cloudera.com/content/cloudera/en/documentation/core/latest/topics/impala_joins.html>.

```sql
DELETE c FROM my_second_table c, stock_symbols s WHERE c.name = s.symbol;
```

|      | The `DELETE` statement only works in Impala when the target table is in Kudu. |
| ---- | ------------------------------------------------------------ |
|      |                                                              |

#### [Deleting In Bulk](http://kudu.apache.org/docs/kudu_impala_integration.html#_deleting_in_bulk)

You can delete in bulk using the same approaches outlined in [Inserting In Bulk](http://kudu.apache.org/docs/kudu_impala_integration.html#kudu_impala_insert_bulk).

```sql
DELETE FROM my_first_table WHERE id < 3;
```

### [Failures During `INSERT`, `UPDATE`, and `DELETE` Operations](http://kudu.apache.org/docs/kudu_impala_integration.html#impala_insertion_caveat)

`INSERT`, `UPDATE`, and `DELETE` statements cannot be considered transactional as a whole. If one of these operations fails part of the way through, the keys may have already been created (in the case of `INSERT`) or the records may have already been modified or removed by another process (in the case of `UPDATE` or `DELETE`). You should design your application with this in mind.

### [Altering Table Properties](http://kudu.apache.org/docs/kudu_impala_integration.html#_altering_table_properties)

You can change Impala’s metadata relating to a given Kudu table by altering the table’s properties. These properties include the table name, the list of Kudu master addresses, and whether the table is managed by Impala (internal) or externally.

Rename an Impala Mapping Table

```sql
ALTER TABLE my_table RENAME TO my_new_table;
```

|      | Renaming a table using the `ALTER TABLE … RENAME` statement only renames the Impala mapping table, regardless of whether the table is an internal or external table. This avoids disruption to other applications that may be accessing the underlying Kudu table. |
| ---- | ------------------------------------------------------------ |
|      |                                                              |

Rename the underlying Kudu table for an internal table

If a table is an internal table, the underlying Kudu table may be renamed by changing the `kudu.table_name` property:

```sql
ALTER TABLE my_internal_table
SET TBLPROPERTIES('kudu.table_name' = 'new_name')
```

Remapping an external table to a different Kudu table

If another application has renamed a Kudu table under Impala, it is possible to re-map an external table to point to a different Kudu table name.

```sql
ALTER TABLE my_external_table_
SET TBLPROPERTIES('kudu.table_name' = 'some_other_kudu_table')
```

Change the Kudu Master Address

```sql
ALTER TABLE my_table
SET TBLPROPERTIES('kudu.master_addresses' = 'kudu-new-master.example.com:7051');
```

Change an Internally-Managed Table to External

```sql
ALTER TABLE my_table SET TBLPROPERTIES('EXTERNAL' = 'TRUE');
```

### [Dropping a Kudu Table Using Impala](http://kudu.apache.org/docs/kudu_impala_integration.html#_dropping_a_kudu_table_using_impala)

If the table was created as an internal table in Impala, using `CREATE TABLE`, the standard `DROP TABLE` syntax drops the underlying Kudu table and all its data. If the table was created as an external table, using `CREATE EXTERNAL TABLE`, the mapping between Impala and Kudu is dropped, but the Kudu table is left intact, with all its data.

```sql
DROP TABLE my_first_table;
```

## [What’s Next?](http://kudu.apache.org/docs/kudu_impala_integration.html#_what_s_next)

The examples above have only explored a fraction of what you can do with Impala Shell.

- Learn about the [Impala project](http://impala.io/).
- Read the [Impala documentation](http://www.cloudera.com/content/www/en-us/documentation/enterprise/latest/topics/impala.html).
- View the [Impala SQL reference](http://www.cloudera.com/content/www/en-us/documentation/enterprise/latest/topics/impala_langref.html).
- Read about Impala internals or learn how to contribute to Impala on the [Impala Wiki](https://github.com/cloudera/Impala/wiki).
- Read about the native [Kudu APIs](http://kudu.apache.org/docs/installation.html#view_api).

### [Known Issues and Limitations](http://kudu.apache.org/docs/kudu_impala_integration.html#_known_issues_and_limitations)

- Kudu tables with a name containing upper case or non-ascii characters must be assigned an alternate name when used as an external table in Impala.
- Kudu tables with a column name containing upper case or non-ascii characters may not be used as an external table in Impala. Columns may be renamed in Kudu to work around this issue.
- When creating a Kudu table, the `CREATE TABLE` statement must include the primary key columns before other columns, in primary key order.
- Impala can not create Kudu tables with `VARCHAR` or nested-typed columns.
- Impala cannot update values in primary key columns.
- `!=` and `LIKE` predicates are not pushed to Kudu, and instead will be evaluated by the Impala scan node. This may decrease performance relative to other types of predicates.
- Updates, inserts, and deletes via Impala are non-transactional. If a query fails part of the way through, its partial effects will not be rolled back.
- The maximum parallelism of a single query is limited to the number of tablets in a table. For good analytic performance, aim for 10 or more tablets per host for large tables.