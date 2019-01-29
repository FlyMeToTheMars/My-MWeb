## Description:

Generates a CSV representation of the input FlowFile Attributes. The resulting CSV can be written to either a newly generated attribute named 'CSVAttributes' or written to the FlowFile as content. If the attribute value contains a comma, newline or double quote, then the attribute value will be escaped with double quotes. Any double quote characters in the attribute value are escaped with another double quote.

### Tags:

csv, attributes, flowfile

### Properties:

In the list below, the names of required properties appear in **bold**. Any other properties (not in bold) are considered optional. The table also indicates any default values, and whether a property supports the [NiFi Expression Language](https://nifi.apache.org/docs/nifi-docs/html/expression-language-guide.html).

| Name                          | Default Value      | Allowable Values                                             | Description                                                  |
| ----------------------------- | ------------------ | ------------------------------------------------------------ | ------------------------------------------------------------ |
| Attribute List                |                    |                                                              | Comma separated list of attributes to be included in the resulting CSV. If this value is left empty then all existing Attributes will be included. This list of attributes is case sensitive and supports attribute names that contain commas. If an attribute specified in the list is not found it will be emitted to the resulting CSV with an empty string or null depending on the 'Null Value' property. If a core attribute is specified in this list and the 'Include Core Attributes' property is false, the core attribute will be included. The attribute list ALWAYS wins. **Supports Expression Language: true (will be evaluated using flow file attributes and variable registry)** |
| Attributes Regular Expression |                    |                                                              | Regular expression that will be evaluated against the flow file attributes to select the matching attributes. This property can be used in combination with the attributes list property. The final output will contain a combination of matches found in the ATTRIBUTE_LIST and ATTRIBUTE_REGEX. **Supports Expression Language: true (will be evaluated using flow file attributes and variable registry)** |
| **Destination**               | flowfile-attribute | flowfile-attribute ![The resulting CSV string will be placed into a new flowfile attribute named 'CSVData'.  The content of the flowfile will not be changed.](https://nifi.apache.org/docs/nifi-docs/html/images/iconInfo.png)flowfile-content ![The resulting CSV string will be placed into the content of the flowfile.Existing flowfile context will be overwritten. 'CSVData' will not be written to at all (neither null nor empty string).](https://nifi.apache.org/docs/nifi-docs/html/images/iconInfo.png) | Control if CSV value is written as a new flowfile attribute 'CSVData' or written in the flowfile content. |
| **Include Core Attributes**   | true               | truefalse                                                    | Determines if the FlowFile org.apache.nifi.flowfile.attributes.CoreAttributes, which are contained in every FlowFile, should be included in the final CSV value generated. Core attributes will be added to the end of the CSVData and CSVSchema strings. The Attribute List property overrides this setting. |
| **Null Value**                | false              | truefalse                                                    | If true a non existing or empty attribute will be 'null' in the resulting CSV. If false an empty string will be placed in the CSV |
| **Include Schema**            | false              | truefalse                                                    | If true the schema (attribute names) will also be converted to a CSV string which will either be applied to a new attribute named 'CSVSchema' or applied at the first row in the content depending on the DESTINATION property setting. |

### Relationships:

| Name    | Description                              |
| ------- | ---------------------------------------- |
| success | Successfully converted attributes to CSV |
| failure | Failed to convert attributes to CSV      |

### Reads Attributes:

None specified.

### Writes Attributes:

| Name      | Description                      |
| --------- | -------------------------------- |
| CSVSchema | CSV representation of the Schema |
| CSVData   | CSV representation of Attributes |

### State management:

This component does not store state.

### Restricted:

This component is not restricted.

### Input requirement:

This component requires an incoming relationship.

### System Resource Considerations:

None specified.