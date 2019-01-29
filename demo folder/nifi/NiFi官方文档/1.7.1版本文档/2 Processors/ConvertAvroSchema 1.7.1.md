## Description:

Convert records from one Avro schema to another, including support for flattening and simple type conversions

[Additional Details...](https://nifi.apache.org/docs/nifi-docs/components/org.apache.nifi/nifi-kite-nar/1.7.1/org.apache.nifi.processors.kite.ConvertAvroSchema/additionalDetails.html)

### Tags:

avro, convert, kite

### Properties:

In the list below, the names of required properties appear in **bold**. Any other properties (not in bold) are considered optional. The table also indicates any default values, and whether a property supports the [NiFi Expression Language](https://nifi.apache.org/docs/nifi-docs/html/expression-language-guide.html).

| Name              | Default Value | Allowable Values          | Description                                                  |
| ----------------- | ------------- | ------------------------- | ------------------------------------------------------------ |
| **Input Schema**  |               |                           | Avro Schema of Input Flowfiles. This can be a URI (dataset, view, or resource) or literal JSON schema. **Supports Expression Language: true (will be evaluated using flow file attributes and variable registry)** |
| **Output Schema** |               |                           | Avro Schema of Output Flowfiles. This can be a URI (dataset, view, or resource) or literal JSON schema. **Supports Expression Language: true (will be evaluated using flow file attributes and variable registry)** |
| Locale            | default       |                           | Locale to use for scanning data (see https://docs.oracle.com/javase/7/docs/api/java/util/Locale.html)or " default" for JVM default |
| Compression type  | SNAPPY        | BZIP2DEFLATENONESNAPPYLZO | Compression type to use when writting Avro files. Default is Snappy. |

### Dynamic Properties:

Dynamic Properties allow the user to specify both the name and value of a property.

| Name                         | Value                        | Description                                                  |
| ---------------------------- | ---------------------------- | ------------------------------------------------------------ |
| Field name from input schema | Field name for output schema | Explicit mappings from input schema to output schema, which supports renaming fields and stepping into nested records on the input schema using notation like parent.id **Supports Expression Language: false** |



### Relationships:

| Name    | Description                              |
| ------- | ---------------------------------------- |
| success | Avro content that converted successfully |
| failure | Avro content that failed to convert      |

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



## [Additional Details...](https://nifi.apache.org/docs/nifi-docs/components/org.apache.nifi/nifi-kite-nar/1.7.1/org.apache.nifi.processors.kite.ConvertAvroSchema/additionalDetails.html)

### Description:

This processor is used to convert data between two Avro formats, such as those coming from the `ConvertCSVToAvro` or`ConvertJSONToAvro` processors. The input and output content of the flow files should be Avro data files. The processor includes support for the following basic type conversions:

- Anything to String, using the data's default String representation
- String types to numeric types int, long, double, and float
- Conversion to and from optional Avro types

In addition, fields can be renamed or unpacked from a record type by using the dynamic properties.



### Mapping Example:

Throughout this example, we will refer to input data with the following schema:

```
{
    "type": "record",
    "name": "CustomerInput",
    "namespace": "org.apache.example",
    "fields": [
        {
            "name": "id",
            "type": "string"
        },
        {
            "name": "companyName",
            "type": ["null", "string"],
            "default": null
        },
        {
            "name": "revenue",
            "type": ["null", "string"],
            "default": null
        },
        {
            "name" : "parent",
            "type" : [ "null", {
              "type" : "record",
              "name" : "parent",
              "fields" : [ {
                "name" : "name",
                "type" : ["null", "string"],
                "default" : null
              }, {
                "name" : "id",
                "type" : "string"
              } ]
            } ],
            "default" : null
        }
    ]
}
             
```

Where even though the revenue and id fields are mapped as string, they are logically long and double respectively. By default, fields with matching names will be mapped automatically, so the following output schema could be converted without using dynamic properties:

```
{
    "type": "record",
    "name": "SimpleCustomerOutput",
    "namespace": "org.apache.example",
    "fields": [
        {
            "name": "id",
            "type": "long"
        },
        {
            "name": "companyName",
            "type": ["null", "string"],
            "default": null
        },
        {
            "name": "revenue",
            "type": ["null", "double"],
            "default": null
        }
    ]
}
             
```

To rename companyName to name and to extract the parent's id field, both a schema and a dynamic properties must be provided. For example, to convert to the following schema:

```
{
    "type": "record",
    "name": "SimpleCustomerOutput",
    "namespace": "org.apache.example",
    "fields": [
        {
            "name": "id",
            "type": "long"
        },
        {
            "name": "name",
            "type": ["null", "string"],
            "default": null
        },
        {
            "name": "revenue",
            "type": ["null", "double"],
            "default": null
        },
        {
            "name": "parentId",
            "type": ["null", "long"],
            "default": null
        }
    ]
}
             
```

The following dynamic properties would be used:

```
"companyName" -> "name"
"parent.id" -> "parentId"
             
```