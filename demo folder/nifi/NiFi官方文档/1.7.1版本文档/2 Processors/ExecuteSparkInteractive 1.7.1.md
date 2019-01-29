## Description:

Execute Spark Code over a Livy-managed HTTP session to a live Spark context. Supports cached RDD sharing.

### Tags:

spark, livy, http, execute

### Properties:

In the list below, the names of required properties appear in **bold**. Any other properties (not in bold) are considered optional. The table also indicates any default values, and whether a property supports the [NiFi Expression Language](https://nifi.apache.org/docs/nifi-docs/html/expression-language-guide.html).

| Name                        | Default Value | Allowable Values                                             | Description                                                  |
| --------------------------- | ------------- | ------------------------------------------------------------ | ------------------------------------------------------------ |
| **Livy Controller Service** |               | **Controller Service API:**  LivySessionService **Implementation:** [LivySessionController](https://nifi.apache.org/docs/nifi-docs/components/org.apache.nifi/nifi-livy-nar/1.7.1/org.apache.nifi.controller.livy.LivySessionController/index.html) | The controller service to use for Livy-managed session(s).   |
| Code                        |               |                                                              | The code to execute in the session. This property can be empty, a constant value, or built from attributes using Expression Language. If this property is specified, it will be used regardless of the content of incoming flowfiles. If this property is empty, the content of the incoming flow file is expected to contain valid code to be issued by the processor to the session. Note that Expression Language is not evaluated for flow file contents. **Supports Expression Language: true (will be evaluated using flow file attributes and variable registry)** |
| **Character Set**           | UTF-8         |                                                              | The character set encoding for the incoming flow file. **Supports Expression Language: true (will be evaluated using flow file attributes and variable registry)** |
| **Status Check Interval**   | 1 sec         |                                                              | The amount of time to wait between checking the status of an operation. **Supports Expression Language: true (will be evaluated using flow file attributes and variable registry)** |

### Relationships:

| Name    | Description                                                  |
| ------- | ------------------------------------------------------------ |
| success | FlowFiles that are successfully processed are sent to this relationship |
| wait    | FlowFiles that are waiting on an available Spark session will be sent to this relationship |
| failure | FlowFiles are routed to this relationship when they cannot be parsed |

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