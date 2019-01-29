## Description:

Converts CSV files to Avro according to an Avro Schema

### Tags:

kite, csv, avro

### Properties:

In the list below, the names of required properties appear in **bold**. Any other properties (not in bold) are considered optional. The table also indicates any default values, and whether a property supports the [NiFi Expression Language](https://nifi.apache.org/docs/nifi-docs/html/expression-language-guide.html).

| Name                           | Default Value | Allowable Values          | Description                                                  |
| ------------------------------ | ------------- | ------------------------- | ------------------------------------------------------------ |
| Hadoop configuration Resources |               |                           | A file or comma separated list of files which contains the Hadoop file system configuration. Without this, Hadoop will search the classpath for a 'core-site.xml' and 'hdfs-site.xml' file or will revert to a default configuration. **Supports Expression Language: true (will be evaluated using variable registry only)** |
| **Record schema**              |               |                           | Outgoing Avro schema for each record created from a CSV row **Supports Expression Language: true (will be evaluated using flow file attributes and variable registry)** |
| CSV charset                    | utf8          |                           | Character set for CSV files **Supports Expression Language: true (will be evaluated using flow file attributes and variable registry)** |
| CSV delimiter                  | ,             |                           | Delimiter character for CSV records **Supports Expression Language: true (will be evaluated using flow file attributes and variable registry)** |
| CSV quote character            | "             |                           | Quote character for CSV values **Supports Expression Language: true (will be evaluated using flow file attributes and variable registry)** |
| CSV escape character           | \             |                           | Escape character for CSV values **Supports Expression Language: true (will be evaluated using flow file attributes and variable registry)** |
| Use CSV header line            | false         |                           | Whether to use the first line as a header **Supports Expression Language: true (will be evaluated using flow file attributes and variable registry)** |
| Lines to skip                  | 0             |                           | Number of lines to skip before reading header or data **Supports Expression Language: true (will be evaluated using flow file attributes and variable registry)** |
| Compression type               | SNAPPY        | BZIP2DEFLATENONESNAPPYLZO | Compression type to use when writting Avro files. Default is Snappy. |

### Relationships:

| Name         | Description                                           |
| ------------ | ----------------------------------------------------- |
| success      | Avro content that was converted successfully from CSV |
| failure      | CSV content that could not be processed               |
| incompatible | CSV content that could not be converted               |

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