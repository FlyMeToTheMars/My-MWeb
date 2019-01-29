## Description:

Consumes a Microsoft Excel document and converts each worksheet to csv. Each sheet from the incoming Excel document will generate a new Flowfile that will be output from this processor. Each output Flowfile's contents will be formatted as a csv file where the each row from the excel sheet is output as a newline in the csv file. This processor is currently only capable of processing .xlsx (XSSF 2007 OOXML file format) Excel documents and not older .xls (HSSF '97(-2007) file format) documents. This processor also expects well formatted CSV content and will not escape cell's containing invalid content such as newlines or additional commas.

[Additional Details...](https://nifi.apache.org/docs/nifi-docs/components/org.apache.nifi/nifi-poi-nar/1.7.1/org.apache.nifi.processors.poi.ConvertExcelToCSVProcessor/additionalDetails.html)

### Tags:

excel, csv, poi

### Properties:

In the list below, the names of required properties appear in **bold**. Any other properties (not in bold) are considered optional. The table also indicates any default values, and whether a property supports the [NiFi Expression Language](https://nifi.apache.org/docs/nifi-docs/html/expression-language-guide.html).

| Name                           | Default Value | Allowable Values                                             | Description                                                  |
| ------------------------------ | ------------- | ------------------------------------------------------------ | ------------------------------------------------------------ |
| Sheets to Extract              |               |                                                              | Comma separated list of Excel document sheet names that should be extracted from the excel document. If this property is left blank then all of the sheets will be extracted from the Excel document. The list of names is case in-sensitive. Any sheets not specified in this value will be ignored. **Supports Expression Language: true (will be evaluated using flow file attributes and variable registry)** |
| **Number of Rows to Skip**     | 0             |                                                              | The row number of the first row to start processing.Use this to skip over rows of data at the top of your worksheet that are not part of the dataset.Empty rows of data anywhere in the spreadsheet will always be skipped, no matter what this value is set to. **Supports Expression Language: true (will be evaluated using flow file attributes and variable registry)** |
| Columns To Skip                |               |                                                              | Comma delimited list of column numbers to skip. Use the columns number and not the letter designation. Use this to skip over columns anywhere in your worksheet that you don't want extracted as part of the record. **Supports Expression Language: true (will be evaluated using flow file attributes and variable registry)** |
| **Format Cell Values**         | false         | truefalse                                                    | Should the cell values be written to CSV using the formatting applied in Excel, or should they be printed as raw values. |
| **CSV Format**                 | custom        | Custom Format ![The format of the CSV is configured by using the properties of this Controller Service, such as Value Separator](https://nifi.apache.org/docs/nifi-docs/html/images/iconInfo.png)RFC 4180 ![CSV data follows the RFC 4180 Specification defined at https://tools.ietf.org/html/rfc4180](https://nifi.apache.org/docs/nifi-docs/html/images/iconInfo.png)Microsoft Excel ![CSV data follows the format used by Microsoft Excel](https://nifi.apache.org/docs/nifi-docs/html/images/iconInfo.png)Tab-Delimited ![CSV data is Tab-Delimited instead of Comma Delimited](https://nifi.apache.org/docs/nifi-docs/html/images/iconInfo.png)MySQL Format ![CSV data follows the format used by MySQL](https://nifi.apache.org/docs/nifi-docs/html/images/iconInfo.png)Informix Unload ![The format used by Informix when issuing the UNLOAD TO file_name command](https://nifi.apache.org/docs/nifi-docs/html/images/iconInfo.png)Informix Unload Escape Disabled ![The format used by Informix when issuing the UNLOAD TO file_name command with escaping disabled](https://nifi.apache.org/docs/nifi-docs/html/images/iconInfo.png) | Specifies which "format" the CSV data is in, or specifies if custom formatting should be used. |
| **Value Separator**            | ,             |                                                              | The character that is used to separate values/fields in a CSV Record |
| **Include Header Line**        | true          | truefalse                                                    | Specifies whether or not the CSV column names should be written out as the first line. |
| **Quote Character**            | "             |                                                              | The character that is used to quote values so that escape characters do not have to be used |
| **Escape Character**           | \             |                                                              | The character that is used to escape characters that would otherwise have a specific meaning to the CSV Parser. |
| Comment Marker                 |               |                                                              | The character that is used to denote the start of a comment. Any line that begins with this comment will be ignored. |
| Null String                    |               |                                                              | Specifies a String that, if present as a value in the CSV, should be considered a null field instead of using the literal value. |
| **Trim Fields**                | true          | truefalse                                                    | Whether or not white space should be removed from the beginning and end of fields |
| **Quote Mode**                 | NONE          | Quote All Values ![All values will be quoted using the configured quote character.](https://nifi.apache.org/docs/nifi-docs/html/images/iconInfo.png)Quote Minimal ![Values will be quoted only if they are contain special characters such as newline characters or field separators.](https://nifi.apache.org/docs/nifi-docs/html/images/iconInfo.png)Quote Non-Numeric Values ![Values will be quoted unless the value is a number.](https://nifi.apache.org/docs/nifi-docs/html/images/iconInfo.png)Do Not Quote Values ![Values will not be quoted. Instead, all special characters will be escaped using the configured escape character.](https://nifi.apache.org/docs/nifi-docs/html/images/iconInfo.png) | Specifies how fields should be quoted when they are written  |
| **Record Separator**           | \n            |                                                              | Specifies the characters to use in order to separate CSV Records |
| **Include Trailing Delimiter** | false         | truefalse                                                    | If true, a trailing delimiter will be added to each CSV Record that is written. If false, the trailing delimiter will be omitted. |

### Relationships:

| Name     | Description                                        |
| -------- | -------------------------------------------------- |
| success  | Excel data converted to csv                        |
| failure  | Failed to parse the Excel document                 |
| original | Original Excel document received by this processor |

### Reads Attributes:

None specified.

### Writes Attributes:

| Name                             | Description                                                  |
| -------------------------------- | ------------------------------------------------------------ |
| sheetname                        | The name of the Excel sheet that this particular row of data came from in the Excel document |
| numrows                          | The number of rows in this Excel Sheet                       |
| sourcefilename                   | The name of the Excel document file that this data originated from |
| convertexceltocsvprocessor.error | Error message that was encountered on a per Excel sheet basis. This attribute is only populated if an error was occured while processing the particular sheet. Having the error present at the sheet level will allow for the end user to better understand what syntax errors in their excel doc on a larger scale caused the error. |

### State management:

This component does not store state.

### Restricted:

This component is not restricted.

### System Resource Considerations:

None specified.