## Description:

Converts a JSON-formatted FlowFile into an UPDATE, INSERT, or DELETE SQL statement. The incoming FlowFile is expected to be "flat" JSON message, meaning that it consists of a single JSON element and each field maps to a simple type. If a field maps to a JSON object, that JSON object will be interpreted as Text. If the input is an array of JSON elements, each element in the array is output as a separate FlowFile to the 'sql' relationship. Upon successful conversion, the original FlowFile is routed to the 'original' relationship and the SQL is routed to the 'sql' relationship.

### Tags:

json, sql, database, rdbms, insert, update, delete, relational, flat

### Properties:

In the list below, the names of required properties appear in **bold**. Any other properties (not in bold) are considered optional. The table also indicates any default values, and whether a property supports the [NiFi Expression Language](https://nifi.apache.org/docs/nifi-docs/html/expression-language-guide.html).

| Name                               | Default Value             | Allowable Values                                             | Description                                                  |
| ---------------------------------- | ------------------------- | ------------------------------------------------------------ | ------------------------------------------------------------ |
| **JDBC Connection Pool**           |                           | **Controller Service API:**  DBCPService **Implementations:** [DBCPConnectionPoolLookup](https://nifi.apache.org/docs/nifi-docs/components/org.apache.nifi/nifi-dbcp-service-nar/1.7.1/org.apache.nifi.dbcp.DBCPConnectionPoolLookup/index.html) [HiveConnectionPool](https://nifi.apache.org/docs/nifi-docs/components/org.apache.nifi/nifi-hive-nar/1.7.1/org.apache.nifi.dbcp.hive.HiveConnectionPool/index.html) [DBCPConnectionPool](https://nifi.apache.org/docs/nifi-docs/components/org.apache.nifi/nifi-dbcp-service-nar/1.7.1/org.apache.nifi.dbcp.DBCPConnectionPool/index.html) | Specifies the JDBC Connection Pool to use in order to convert the JSON message to a SQL statement. The Connection Pool is necessary in order to determine the appropriate database column types. |
| **Statement Type**                 |                           | UPDATEINSERTDELETE                                           | Specifies the type of SQL Statement to generate              |
| **Table Name**                     |                           |                                                              | The name of the table that the statement should update **Supports Expression Language: true (will be evaluated using flow file attributes and variable registry)** |
| Catalog Name                       |                           |                                                              | The name of the catalog that the statement should update. This may not apply for the database that you are updating. In this case, leave the field empty **Supports Expression Language: true (will be evaluated using flow file attributes and variable registry)** |
| Schema Name                        |                           |                                                              | The name of the schema that the table belongs to. This may not apply for the database that you are updating. In this case, leave the field empty **Supports Expression Language: true (will be evaluated using flow file attributes and variable registry)** |
| Translate Field Names              | true                      | truefalse                                                    | If true, the Processor will attempt to translate JSON field names into the appropriate column names for the table specified. If false, the JSON field names must match the column names exactly, or the column will not be updated |
| Unmatched Field Behavior           | Ignore Unmatched Fields   | Ignore Unmatched Fields ![Any field in the JSON document that cannot be mapped to a column in the database is ignored](https://nifi.apache.org/docs/nifi-docs/html/images/iconInfo.png)Fail ![If the JSON document has any field that cannot be mapped to a column in the database, the FlowFile will be routed to the failure relationship](https://nifi.apache.org/docs/nifi-docs/html/images/iconInfo.png) | If an incoming JSON element has a field that does not map to any of the database table's columns, this property specifies how to handle the situation |
| Unmatched Column Behavior          | Fail on Unmatched Columns | Ignore Unmatched Columns ![Any column in the database that does not have a field in the JSON document will be assumed to not be required.  No notification will be logged](https://nifi.apache.org/docs/nifi-docs/html/images/iconInfo.png)Warn on Unmatched Columns ![Any column in the database that does not have a field in the JSON document will be assumed to not be required.  A warning will be logged](https://nifi.apache.org/docs/nifi-docs/html/images/iconInfo.png)Fail on Unmatched Columns ![A flow will fail if any column in the database that does not have a field in the JSON document.  An error will be logged](https://nifi.apache.org/docs/nifi-docs/html/images/iconInfo.png) | If an incoming JSON element does not have a field mapping for all of the database table's columns, this property specifies how to handle the situation |
| Update Keys                        |                           |                                                              | A comma-separated list of column names that uniquely identifies a row in the database for UPDATE statements. If the Statement Type is UPDATE and this property is not set, the table's Primary Keys are used. In this case, if no Primary Key exists, the conversion to SQL will fail if Unmatched Column Behaviour is set to FAIL. This property is ignored if the Statement Type is INSERT **Supports Expression Language: true (will be evaluated using flow file attributes and variable registry)** |
| Quote Column Identifiers           | false                     | truefalse                                                    | Enabling this option will cause all column names to be quoted, allowing you to use reserved words as column names in your tables. |
| Quote Table Identifiers            | false                     | truefalse                                                    | Enabling this option will cause the table name to be quoted to support the use of special characters in the table name |
| **SQL Parameter Attribute Prefix** | sql                       |                                                              | The string to be prepended to the outgoing flow file attributes, such as <sql>.args.1.value, where <sql> is replaced with the specified value **Supports Expression Language: true (will be evaluated using flow file attributes and variable registry)** |

### Relationships:

| Name     | Description                                                  |
| -------- | ------------------------------------------------------------ |
| sql      | A FlowFile is routed to this relationship when its contents have successfully been converted into a SQL statement |
| failure  | A FlowFile is routed to this relationship if it cannot be converted into a SQL statement. Common causes include invalid JSON content or the JSON content missing a required field (if using an INSERT statement type). |
| original | When a FlowFile is converted to SQL, the original JSON FlowFile is routed to this relationship |

### Reads Attributes:

None specified.

### Writes Attributes:

| Name                | Description                                                  |
| ------------------- | ------------------------------------------------------------ |
| mime.type           | Sets mime.type of FlowFile that is routed to 'sql' to 'text/plain'. |
| <sql>.table         | Sets the <sql>.table attribute of FlowFile that is routed to 'sql' to the name of the table that is updated by the SQL statement. The prefix for this attribute ('sql', e.g.) is determined by the SQL Parameter Attribute Prefix property. |
| <sql>.catalog       | If the Catalog name is set for this database, specifies the name of the catalog that the SQL statement will update. If no catalog is used, this attribute will not be added. The prefix for this attribute ('sql', e.g.) is determined by the SQL Parameter Attribute Prefix property. |
| fragment.identifier | All FlowFiles routed to the 'sql' relationship for the same incoming FlowFile (multiple will be output for the same incoming FlowFile if the incoming FlowFile is a JSON Array) will have the same value for the fragment.identifier attribute. This can then be used to correlate the results. |
| fragment.count      | The number of SQL FlowFiles that were produced for same incoming FlowFile. This can be used in conjunction with the fragment.identifier attribute in order to know how many FlowFiles belonged to the same incoming FlowFile. |
| fragment.index      | The position of this FlowFile in the list of outgoing FlowFiles that were all derived from the same incoming FlowFile. This can be used in conjunction with the fragment.identifier and fragment.count attributes to know which FlowFiles originated from the same incoming FlowFile and in what order the SQL FlowFiles were produced |
| <sql>.args.N.type   | The output SQL statements are parametrized in order to avoid SQL Injection Attacks. The types of the Parameters to use are stored in attributes named <sql>.args.1.type, <sql>.args.2.type, <sql>.args.3.type, and so on. The type is a number representing a JDBC Type constant. Generally, this is useful only for software to read and interpret but is added so that a processor such as PutSQL can understand how to interpret the values. The prefix for this attribute ('sql', e.g.) is determined by the SQL Parameter Attribute Prefix property. |
| <sql>.args.N.value  | The output SQL statements are parametrized in order to avoid SQL Injection Attacks. The values of the Parameters to use are stored in the attributes named sql.args.1.value, sql.args.2.value, sql.args.3.value, and so on. Each of these attributes has a corresponding <sql>.args.N.type attribute that indicates how the value should be interpreted when inserting it into the database.The prefix for this attribute ('sql', e.g.) is determined by the SQL Parameter Attribute Prefix property. |

### State management:

This component does not store state.

### Restricted:

This component is not restricted.

### Input requirement:

This component requires an incoming relationship.

### System Resource Considerations:

None specified.

### See Also:

[PutSQL](https://nifi.apache.org/docs/nifi-docs/components/org.apache.nifi/nifi-standard-nar/1.7.1/org.apache.nifi.processors.standard.PutSQL/index.html)