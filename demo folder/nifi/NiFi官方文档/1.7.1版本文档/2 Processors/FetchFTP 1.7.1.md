## Description:

Fetches the content of a file from a remote SFTP server and overwrites the contents of an incoming FlowFile with the content of the remote file.

### Tags:

ftp, get, retrieve, files, fetch, remote, ingest, source, input

### Properties:

In the list below, the names of required properties appear in **bold**. Any other properties (not in bold) are considered optional. The table also indicates any default values, whether a property supports the [NiFi Expression Language](https://nifi.apache.org/docs/nifi-docs/html/expression-language-guide.html), and whether a property is considered "sensitive", meaning that its value will be encrypted. Before entering a value in a sensitive property, ensure that the **nifi.properties** file has an entry for the property **nifi.sensitive.props.key**.

| Name                        | Default Value | Allowable Values                                             | Description                                                  |
| --------------------------- | ------------- | ------------------------------------------------------------ | ------------------------------------------------------------ |
| **Hostname**                |               |                                                              | The fully-qualified hostname or IP address of the host to fetch the data from **Supports Expression Language: true (will be evaluated using flow file attributes and variable registry)** |
| **Port**                    | 21            |                                                              | The port to connect to on the remote host to fetch the data from **Supports Expression Language: true (will be evaluated using flow file attributes and variable registry)** |
| **Username**                |               |                                                              | Username **Supports Expression Language: true (will be evaluated using flow file attributes and variable registry)** |
| Password                    |               |                                                              | Password for the user account **Sensitive Property: true** **Supports Expression Language: true (will be evaluated using flow file attributes and variable registry)** |
| **Remote File**             |               |                                                              | The fully qualified filename on the remote system **Supports Expression Language: true (will be evaluated using flow file attributes and variable registry)** |
| **Completion Strategy**     | None          | None ![Leave the file as-is](https://nifi.apache.org/docs/nifi-docs/html/images/iconInfo.png)Move File ![Move the file to the directory specified by the <Move Destination Directory> property](https://nifi.apache.org/docs/nifi-docs/html/images/iconInfo.png)Delete File ![Deletes the original file from the remote system](https://nifi.apache.org/docs/nifi-docs/html/images/iconInfo.png) | Specifies what to do with the original file on the server once it has been pulled into NiFi. If the Completion Strategy fails, a warning will be logged but the data will still be transferred. |
| Move Destination Directory  |               |                                                              | The directory on the remote server to move the original file to once it has been ingested into NiFi. This property is ignored unless the Completion Strategy is set to 'Move File'. The specified directory must already exist on the remote system if 'Create Directory' is disabled, or the rename will fail. **Supports Expression Language: true (will be evaluated using flow file attributes and variable registry)** |
| Create Directory            | false         | truefalse                                                    | Used when 'Completion Strategy' is 'Move File'. Specifies whether or not the remote directory should be created if it does not exist. |
| **Connection Timeout**      | 30 sec        |                                                              | Amount of time to wait before timing out while creating a connection |
| **Data Timeout**            | 30 sec        |                                                              | When transferring a file between the local and remote system, this value specifies how long is allowed to elapse without any data being transferred between systems |
| **Use Compression**         | false         | truefalse                                                    | Indicates whether or not ZLIB compression should be used when transferring files |
| Connection Mode             | Passive       | ActivePassive                                                | The FTP Connection Mode                                      |
| Transfer Mode               | Binary        | BinaryASCII                                                  | The FTP Transfer Mode                                        |
| Proxy Configuration Service |               | **Controller Service API:**  ProxyConfigurationService **Implementation:** [StandardProxyConfigurationService](https://nifi.apache.org/docs/nifi-docs/components/org.apache.nifi/nifi-proxy-configuration-nar/1.7.1/org.apache.nifi.proxy.StandardProxyConfigurationService/index.html) | Specifies the Proxy Configuration Controller Service to proxy network requests. If set, it supersedes proxy settings configured per component. Supported proxies: SOCKS, HTTP + AuthN |
| Proxy Type                  | DIRECT        | DIRECTHTTPSOCKS                                              | Proxy type used for file transfers                           |
| Proxy Host                  |               |                                                              | The fully qualified hostname or IP address of the proxy server **Supports Expression Language: true (will be evaluated using variable registry only)** |
| Proxy Port                  |               |                                                              | The port of the proxy server **Supports Expression Language: true (will be evaluated using variable registry only)** |
| Http Proxy Username         |               |                                                              | Http Proxy Username **Supports Expression Language: true (will be evaluated using variable registry only)** |
| Http Proxy Password         |               |                                                              | Http Proxy Password **Sensitive Property: true** **Supports Expression Language: true (will be evaluated using variable registry only)** |
| Internal Buffer Size        | 16KB          |                                                              | Set the internal buffer size for buffered data streams       |

### Relationships:

| Name              | Description                                                  |
| ----------------- | ------------------------------------------------------------ |
| success           | All FlowFiles that are received are routed to success        |
| comms.failure     | Any FlowFile that could not be fetched from the remote server due to a communications failure will be transferred to this Relationship. |
| not.found         | Any FlowFile for which we receive a 'Not Found' message from the remote server will be transferred to this Relationship. |
| permission.denied | Any FlowFile that could not be fetched from the remote server due to insufficient permissions will be transferred to this Relationship. |

### Reads Attributes:

None specified.

### Writes Attributes:

| Name                | Description                                                  |
| ------------------- | ------------------------------------------------------------ |
| ftp.remote.host     | The hostname or IP address from which the file was pulled    |
| ftp.remote.port     | The port that was used to communicate with the remote FTP server |
| ftp.remote.filename | The name of the remote file that was pulled                  |
| filename            | The filename is updated to point to the filename fo the remote file |
| path                | If the Remote File contains a directory name, that directory name will be added to the FlowFile using the 'path' attribute |

### State management:

This component does not store state.

### Restricted:

This component is not restricted.

### Input requirement:

This component requires an incoming relationship.

### System Resource Considerations:

None specified.

### See Also:

[GetSFTP](https://nifi.apache.org/docs/nifi-docs/components/org.apache.nifi/nifi-standard-nar/1.7.1/org.apache.nifi.processors.standard.GetSFTP/index.html), [PutSFTP](https://nifi.apache.org/docs/nifi-docs/components/org.apache.nifi/nifi-standard-nar/1.7.1/org.apache.nifi.processors.standard.PutSFTP/index.html), [GetFTP](https://nifi.apache.org/docs/nifi-docs/components/org.apache.nifi/nifi-standard-nar/1.7.1/org.apache.nifi.processors.standard.GetFTP/index.html), [PutFTP](https://nifi.apache.org/docs/nifi-docs/components/org.apache.nifi/nifi-standard-nar/1.7.1/org.apache.nifi.processors.standard.PutFTP/index.html)