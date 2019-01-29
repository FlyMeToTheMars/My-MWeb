## Description:

Applies a list of Jolt specifications to the flowfile JSON payload. A new FlowFile is created with transformed content and is routed to the 'success' relationship. If the JSON transform fails, the original FlowFile is routed to the 'failure' relationship.

[Additional Details...](https://nifi.apache.org/docs/nifi-docs/components/org.apache.nifi/nifi-standard-nar/1.7.1/org.apache.nifi.processors.standard.JoltTransformJSON/additionalDetails.html)

### Tags:

json, jolt, transform, shiftr, chainr, defaultr, removr, cardinality, sort

### Properties:

In the list below, the names of required properties appear in **bold**. Any other properties (not in bold) are considered optional. The table also indicates any default values, and whether a property supports the [NiFi Expression Language](https://nifi.apache.org/docs/nifi-docs/html/expression-language-guide.html).

| Name                             | Default Value        | Allowable Values                                             | Description                                                  |
| -------------------------------- | -------------------- | ------------------------------------------------------------ | ------------------------------------------------------------ |
| **Jolt Transformation DSL**      | jolt-transform-chain | Cardinality ![Change the cardinality of input elements to create the output JSON.](https://nifi.apache.org/docs/nifi-docs/html/images/iconInfo.png)Chain ![Execute list of Jolt transformations.](https://nifi.apache.org/docs/nifi-docs/html/images/iconInfo.png)Default ![ Apply default values to the output JSON.](https://nifi.apache.org/docs/nifi-docs/html/images/iconInfo.png)Modify - Default ![Writes when key is missing or value is null](https://nifi.apache.org/docs/nifi-docs/html/images/iconInfo.png)Modify - Define ![Writes when key is missing](https://nifi.apache.org/docs/nifi-docs/html/images/iconInfo.png)Modify - Overwrite ![ Always overwrite value](https://nifi.apache.org/docs/nifi-docs/html/images/iconInfo.png)Remove ![ Remove values from input data to create the output JSON.](https://nifi.apache.org/docs/nifi-docs/html/images/iconInfo.png)Shift ![Shift input JSON/data to create the output JSON.](https://nifi.apache.org/docs/nifi-docs/html/images/iconInfo.png)Sort ![Sort input json key values alphabetically. Any specification set is ignored.](https://nifi.apache.org/docs/nifi-docs/html/images/iconInfo.png)Custom ![Custom Transformation. Requires Custom Transformation Class Name](https://nifi.apache.org/docs/nifi-docs/html/images/iconInfo.png) | Specifies the Jolt Transformation that should be used with the provided specification. |
| Custom Transformation Class Name |                      |                                                              | Fully Qualified Class Name for Custom Transformation         |
| Custom Module Directory          |                      |                                                              | Comma-separated list of paths to files and/or directories which contain modules containing custom transformations (that are not included on NiFi's classpath). |
| Jolt Specification               |                      |                                                              | Jolt Specification for transform of JSON data. This value is ignored if the Jolt Sort Transformation is selected. **Supports Expression Language: true (will be evaluated using flow file attributes and variable registry)** |
| **Transform Cache Size**         | 1                    |                                                              | Compiling a Jolt Transform can be fairly expensive. Ideally, this will be done only once. However, if the Expression Language is used in the transform, we may need a new Transform for each FlowFile. This value controls how many of those Transforms we cache in memory in order to avoid having to compile the Transform each time. |

### Relationships:

| Name    | Description                                                  |
| ------- | ------------------------------------------------------------ |
| success | The FlowFile with transformed content will be routed to this relationship |
| failure | If a FlowFile fails processing for any reason (for example, the FlowFile is not valid JSON), it will be routed to this relationship |

### Reads Attributes:

None specified.

### Writes Attributes:

| Name      | Description                    |
| --------- | ------------------------------ |
| mime.type | Always set to application/json |

### State management:

This component does not store state.

### Restricted:

This component is not restricted.

### Input requirement:

This component requires an incoming relationship.

### System Resource Considerations:

None specified.