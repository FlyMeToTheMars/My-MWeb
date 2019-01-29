## Description:

The DebugFlow processor aids testing and debugging the FlowFile framework by allowing various responses to be explicitly triggered in response to the receipt of a FlowFile or a timer event without a FlowFile if using timer or cron based scheduling. It can force responses needed to exercise or test various failure modes that can occur when a processor runs.

[Additional Details...](https://nifi.apache.org/docs/nifi-docs/components/org.apache.nifi/nifi-standard-nar/1.7.1/org.apache.nifi.processors.standard.DebugFlow/additionalDetails.html)

### Tags:

test, debug, processor, utility, flow, FlowFile

### Properties:

In the list below, the names of required properties appear in **bold**. Any other properties (not in bold) are considered optional. The table also indicates any default values, and whether a property supports the [NiFi Expression Language](https://nifi.apache.org/docs/nifi-docs/html/expression-language-guide.html).

| Name                                     | Default Value              | Allowable Values | Description                                                  |
| ---------------------------------------- | -------------------------- | ---------------- | ------------------------------------------------------------ |
| **FlowFile Success Iterations**          | 1                          |                  | Number of FlowFiles to forward to success relationship.      |
| **FlowFile Failure Iterations**          | 0                          |                  | Number of FlowFiles to forward to failure relationship.      |
| **FlowFile Rollback Iterations**         | 0                          |                  | Number of FlowFiles to roll back (without penalty).          |
| **FlowFile Rollback Yield Iterations**   | 0                          |                  | Number of FlowFiles to roll back and yield.                  |
| **FlowFile Rollback Penalty Iterations** | 0                          |                  | Number of FlowFiles to roll back with penalty.               |
| **FlowFile Exception Iterations**        | 0                          |                  | Number of FlowFiles to throw exception.                      |
| **FlowFile Exception Class**             | java.lang.RuntimeException |                  | Exception class to be thrown (must extend java.lang.RuntimeException). |
| **No FlowFile Skip Iterations**          | 1                          |                  | Number of times to skip onTrigger if no FlowFile.            |
| **No FlowFile Exception Iterations**     | 0                          |                  | Number of times to throw NPE exception if no FlowFile.       |
| **No FlowFile Yield Iterations**         | 0                          |                  | Number of times to yield if no FlowFile.                     |
| **No FlowFile Exception Class**          | java.lang.RuntimeException |                  | Exception class to be thrown if no FlowFile (must extend java.lang.RuntimeException). |
| **Write Iterations**                     | 0                          |                  | Number of times to write to the FlowFile                     |
| **Content Size**                         | 1 KB                       |                  | The number of bytes to write each time that the FlowFile is written to |
| **@OnScheduled Pause Time**              | 0 sec                      |                  | Specifies how long the processor should sleep in the @OnScheduled method, so that the processor can be forced to take a long time to start up |
| **Fail When @OnScheduled called**        | false                      | truefalse        | Specifies whether or not the Processor should throw an Exception when the methods annotated with @OnScheduled are called |
| **@OnUnscheduled Pause Time**            | 0 sec                      |                  | Specifies how long the processor should sleep in the @OnUnscheduled method, so that the processor can be forced to take a long time to respond when user clicks stop |
| **Fail When @OnUnscheduled called**      | false                      | truefalse        | Specifies whether or not the Processor should throw an Exception when the methods annotated with @OnUnscheduled are called |
| **@OnStopped Pause Time**                | 0 sec                      |                  | Specifies how long the processor should sleep in the @OnStopped method, so that the processor can be forced to take a long time to shutdown **Supports Expression Language: true (will be evaluated using variable registry only)** |
| **Fail When @OnStopped called**          | false                      | truefalse        | Specifies whether or not the Processor should throw an Exception when the methods annotated with @OnStopped are called |
| **OnTrigger Pause Time**                 | 0 sec                      |                  | Specifies how long the processor should sleep in the onTrigger() method, so that the processor can be forced to take a long time to perform its task |
| **CustomValidate Pause Time**            | 0 sec                      |                  | Specifies how long the processor should sleep in the customValidate() method |
| **Ignore Interrupts When Paused**        | false                      | truefalse        | If the Processor's thread(s) are sleeping (due to one of the "Pause Time" properties above), and the thread is interrupted, this indicates whether the Processor should ignore the interrupt and continue sleeping or if it should allow itself to be interrupted. |

### Relationships:

| Name    | Description                       |
| ------- | --------------------------------- |
| success | FlowFiles processed successfully. |
| failure | FlowFiles that failed to process. |

### Reads Attributes:

None specified.

### Writes Attributes:

None specified.

### State management:

This component does not store state.

### Restricted:

This component is not restricted.

### System Resource Considerations:

None specified.