## Description:

Generates a JSON representation of the input FlowFile Attributes. The resulting JSON can be written to either a new Attribute 'JSONAttributes' or written to the FlowFile as content.

### Tags:

json, attributes, flowfile

### Properties:

In the list below, the names of required properties appear in **bold**. Any other properties (not in bold) are considered optional. The table also indicates any default values, and whether a property supports the [NiFi Expression Language](https://nifi.apache.org/docs/nifi-docs/html/expression-language-guide.html).

| Name                          | Default Value      | Allowable Values                   | Description                                                  |
| ----------------------------- | ------------------ | ---------------------------------- | ------------------------------------------------------------ |
| Attributes List               |                    |                                    | Comma separated list of attributes to be included in the resulting JSON. If this value is left empty then all existing Attributes will be included. This list of attributes is case sensitive. If an attribute specified in the list is not found it will be be emitted to the resulting JSON with an empty string or NULL value. |
| Attributes Regular Expression |                    |                                    | Regular expression that will be evaluated against the flow file attributes to select the matching attributes. This property can be used in combination with the attributes list property. **Supports Expression Language: true (will be evaluated using variable registry only)** |
| **Destination**               | flowfile-attribute | flowfile-attributeflowfile-content | Control if JSON value is written as a new flowfile attribute 'JSONAttributes' or written in the flowfile content. Writing to flowfile content will overwrite any existing flowfile content. |
| **Include Core Attributes**   | true               | truefalse                          | Determines if the FlowFile org.apache.nifi.flowfile.attributes.CoreAttributes which are contained in every FlowFile should be included in the final JSON value generated. |
| **Null Value**                | false              | truefalse                          | If true a non existing or empty attribute will be NULL in the resulting JSON. If false an empty string will be placed in the JSON |

### Relationships:

| Name    | Description                               |
| ------- | ----------------------------------------- |
| success | Successfully converted attributes to JSON |
| failure | Failed to convert attributes to JSON      |

### Reads Attributes:

None specified.

### Writes Attributes:

| Name           | Description                       |
| -------------- | --------------------------------- |
| JSONAttributes | JSON representation of Attributes |

### State management:

This component does not store state.

### Restricted:

This component is not restricted.

### Input requirement:

This component requires an incoming relationship.

### System Resource Considerations:

None specified.