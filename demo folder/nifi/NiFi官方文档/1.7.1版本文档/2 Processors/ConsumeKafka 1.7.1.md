## Description:

Consumes messages from Apache Kafka specifically built against the Kafka 0.9.x Consumer API. Please note there are cases where the publisher can get into an indefinite stuck state. We are closely monitoring how this evolves in the Kafka community and will take advantage of those fixes as soon as we can. In the mean time it is possible to enter states where the only resolution will be to restart the JVM NiFi runs on. The complementary NiFi processor for sending messages is PublishKafka.

[Additional Details...](https://nifi.apache.org/docs/nifi-docs/components/org.apache.nifi/nifi-kafka-0-9-nar/1.7.1/org.apache.nifi.processors.kafka.pubsub.ConsumeKafka/additionalDetails.html)

### Tags:

Kafka, Get, Ingest, Ingress, Topic, PubSub, Consume, 0.9.x

### Properties:

In the list below, the names of required properties appear in **bold**. Any other properties (not in bold) are considered optional. The table also indicates any default values, and whether a property supports the [NiFi Expression Language](https://nifi.apache.org/docs/nifi-docs/html/expression-language-guide.html).

| Name                       | Default Value  | Allowable Values                                             | Description                                                  |
| -------------------------- | -------------- | ------------------------------------------------------------ | ------------------------------------------------------------ |
| **Kafka Brokers**          | localhost:9092 |                                                              | A comma-separated list of known Kafka Brokers in the format <host>:<port> **Supports Expression Language: true (will be evaluated using variable registry only)** |
| **Security Protocol**      | PLAINTEXT      | PLAINTEXT ![PLAINTEXT](https://nifi.apache.org/docs/nifi-docs/html/images/iconInfo.png)SSL ![SSL](https://nifi.apache.org/docs/nifi-docs/html/images/iconInfo.png)SASL_PLAINTEXT ![SASL_PLAINTEXT](https://nifi.apache.org/docs/nifi-docs/html/images/iconInfo.png)SASL_SSL ![SASL_SSL](https://nifi.apache.org/docs/nifi-docs/html/images/iconInfo.png) | Protocol used to communicate with brokers. Corresponds to Kafka's 'security.protocol' property. |
| Kerberos Service Name      |                |                                                              | The Kerberos principal name that Kafka runs as. This can be defined either in Kafka's JAAS config or in Kafka's config. Corresponds to Kafka's 'security.protocol' property.It is ignored unless one of the SASL options of the <Security Protocol> are selected. |
| SSL Context Service        |                | **Controller Service API:**  SSLContextService **Implementations:** [StandardSSLContextService](https://nifi.apache.org/docs/nifi-docs/components/org.apache.nifi/nifi-ssl-context-service-nar/1.7.1/org.apache.nifi.ssl.StandardSSLContextService/index.html) [StandardRestrictedSSLContextService](https://nifi.apache.org/docs/nifi-docs/components/org.apache.nifi/nifi-ssl-context-service-nar/1.7.1/org.apache.nifi.ssl.StandardRestrictedSSLContextService/index.html) | Specifies the SSL Context Service to use for communicating with Kafka. |
| **Topic Name(s)**          |                |                                                              | The name of the Kafka Topic(s) to pull from. More than one can be supplied if comma separated. **Supports Expression Language: true (will be evaluated using variable registry only)** |
| **Group ID**               |                |                                                              | A Group ID is used to identify consumers that are within the same consumer group. Corresponds to Kafka's 'group.id' property. |
| **Offset Reset**           | latest         | earliest ![Automatically reset the offset to the earliest offset](https://nifi.apache.org/docs/nifi-docs/html/images/iconInfo.png)latest ![Automatically reset the offset to the latest offset](https://nifi.apache.org/docs/nifi-docs/html/images/iconInfo.png)none ![Throw exception to the consumer if no previous offset is found for the consumer's group](https://nifi.apache.org/docs/nifi-docs/html/images/iconInfo.png) | Allows you to manage the condition when there is no initial offset in Kafka or if the current offset does not exist any more on the server (e.g. because that data has been deleted). Corresponds to Kafka's 'auto.offset.reset' property. |
| **Key Attribute Encoding** | utf-8          | UTF-8 Encoded ![The key is interpreted as a UTF-8 Encoded string.](https://nifi.apache.org/docs/nifi-docs/html/images/iconInfo.png)Hex Encoded ![The key is interpreted as arbitrary binary data and is encoded using hexadecimal characters with uppercase letters](https://nifi.apache.org/docs/nifi-docs/html/images/iconInfo.png) | FlowFiles that are emitted have an attribute named 'kafka.key'. This property dictates how the value of the attribute should be encoded. |
| Message Demarcator         |                |                                                              | Since KafkaConsumer receives messages in batches, you have an option to output FlowFiles which contains all Kafka messages in a single batch for a given topic and partition and this property allows you to provide a string (interpreted as UTF-8) to use for demarcating apart multiple Kafka messages. This is an optional property and if not provided each Kafka message received will result in a single FlowFile which time it is triggered. To enter special character such as 'new line' use CTRL+Enter or Shift+Enter depending on the OS **Supports Expression Language: true (will be evaluated using variable registry only)** |
| Max Poll Records           | 10000          |                                                              | Specifies the maximum number of records Kafka should return in a single poll. |
| Max Uncommitted Time       | 1 secs         |                                                              | Specifies the maximum amount of time allowed to pass before offsets must be committed. This value impacts how often offsets will be committed. Committing offsets less often increases throughput but also increases the window of potential data duplication in the event of a rebalance or JVM restart between commits. This value is also related to maximum poll records and the use of a message demarcator. When using a message demarcator we can have far more uncommitted messages than when we're not as there is much less for us to keep track of in memory. |

### Dynamic Properties:

Dynamic Properties allow the user to specify both the name and value of a property.

| Name                                        | Value                                              | Description                                                  |
| ------------------------------------------- | -------------------------------------------------- | ------------------------------------------------------------ |
| The name of a Kafka configuration property. | The value of a given Kafka configuration property. | These properties will be added on the Kafka configuration after loading any provided configuration properties. In the event a dynamic property represents a property that was already set, its value will be ignored and WARN message logged. For the list of available Kafka properties please refer to: http://kafka.apache.org/documentation.html#configuration.  **Supports Expression Language: false** |



### Relationships:

| Name    | Description                                                  |
| ------- | ------------------------------------------------------------ |
| success | FlowFiles received from Kafka. Depending on demarcation strategy it is a flow file per message or a bundle of messages grouped by topic and partition. |

### Reads Attributes:

None specified.

### Writes Attributes:

| Name            | Description                                                  |
| --------------- | ------------------------------------------------------------ |
| kafka.count     | The number of messages written if more than one              |
| kafka.key       | The key of message if present and if single message. How the key is encoded depends on the value of the 'Key Attribute Encoding' property. |
| kafka.offset    | The offset of the message in the partition of the topic.     |
| kafka.partition | The partition of the topic the message or message bundle is from |
| kafka.topic     | The topic the message or message bundle is from              |

### State management:

This component does not store state.

### Restricted:

This component is not restricted.

### Input requirement:

This component does not allow an incoming relationship.

### System Resource Considerations:

None specified.