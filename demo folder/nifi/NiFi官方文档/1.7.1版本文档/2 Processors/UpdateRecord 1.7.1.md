## Description:

Updates the contents of a FlowFile that contains Record-oriented data (i.e., data that can be read via a RecordReader and written by a RecordWriter). This Processor requires that at least one user-defined Property be added. 



The name of the Property should indicate a RecordPath that determines the field that should be updated. The value of the Property is either a replacement value (optionally making use of the Expression Language) or is itself a RecordPath that extracts a value from the Record. Whether the Property value is determined to be a RecordPath or a literal value depends on the configuration of the <Replacement Value Strategy> Property.

[Additional Details...](https://nifi.apache.org/docs/nifi-docs/components/org.apache.nifi/nifi-standard-nar/1.7.1/org.apache.nifi.processors.standard.UpdateRecord/additionalDetails.html)

### Tags:

update, record, generic, schema, json, csv, avro, log, logs, freeform, text

### Properties:

In the list below, the names of required properties appear in **bold**. Any other properties (not in bold) are considered optional. The table also indicates any default values.

| Name                           | Default Value | Allowable Values                                             | Description                                                  |
| ------------------------------ | ------------- | ------------------------------------------------------------ | ------------------------------------------------------------ |
| **Record Reader**              |               | **Controller Service API:**  RecordReaderFactory **Implementations:** [JsonTreeReader](https://nifi.apache.org/docs/nifi-docs/components/org.apache.nifi/nifi-record-serialization-services-nar/1.7.1/org.apache.nifi.json.JsonTreeReader/index.html) [AvroReader](https://nifi.apache.org/docs/nifi-docs/components/org.apache.nifi/nifi-record-serialization-services-nar/1.7.1/org.apache.nifi.avro.AvroReader/index.html) [CSVReader](https://nifi.apache.org/docs/nifi-docs/components/org.apache.nifi/nifi-record-serialization-services-nar/1.7.1/org.apache.nifi.csv.CSVReader/index.html) [XMLReader](https://nifi.apache.org/docs/nifi-docs/components/org.apache.nifi/nifi-record-serialization-services-nar/1.7.1/org.apache.nifi.xml.XMLReader/index.html) [JsonPathReader](https://nifi.apache.org/docs/nifi-docs/components/org.apache.nifi/nifi-record-serialization-services-nar/1.7.1/org.apache.nifi.json.JsonPathReader/index.html) [ScriptedReader](https://nifi.apache.org/docs/nifi-docs/components/org.apache.nifi/nifi-scripting-nar/1.7.1/org.apache.nifi.record.script.ScriptedReader/index.html) [GrokReader](https://nifi.apache.org/docs/nifi-docs/components/org.apache.nifi/nifi-record-serialization-services-nar/1.7.1/org.apache.nifi.grok.GrokReader/index.html) | Specifies the Controller Service to use for reading incoming data |
| **Record Writer**              |               | **Controller Service API:**  RecordSetWriterFactory **Implementations:** [AvroRecordSetWriter](https://nifi.apache.org/docs/nifi-docs/components/org.apache.nifi/nifi-record-serialization-services-nar/1.7.1/org.apache.nifi.avro.AvroRecordSetWriter/index.html) [CSVRecordSetWriter](https://nifi.apache.org/docs/nifi-docs/components/org.apache.nifi/nifi-record-serialization-services-nar/1.7.1/org.apache.nifi.csv.CSVRecordSetWriter/index.html) [JsonRecordSetWriter](https://nifi.apache.org/docs/nifi-docs/components/org.apache.nifi/nifi-record-serialization-services-nar/1.7.1/org.apache.nifi.json.JsonRecordSetWriter/index.html) [ScriptedRecordSetWriter](https://nifi.apache.org/docs/nifi-docs/components/org.apache.nifi/nifi-scripting-nar/1.7.1/org.apache.nifi.record.script.ScriptedRecordSetWriter/index.html) [XMLRecordSetWriter](https://nifi.apache.org/docs/nifi-docs/components/org.apache.nifi/nifi-record-serialization-services-nar/1.7.1/org.apache.nifi.xml.XMLRecordSetWriter/index.html) [FreeFormTextRecordSetWriter](https://nifi.apache.org/docs/nifi-docs/components/org.apache.nifi/nifi-record-serialization-services-nar/1.7.1/org.apache.nifi.text.FreeFormTextRecordSetWriter/index.html) | Specifies the Controller Service to use for writing out the records |
| **Replacement Value Strategy** | literal-value | Literal Value ![The value entered for a Property (after Expression Language has been evaluated) is the desired value to update the Record Fields with. Expression Language may reference variables 'field.name', 'field.type', and 'field.value' to access information about the field and the value of the field being evaluated.](https://nifi.apache.org/docs/nifi-docs/html/images/iconInfo.png)Record Path Value ![The value entered for a Property (after Expression Language has been evaluated) is not the literal value to use but rather is a Record Path that should be evaluated against the Record, and the result of the RecordPath will be used to update the Record. Note that if this option is selected, and the Record Path results in multiple values for a given Record, the input FlowFile will be routed to the 'failure' Relationship.](https://nifi.apache.org/docs/nifi-docs/html/images/iconInfo.png) | Specifies how to interpret the configured replacement values |

### Relationships:

| Name    | Description                                                  |
| ------- | ------------------------------------------------------------ |
| success | FlowFiles that are successfully transformed will be routed to this relationship |
| failure | If a FlowFile cannot be transformed from the configured input format to the configured output format, the unchanged FlowFile will be routed to this relationship |

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

[ConvertRecord](https://nifi.apache.org/docs/nifi-docs/components/org.apache.nifi/nifi-standard-nar/1.7.1/org.apache.nifi.processors.standard.ConvertRecord/index.html)



## [Additional Details...](https://nifi.apache.org/docs/nifi-docs/components/org.apache.nifi/nifi-standard-nar/1.7.1/org.apache.nifi.processors.standard.UpdateRecord/additionalDetails.html)



UpdateRecord makes use of the NiFi [RecordPath Domain-Specific Language (DSL)](https://nifi.apache.org/docs/nifi-docs/html/record-path-guide.html) to allow the user to **indicate which field(s) in the Record should be updated.** Users do this **by** **adding** a User-defined **Property** to the Processor's configuration. 

The **name** of the **User-defined Property** must be the **RecordPath** text that should be evaluated against each Record. 

The **value** of the Property **specifies** what **value** should **go into** that selected Record **field**.



When specifying the replacement value (the value of the User-defined Property), the user is **able to** specify：

1.  a **literal value** such as the number `10`; 
2. an **Expression Language Expression** to reference FlowFile attributes, such as `${filename}`; 
3. or another **RecordPath** path **from** which to retrieve the desired **value from the Record itself**. 

Whether the value entered should be interpreted as **a literal or a RecordPath** path is **determined by** the value of the <Replacement Value Strategy> Property.

1. If a RecordPath is given and does **not match** any field in an input Record, that Property will be **skipped** and all other Properties will still be evaluated.
2. If the RecordPath **matches** exactly one field, that field will be **updated** with the corresponding value. 
3. If **multiple** fields **match** the RecordPath, then **all** fields that match will be **updated**. 
4. If the replacement value is itself a RecordPath that does **not match**, then a `null` value will be **set** for the field. 



For instances where this is not the desired behavior, RecordPath predicates can be used to filter the fields that match so that no fields will be selected. See [RecordPath Predicates](https://nifi.apache.org/docs/nifi-docs/html/record-path-guide.html#predicates) for more information.

Below, we lay out some examples in order to provide clarity about the Processor's behavior. For all of the examples below, consider the example to operate on the following set of 2 (JSON) records:

```
  [{
    "id": 17,
    "name": "John",
    "child": {
        "id": "1"
    },
    "siblingIds": [4, 8],
    "siblings": [
        { "name": "Jeremy", "id": 4 },
        { "name": "Julia", "id": 8 }
    ]
  },
  {
    "id": 98,
    "name": "Jane",
    "child": {
        "id": 2
    },
    "gender": "F",
    "siblingIds": [],
    "siblings": []
  }]
```



For brevity, we will omit the corresponding schema and configuration of the RecordReader and RecordWriter. Otherwise, consider the following set of Properties are configured for the Processor and their associated outputs.

### Example 1 - Replace with Literal

Here, we will replace the name of each Record with the name 'Jeremy' and set the gender to 'M':

| Property Name              | Property Value |
| -------------------------- | -------------- |
| Replacement Value Strategy | Literal Value  |
| /name                      | Jeremy         |
| /gender                    | M              |

This will yield the following output:

```json
  [{
    "id": 17,
    "name": "Jeremy",
    "child": {
        "id": "1"
    },
    "gender": "M",
    "siblingIds": [4, 8],
    "siblings": [
        { "name": "Jeremy", "id": 4 },
        { "name": "Julia", "id": 8 }
    ]
  },
  {
    "id": 98,
    "name": "Jeremy",
    "child": {
        "id": 2
    },
    "gender": "M",
    "siblingIds": [],
    "siblings": []
  }]
```



Note that even though the first record did not have a "gender" field in the input, one will be **added** after the "child" **field**, as that's where **the field is located in the schema**.

### Example 2 - Replace with RecordPath

This example will replace the value in one field of the Record with the value from another field. For this example, consider the following set of Properties:

| Property Name              | Property Value    |
| -------------------------- | ----------------- |
| Replacement Value Strategy | Record Path Value |
| /name                      | /siblings[0]/name |

This will yield the following output:

```json
  [{
    "id": 17,
    "name": "Jeremy",
    "child": {
        "id": "1"
    },
    "siblingIds": [4, 8],
    "siblings": [
        { "name": "Jeremy", "id": 4 },
        { "name": "Julia", "id": 8 }
    ]
  },
  {
    "id": 98,
    "name": null,
    "child": {
        "id": 2
    },
    "gender": "F",
    "siblingIds": [],
    "siblings": []
  }]
```



### Example 3 - Replace with Relative RecordPath

In the above example, we replaced the value of field based on another RecordPath. That RecordPath was an "absolute RecordPath," meaning that it starts with a "slash" character (`/`) and therefore it specifies the path from the "root" or "outer most" element. However, sometimes we want to reference a field in such a way that we defined the RecordPath relative to the field being updated. This example does just that. For each of the siblings given in the "siblings" array, we will replace the sibling's name with their id's. To do so, we will configure the processor with the following properties:

| Property Name              | Property Value    |
| -------------------------- | ----------------- |
| Replacement Value Strategy | Record Path Value |
| /siblings[*]/name          | ../id             |

Note that the RecordPath that was given for the value starts with `..`, which is a reference to the parent. We do this because the field that we are going to update is the "name" field of the sibling. To get to the associated "id" field, we need to go to the "name" field's parent and then to its "id" child field. The above example results in the following output:

```
  [{
    "id": 17,
    "name": "John",
    "child": {
        "id": "1"
    },
    "siblingIds": [4, 8],
    "siblings": [
        { "name": "4", "id": 4 },
        { "name": "8", "id": 8 }
    ]
  },
  {
    "id": 98,
    "name": "Jane",
    "child": {
        "id": 2
    },
    "gender": "F",
    "siblingIds": [],
    "siblings": []
  }]
```



### Example 4 - Replace Multiple Values

This example will replace the value of all fields that have the name "id", regardless of where in the Record hierarchy the field is found. The value that it uses references the Expression Language, so for this example, let's assume that the incoming FlowFile has an attribute named "replacement.id" that has a value of "91":

| Property Name              | Property Value    |
| -------------------------- | ----------------- |
| Replacement Value Strategy | Literal Value     |
| //id                       | ${replacement.id} |

This will yield the following output:

```
  [{
    "id": 91,
    "name": "John",
    "child": {
        "id": "91"
    },
    "siblingIds": [4, 8],
    "siblings": [
        { "name": "Jeremy", "id": 91 },
        { "name": "Julia", "id": 91 }
    ]
  },
  {
    "id": 91,
    "name": "Jane",
    "child": {
        "id": 91
    },
    "gender": "F",
    "siblingIds": [],
    "siblings": []
  }]
```



It is also worth noting that in this example, some of the "id" fields were of type STRING, while others were of type INT. This is okay because the RecordReaders and RecordWriters should handle these simple type coercions for us.

### Example 5 - Use Expression Language to Modify Value

This example will capitalize the value of all 'name' fields, regardless of where in the Record hierarchy the field is found. This is done by referencing the 'field.value' variable in the Expression Language. We can also access the field.name variable and the field.type variable.

| Property Name              | Property Value           |
| -------------------------- | ------------------------ |
| Replacement Value Strategy | Literal Value            |
| //name                     | ${field.value:toUpper()} |

This will yield the following output:

```
  [{
    "id": 17,
    "name": "JOHN",
    "child": {
        "id": "1"
    },
    "siblingIds": [4, 8],
    "siblings": [
        { "name": "JEREMY", "id": 4 },
        { "name": "JULIA", "id": 8 }
    ]
  },
  {
    "id": 98,
    "name": "JANE",
    "child": {
        "id": 2
    },
    "gender": "F",
    "siblingIds": [],
    "siblings": []
  }]
```