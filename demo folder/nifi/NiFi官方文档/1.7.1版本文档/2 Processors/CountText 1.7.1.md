## Description:

Counts various metrics on incoming text. The requested results will be recorded as attributes. The resulting flowfile will not have its content modified.

### Tags:

count, text, line, word, character

### Properties:

In the list below, the names of required properties appear in **bold**. Any other properties (not in bold) are considered optional. The table also indicates any default values.

| Name                       | Default Value | Allowable Values                              | Description                                                  |
| -------------------------- | ------------- | --------------------------------------------- | ------------------------------------------------------------ |
| **Count Lines**            | true          | truefalse                                     | If enabled, will count the number of lines present in the incoming text. |
| **Count Non-Empty Lines**  | false         | truefalse                                     | If enabled, will count the number of lines that contain a non-whitespace character present in the incoming text. |
| **Count Words**            | false         | truefalse                                     | If enabled, will count the number of words (alphanumeric character groups bounded by whitespace) present in the incoming text. Common logical delimiters [_-.] do not bound a word unless 'Split Words on Symbols' is true. |
| **Count Characters**       | false         | truefalse                                     | If enabled, will count the number of characters (including whitespace and symbols, but not including newlines and carriage returns) present in the incoming text. |
| **Split Words on Symbols** | false         | truefalse                                     | If enabled, the word count will identify strings separated by common logical delimiters [ _ - . ] as independent words (ex. split-words-on-symbols = 4 words). |
| **Character Encoding**     | UTF-8         | ISO-8859-1UTF-8UTF-16UTF-16LEUTF-16BEUS-ASCII | Specifies a character encoding to use.                       |

### Relationships:

| Name    | Description                                                  |
| ------- | ------------------------------------------------------------ |
| success | The flowfile contains the original content with one or more attributes added containing the respective counts |
| failure | If the flowfile text cannot be counted for some reason, the original file will be routed to this destination and nothing will be routed elsewhere |

### Reads Attributes:

None specified.

### Writes Attributes:

| Name                     | Description                                                  |
| ------------------------ | ------------------------------------------------------------ |
| text.line.count          | The number of lines of text present in the FlowFile content  |
| text.line.nonempty.count | The number of lines of text (with at least one non-whitespace character) present in the original FlowFile |
| text.word.count          | The number of words present in the original FlowFile         |
| text.character.count     | The number of characters (given the specified character encoding) present in the original FlowFile |

### State management:

This component does not store state.

### Restricted:

This component is not restricted.

### Input requirement:

This component requires an incoming relationship.

### System Resource Considerations:

None specified.

### See Also:

[SplitText](https://nifi.apache.org/docs/nifi-docs/components/org.apache.nifi/nifi-standard-nar/1.7.1/org.apache.nifi.processors.standard.SplitText/index.html)