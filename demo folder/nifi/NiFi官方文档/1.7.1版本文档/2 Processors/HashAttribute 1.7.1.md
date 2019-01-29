## Description:

Hashes together **the key/value pairs of several FlowFile Attributes** and adds the hash as a new attribute. 



Optional properties are to be added such that 

**the name of the property** is the name of a FlowFile Attribute to consider and 

**the value of the property** is a regular expression that, if matched by the attribute value, will cause that attribute to be used as part of the hash. If the regular expression contains a capturing group, only the value of the capturing group will be used.

### Tags:

attributes, hash

### Properties:

In the list below, the names of required properties appear in **bold**. Any other properties (not in bold) are considered optional. The table also indicates any default values.

| Name                         | Default Value | Allowable Values | Description                                                  |
| ---------------------------- | ------------- | ---------------- | ------------------------------------------------------------ |
| **Hash Value Attribute Key** |               |                  | The name of the FlowFile Attribute where the hash value should be stored |

### Dynamic Properties:

Dynamic Properties allow the user to specify both the name and value of a property.

| Name                                              | Value                | Description                                                  |
| ------------------------------------------------- | -------------------- | ------------------------------------------------------------ |
| A flowfile attribute key for attribute inspection | A Regular Expression | This regular expression is evaluated against the flowfile attribute values. If the regular expression contains a capturing group, the value of that group will be used when comparing flow file attributes. Otherwise, the original flow file attribute's value will be used if and only if the value matches the given regular expression. **Supports Expression Language: false** |



### Relationships:

| Name    | Description                                             |
| ------- | ------------------------------------------------------- |
| success | Used for FlowFiles that have a hash value added         |
| failure | Used for FlowFiles that are missing required attributes |

### Reads Attributes:

None specified.

### Writes Attributes:

| Name                       | Description                                                  |
| -------------------------- | ------------------------------------------------------------ |
| <Hash Value Attribute Key> | This Processor adds an attribute whose value is the result of Hashing the existing FlowFile attributes. The name of this attribute is specified by the <Hash Value Attribute Key> property. |

### State management:

This component does not store state.

### Restricted:

This component is not restricted.

### Input requirement:

This component requires an incoming relationship.

### System Resource Considerations:

None specified.