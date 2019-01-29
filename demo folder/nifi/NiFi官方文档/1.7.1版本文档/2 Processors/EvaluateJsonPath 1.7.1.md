## Description:

Evaluates one or more JsonPath expressions against the content of a FlowFile. The results of those expressions are assigned to FlowFile Attributes or are written to the content of the FlowFile itself, depending on configuration of the Processor. JsonPaths are entered by adding user-defined properties; the name of the property maps to the Attribute Name into which the result will be placed (if the Destination is flowfile-attribute; otherwise, the property name is ignored). The value of the property must be a valid JsonPath expression. A Return Type of 'auto-detect' will make a determination based off the configured destination. When 'Destination' is set to 'flowfile-attribute,' a return type of 'scalar' will be used. When 'Destination' is set to 'flowfile-content,' a return type of 'JSON' will be used.If the JsonPath evaluates to a JSON array or JSON object and the Return Type is set to 'scalar' the FlowFile will be unmodified and will be routed to failure. A Return Type of JSON can return scalar values if the provided JsonPath evaluates to the specified value and will be routed as a match.If Destination is 'flowfile-content' and the JsonPath does not evaluate to a defined path, the FlowFile will be routed to 'unmatched' without having its contents modified. If Destination is flowfile-attribute and the expression matches nothing, attributes will be created with empty strings as the value, and the FlowFile will always be routed to 'matched.'

[Additional Details...](https://nifi.apache.org/docs/nifi-docs/components/org.apache.nifi/nifi-standard-nar/1.7.1/org.apache.nifi.processors.standard.EvaluateJsonPath/additionalDetails.html)

### Tags:

JSON, evaluate, JsonPath

### Properties:

In the list below, the names of required properties appear in **bold**. Any other properties (not in bold) are considered optional. The table also indicates any default values.

| Name                          | Default Value    | Allowable Values                   | Description                                                  |
| ----------------------------- | ---------------- | ---------------------------------- | ------------------------------------------------------------ |
| **Destination**               | flowfile-content | flowfile-contentflowfile-attribute | Indicates whether the results of the JsonPath evaluation are written to the FlowFile content or a FlowFile attribute; if using attribute, must specify the Attribute Name property. If set to flowfile-content, only one JsonPath may be specified, and the property name is ignored. |
| **Return Type**               | auto-detect      | auto-detectjsonscalar              | Indicates the desired return type of the JSON Path expressions. Selecting 'auto-detect' will set the return type to 'json' for a Destination of 'flowfile-content', and 'scalar' for a Destination of 'flowfile-attribute'. |
| **Path Not Found Behavior**   | ignore           | warnignore                         | Indicates how to handle missing JSON path expressions when destination is set to 'flowfile-attribute'. Selecting 'warn' will generate a warning when a JSON path expression is not found. |
| **Null Value Representation** | empty string     | empty stringthe string 'null'      | Indicates the desired representation of JSON Path expressions resulting in a null value. |

### Dynamic Properties:

Dynamic Properties allow the user to specify both the name and value of a property.

| Name                                                         | Value                 | Description                                                  |
| ------------------------------------------------------------ | --------------------- | ------------------------------------------------------------ |
| A FlowFile attribute(if <Destination> is set to 'flowfile-attribute') | A JsonPath expression | If <Destination>='flowfile-attribute' then that FlowFile attribute will be set to any JSON objects that match the JsonPath. If <Destination>='flowfile-content' then the FlowFile content will be updated to any JSON objects that match the JsonPath. **Supports Expression Language: false** |



### Relationships:

| Name      | Description                                                  |
| --------- | ------------------------------------------------------------ |
| failure   | FlowFiles are routed to this relationship when the JsonPath cannot be evaluated against the content of the FlowFile; for instance, if the FlowFile is not valid JSON |
| unmatched | FlowFiles are routed to this relationship when the JsonPath does not match the content of the FlowFile and the Destination is set to flowfile-content |
| matched   | FlowFiles are routed to this relationship when the JsonPath is successfully evaluated and the FlowFile is modified as a result |

### Reads Attributes:

None specified.

### Writes Attributes:

None specified.

### State management:

This component does not store state.

### Restricted:

This component is not restricted.

### Input requirement:

This component requires an incoming relationship.

### System Resource Considerations:

None specified.



## [Additional Details...](https://nifi.apache.org/docs/nifi-docs/components/org.apache.nifi/nifi-standard-nar/1.7.1/org.apache.nifi.processors.standard.EvaluateJsonPath/additionalDetails.html)

**Note:** The underlying JsonPath library loads the entirety of the streamed content into and performs result evaluations in memory. Accordingly, it is important to consider the anticipated profile of content being evaluated by this processor and the hardware supporting it especially when working against large JSON documents.