## Description:

Track a Rolling Window based on evaluating an Expression Language expression on each FlowFile and add that value to the processor's state. Each FlowFile will be emitted with the count of FlowFiles and total aggregate value of values processed in the current time window.

### Tags:

Attribute Expression Language, state, data science, rolling, window

### Properties:

In the list below, the names of required properties appear in **bold**. Any other properties (not in bold) are considered optional. The table also indicates any default values, and whether a property supports the [NiFi Expression Language](https://nifi.apache.org/docs/nifi-docs/html/expression-language-guide.html).

| Name               | Default Value | Allowable Values | Description                                                  |
| ------------------ | ------------- | ---------------- | ------------------------------------------------------------ |
| **Value to track** |               |                  | The expression on which to evaluate each FlowFile. The result of the expression will be added to the rolling window value. **Supports Expression Language: true (will be evaluated using flow file attributes and variable registry)** |
| **Time window**    |               |                  | The time window on which to calculate the rolling window.    |
| Sub-window length  |               |                  | When set, values will be batched into sub-windows of the set length. This allows for much larger length total windows to be set but sacrifices some precision. If this is not set (or is 0) then each value is stored in state with the timestamp of when it was received. After the length of time stated in Time window elaspes the value will be removed. If this is set, values will be batched together every X amount of time (where X is the time period set for this property) and removed all at once. |

### Relationships:

| Name           | Description                                                  |
| -------------- | ------------------------------------------------------------ |
| set state fail | When state fails to save when processing a FlowFile, the FlowFile is routed here. |
| success        | All FlowFiles are successfully processed are routed here     |
| failure        | When a FlowFile fails for a reason other than failing to set state it is routed here. |

### Reads Attributes:

None specified.

### Writes Attributes:

| Name                 | Description                                                  |
| -------------------- | ------------------------------------------------------------ |
| rolling_window_value | The rolling window value (sum of all the values stored).     |
| rolling_window_count | The count of the number of FlowFiles seen in the rolling window. |
| rolling_window_mean  | The mean of the FlowFiles seen in the rolling window.        |

### State management:

| Scope | Description                                                  |
| ----- | ------------------------------------------------------------ |
| LOCAL | Store the values backing the rolling window. This includes storing the individual values and their time-stamps or the batches of values and their counts. |

### Restricted:

This component is not restricted.

### Input requirement:

This component requires an incoming relationship.

### System Resource Considerations:

None specified.