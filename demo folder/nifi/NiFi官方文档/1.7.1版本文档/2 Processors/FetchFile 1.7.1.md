## Description:

Reads the contents of a file from disk and streams it into the contents of an incoming FlowFile. Once this is done, the file is optionally moved elsewhere or deleted to help keep the file system organized.

### Tags:

local, files, filesystem, ingest, ingress, get, source, input, fetch

### Properties:

In the list below, the names of required properties appear in **bold**. Any other properties (not in bold) are considered optional. The table also indicates any default values, and whether a property supports the [NiFi Expression Language](https://nifi.apache.org/docs/nifi-docs/html/expression-language-guide.html).

| Name                                 | Default Value                | Allowable Values                                             | Description                                                  |
| ------------------------------------ | ---------------------------- | ------------------------------------------------------------ | ------------------------------------------------------------ |
| **File to Fetch**                    | ${absolute.path}/${filename} |                                                              | The fully-qualified filename of the file to fetch from the file system **Supports Expression Language: true (will be evaluated using flow file attributes and variable registry)** |
| **Completion Strategy**              | None                         | None ![Leave the file as-is](https://nifi.apache.org/docs/nifi-docs/html/images/iconInfo.png)Move File ![Moves the file to the directory specified by the <Move Destination Directory> property](https://nifi.apache.org/docs/nifi-docs/html/images/iconInfo.png)Delete File ![Deletes the original file from the file system](https://nifi.apache.org/docs/nifi-docs/html/images/iconInfo.png) | Specifies what to do with the original file on the file system once it has been pulled into NiFi |
| Move Destination Directory           |                              |                                                              | The directory to the move the original file to once it has been fetched from the file system. This property is ignored unless the Completion Strategy is set to "Move File". If the directory does not exist, it will be created. **Supports Expression Language: true (will be evaluated using flow file attributes and variable registry)** |
| **Move Conflict Strategy**           | Rename                       | Rename ![The existing destination file should remain intact. The newly ingested file should be moved to the destination directory but be renamed to a random filename](https://nifi.apache.org/docs/nifi-docs/html/images/iconInfo.png)Replace File ![The newly ingested file should replace the existing file in the Destination Directory](https://nifi.apache.org/docs/nifi-docs/html/images/iconInfo.png)Keep Existing ![The existing file should in the Destination Directory should stay intact and the newly ingested file should be deleted](https://nifi.apache.org/docs/nifi-docs/html/images/iconInfo.png)Fail ![The existing destination file should remain intact and the incoming FlowFile should be routed to failure](https://nifi.apache.org/docs/nifi-docs/html/images/iconInfo.png) | If Completion Strategy is set to Move File and a file already exists in the destination directory with the same name, this property specifies how that naming conflict should be resolved |
| **Log level when file not found**    | ERROR                        | TRACEDEBUGINFOWARNERRORFATALNONE                             | Log level to use in case the file does not exist when the processor is triggered |
| **Log level when permission denied** | ERROR                        | TRACEDEBUGINFOWARNERRORFATALNONE                             | Log level to use in case user alopresto does not have sufficient permissions to read the file |

### Relationships:

| Name              | Description                                                  |
| ----------------- | ------------------------------------------------------------ |
| success           | Any FlowFile that is successfully fetched from the file system will be transferred to this Relationship. |
| not.found         | Any FlowFile that could not be fetched from the file system because the file could not be found will be transferred to this Relationship. |
| permission.denied | Any FlowFile that could not be fetched from the file system due to the user running NiFi not having sufficient permissions will be transferred to this Relationship. |
| failure           | Any FlowFile that could not be fetched from the file system for any reason other than insufficient permissions or the file not existing will be transferred to this Relationship. |

### Reads Attributes:

None specified.

### Writes Attributes:

None specified.

### State management:

This component does not store state.

### Restricted:

| Required Permission | Explanation                                                  |
| ------------------- | ------------------------------------------------------------ |
| read filesystem     | Provides operator the ability to read from any file that NiFi has access to. |
| write filesystem    | Provides operator the ability to delete any file that NiFi has access to. |

### Input requirement:

This component requires an incoming relationship.

### System Resource Considerations:

None specified.

### See Also:

[GetFile](https://nifi.apache.org/docs/nifi-docs/components/org.apache.nifi/nifi-standard-nar/1.7.1/org.apache.nifi.processors.standard.GetFile/index.html), [PutFile](https://nifi.apache.org/docs/nifi-docs/components/org.apache.nifi/nifi-standard-nar/1.7.1/org.apache.nifi.processors.standard.PutFile/index.html), [ListFile](https://nifi.apache.org/docs/nifi-docs/components/org.apache.nifi/nifi-standard-nar/1.7.1/org.apache.nifi.processors.standard.ListFile/index.html)