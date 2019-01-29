## Description:

Fetches a row from an HBase table. The Destination property controls whether the cells are added as flow file attributes, or the row is written to the flow file content as JSON. This processor may be used to fetch a fixed row on a interval by specifying the table and row id directly in the processor, or it may be used to dynamically fetch rows by referencing the table and row id from incoming flow files.

### Tags:

hbase, scan, fetch, get, enrich

### Properties:

In the list below, the names of required properties appear in **bold**. Any other properties (not in bold) are considered optional. The table also indicates any default values, and whether a property supports the [NiFi Expression Language](https://nifi.apache.org/docs/nifi-docs/html/expression-language-guide.html).

| Name                     | Default Value       | Allowable Values                                             | Description                                                  |
| ------------------------ | ------------------- | ------------------------------------------------------------ | ------------------------------------------------------------ |
| **HBase Client Service** |                     | **Controller Service API:**  HBaseClientService **Implementation:** [HBase_1_1_2_ClientService](https://nifi.apache.org/docs/nifi-docs/components/org.apache.nifi/nifi-hbase_1_1_2-client-service-nar/1.7.1/org.apache.nifi.hbase.HBase_1_1_2_ClientService/index.html) | Specifies the Controller Service to use for accessing HBase. |
| **Table Name**           |                     |                                                              | The name of the HBase Table to fetch from. **Supports Expression Language: true (will be evaluated using flow file attributes and variable registry)** |
| **Row Identifier**       |                     |                                                              | The identifier of the row to fetch. **Supports Expression Language: true (will be evaluated using flow file attributes and variable registry)** |
| Columns                  |                     |                                                              | An optional comma-separated list of "<colFamily>:<colQualifier>" pairs to fetch. To return all columns for a given family, leave off the qualifier such as "<colFamily1>,<colFamily2>". **Supports Expression Language: true (will be evaluated using flow file attributes and variable registry)** |
| Authorizations           |                     |                                                              | The list of authorizations to pass to the scanner. This will be ignored if cell visibility labels are not in use. **Supports Expression Language: true (will be evaluated using flow file attributes and variable registry)** |
| **Destination**          | flowfile-attributes | flowfile-attributes ![Adds the JSON document representing the row that was fetched as an attribute named hbase.row. The format of the JSON document is determined by the JSON Format property. NOTE: Fetching many large rows into attributes may have a negative impact on performance.](https://nifi.apache.org/docs/nifi-docs/html/images/iconInfo.png)flowfile-content ![Overwrites the FlowFile content with a JSON document representing the row that was fetched. The format of the JSON document is determined by the JSON Format property.](https://nifi.apache.org/docs/nifi-docs/html/images/iconInfo.png) | Indicates whether the row fetched from HBase is written to FlowFile content or FlowFile Attributes. |
| **JSON Format**          | full-row            | full-row ![Creates a JSON document with the format: {"row":<row-id>, "cells":[{"fam":<col-fam>, "qual":<col-val>, "val":<value>, "ts":<timestamp>}]}.](https://nifi.apache.org/docs/nifi-docs/html/images/iconInfo.png)col-qual-and-val ![Creates a JSON document with the format: {"<col-qual>":"<value>", "<col-qual>":"<value>".](https://nifi.apache.org/docs/nifi-docs/html/images/iconInfo.png) | Specifies how to represent the HBase row as a JSON document. |
| **JSON Value Encoding**  | none                | none ![Creates a String using the bytes of given data and the given Character Set.](https://nifi.apache.org/docs/nifi-docs/html/images/iconInfo.png)base64 ![Creates a Base64 encoded String of the given data.](https://nifi.apache.org/docs/nifi-docs/html/images/iconInfo.png) | Specifies how to represent row ids, column families, column qualifiers, and values when stored in FlowFile attributes, or written to JSON. |
| **Encode Character Set** | UTF-8               |                                                              | The character set used to encode the JSON representation of the row. |
| **Decode Character Set** | UTF-8               |                                                              | The character set used to decode data from HBase.            |

### Relationships:

| Name      | Description                                                  |
| --------- | ------------------------------------------------------------ |
| success   | All successful fetches are routed to this relationship.      |
| failure   | All failed fetches are routed to this relationship.          |
| not found | All fetches where the row id is not found are routed to this relationship. |

### Reads Attributes:

None specified.

### Writes Attributes:

| Name        | Description                                                  |
| ----------- | ------------------------------------------------------------ |
| hbase.table | The name of the HBase table that the row was fetched from    |
| hbase.row   | A JSON document representing the row. This property is only written when a Destination of flowfile-attributes is selected. |
| mime.type   | Set to application/json when using a Destination of flowfile-content, not set or modified otherwise |

### State management:

This component does not store state.

### Restricted:

This component is not restricted.

### Input requirement:

This component requires an incoming relationship.

### System Resource Considerations:

None specified.