## Description:

Execute a Flume sink. Each input FlowFile is converted into a Flume Event for processing by the sink.

[Additional Details...](https://nifi.apache.org/docs/nifi-docs/components/org.apache.nifi/nifi-flume-nar/1.7.1/org.apache.nifi.processors.flume.ExecuteFlumeSink/additionalDetails.html)

### Tags:

flume, hadoop, put, sink

### Properties:

In the list below, the names of required properties appear in **bold**. Any other properties (not in bold) are considered optional. The table also indicates any default values.

| Name                    | Default Value | Allowable Values | Description                                                  |
| ----------------------- | ------------- | ---------------- | ------------------------------------------------------------ |
| **Sink Type**           |               |                  | The component type name for the sink. For some sinks, this is a short, symbolic name (e.g. hdfs). For others, it's the fully-qualified name of the Sink class. See the Flume User Guide for details. |
| **Agent Name**          | tier1         |                  | The name of the agent used in the Flume sink configuration   |
| **Sink Name**           | sink-1        |                  | The name of the sink used in the Flume sink configuration    |
| **Flume Configuration** |               |                  | The Flume configuration for the sink copied from the flume.properties file |

### Relationships:

| Name    | Description |
| ------- | ----------- |
| success |             |
| failure |             |

### Reads Attributes:

None specified.

### Writes Attributes:

None specified.

### State management:

This component does not store state.

### Restricted:

| Required Permission | Explanation                                                  |
| ------------------- | ------------------------------------------------------------ |
| execute code        | Provides operator the ability to execute arbitrary Flume configurations assuming all permissions that NiFi has. |

### Input requirement:

This component requires an incoming relationship.

### System Resource Considerations:

None specified.