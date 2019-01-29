## Description:

Evaluates one or more SQL queries against the contents of a FlowFile. The result of the SQL query then becomes the content of the output FlowFile. 

This can be used, for example, for field-specific filtering, transformation, and row-level filtering. Columns can be renamed, simple calculations and aggregations performed, etc. The Processor is configured with a Record Reader Controller Service and a Record Writer service so as to allow flexibility in incoming and outgoing data formats. The Processor must be configured with at least one user-defined property. The name of the Property is the Relationship to route data to, and the value of the Property is a SQL SELECT statement that is used to specify how input data should be transformed/filtered. The SQL statement must be valid ANSI SQL and is powered by Apache Calcite. If the transformation fails, the original FlowFile is routed to the 'failure' relationship. Otherwise, the data selected will be routed to the associated relationship. If the Record Writer chooses to inherit the schema from the Record, it is important to note that the schema that is inherited will be from the ResultSet, rather than the input Record. This allows a single instance of the QueryRecord processor to have multiple queries, each of which returns a different set of columns and aggregations. As a result, though, the schema that is derived will have no schema name, so it is important that the configured Record Writer not attempt to write the Schema Name as an attribute if inheriting the Schema from the Record. See the Processor Usage documentation for more information.

[Additional Details...](https://nifi.apache.org/docs/nifi-docs/components/org.apache.nifi/nifi-standard-nar/1.7.1/org.apache.nifi.processors.standard.QueryRecord/additionalDetails.html)

### Tags:

sql, query, calcite, route, record, transform, select, update, modify, etl, filter, record, csv, json, logs, text, avro, aggregate

### Properties:

In the list below, the names of required properties appear in **bold**. Any other properties (not in bold) are considered optional. The table also indicates any default values.

| Name                              | Default Value | Allowable Values                                             | Description                                                  |
| --------------------------------- | ------------- | ------------------------------------------------------------ | ------------------------------------------------------------ |
| **Record Reader**                 |               | **Controller Service API:**  RecordReaderFactory **Implementations:** [JsonTreeReader](https://nifi.apache.org/docs/nifi-docs/components/org.apache.nifi/nifi-record-serialization-services-nar/1.7.1/org.apache.nifi.json.JsonTreeReader/index.html) [AvroReader](https://nifi.apache.org/docs/nifi-docs/components/org.apache.nifi/nifi-record-serialization-services-nar/1.7.1/org.apache.nifi.avro.AvroReader/index.html) [CSVReader](https://nifi.apache.org/docs/nifi-docs/components/org.apache.nifi/nifi-record-serialization-services-nar/1.7.1/org.apache.nifi.csv.CSVReader/index.html) [XMLReader](https://nifi.apache.org/docs/nifi-docs/components/org.apache.nifi/nifi-record-serialization-services-nar/1.7.1/org.apache.nifi.xml.XMLReader/index.html) [JsonPathReader](https://nifi.apache.org/docs/nifi-docs/components/org.apache.nifi/nifi-record-serialization-services-nar/1.7.1/org.apache.nifi.json.JsonPathReader/index.html) [ScriptedReader](https://nifi.apache.org/docs/nifi-docs/components/org.apache.nifi/nifi-scripting-nar/1.7.1/org.apache.nifi.record.script.ScriptedReader/index.html) [GrokReader](https://nifi.apache.org/docs/nifi-docs/components/org.apache.nifi/nifi-record-serialization-services-nar/1.7.1/org.apache.nifi.grok.GrokReader/index.html) | Specifies the Controller Service to use for parsing incoming data and determining the data's schema |
| **Record Writer**                 |               | **Controller Service API:**  RecordSetWriterFactory **Implementations:** [AvroRecordSetWriter](https://nifi.apache.org/docs/nifi-docs/components/org.apache.nifi/nifi-record-serialization-services-nar/1.7.1/org.apache.nifi.avro.AvroRecordSetWriter/index.html) [CSVRecordSetWriter](https://nifi.apache.org/docs/nifi-docs/components/org.apache.nifi/nifi-record-serialization-services-nar/1.7.1/org.apache.nifi.csv.CSVRecordSetWriter/index.html) [JsonRecordSetWriter](https://nifi.apache.org/docs/nifi-docs/components/org.apache.nifi/nifi-record-serialization-services-nar/1.7.1/org.apache.nifi.json.JsonRecordSetWriter/index.html) [ScriptedRecordSetWriter](https://nifi.apache.org/docs/nifi-docs/components/org.apache.nifi/nifi-scripting-nar/1.7.1/org.apache.nifi.record.script.ScriptedRecordSetWriter/index.html) [XMLRecordSetWriter](https://nifi.apache.org/docs/nifi-docs/components/org.apache.nifi/nifi-record-serialization-services-nar/1.7.1/org.apache.nifi.xml.XMLRecordSetWriter/index.html) [FreeFormTextRecordSetWriter](https://nifi.apache.org/docs/nifi-docs/components/org.apache.nifi/nifi-record-serialization-services-nar/1.7.1/org.apache.nifi.text.FreeFormTextRecordSetWriter/index.html) | Specifies the Controller Service to use for writing results to a FlowFile |
| **Include Zero Record FlowFiles** | true          | truefalse                                                    | When running the SQL statement against an incoming FlowFile, if the result has no data, this property specifies whether or not a FlowFile will be sent to the corresponding relationship |
| **Cache Schema**                  | true          | truefalse                                                    | Parsing the SQL query and deriving the FlowFile's schema is relatively expensive. If this value is set to true, the Processor will cache these values so that the Processor is much more efficient and much faster. However, if this is done, then the schema that is derived for the first FlowFile processed must apply to all FlowFiles. If all FlowFiles will not have the exact same schema, or if the SQL SELECT statement uses the Expression Language, this value should be set to false. |

### Dynamic Properties:

Dynamic Properties allow the user to specify both the name and value of a property.

| Name                                          | Value                                                        | Description                                                  |
| --------------------------------------------- | ------------------------------------------------------------ | ------------------------------------------------------------ |
| The name of the relationship to route data to | A SQL SELECT statement that is used to determine what data should be routed to this relationship. | Each user-defined property specifies a SQL SELECT statement to run over the data, with the data that is selected being routed to the relationship whose name is the property name **Supports Expression Language: true (will be evaluated using flow file attributes and variable registry)** |



### Relationships:

| Name     | Description                                                  |
| -------- | ------------------------------------------------------------ |
| failure  | If a FlowFile fails processing for any reason (for example, the SQL statement contains columns not present in input data), the original FlowFile it will be routed to this relationship |
| original | The original FlowFile is routed to this relationship         |

### Dynamic Relationships:

A Dynamic Relationship may be created based on how the user configures the Processor.

| Name            | Description                                                  |
| --------------- | ------------------------------------------------------------ |
| <Property Name> | Each user-defined property defines a new Relationship for this Processor. |



### Reads Attributes:

None specified.

### Writes Attributes:

| Name         | Description                                                  |
| ------------ | ------------------------------------------------------------ |
| mime.type    | Sets the mime.type attribute to the MIME Type specified by the Record Writer |
| record.count | The number of records selected by the query                  |

### State management:

This component does not store state.

### Restricted:

This component is not restricted.

### Input requirement:

This component requires an incoming relationship.

### System Resource Considerations:

None specified.