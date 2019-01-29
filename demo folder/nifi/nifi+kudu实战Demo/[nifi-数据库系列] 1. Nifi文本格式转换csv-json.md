# Apache Nifi 文本格式转换 csv->json

**Abstract**：本文的主要目的是展示如何使用nifi 1.2 中的processor将csv格式的文件转换为json格式的文件。nifi中的convertRecord processor能够完成不同格式的文件之间的相互转换。 
**涉及到的处理器以及功能** 
- **GetFile**:从指定的路径中读取文件 
- **UpdateAttribute**：对flowfile的属性进行更新，添加更改或者删除flowfile的属性 
- **ConvertRecord**:通过指定Reader和Writer的类型，完成文件格式转换 
- **PutFile**：将FlowFile写入到指定路径

## 整体流程图

![整体流程图](https://upload-images.jianshu.io/upload_images/12325689-fec20d1128951f1c.png?imageMogr2/auto-orient/strip%7CimageView2/2/w/1240)

## 细节说明

### GetFile:读取文件。

#### property说明：

- Input Directory：输入文件的路径
- File Filter：对文件名进行过滤，将不符合的文件过滤掉
- Keep Source File：默认情况下，会将源文件删除 
  ![](https://upload-images.jianshu.io/upload_images/12325689-79f6778b25277c38.png?imageMogr2/auto-orient/strip%7CimageView2/2/w/1240)


### UpdateAttribute

#### property说明：

- schema.name:在flowfile中添加一个属性，并设定取值 
  ![](https://upload-images.jianshu.io/upload_images/12325689-0ecab9b4cbdaf172.png?imageMogr2/auto-orient/strip%7CimageView2/2/w/1240)


### ConvertRecord:转换文件格式

首先添加一个Record Reader和Record Writer，对于Record Reader，我们选择的是CSVReader，因为我们读取的文件是CSV格式，这个需要根据读取文件的格式选择。对于RecordWriter，我们选择的是JsonRecordSetWriter。 
![](https://upload-images.jianshu.io/upload_images/12325689-808a9592739724ae.png?imageMogr2/auto-orient/strip%7CimageView2/2/w/1240)

对于Record Reader而言，我们可以看到右侧有一个小箭头，点击箭头来对CSVReader进一步设置。 
![](https://upload-images.jianshu.io/upload_images/12325689-b24514be6a9030f7.png?imageMogr2/auto-orient/strip%7CimageView2/2/w/1240)

Schema Access Strategy：这里我们选择通过Schema Name来找到对应的schema 
Schema Registry：需要选择Scheme Registry的类型，这里选择的是AvroSchemaRegistry，右侧又出现一个小箭头，需要对AvroSchemaRegistry进行设置。 

![](https://upload-images.jianshu.io/upload_images/12325689-867283bd3cdb2328.png?imageMogr2/auto-orient/strip%7CimageView2/2/w/1240)

Record Write进行类似的设置即可。 
当对Record Reader和Record Writer设置完之后，如下图所示： 
![](https://upload-images.jianshu.io/upload_images/12325689-3068497d3418fd6a.png?imageMogr2/auto-orient/strip%7CimageView2/2/w/1240)

每一行的最右边有一个类似闪电的图标，点击该图标可以使对应的property生效