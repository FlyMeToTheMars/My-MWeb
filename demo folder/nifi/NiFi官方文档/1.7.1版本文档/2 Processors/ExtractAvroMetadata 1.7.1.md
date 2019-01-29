## Description:

Extracts metadata from the header of an Avro datafile.

### Tags:

avro, schema, metadata

### Properties:

In the list below, the names of required properties appear in **bold**. Any other properties (not in bold) are considered optional. The table also indicates any default values.

| Name                      | Default Value | Allowable Values      | Description                                                  |
| ------------------------- | ------------- | --------------------- | ------------------------------------------------------------ |
| **Fingerprint Algorithm** | CRC-64-AVRO   | CRC-64-AVROMD5SHA-256 | The algorithm used to generate the schema fingerprint. Available choices are based on the Avro recommended practices for fingerprint generation. |
| Metadata Keys             |               |                       | A comma-separated list of keys indicating key/value pairs to extract from the Avro file header. The key 'avro.schema' can be used to extract the full schema in JSON format, and 'avro.codec' can be used to extract the codec name if one exists. |
| **Count Items**           | false         | truefalse             | If true the number of items in the datafile will be counted and stored in a FlowFile attribute 'item.count'. The counting is done by reading blocks and getting the number of items for each block, thus avoiding de-serializing. The items being counted will be the top-level items in the datafile. For example, with a schema of type record the items will be the records, and for a schema of type Array the items will be the arrays (not the number of entries in each array). |

### Relationships:

| Name    | Description                                                  |
| ------- | ------------------------------------------------------------ |
| success | A FlowFile is routed to this relationship after metadata has been extracted. |
| failure | A FlowFile is routed to this relationship if it cannot be parsed as Avro or metadata cannot be extracted for any reason |

### Reads Attributes:

None specified.

### Writes Attributes:

| Name               | Description                                                  |
| ------------------ | ------------------------------------------------------------ |
| schema.type        | The type of the schema (i.e. record, enum, etc.).            |
| schema.name        | Contains the name when the type is a record, enum or fixed, otherwise contains the name of the primitive type. |
| schema.fingerprint | The result of the Fingerprint Algorithm as a Hex string.     |
| item.count         | The total number of items in the datafile, only written if Count Items is set to true. |

### State management:

This component does not store state.

### Restricted:

This component is not restricted.

### Input requirement:

This component requires an incoming relationship.

### System Resource Considerations:

None specified.