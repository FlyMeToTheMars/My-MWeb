## Description:

A processor that can count the number of items in a record set, as well as provide counts based on user-defined criteria on subsets of the record set.

[Additional Details...](https://nifi.apache.org/docs/nifi-docs/components/org.apache.nifi/nifi-standard-nar/1.7.1/org.apache.nifi.processors.standard.CalculateRecordStats/additionalDetails.html)

### Tags:

record, stats, metrics

### Properties:

In the list below, the names of required properties appear in **bold**. Any other properties (not in bold) are considered optional. The table also indicates any default values, and whether a property supports the [NiFi Expression Language](https://nifi.apache.org/docs/nifi-docs/html/expression-language-guide.html).

| Name                   | Default Value | Allowable Values                                             | Description                                                  |
| ---------------------- | ------------- | ------------------------------------------------------------ | ------------------------------------------------------------ |
| **Record Reader**      |               | **Controller Service API:**  RecordReaderFactory **Implementations:** [JsonTreeReader](https://nifi.apache.org/docs/nifi-docs/components/org.apache.nifi/nifi-record-serialization-services-nar/1.7.1/org.apache.nifi.json.JsonTreeReader/index.html) [AvroReader](https://nifi.apache.org/docs/nifi-docs/components/org.apache.nifi/nifi-record-serialization-services-nar/1.7.1/org.apache.nifi.avro.AvroReader/index.html) [CSVReader](https://nifi.apache.org/docs/nifi-docs/components/org.apache.nifi/nifi-record-serialization-services-nar/1.7.1/org.apache.nifi.csv.CSVReader/index.html) [XMLReader](https://nifi.apache.org/docs/nifi-docs/components/org.apache.nifi/nifi-record-serialization-services-nar/1.7.1/org.apache.nifi.xml.XMLReader/index.html) [JsonPathReader](https://nifi.apache.org/docs/nifi-docs/components/org.apache.nifi/nifi-record-serialization-services-nar/1.7.1/org.apache.nifi.json.JsonPathReader/index.html) [ScriptedReader](https://nifi.apache.org/docs/nifi-docs/components/org.apache.nifi/nifi-scripting-nar/1.7.1/org.apache.nifi.record.script.ScriptedReader/index.html) [GrokReader](https://nifi.apache.org/docs/nifi-docs/components/org.apache.nifi/nifi-record-serialization-services-nar/1.7.1/org.apache.nifi.grok.GrokReader/index.html) | A record reader to use for reading the records.              |
| **record-stats-limit** | 10            |                                                              | Limit the number of individual stats that are returned for each record path to the top N results. **Supports Expression Language: true (will be evaluated using flow file attributes and variable registry)** |

### Relationships:

| Name    | Description                                            |
| ------- | ------------------------------------------------------ |
| success | If a flowfile is successfully processed, it goes here. |
| failure | If a flowfile fails to be processed, it goes here.     |

### Reads Attributes:

None specified.

### Writes Attributes:

| Name                                                   | Description                                                  |
| ------------------------------------------------------ | ------------------------------------------------------------ |
| record.count                                           | A count of the records in the record set in the flowfile.    |
| recordStats.<User Defined Property Name>.count         | A count of the records that contain a value for the user defined property. |
| recordStats.<User Defined Property Name>.<value>.count | Each value discovered for the user defined property will have its own count attribute. Total number of top N value counts to be added is defined by the limit configuration. |

### State management:

This component does not store state.

### Restricted:

This component is not restricted.

### Input requirement:

This component requires an incoming relationship.

### System Resource Considerations:

None specified.