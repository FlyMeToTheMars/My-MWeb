## Description:

Converts records from one data format to another using configured Record Reader and Record Write Controller Services. The Reader and Writer must be configured with "matching" schemas. By this, we mean the schemas must have the same field names. The types of the fields do not have to be the same if a field value can be coerced from one type to another. For instance, if the input schema has a field named "balance" of type double, the output schema can have a field named "balance" with a type of string, double, or float. If any field is present in the input that is not present in the output, the field will be left out of the output. If any field is specified in the output schema but is not present in the input data/schema, then the field will not be present in the output or will have a null value, depending on the writer.

### Tags:

convert, record, generic, schema, json, csv, avro, log, logs, freeform, text

### Properties:

In the list below, the names of required properties appear in **bold**. Any other properties (not in bold) are considered optional. The table also indicates any default values.

| Name              | Default Value | Allowable Values                                             | Description                                                  |
| ----------------- | ------------- | ------------------------------------------------------------ | ------------------------------------------------------------ |
| **Record Reader** |               | **Controller Service API:**  RecordReaderFactory **Implementations:** [JsonTreeReader](https://nifi.apache.org/docs/nifi-docs/components/org.apache.nifi/nifi-record-serialization-services-nar/1.7.1/org.apache.nifi.json.JsonTreeReader/index.html) [AvroReader](https://nifi.apache.org/docs/nifi-docs/components/org.apache.nifi/nifi-record-serialization-services-nar/1.7.1/org.apache.nifi.avro.AvroReader/index.html) [CSVReader](https://nifi.apache.org/docs/nifi-docs/components/org.apache.nifi/nifi-record-serialization-services-nar/1.7.1/org.apache.nifi.csv.CSVReader/index.html) [XMLReader](https://nifi.apache.org/docs/nifi-docs/components/org.apache.nifi/nifi-record-serialization-services-nar/1.7.1/org.apache.nifi.xml.XMLReader/index.html) [JsonPathReader](https://nifi.apache.org/docs/nifi-docs/components/org.apache.nifi/nifi-record-serialization-services-nar/1.7.1/org.apache.nifi.json.JsonPathReader/index.html) [ScriptedReader](https://nifi.apache.org/docs/nifi-docs/components/org.apache.nifi/nifi-scripting-nar/1.7.1/org.apache.nifi.record.script.ScriptedReader/index.html) [GrokReader](https://nifi.apache.org/docs/nifi-docs/components/org.apache.nifi/nifi-record-serialization-services-nar/1.7.1/org.apache.nifi.grok.GrokReader/index.html) | Specifies the Controller Service to use for reading incoming data |
| **Record Writer** |               | **Controller Service API:**  RecordSetWriterFactory **Implementations:** [AvroRecordSetWriter](https://nifi.apache.org/docs/nifi-docs/components/org.apache.nifi/nifi-record-serialization-services-nar/1.7.1/org.apache.nifi.avro.AvroRecordSetWriter/index.html) [CSVRecordSetWriter](https://nifi.apache.org/docs/nifi-docs/components/org.apache.nifi/nifi-record-serialization-services-nar/1.7.1/org.apache.nifi.csv.CSVRecordSetWriter/index.html) [JsonRecordSetWriter](https://nifi.apache.org/docs/nifi-docs/components/org.apache.nifi/nifi-record-serialization-services-nar/1.7.1/org.apache.nifi.json.JsonRecordSetWriter/index.html) [ScriptedRecordSetWriter](https://nifi.apache.org/docs/nifi-docs/components/org.apache.nifi/nifi-scripting-nar/1.7.1/org.apache.nifi.record.script.ScriptedRecordSetWriter/index.html) [XMLRecordSetWriter](https://nifi.apache.org/docs/nifi-docs/components/org.apache.nifi/nifi-record-serialization-services-nar/1.7.1/org.apache.nifi.xml.XMLRecordSetWriter/index.html) [FreeFormTextRecordSetWriter](https://nifi.apache.org/docs/nifi-docs/components/org.apache.nifi/nifi-record-serialization-services-nar/1.7.1/org.apache.nifi.text.FreeFormTextRecordSetWriter/index.html) | Specifies the Controller Service to use for writing out the records |

### Relationships:

| Name    | Description                                                  |
| ------- | ------------------------------------------------------------ |
| success | FlowFiles that are successfully transformed will be routed to this relationship |
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