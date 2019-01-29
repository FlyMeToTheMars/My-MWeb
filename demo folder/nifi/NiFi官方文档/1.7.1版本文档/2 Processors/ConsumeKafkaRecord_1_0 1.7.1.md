## Description:

Consumes messages from Apache Kafka specifically built against the Kafka 1.0 Consumer API. The complementary NiFi processor for sending messages is PublishKafkaRecord_1_0. Please note that, at this time, the Processor assumes that all records that are retrieved from a given partition have the same schema. If any of the Kafka messages are pulled but cannot be parsed or written with the configured Record Reader or Record Writer, the contents of the message will be written to a separate FlowFile, and that FlowFile will be transferred to the 'parse.failure' relationship. Otherwise, each FlowFile is sent to the 'success' relationship and may contain many individual messages within the single FlowFile. A 'record.count' attribute is added to indicate how many messages are contained in the FlowFile. No two Kafka messages will be placed into the same FlowFile if they have different schemas, or if they have different values for a message header that is included by the <Headers to Add as Attributes> property.

[Additional Details...](https://nifi.apache.org/docs/nifi-docs/components/org.apache.nifi/nifi-kafka-1-0-nar/1.7.1/org.apache.nifi.processors.kafka.pubsub.ConsumeKafkaRecord_1_0/additionalDetails.html)

### Tags:

Kafka, Get, Record, csv, avro, json, Ingest, Ingress, Topic, PubSub, Consume, 1.0

### Properties:

In the list below, the names of required properties appear in **bold**. Any other properties (not in bold) are considered optional. The table also indicates any default values, and whether a property supports the [NiFi Expression Language](https://nifi.apache.org/docs/nifi-docs/html/expression-language-guide.html).

| Name                                 | Default Value  | Allowable Values                                             | Description                                                  |
| ------------------------------------ | -------------- | ------------------------------------------------------------ | ------------------------------------------------------------ |
| **Kafka Brokers**                    | localhost:9092 |                                                              | A comma-separated list of known Kafka Brokers in the format <host>:<port> **Supports Expression Language: true (will be evaluated using variable registry only)** |
| **Topic Name(s)**                    |                |                                                              | The name of the Kafka Topic(s) to pull from. More than one can be supplied if comma separated. **Supports Expression Language: true (will be evaluated using variable registry only)** |
| **Topic Name Format**                | names          | names ![Topic is a full topic name or comma separated list of names](https://nifi.apache.org/docs/nifi-docs/html/images/iconInfo.png)pattern ![Topic is a regex using the Java Pattern syntax](https://nifi.apache.org/docs/nifi-docs/html/images/iconInfo.png) | Specifies whether the Topic(s) provided are a comma separated list of names or a single regular expression |
| **Record Reader**                    |                | **Controller Service API:**  RecordReaderFactory **Implementations:** [JsonTreeReader](https://nifi.apache.org/docs/nifi-docs/components/org.apache.nifi/nifi-record-serialization-services-nar/1.7.1/org.apache.nifi.json.JsonTreeReader/index.html) [AvroReader](https://nifi.apache.org/docs/nifi-docs/components/org.apache.nifi/nifi-record-serialization-services-nar/1.7.1/org.apache.nifi.avro.AvroReader/index.html) [CSVReader](https://nifi.apache.org/docs/nifi-docs/components/org.apache.nifi/nifi-record-serialization-services-nar/1.7.1/org.apache.nifi.csv.CSVReader/index.html) [XMLReader](https://nifi.apache.org/docs/nifi-docs/components/org.apache.nifi/nifi-record-serialization-services-nar/1.7.1/org.apache.nifi.xml.XMLReader/index.html) [JsonPathReader](https://nifi.apache.org/docs/nifi-docs/components/org.apache.nifi/nifi-record-serialization-services-nar/1.7.1/org.apache.nifi.json.JsonPathReader/index.html) [ScriptedReader](https://nifi.apache.org/docs/nifi-docs/components/org.apache.nifi/nifi-scripting-nar/1.7.1/org.apache.nifi.record.script.ScriptedReader/index.html) [GrokReader](https://nifi.apache.org/docs/nifi-docs/components/org.apache.nifi/nifi-record-serialization-services-nar/1.7.1/org.apache.nifi.grok.GrokReader/index.html) | The Record Reader to use for incoming FlowFiles              |
| **Record Writer**                    |                | **Controller Service API:**  RecordSetWriterFactory **Implementations:** [AvroRecordSetWriter](https://nifi.apache.org/docs/nifi-docs/components/org.apache.nifi/nifi-record-serialization-services-nar/1.7.1/org.apache.nifi.avro.AvroRecordSetWriter/index.html) [CSVRecordSetWriter](https://nifi.apache.org/docs/nifi-docs/components/org.apache.nifi/nifi-record-serialization-services-nar/1.7.1/org.apache.nifi.csv.CSVRecordSetWriter/index.html) [JsonRecordSetWriter](https://nifi.apache.org/docs/nifi-docs/components/org.apache.nifi/nifi-record-serialization-services-nar/1.7.1/org.apache.nifi.json.JsonRecordSetWriter/index.html) [ScriptedRecordSetWriter](https://nifi.apache.org/docs/nifi-docs/components/org.apache.nifi/nifi-scripting-nar/1.7.1/org.apache.nifi.record.script.ScriptedRecordSetWriter/index.html) [XMLRecordSetWriter](https://nifi.apache.org/docs/nifi-docs/components/org.apache.nifi/nifi-record-serialization-services-nar/1.7.1/org.apache.nifi.xml.XMLRecordSetWriter/index.html) [FreeFormTextRecordSetWriter](https://nifi.apache.org/docs/nifi-docs/components/org.apache.nifi/nifi-record-serialization-services-nar/1.7.1/org.apache.nifi.text.FreeFormTextRecordSetWriter/index.html) | The Record Writer to use in order to serialize the data before sending to Kafka |
| **Honor Transactions**               | true           | truefalse                                                    | Specifies whether or not NiFi should honor transactional guarantees when communicating with Kafka. If false, the Processor will use an "isolation level" of read_uncomitted. This means that messages will be received as soon as they are written to Kafka but will be pulled, even if the producer cancels the transactions. If this value is true, NiFi will not receive any messages for which the producer's transaction was canceled, but this can result in some latency since the consumer must wait for the producer to finish its entire transaction instead of pulling as the messages become available. |
| **Security Protocol**                | PLAINTEXT      | PLAINTEXT ![PLAINTEXT](https://nifi.apache.org/docs/nifi-docs/html/images/iconInfo.png)SSL ![SSL](https://nifi.apache.org/docs/nifi-docs/html/images/iconInfo.png)SASL_PLAINTEXT ![SASL_PLAINTEXT](https://nifi.apache.org/docs/nifi-docs/html/images/iconInfo.png)SASL_SSL ![SASL_SSL](https://nifi.apache.org/docs/nifi-docs/html/images/iconInfo.png) | Protocol used to communicate with brokers. Corresponds to Kafka's 'security.protocol' property. |
| Kerberos Credentials Service         |                | **Controller Service API:**  KerberosCredentialsService **Implementation:** [KeytabCredentialsService](https://nifi.apache.org/docs/nifi-docs/components/org.apache.nifi/nifi-kerberos-credentials-service-nar/1.7.1/org.apache.nifi.kerberos.KeytabCredentialsService/index.html) | Specifies the Kerberos Credentials Controller Service that should be used for authenticating with Kerberos |
| Kerberos Service Name                |                |                                                              | The Kerberos principal name that Kafka runs as. This can be defined either in Kafka's JAAS config or in Kafka's config. Corresponds to Kafka's 'security.protocol' property.It is ignored unless one of the SASL options of the <Security Protocol> are selected. **Supports Expression Language: true (will be evaluated using variable registry only)** |
| Kerberos Principal                   |                |                                                              | The Kerberos principal that will be used to connect to brokers. If not set, it is expected to set a JAAS configuration file in the JVM properties defined in the bootstrap.conf file. This principal will be set into 'sasl.jaas.config' Kafka's property. **Supports Expression Language: true (will be evaluated using variable registry only)** |
| Kerberos Keytab                      |                |                                                              | The Kerberos keytab that will be used to connect to brokers. If not set, it is expected to set a JAAS configuration file in the JVM properties defined in the bootstrap.conf file. This principal will be set into 'sasl.jaas.config' Kafka's property. **Supports Expression Language: true (will be evaluated using variable registry only)** |
| SSL Context Service                  |                | **Controller Service API:**  SSLContextService **Implementations:** [StandardSSLContextService](https://nifi.apache.org/docs/nifi-docs/components/org.apache.nifi/nifi-ssl-context-service-nar/1.7.1/org.apache.nifi.ssl.StandardSSLContextService/index.html) [StandardRestrictedSSLContextService](https://nifi.apache.org/docs/nifi-docs/components/org.apache.nifi/nifi-ssl-context-service-nar/1.7.1/org.apache.nifi.ssl.StandardRestrictedSSLContextService/index.html) | Specifies the SSL Context Service to use for communicating with Kafka. |
| **Group ID**                         |                |                                                              | A Group ID is used to identify consumers that are within the same consumer group. Corresponds to Kafka's 'group.id' property. |
| **Offset Reset**                     | latest         | earliest ![Automatically reset the offset to the earliest offset](https://nifi.apache.org/docs/nifi-docs/html/images/iconInfo.png)latest ![Automatically reset the offset to the latest offset](https://nifi.apache.org/docs/nifi-docs/html/images/iconInfo.png)none ![Throw exception to the consumer if no previous offset is found for the consumer's group](https://nifi.apache.org/docs/nifi-docs/html/images/iconInfo.png) | Allows you to manage the condition when there is no initial offset in Kafka or if the current offset does not exist any more on the server (e.g. because that data has been deleted). Corresponds to Kafka's 'auto.offset.reset' property. |
| Message Header Encoding              | UTF-8          |                                                              | Any message header that is found on a Kafka message will be added to the outbound FlowFile as an attribute. This property indicates the Character Encoding to use for deserializing the headers. |
| Headers to Add as Attributes (Regex) |                |                                                              | A Regular Expression that is matched against all message headers. Any message header whose name matches the regex will be added to the FlowFile as an Attribute. If not specified, no Header values will be added as FlowFile attributes. If two messages have a different value for the same header and that header is selected by the provided regex, then those two messages must be added to different FlowFiles. As a result, users should be cautious about using a regex like ".*" if messages are expected to have header values that are unique per message, such as an identifier or timestamp, because it will prevent NiFi from bundling the messages together efficiently. |
| Max Poll Records                     | 10000          |                                                              | Specifies the maximum number of records Kafka should return in a single poll. |
| Max Uncommitted Time                 | 1 secs         |                                                              | Specifies the maximum amount of time allowed to pass before offsets must be committed. This value impacts how often offsets will be committed. Committing offsets less often increases throughput but also increases the window of potential data duplication in the event of a rebalance or JVM restart between commits. This value is also related to maximum poll records and the use of a message demarcator. When using a message demarcator we can have far more uncommitted messages than when we're not as there is much less for us to keep track of in memory. |

### Dynamic Properties:

Dynamic Properties allow the user to specify both the name and value of a property.

| Name                                        | Value                                              | Description                                                  |
| ------------------------------------------- | -------------------------------------------------- | ------------------------------------------------------------ |
| The name of a Kafka configuration property. | The value of a given Kafka configuration property. | These properties will be added on the Kafka configuration after loading any provided configuration properties. In the event a dynamic property represents a property that was already set, its value will be ignored and WARN message logged. For the list of available Kafka properties please refer to: http://kafka.apache.org/documentation.html#configuration.  **Supports Expression Language: false** |



### Relationships:

| Name          | Description                                                  |
| ------------- | ------------------------------------------------------------ |
| success       | FlowFiles received from Kafka. Depending on demarcation strategy it is a flow file per message or a bundle of messages grouped by topic and partition. |
| parse.failure | If a message from Kafka cannot be parsed using the configured Record Reader, the contents of the message will be routed to this Relationship as its own individual FlowFile. |

### Reads Attributes:

None specified.

### Writes Attributes:

| Name            | Description                                                  |
| --------------- | ------------------------------------------------------------ |
| record.count    | The number of records received                               |
| mime.type       | The MIME Type that is provided by the configured Record Writer |
| kafka.partition | The partition of the topic the records are from              |
| kafka.topic     | The topic records are from                                   |

### State management:

This component does not store state.

### Restricted:

This component is not restricted.

### Input requirement:

This component does not allow an incoming relationship.

### System Resource Considerations:

None specified.

### See Also:

[ConsumeKafka_1_0](https://nifi.apache.org/docs/nifi-docs/components/org.apache.nifi/nifi-kafka-1-0-nar/1.7.1/org.apache.nifi.processors.kafka.pubsub.ConsumeKafka_1_0/index.html), [PublishKafka_1_0](https://nifi.apache.org/docs/nifi-docs/components/org.apache.nifi/nifi-kafka-1-0-nar/1.7.1/org.apache.nifi.processors.kafka.pubsub.PublishKafka_1_0/index.html), [PublishKafkaRecord_1_0](https://nifi.apache.org/docs/nifi-docs/components/org.apache.nifi/nifi-kafka-1-0-nar/1.7.1/org.apache.nifi.processors.kafka.pubsub.PublishKafkaRecord_1_0/index.html)