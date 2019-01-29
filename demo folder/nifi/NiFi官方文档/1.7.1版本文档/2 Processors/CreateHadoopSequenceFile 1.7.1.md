## Description:

Creates Hadoop Sequence Files from incoming flow files

[Additional Details...](https://nifi.apache.org/docs/nifi-docs/components/org.apache.nifi/nifi-hadoop-nar/1.7.1/org.apache.nifi.processors.hadoop.CreateHadoopSequenceFile/additionalDetails.html)

### Tags:

hadoop, sequence file, create, sequencefile

### Properties:

In the list below, the names of required properties appear in **bold**. Any other properties (not in bold) are considered optional. The table also indicates any default values, and whether a property supports the [NiFi Expression Language](https://nifi.apache.org/docs/nifi-docs/html/expression-language-guide.html).

| Name                           | Default Value | Allowable Values                                             | Description                                                  |
| ------------------------------ | ------------- | ------------------------------------------------------------ | ------------------------------------------------------------ |
| Hadoop Configuration Resources |               |                                                              | A file or comma separated list of files which contains the Hadoop file system configuration. Without this, Hadoop will search the classpath for a 'core-site.xml' and 'hdfs-site.xml' file or will revert to a default configuration. To use swebhdfs, see 'Additional Details' section of PutHDFS's documentation. **Supports Expression Language: true (will be evaluated using variable registry only)** |
| Kerberos Credentials Service   |               | **Controller Service API:**  KerberosCredentialsService **Implementation:** [KeytabCredentialsService](https://nifi.apache.org/docs/nifi-docs/components/org.apache.nifi/nifi-kerberos-credentials-service-nar/1.7.1/org.apache.nifi.kerberos.KeytabCredentialsService/index.html) | Specifies the Kerberos Credentials Controller Service that should be used for authenticating with Kerberos |
| Kerberos Principal             |               |                                                              | Kerberos principal to authenticate as. Requires nifi.kerberos.krb5.file to be set in your nifi.properties **Supports Expression Language: true (will be evaluated using variable registry only)** |
| Kerberos Keytab                |               |                                                              | Kerberos keytab associated with the principal. Requires nifi.kerberos.krb5.file to be set in your nifi.properties **Supports Expression Language: true (will be evaluated using variable registry only)** |
| Kerberos Relogin Period        | 4 hours       |                                                              | Period of time which should pass before attempting a kerberos relogin. This property has been deprecated, and has no effect on processing. Relogins now occur automatically. **Supports Expression Language: true (will be evaluated using variable registry only)** |
| Additional Classpath Resources |               |                                                              | A comma-separated list of paths to files and/or directories that will be added to the classpath. When specifying a directory, all files with in the directory will be added to the classpath, but further sub-directories will not be included. |
| Compression type               |               | NONERECORDBLOCK                                              | Type of compression to use when creating Sequence File       |
| **Compression codec**          | NONE          | NONE ![No compression](https://nifi.apache.org/docs/nifi-docs/html/images/iconInfo.png)DEFAULT ![Default ZLIB compression](https://nifi.apache.org/docs/nifi-docs/html/images/iconInfo.png)BZIP ![BZIP compression](https://nifi.apache.org/docs/nifi-docs/html/images/iconInfo.png)GZIP ![GZIP compression](https://nifi.apache.org/docs/nifi-docs/html/images/iconInfo.png)LZ4 ![LZ4 compression](https://nifi.apache.org/docs/nifi-docs/html/images/iconInfo.png)LZO ![LZO compression - it assumes LD_LIBRARY_PATH has been set and jar is available](https://nifi.apache.org/docs/nifi-docs/html/images/iconInfo.png)SNAPPY ![Snappy compression](https://nifi.apache.org/docs/nifi-docs/html/images/iconInfo.png)AUTOMATIC ![Will attempt to automatically detect the compression codec.](https://nifi.apache.org/docs/nifi-docs/html/images/iconInfo.png) | No Description Provided.                                     |

### Relationships:

| Name    | Description                                                  |
| ------- | ------------------------------------------------------------ |
| success | Generated Sequence Files are sent to this relationship       |
| failure | Incoming files that failed to generate a Sequence File are sent to this relationship |

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

### See Also:

[PutHDFS](https://nifi.apache.org/docs/nifi-docs/components/org.apache.nifi/nifi-hadoop-nar/1.7.1/org.apache.nifi.processors.hadoop.PutHDFS/index.html)