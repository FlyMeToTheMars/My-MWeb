## Description:

Executes provided SQL select query. Query result will be converted to Avro format. Streaming is used so arbitrarily large result sets are supported. This processor can be scheduled to run on a timer, or cron expression, using the standard scheduling methods, or it can be triggered by an incoming FlowFile. If it is triggered by an incoming FlowFile, then attributes of that FlowFile will be available when evaluating the select query, and the query may use the ? to escape parameters. In this case, the parameters to use must exist as FlowFile attributes with the naming convention sql.args.N.type and sql.args.N.value, where N is a positive integer. The sql.args.N.type is expected to be a number indicating the JDBC Type. The content of the FlowFile is expected to be in UTF-8 format. FlowFile attribute 'executesql.row.count' indicates how many rows were selected.

### Tags:

sql, select, jdbc, query, database

### Properties:

In the list below, the names of required properties appear in **bold**. Any other properties (not in bold) are considered optional. The table also indicates any default values, and whether a property supports the [NiFi Expression Language](https://nifi.apache.org/docs/nifi-docs/html/expression-language-guide.html).

| Name                                    | Default Value | Allowable Values                                             | Description                                                  |
| --------------------------------------- | ------------- | ------------------------------------------------------------ | ------------------------------------------------------------ |
| **Database Connection Pooling Service** |               | **Controller Service API:**  DBCPService **Implementations:** [DBCPConnectionPoolLookup](https://nifi.apache.org/docs/nifi-docs/components/org.apache.nifi/nifi-dbcp-service-nar/1.7.1/org.apache.nifi.dbcp.DBCPConnectionPoolLookup/index.html) [HiveConnectionPool](https://nifi.apache.org/docs/nifi-docs/components/org.apache.nifi/nifi-hive-nar/1.7.1/org.apache.nifi.dbcp.hive.HiveConnectionPool/index.html) [DBCPConnectionPool](https://nifi.apache.org/docs/nifi-docs/components/org.apache.nifi/nifi-dbcp-service-nar/1.7.1/org.apache.nifi.dbcp.DBCPConnectionPool/index.html) | The Controller Service that is used to obtain connection to database |
| SQL select query                        |               |                                                              | The SQL select query to execute. The query can be empty, a constant value, or built from attributes using Expression Language. If this property is specified, it will be used regardless of the content of incoming flowfiles. If this property is empty, the content of the incoming flow file is expected to contain a valid SQL select query, to be issued by the processor to the database. Note that Expression Language is not evaluated for flow file contents. **Supports Expression Language: true (will be evaluated using flow file attributes and variable registry)** |
| **Max Wait Time**                       | 0 seconds     |                                                              | The maximum amount of time allowed for a running SQL select query , zero means there is no limit. Max time less than 1 second will be equal to zero. |
| **Normalize Table/Column Names**        | false         | truefalse                                                    | Whether to change non-Avro-compatible characters in column names to Avro-compatible characters. For example, colons and periods will be changed to underscores in order to build a valid Avro record. |
| **Use Avro Logical Types**              | false         | truefalse                                                    | Whether to use Avro Logical Types for DECIMAL/NUMBER, DATE, TIME and TIMESTAMP columns. If disabled, written as string. If enabled, Logical types are used and written as its underlying type, specifically, DECIMAL/NUMBER as logical 'decimal': written as bytes with additional precision and scale meta data, DATE as logical 'date-millis': written as int denoting days since Unix epoch (1970-01-01), TIME as logical 'time-millis': written as int denoting milliseconds since Unix epoch, and TIMESTAMP as logical 'timestamp-millis': written as long denoting milliseconds since Unix epoch. If a reader of written Avro records also knows these logical types, then these values can be deserialized with more context depending on reader implementation. |
| **Default Decimal Precision**           | 10            |                                                              | When a DECIMAL/NUMBER value is written as a 'decimal' Avro logical type, a specific 'precision' denoting number of available digits is required. Generally, precision is defined by column data type definition or database engines default. However undefined precision (0) can be returned from some database engines. 'Default Decimal Precision' is used when writing those undefined precision numbers. **Supports Expression Language: true (will be evaluated using flow file attributes and variable registry)** |
| **Default Decimal Scale**               | 0             |                                                              | When a DECIMAL/NUMBER value is written as a 'decimal' Avro logical type, a specific 'scale' denoting number of available decimal digits is required. Generally, scale is defined by column data type definition or database engines default. However when undefined precision (0) is returned, scale can also be uncertain with some database engines. 'Default Decimal Scale' is used when writing those undefined numbers. If a value has more decimals than specified scale, then the value will be rounded-up, e.g. 1.53 becomes 2 with scale 0, and 1.5 with scale 1. **Supports Expression Language: true (will be evaluated using flow file attributes and variable registry)** |

### Relationships:

| Name    | Description                                                  |
| ------- | ------------------------------------------------------------ |
| success | Successfully created FlowFile from SQL query result set.     |
| failure | SQL query execution failed. Incoming FlowFile will be penalized and routed to this relationship |

### Reads Attributes:

| Name              | Description                                                  |
| ----------------- | ------------------------------------------------------------ |
| sql.args.N.type   | Incoming FlowFiles are expected to be parametrized SQL statements. The type of each Parameter is specified as an integer that represents the JDBC Type of the parameter. |
| sql.args.N.value  | Incoming FlowFiles are expected to be parametrized SQL statements. The value of the Parameters are specified as sql.args.1.value, sql.args.2.value, sql.args.3.value, and so on. The type of the sql.args.1.value Parameter is specified by the sql.args.1.type attribute. |
| sql.args.N.format | This attribute is always optional, but default options may not always work for your data. Incoming FlowFiles are expected to be parametrized SQL statements. In some cases a format option needs to be specified, currently this is only applicable for binary data types, dates, times and timestamps. Binary Data Types (defaults to 'ascii') - ascii: each string character in your attribute value represents a single byte. This is the format provided by Avro Processors. base64: the string is a Base64 encoded string that can be decoded to bytes. hex: the string is hex encoded with all letters in upper case and no '0x' at the beginning. Dates/Times/Timestamps - Date, Time and Timestamp formats all support both custom formats or named format ('yyyy-MM-dd','ISO_OFFSET_DATE_TIME') as specified according to java.time.format.DateTimeFormatter. If not specified, a long value input is expected to be an unix epoch (milli seconds from 1970/1/1), or a string value in 'yyyy-MM-dd' format for Date, 'HH:mm:ss.SSS' for Time (some database engines e.g. Derby or MySQL do not support milliseconds and will truncate milliseconds), 'yyyy-MM-dd HH:mm:ss.SSS' for Timestamp is used. |

### Writes Attributes:

| Name                       | Description                                                  |
| -------------------------- | ------------------------------------------------------------ |
| executesql.row.count       | Contains the number of rows returned in the select query     |
| executesql.query.duration  | Duration of the query in milliseconds                        |
| executesql.resultset.index | Assuming multiple result sets are returned, the zero based index of this result set. |

### State management:

This component does not store state.

### Restricted:

This component is not restricted.

### Input requirement:

This component allows an incoming relationship.

### System Resource Considerations:

None specified.