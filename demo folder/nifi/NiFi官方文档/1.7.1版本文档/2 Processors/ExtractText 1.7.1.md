## Description:

Evaluates one or more Regular Expressions against the content of a FlowFile. The results of those Regular Expressions are assigned to FlowFile Attributes. 

Regular Expressions are entered by **adding user-defined properties**; the name of the property maps to the Attribute Name into which the result will be placed. 

The first capture group, if any found, will be placed into that attribute name.

But all capture groups, including the matching string sequence itself will also be provided at that attribute name with an index value provided, with the exception of a capturing group that is optional and does not match - 

for example, given the attribute name "regex" and expression "abc(def)?(g)" we would add an attribute "regex.1" with a value of "def" if the "def" matched. If the "def" did not match, no attribute named "regex.1" would be added but an attribute named "regex.2" with a value of "g" will be added regardless.

The value of the property must be a valid Regular Expressions with one or more capturing groups. If the Regular Expression matches more than once, only the first match will be used unless the property enabling repeating capture group is set to true. If any provided Regular Expression matches, the FlowFile(s) will be routed to 'matched'. If no provided Regular Expression matches, the FlowFile will be routed to 'unmatched' and no attributes will be applied to the FlowFile.

### Tags:

evaluate, extract, Text, Regular Expression, regex

### Properties:

In the list below, the names of required properties appear in **bold**. Any other properties (not in bold) are considered optional. The table also indicates any default values.

| Name                                            | Default Value | Allowable Values | Description                                                  |
| ----------------------------------------------- | ------------- | ---------------- | ------------------------------------------------------------ |
| **Character Set**                               | UTF-8         |                  | The Character Set in which the file is encoded               |
| **Maximum Buffer Size**                         | 1 MB          |                  | Specifies the maximum amount of data to buffer (per file) in order to apply the regular expressions. Files larger than the specified maximum will not be fully evaluated. |
| Maximum Capture Group Length                    | 1024          |                  | Specifies the maximum number of characters a given capture group value can have. Any characters beyond the max will be truncated. |
| **Enable Canonical Equivalence**                | false         | truefalse        | Indicates that two characters match only when their full canonical decompositions match. |
| **Enable Case-insensitive Matching**            | false         | truefalse        | Indicates that two characters match even if they are in a different case. Can also be specified via the embedded flag (?i). |
| **Permit Whitespace and Comments in Pattern**   | false         | truefalse        | In this mode, whitespace is ignored, and embedded comments starting with # are ignored until the end of a line. Can also be specified via the embedded flag (?x). |
| **Enable DOTALL Mode**                          | false         | truefalse        | Indicates that the expression '.' should match any character, including a line terminator. Can also be specified via the embedded flag (?s). |
| **Enable Literal Parsing of the Pattern**       | false         | truefalse        | Indicates that Metacharacters and escape characters should be given no special meaning. |
| **Enable Multiline Mode**                       | false         | truefalse        | Indicates that '^' and '$' should match just after and just before a line terminator or end of sequence, instead of only the beginning or end of the entire input. Can also be specified via the embeded flag (?m). |
| **Enable Unicode-aware Case Folding**           | false         | truefalse        | When used with 'Enable Case-insensitive Matching', matches in a manner consistent with the Unicode Standard. Can also be specified via the embedded flag (?u). |
| **Enable Unicode Predefined Character Classes** | false         | truefalse        | Specifies conformance with the Unicode Technical Standard #18: Unicode Regular Expression Annex C: Compatibility Properties. Can also be specified via the embedded flag (?U). |
| **Enable Unix Lines Mode**                      | false         | truefalse        | Indicates that only the ' ' line terminator is recognized in the behavior of '.', '^', and '$'. Can also be specified via the embedded flag (?d). |
| **Include Capture Group 0**                     | true          | truefalse        | Indicates that Capture Group 0 should be included as an attribute. Capture Group 0 represents the entirety of the regular expression match, is typically not used, and could have considerable length. |
| **Enable repeating capture group**              | false         | truefalse        | If set to true, every string matching the capture groups will be extracted. Otherwise, if the Regular Expression matches more than once, only the first match will be extracted. |

### Dynamic Properties:

Dynamic Properties allow the user to specify both the name and value of a property.

| Name                 | Value                                                 | Description                                                  |
| -------------------- | ----------------------------------------------------- | ------------------------------------------------------------ |
| A FlowFile attribute | A Regular Expression with one or more capturing group | The first capture group, if any found, will be placed into that attribute name.But all capture groups, including the matching string sequence itself will also be provided at that attribute name with an index value provided. **Supports Expression Language: false** |



### Relationships:

| Name      | Description                                                  |
| --------- | ------------------------------------------------------------ |
| unmatched | FlowFiles are routed to this relationship when no provided Regular Expression matches the content of the FlowFile |
| matched   | FlowFiles are routed to this relationship when the Regular Expression is successfully evaluated and the FlowFile is modified as a result |

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