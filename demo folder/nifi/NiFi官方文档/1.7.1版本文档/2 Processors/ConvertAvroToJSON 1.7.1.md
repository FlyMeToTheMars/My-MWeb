## Description:

Converts a Binary Avro record into a JSON object. This processor provides a direct mapping of an Avro field to a JSON field, such that the resulting JSON will have the same hierarchical structure as the Avro document. Note that the Avro schema information will be lost, as this is not a translation from binary Avro to JSON formatted Avro. The output JSON is encoded the UTF-8 encoding. If an incoming FlowFile contains a stream of multiple Avro records, the resultant FlowFile will contain a JSON Array containing all of the Avro records or a sequence of JSON Objects. If an incoming FlowFile does not contain any records, an empty JSON object is the output. Empty/Single Avro record FlowFile inputs are optionally wrapped in a container as dictated by 'Wrap Single Record'

### Tags:

avro, convert, json

### Properties:

In the list below, the names of required properties appear in **bold**. Any other properties (not in bold) are considered optional. The table also indicates any default values.

| Name                       | Default Value | Allowable Values | Description                                                  |
| -------------------------- | ------------- | ---------------- | ------------------------------------------------------------ |
| **JSON container options** | array         | nonearray        | Determines how stream of records is exposed: either as a sequence of single Objects (none) (i.e. writing every Object to a new line), or as an array of Objects (array). |
| **Wrap Single Record**     | false         | truefalse        | Determines if the resulting output for empty records or a single record should be wrapped in a container array as specified by 'JSON container options' |
| Avro schema                |               |                  | If the Avro records do not contain the schema (datum only), it must be specified here. |

### Relationships:

| Name    | Description                                                  |
| ------- | ------------------------------------------------------------ |
| success | A FlowFile is routed to this relationship after it has been converted to JSON |
| failure | A FlowFile is routed to this relationship if it cannot be parsed as Avro or cannot be converted to JSON for any reason |

### Reads Attributes:

None specified.

### Writes Attributes:

| Name      | Description                            |
| --------- | -------------------------------------- |
| mime.type | Sets the mime type to application/json |

### State management:

This component does not store state.

### Restricted:

This component is not restricted.

### Input requirement:

This component requires an incoming relationship.

### System Resource Considerations:

None specified.