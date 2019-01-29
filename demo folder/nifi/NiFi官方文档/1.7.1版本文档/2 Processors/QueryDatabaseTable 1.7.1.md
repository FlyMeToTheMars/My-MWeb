## Description:

Generates a SQL select query, or uses a provided statement, and executes it to fetch all rows whose values in the specified Maximum Value column(s) are larger than the previously-seen maxima. Query result will be converted to Avro format. Expression Language is supported for several properties, but no incoming connections are permitted. The Variable Registry may be used to provide values for any property containing Expression Language. If it is desired to leverage flow file attributes to perform these queries, the GenerateTableFetch and/or ExecuteSQL processors can be used for this purpose. Streaming is used so arbitrarily large result sets are supported. This processor can be scheduled to run on a timer or cron expression, using the standard scheduling methods. This processor is intended to be run on the Primary Node only. FlowFile attribute 'querydbtable.row.count' indicates how many rows were selected.

### Tags:

sql, select, jdbc, query, database

### Properties:

In the list below, the names of required properties appear in **bold**. Any other properties (not in bold) are considered optional. The table also indicates any default values, and whether a property supports the [NiFi Expression Language](https://nifi.apache.org/docs/nifi-docs/html/expression-language-guide.html).

| Name                                    | Default Value | Allowable Values                                             | Description                                                  |
| --------------------------------------- | ------------- | ------------------------------------------------------------ | ------------------------------------------------------------ |
| **Database Connection Pooling Service** |               | **Controller Service API:**  DBCPService **Implementations:** [DBCPConnectionPoolLookup](https://nifi.apache.org/docs/nifi-docs/components/org.apache.nifi/nifi-dbcp-service-nar/1.7.1/org.apache.nifi.dbcp.DBCPConnectionPoolLookup/index.html) [HiveConnectionPool](https://nifi.apache.org/docs/nifi-docs/components/org.apache.nifi/nifi-hive-nar/1.7.1/org.apache.nifi.dbcp.hive.HiveConnectionPool/index.html) [DBCPConnectionPool](https://nifi.apache.org/docs/nifi-docs/components/org.apache.nifi/nifi-dbcp-service-nar/1.7.1/org.apache.nifi.dbcp.DBCPConnectionPool/index.html) | The Controller Service that is used to obtain a connection to the database. |
| **Database Type**                       | Generic       | Generic ![Generates ANSI SQL](https://nifi.apache.org/docs/nifi-docs/html/images/iconInfo.png)Oracle ![Generates Oracle compliant SQL](https://nifi.apache.org/docs/nifi-docs/html/images/iconInfo.png)Oracle 12+ ![Generates Oracle compliant SQL for version 12 or greater](https://nifi.apache.org/docs/nifi-docs/html/images/iconInfo.png)MS SQL 2012+ ![Generates MS SQL Compatible SQL, for version 2012 or greater](https://nifi.apache.org/docs/nifi-docs/html/images/iconInfo.png)MS SQL 2008 ![Generates MS SQL Compatible SQL for version 2008](https://nifi.apache.org/docs/nifi-docs/html/images/iconInfo.png)MySQL ![Generates MySQL compatible SQL](https://nifi.apache.org/docs/nifi-docs/html/images/iconInfo.png) | The type/flavor of database, used for generating database-specific code. In many cases the Generic type should suffice, but some databases (such as Oracle) require custom SQL clauses. |
| **Table Name**                          |               |                                                              | The name of the database table to be queried. When a custom query is used, this property is used to alias the query and appears as an attribute on the FlowFile. **Supports Expression Language: true (will be evaluated using variable registry only)** |
| Columns to Return                       |               |                                                              | A comma-separated list of column names to be used in the query. If your database requires special treatment of the names (quoting, e.g.), each name should include such treatment. If no column names are supplied, all columns in the specified table will be returned. NOTE: It is important to use consistent column names for a given table for incremental fetch to work properly. **Supports Expression Language: true (will be evaluated using variable registry only)** |
| Additional WHERE clause                 |               |                                                              | A custom clause to be added in the WHERE condition when building SQL queries. **Supports Expression Language: true (will be evaluated using variable registry only)** |
| Custom Query                            |               |                                                              | A custom SQL query used to retrieve data. Instead of building a SQL query from other properties, this query will be wrapped as a sub-query. Query must have no ORDER BY statement. **Supports Expression Language: true (will be evaluated using variable registry only)** |
| Maximum-value Columns                   |               |                                                              | A comma-separated list of column names. The processor will keep track of the maximum value for each column that has been returned since the processor started running. Using multiple columns implies an order to the column list, and each column's values are expected to increase more slowly than the previous columns' values. Thus, using multiple columns implies a hierarchical structure of columns, which is usually used for partitioning tables. This processor can be used to retrieve only those rows that have been added/updated since the last retrieval. Note that some JDBC types such as bit/boolean are not conducive to maintaining maximum value, so columns of these types should not be listed in this property, and will result in error(s) during processing. If no columns are provided, all rows from the table will be considered, which could have a performance impact. NOTE: It is important to use consistent max-value column names for a given table for incremental fetch to work properly. **Supports Expression Language: true (will be evaluated using variable registry only)** |
| **Max Wait Time**                       | 0 seconds     |                                                              | The maximum amount of time allowed for a running SQL select query , zero means there is no limit. Max time less than 1 second will be equal to zero. **Supports Expression Language: true (will be evaluated using variable registry only)** |
| **Fetch Size**                          | 0             |                                                              | The number of result rows to be fetched from the result set at a time. This is a hint to the database driver and may not be honored and/or exact. If the value specified is zero, then the hint is ignored. **Supports Expression Language: true (will be evaluated using variable registry only)** |
| **Max Rows Per Flow File**              | 0             |                                                              | The maximum number of result rows that will be included in a single FlowFile. This will allow you to break up very large result sets into multiple FlowFiles. If the value specified is zero, then all rows are returned in a single FlowFile. **Supports Expression Language: true (will be evaluated using variable registry only)** |
| **Output Batch Size**                   | 0             |                                                              | The number of output FlowFiles to queue before committing the process session. When set to zero, the session will be committed when all result set rows have been processed and the output FlowFiles are ready for transfer to the downstream relationship. For large result sets, this can cause a large burst of FlowFiles to be transferred at the end of processor execution. If this property is set, then when the specified number of FlowFiles are ready for transfer, then the session will be committed, thus releasing the FlowFiles to the downstream relationship. NOTE: The maxvalue.* and fragment.count attributes will not be set on FlowFiles when this property is set. **Supports Expression Language: true (will be evaluated using variable registry only)** |
| **Maximum Number of Fragments**         | 0             |                                                              | The maximum number of fragments. If the value specified is zero, then all fragments are returned. This prevents OutOfMemoryError when this processor ingests huge table. NOTE: Setting this property can result in data loss, as the incoming results are not ordered, and fragments may end at arbitrary boundaries where rows are not included in the result set. **Supports Expression Language: true (will be evaluated using variable registry only)** |
| **Normalize Table/Column Names**        | false         | truefalse                                                    | Whether to change non-Avro-compatible characters in column names to Avro-compatible characters. For example, colons and periods will be changed to underscores in order to build a valid Avro record. |
| **Use Avro Logical Types**              | false         | truefalse                                                    | Whether to use Avro Logical Types for DECIMAL/NUMBER, DATE, TIME and TIMESTAMP columns. If disabled, written as string. If enabled, Logical types are used and written as its underlying type, specifically, DECIMAL/NUMBER as logical 'decimal': written as bytes with additional precision and scale meta data, DATE as logical 'date-millis': written as int denoting days since Unix epoch (1970-01-01), TIME as logical 'time-millis': written as int denoting milliseconds since Unix epoch, and TIMESTAMP as logical 'timestamp-millis': written as long denoting milliseconds since Unix epoch. If a reader of written Avro records also knows these logical types, then these values can be deserialized with more context depending on reader implementation. |
| **Default Decimal Precision**           | 10            |                                                              | When a DECIMAL/NUMBER value is written as a 'decimal' Avro logical type, a specific 'precision' denoting number of available digits is required. Generally, precision is defined by column data type definition or database engines default. However undefined precision (0) can be returned from some database engines. 'Default Decimal Precision' is used when writing those undefined precision numbers. **Supports Expression Language: true (will be evaluated using variable registry only)** |
| **Default Decimal Scale**               | 0             |                                                              | When a DECIMAL/NUMBER value is written as a 'decimal' Avro logical type, a specific 'scale' denoting number of available decimal digits is required. Generally, scale is defined by column data type definition or database engines default. However when undefined precision (0) is returned, scale can also be uncertain with some database engines. 'Default Decimal Scale' is used when writing those undefined numbers. If a value has more decimals than specified scale, then the value will be rounded-up, e.g. 1.53 becomes 2 with scale 0, and 1.5 with scale 1. **Supports Expression Language: true (will be evaluated using variable registry only)** |

### Dynamic Properties:

Dynamic Properties allow the user to specify both the name and value of a property.

| Name                                | Value                                          | Description                                                  |
| ----------------------------------- | ---------------------------------------------- | ------------------------------------------------------------ |
| initial.maxvalue.<max_value_column> | Initial maximum value for the specified column | Specifies an initial max value for max value column(s). Properties should be added in the format `initial.maxvalue.<max_value_column>`. This value is only used the first time the table is accessed (when a Maximum Value Column is specified). **Supports Expression Language: true (will be evaluated using variable registry only)** |



### Relationships:

| Name    | Description                                              |
| ------- | -------------------------------------------------------- |
| success | Successfully created FlowFile from SQL query result set. |

### Reads Attributes:

None specified.

### Writes Attributes:

| Name                   | Description                                                  |
| ---------------------- | ------------------------------------------------------------ |
| tablename              | Name of the table being queried                              |
| querydbtable.row.count | The number of rows selected by the query                     |
| fragment.identifier    | If 'Max Rows Per Flow File' is set then all FlowFiles from the same query result set will have the same value for the fragment.identifier attribute. This can then be used to correlate the results. |
| fragment.count         | If 'Max Rows Per Flow File' is set then this is the total number of FlowFiles produced by a single ResultSet. This can be used in conjunction with the fragment.identifier attribute in order to know how many FlowFiles belonged to the same incoming ResultSet. If Output Batch Size is set, then this attribute will not be populated. |
| fragment.index         | If 'Max Rows Per Flow File' is set then the position of this FlowFile in the list of outgoing FlowFiles that were all derived from the same result set FlowFile. This can be used in conjunction with the fragment.identifier attribute to know which FlowFiles originated from the same query result set and in what order FlowFiles were produced |
| maxvalue.*             | Each attribute contains the observed maximum value of a specified 'Maximum-value Column'. The suffix of the attribute is the name of the column. If Output Batch Size is set, then this attribute will not be populated. |

### State management:

| Scope   | Description                                                  |
| ------- | ------------------------------------------------------------ |
| CLUSTER | After performing a query on the specified table, the maximum values for the specified column(s) will be retained for use in future executions of the query. This allows the Processor to fetch only those records that have max values greater than the retained values. This can be used for incremental fetching, fetching of newly added rows, etc. To clear the maximum values, clear the state of the processor per the State Management documentation |

### Restricted:

This component is not restricted.

### Input requirement:

This component does not allow an incoming relationship.

### System Resource Considerations:

None specified.

### See Also:

[GenerateTableFetch](https://nifi.apache.org/docs/nifi-docs/components/org.apache.nifi/nifi-standard-nar/1.7.1/org.apache.nifi.processors.standard.GenerateTableFetch/index.html), [ExecuteSQL](https://nifi.apache.org/docs/nifi-docs/components/org.apache.nifi/nifi-standard-nar/1.7.1/org.apache.nifi.processors.standard.ExecuteSQL/index.html)