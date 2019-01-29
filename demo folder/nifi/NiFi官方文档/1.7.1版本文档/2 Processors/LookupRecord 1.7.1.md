## Description:

Extracts one or more fields from a Record and looks up a value for those fields in a LookupService. 

If a result is returned by the LookupService, that result is optionally added to the Record. In this case, the processor functions as an Enrichment processor. 

Regardless, the Record is then routed to either the 'matched' relationship or 'unmatched' relationship (if the 'Routing Strategy' property is configured to do so), indicating whether or not a result was returned by the LookupService, allowing the processor to also function as a Routing processor. The "coordinates" to use for looking up a value in the Lookup Service are defined by adding a user-defined property.

 Each property that is added will have an entry added to a Map, where the name of the property becomes the Map Key and the value returned by the RecordPath becomes the value for that key.

If multiple values are returned by the RecordPath, then the Record will be routed to the 'unmatched' relationship (or 'success', depending on the 'Routing Strategy' property's configuration). 

If one or more fields match the Result RecordPath, all fields that match will be updated. 

If there is no match in the configured LookupService, then no fields will be updated. I.e., it will not overwrite an existing value in the Record with a null value. Please note, however, that if the results returned by the LookupService are not accounted for in your schema (specifically, the schema that is configured for your Record Writer) then the fields will not be written out to the FlowFile.

### Tags:

lookup, enrichment, route, record, csv, json, avro, logs, convert, filter

### Properties:

In the list below, the names of required properties appear in **bold**. Any other properties (not in bold) are considered optional. The table also indicates any default values, and whether a property supports the [NiFi Expression Language](https://nifi.apache.org/docs/nifi-docs/html/expression-language-guide.html).

| Name                       | Default Value        | Allowable Values                                             | Description                                                  |
| -------------------------- | -------------------- | ------------------------------------------------------------ | ------------------------------------------------------------ |
| **Record Reader**          |                      | **Controller Service API:**  RecordReaderFactory **Implementations:** [JsonTreeReader](https://nifi.apache.org/docs/nifi-docs/components/org.apache.nifi/nifi-record-serialization-services-nar/1.7.1/org.apache.nifi.json.JsonTreeReader/index.html) [AvroReader](https://nifi.apache.org/docs/nifi-docs/components/org.apache.nifi/nifi-record-serialization-services-nar/1.7.1/org.apache.nifi.avro.AvroReader/index.html) [CSVReader](https://nifi.apache.org/docs/nifi-docs/components/org.apache.nifi/nifi-record-serialization-services-nar/1.7.1/org.apache.nifi.csv.CSVReader/index.html) [XMLReader](https://nifi.apache.org/docs/nifi-docs/components/org.apache.nifi/nifi-record-serialization-services-nar/1.7.1/org.apache.nifi.xml.XMLReader/index.html) [JsonPathReader](https://nifi.apache.org/docs/nifi-docs/components/org.apache.nifi/nifi-record-serialization-services-nar/1.7.1/org.apache.nifi.json.JsonPathReader/index.html) [ScriptedReader](https://nifi.apache.org/docs/nifi-docs/components/org.apache.nifi/nifi-scripting-nar/1.7.1/org.apache.nifi.record.script.ScriptedReader/index.html) [GrokReader](https://nifi.apache.org/docs/nifi-docs/components/org.apache.nifi/nifi-record-serialization-services-nar/1.7.1/org.apache.nifi.grok.GrokReader/index.html) | Specifies the Controller Service to use for reading incoming data |
| **Record Writer**          |                      | **Controller Service API:**  RecordSetWriterFactory **Implementations:** [AvroRecordSetWriter](https://nifi.apache.org/docs/nifi-docs/components/org.apache.nifi/nifi-record-serialization-services-nar/1.7.1/org.apache.nifi.avro.AvroRecordSetWriter/index.html) [CSVRecordSetWriter](https://nifi.apache.org/docs/nifi-docs/components/org.apache.nifi/nifi-record-serialization-services-nar/1.7.1/org.apache.nifi.csv.CSVRecordSetWriter/index.html) [JsonRecordSetWriter](https://nifi.apache.org/docs/nifi-docs/components/org.apache.nifi/nifi-record-serialization-services-nar/1.7.1/org.apache.nifi.json.JsonRecordSetWriter/index.html) [ScriptedRecordSetWriter](https://nifi.apache.org/docs/nifi-docs/components/org.apache.nifi/nifi-scripting-nar/1.7.1/org.apache.nifi.record.script.ScriptedRecordSetWriter/index.html) [XMLRecordSetWriter](https://nifi.apache.org/docs/nifi-docs/components/org.apache.nifi/nifi-record-serialization-services-nar/1.7.1/org.apache.nifi.xml.XMLRecordSetWriter/index.html) [FreeFormTextRecordSetWriter](https://nifi.apache.org/docs/nifi-docs/components/org.apache.nifi/nifi-record-serialization-services-nar/1.7.1/org.apache.nifi.text.FreeFormTextRecordSetWriter/index.html) | Specifies the Controller Service to use for writing out the records |
| **Lookup Service**         |                      | **Controller Service API:**  LookupService **Implementations:** [CouchbaseRecordLookupService](https://nifi.apache.org/docs/nifi-docs/components/org.apache.nifi/nifi-couchbase-nar/1.7.1/org.apache.nifi.couchbase.CouchbaseRecordLookupService/index.html) [RestLookupService](https://nifi.apache.org/docs/nifi-docs/components/org.apache.nifi/nifi-lookup-services-nar/1.7.1/org.apache.nifi.lookup.RestLookupService/index.html) [ScriptedLookupService](https://nifi.apache.org/docs/nifi-docs/components/org.apache.nifi/nifi-scripting-nar/1.7.1/org.apache.nifi.lookup.script.ScriptedLookupService/index.html) [DistributedMapCacheLookupService](https://nifi.apache.org/docs/nifi-docs/components/org.apache.nifi/nifi-lookup-services-nar/1.7.1/org.apache.nifi.lookup.DistributedMapCacheLookupService/index.html) [IPLookupService](https://nifi.apache.org/docs/nifi-docs/components/org.apache.nifi/nifi-lookup-services-nar/1.7.1/org.apache.nifi.lookup.maxmind.IPLookupService/index.html) [SimpleKeyValueLookupService](https://nifi.apache.org/docs/nifi-docs/components/org.apache.nifi/nifi-lookup-services-nar/1.7.1/org.apache.nifi.lookup.SimpleKeyValueLookupService/index.html) [MongoDBLookupService](https://nifi.apache.org/docs/nifi-docs/components/org.apache.nifi/nifi-mongodb-services-nar/1.7.1/org.apache.nifi.mongodb.MongoDBLookupService/index.html) [PropertiesFileLookupService](https://nifi.apache.org/docs/nifi-docs/components/org.apache.nifi/nifi-lookup-services-nar/1.7.1/org.apache.nifi.lookup.PropertiesFileLookupService/index.html) [HBase_1_1_2_RecordLookupService](https://nifi.apache.org/docs/nifi-docs/components/org.apache.nifi/nifi-hbase_1_1_2-client-service-nar/1.7.1/org.apache.nifi.hbase.HBase_1_1_2_RecordLookupService/index.html) [CouchbaseKeyValueLookupService](https://nifi.apache.org/docs/nifi-docs/components/org.apache.nifi/nifi-couchbase-nar/1.7.1/org.apache.nifi.couchbase.CouchbaseKeyValueLookupService/index.html) [SimpleCsvFileLookupService](https://nifi.apache.org/docs/nifi-docs/components/org.apache.nifi/nifi-lookup-services-nar/1.7.1/org.apache.nifi.lookup.SimpleCsvFileLookupService/index.html) [CSVRecordLookupService](https://nifi.apache.org/docs/nifi-docs/components/org.apache.nifi/nifi-lookup-services-nar/1.7.1/org.apache.nifi.lookup.CSVRecordLookupService/index.html) [XMLFileLookupService](https://nifi.apache.org/docs/nifi-docs/components/org.apache.nifi/nifi-lookup-services-nar/1.7.1/org.apache.nifi.lookup.XMLFileLookupService/index.html) | The Lookup Service to use in order to lookup a value in each Record |
| Result RecordPath          |                      |                                                              | A RecordPath that points to the field whose value should be updated with whatever value is returned from the Lookup Service. If not specified, the value that is returned from the Lookup Service will be ignored, except for determining whether the FlowFile should be routed to the 'matched' or 'unmatched' Relationship. **Supports Expression Language: true (will be evaluated using flow file attributes and variable registry)** |
| **Routing Strategy**       | route-to-success     | Route to 'success' ![Records will be routed to a 'success' Relationship regardless of whether or not there is a match in the configured Lookup Service](https://nifi.apache.org/docs/nifi-docs/html/images/iconInfo.png)Route to 'matched' or 'unmatched' ![Records will be routed to either a 'matched' or an 'unmatched' Relationship depending on whether or not there was a match in the configured Lookup Service. A single input FlowFile may result in two different output FlowFiles.](https://nifi.apache.org/docs/nifi-docs/html/images/iconInfo.png) | Specifies how to route records after a Lookup has completed  |
| **Record Result Contents** | insert-entire-record | Insert Entire Record ![The entire Record that is retrieved from the Lookup Service will be inserted into the destination path.](https://nifi.apache.org/docs/nifi-docs/html/images/iconInfo.png)Insert Record Fields ![All of the fields in the Record that is retrieved from the Lookup Service will be inserted into the destination path.](https://nifi.apache.org/docs/nifi-docs/html/images/iconInfo.png) | When a result is obtained that contains a Record, this property determines whether the Record itself is inserted at the configured path or if the contents of the Record (i.e., the sub-fields) will be inserted at the configured path. |

### Dynamic Properties:

Dynamic Properties allow the user to specify both the name and value of a property.

| Name            | Value             | Description                                                  |
| --------------- | ----------------- | ------------------------------------------------------------ |
| Value To Lookup | Valid Record Path | A RecordPath that points to the field whose value will be looked up in the configured Lookup Service **Supports Expression Language: true (will be evaluated using flow file attributes and variable registry)** |



### Relationships:

| Name    | Description                                                  |
| ------- | ------------------------------------------------------------ |
| success | All records will be sent to this Relationship if configured to do so, unless a failure occurs |
| failure | If a FlowFile cannot be transformed from the configured input format to the configured output format, the unchanged FlowFile will be routed to this relationship |

### Reads Attributes:

None specified.

### Writes Attributes:

| Name         | Description                                                  |
| ------------ | ------------------------------------------------------------ |
| mime.type    | Sets the mime.type attribute to the MIME Type specified by the Record Writer |
| record.count | The number of records in the FlowFile                        |

### State management:

This component does not store state.

### Restricted:

This component is not restricted.

### Input requirement:

This component requires an incoming relationship.

### System Resource Considerations:

None specified.

### See Also:

[ConvertRecord](https://nifi.apache.org/docs/nifi-docs/components/org.apache.nifi/nifi-standard-nar/1.7.1/org.apache.nifi.processors.standard.ConvertRecord/index.html), [SplitRecord](https://nifi.apache.org/docs/nifi-docs/components/org.apache.nifi/nifi-standard-nar/1.7.1/org.apache.nifi.processors.standard.SplitRecord/index.html), [SimpleKeyValueLookupService](https://nifi.apache.org/docs/nifi-docs/components/org.apache.nifi/nifi-lookup-services-nar/1.7.1/org.apache.nifi.lookup.SimpleKeyValueLookupService/index.html), [IPLookupService](https://nifi.apache.org/docs/nifi-docs/components/org.apache.nifi/nifi-lookup-services-nar/1.7.1/org.apache.nifi.lookup.maxmind.IPLookupService/index.html)