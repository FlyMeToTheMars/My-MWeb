## Description:

Retrieves Change Data Capture (CDC) events from a MySQL database. CDC Events include INSERT, UPDATE, DELETE operations. Events are output as individual flow files ordered by the time at which the operation occurred.

### Tags:

sql, jdbc, cdc, mysql

### Properties:

In the list below, the names of required properties appear in **bold**. Any other properties (not in bold) are considered optional. The table also indicates any default values, whether a property supports the [NiFi Expression Language](https://nifi.apache.org/docs/nifi-docs/html/expression-language-guide.html), and whether a property is considered "sensitive", meaning that its value will be encrypted. Before entering a value in a sensitive property, ensure that the **nifi.properties** file has an entry for the property **nifi.sensitive.props.key**.

| Name                            | Default Value         | Allowable Values                                             | Description                                                  |
| ------------------------------- | --------------------- | ------------------------------------------------------------ | ------------------------------------------------------------ |
| **MySQL Hosts**                 |                       |                                                              | A list of hostname/port entries corresponding to nodes in a MySQL cluster. The entries should be comma separated using a colon such as host1:port,host2:port,.... For example mysql.myhost.com:3306. This processor will attempt to connect to the hosts in the list in order. If one node goes down and failover is enabled for the cluster, then the processor will connect to the active node (assuming its host entry is specified in this property. The default port for MySQL connections is 3306. **Supports Expression Language: true (will be evaluated using variable registry only)** |
| **MySQL Driver Class Name**     | com.mysql.jdbc.Driver |                                                              | The class name of the MySQL database driver class **Supports Expression Language: true (will be evaluated using variable registry only)** |
| MySQL Driver Location(s)        |                       |                                                              | Comma-separated list of files/folders and/or URLs containing the MySQL driver JAR and its dependencies (if any). For example '/var/tmp/mysql-connector-java-5.1.38-bin.jar' **Supports Expression Language: true (will be evaluated using variable registry only)** |
| Username                        |                       |                                                              | Username to access the MySQL cluster **Supports Expression Language: true (will be evaluated using variable registry only)** |
| Password                        |                       |                                                              | Password to access the MySQL cluster **Sensitive Property: true** **Supports Expression Language: true (will be evaluated using variable registry only)** |
| Server ID                       |                       |                                                              | The client connecting to the MySQL replication group is actually a simplified slave (server), and the Server ID value must be unique across the whole replication group (i.e. different from any other Server ID being used by any master or slave). Thus, each instance of CaptureChangeMySQL must have a Server ID unique across the replication group. If the Server ID is not specified, it defaults to 65535. **Supports Expression Language: true (will be evaluated using variable registry only)** |
| Database/Schema Name Pattern    |                       |                                                              | A regular expression (regex) for matching databases (or schemas, depending on your RDBMS' terminology) against the list of CDC events. The regex must match the database name as it is stored in the RDBMS. If the property is not set, the database name will not be used to filter the CDC events. NOTE: DDL events, even if they affect different databases, are associated with the database used by the session to execute the DDL. This means if a connection is made to one database, but the DDL is issued against another, then the connected database will be the one matched against the specified pattern. |
| Table Name Pattern              |                       |                                                              | A regular expression (regex) for matching CDC events affecting matching tables. The regex must match the table name as it is stored in the database. If the property is not set, no events will be filtered based on table name. |
| **Max Wait Time**               | 30 seconds            |                                                              | The maximum amount of time allowed for a connection to be established, zero means there is effectively no limit. **Supports Expression Language: true (will be evaluated using variable registry only)** |
| Distributed Map Cache Client    |                       | **Controller Service API:**  DistributedMapCacheClient **Implementations:** [HBase_1_1_2_ClientMapCacheService](https://nifi.apache.org/docs/nifi-docs/components/org.apache.nifi/nifi-hbase_1_1_2-client-service-nar/1.7.1/org.apache.nifi.hbase.HBase_1_1_2_ClientMapCacheService/index.html) [CouchbaseMapCacheClient](https://nifi.apache.org/docs/nifi-docs/components/org.apache.nifi/nifi-couchbase-nar/1.7.1/org.apache.nifi.couchbase.CouchbaseMapCacheClient/index.html) [DistributedMapCacheClientService](https://nifi.apache.org/docs/nifi-docs/components/org.apache.nifi/nifi-distributed-cache-services-nar/1.7.1/org.apache.nifi.distributed.cache.client.DistributedMapCacheClientService/index.html) [RedisDistributedMapCacheClientService](https://nifi.apache.org/docs/nifi-docs/components/org.apache.nifi/nifi-redis-nar/1.7.1/org.apache.nifi.redis.service.RedisDistributedMapCacheClientService/index.html) | Identifies a Distributed Map Cache Client controller service to be used for keeping information about the various tables, columns, etc. needed by the processor. If a client is not specified, the generated events will not include column type or name information. |
| **Retrieve All Records**        | true                  | truefalse                                                    | Specifies whether to get all available CDC events, regardless of the current binlog filename and/or position. If binlog filename and position values are present in the processor's State, this property's value is ignored. This allows for 4 different configurations: 1) If binlog data is available in processor State, that is used to determine the start location and the value of Retrieve All Records is ignored. 2) If no binlog data is in processor State, then Retrieve All Records set to true means start at the beginning of the binlog history. 3) If no binlog data is in processor State and Initial Binlog Filename/Position are not set, then Retrieve All Records set to false means start at the end of the binlog history. 4) If no binlog data is in processor State and Initial Binlog Filename/Position are set, then Retrieve All Records set to false means start at the specified initial binlog file/position. To reset the behavior, clear the processor state (refer to the State Management section of the processor's documentation). |
| **Include Begin/Commit Events** | false                 | truefalse                                                    | Specifies whether to emit events corresponding to a BEGIN or COMMIT event in the binary log. Set to true if the BEGIN/COMMIT events are necessary in the downstream flow, otherwise set to false, which suppresses generation of these events and can increase flow performance. |
| **Include DDL Events**          | false                 | truefalse                                                    | Specifies whether to emit events corresponding to Data Definition Language (DDL) events such as ALTER TABLE, TRUNCATE TABLE, e.g. in the binary log. Set to true if the DDL events are desired/necessary in the downstream flow, otherwise set to false, which suppresses generation of these events and can increase flow performance. |
| **State Update Interval**       | 0 seconds             |                                                              | Indicates how often to update the processor's state with binlog file/position values. A value of zero means that state will only be updated when the processor is stopped or shutdown. If at some point the processor state does not contain the desired binlog values, the last flow file emitted will contain the last observed values, and the processor can be returned to that state by using the Initial Binlog File, Initial Binlog Position, and Initial Sequence ID properties. **Supports Expression Language: true (will be evaluated using variable registry only)** |
| Initial Sequence ID             |                       |                                                              | Specifies an initial sequence identifier to use if this processor's State does not have a current sequence identifier. If a sequence identifier is present in the processor's State, this property is ignored. Sequence identifiers are monotonically increasing integers that record the order of flow files generated by the processor. They can be used with the EnforceOrder processor to guarantee ordered delivery of CDC events. **Supports Expression Language: true (will be evaluated using variable registry only)** |
| Initial Binlog Filename         |                       |                                                              | Specifies an initial binlog filename to use if this processor's State does not have a current binlog filename. If a filename is present in the processor's State, this property is ignored. This can be used along with Initial Binlog Position to "skip ahead" if previous events are not desired. Note that NiFi Expression Language is supported, but this property is evaluated when the processor is configured, so FlowFile attributes may not be used. Expression Language is supported to enable the use of the Variable Registry and/or environment properties. **Supports Expression Language: true (will be evaluated using variable registry only)** |
| Initial Binlog Position         |                       |                                                              | Specifies an initial offset into a binlog (specified by Initial Binlog Filename) to use if this processor's State does not have a current binlog filename. If a filename is present in the processor's State, this property is ignored. This can be used along with Initial Binlog Filename to "skip ahead" if previous events are not desired. Note that NiFi Expression Language is supported, but this property is evaluated when the processor is configured, so FlowFile attributes may not be used. Expression Language is supported to enable the use of the Variable Registry and/or environment properties. **Supports Expression Language: true (will be evaluated using variable registry only)** |

### Relationships:

| Name    | Description                                              |
| ------- | -------------------------------------------------------- |
| success | Successfully created FlowFile from SQL query result set. |

### Reads Attributes:

None specified.

### Writes Attributes:

| Name            | Description                                                  |
| --------------- | ------------------------------------------------------------ |
| cdc.sequence.id | A sequence identifier (i.e. strictly increasing integer value) specifying the order of the CDC event flow file relative to the other event flow file(s). |
| cdc.event.type  | A string indicating the type of CDC event that occurred, including (but not limited to) 'begin', 'insert', 'update', 'delete', 'ddl' and 'commit'. |
| mime.type       | The processor outputs flow file content in JSON format, and sets the mime.type attribute to application/json |

### State management:

| Scope   | Description                                                  |
| ------- | ------------------------------------------------------------ |
| CLUSTER | Information such as a 'pointer' to the current CDC event in the database is stored by this processor, such that it can continue from the same location if restarted. |

### Restricted:

This component is not restricted.

### Input requirement:

This component does not allow an incoming relationship.

### System Resource Considerations:

None specified.