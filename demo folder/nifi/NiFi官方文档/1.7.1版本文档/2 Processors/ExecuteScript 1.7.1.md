## Description:

Experimental - Executes a script given the flow file and a process session. The script is responsible for handling the incoming flow file (transfer to SUCCESS or remove, e.g.) as well as any flow files created by the script. If the handling is incomplete or incorrect, the session will be rolled back. Experimental: Impact of sustained usage not yet verified.

### Tags:

script, execute, groovy, python, jython, jruby, ruby, javascript, js, lua, luaj, clojure

### Properties:

In the list below, the names of required properties appear in **bold**. Any other properties (not in bold) are considered optional. The table also indicates any default values, and whether a property supports the [NiFi Expression Language](https://nifi.apache.org/docs/nifi-docs/html/expression-language-guide.html).

| Name              | Default Value | Allowable Values                     | Description                                                  |
| ----------------- | ------------- | ------------------------------------ | ------------------------------------------------------------ |
| **Script Engine** | Clojure       | ClojureECMAScriptGroovyluapythonruby | The engine to execute scripts                                |
| Script File       |               |                                      | Path to script file to execute. Only one of Script File or Script Body may be used **Supports Expression Language: true (will be evaluated using variable registry only)** |
| Script Body       |               |                                      | Body of script to execute. Only one of Script File or Script Body may be used |
| Module Directory  |               |                                      | Comma-separated list of paths to files and/or directories which contain modules required by the script. **Supports Expression Language: true (will be evaluated using variable registry only)** |

### Dynamic Properties:

Dynamic Properties allow the user to specify both the name and value of a property.

| Name                               | Value                  | Description                                                  |
| ---------------------------------- | ---------------------- | ------------------------------------------------------------ |
| A script engine property to update | The value to set it to | Updates a script engine property specified by the Dynamic Property's key with the value specified by the Dynamic Property's value **Supports Expression Language: true (will be evaluated using flow file attributes and variable registry)** |



### Relationships:

| Name    | Description                                |
| ------- | ------------------------------------------ |
| success | FlowFiles that were successfully processed |
| failure | FlowFiles that failed to be processed      |

### Reads Attributes:

None specified.

### Writes Attributes:

None specified.

### State management:

| Scope          | Description                                                  |
| -------------- | ------------------------------------------------------------ |
| LOCAL, CLUSTER | Scripts can store and retrieve state using the State Management APIs. Consult the State Manager section of the Developer's Guide for more details. |

### Restricted:

| Required Permission | Explanation                                                  |
| ------------------- | ------------------------------------------------------------ |
| execute code        | Provides operator the ability to execute arbitrary code assuming all permissions that NiFi has. |

### System Resource Considerations:

None specified.

### See Also:

[InvokeScriptedProcessor](https://nifi.apache.org/docs/nifi-docs/components/org.apache.nifi/nifi-scripting-nar/1.7.1/org.apache.nifi.processors.script.InvokeScriptedProcessor/index.html)