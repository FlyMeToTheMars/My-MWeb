

## 整体流程

### Abstract:

本文章将展示如何将一个包含多条数据的文本文件保存到数据库中，每条数据对应数据库中的一条记录

![](https://upload-images.jianshu.io/upload_images/12325689-6d899b27cae41933.png?imageMogr2/auto-orient/strip%7CimageView2/2/w/1240)


下面将依次详细说明每个核心processor的配置以及完成的功能

## GetFile

读取文本文件中的内容，这个文件是[http://files.grouplens.org/datasets/movielens/ml-10m-README.html](http://files.grouplens.org/datasets/movielens/ml-10m-README.html)中movies.dat ,大体内容长着个样子O(∩_∩)O 
![](https://upload-images.jianshu.io/upload_images/12325689-6e6107ed6af9a057.png?imageMogr2/auto-orient/strip%7CimageView2/2/w/1240)

每一行为一条记录，包含三个部分，并用双分号分割

## ExecuteScript

一个执行特定脚本文件的处理器，脚本内容在Script body中指定，同时可以指定脚本的语言。我选用的是groovy编写的脚本，跟java非常类似，并且支持java的语法 
![](https://upload-images.jianshu.io/upload_images/12325689-7e913c2e200862fc.png?imageMogr2/auto-orient/strip%7CimageView2/2/w/1240)


因为输入文件的格式不符合CSV json等格式，因此我们需要对其进行格式转换，将每一行的内容通过”::”分割，然后采用”;”进行拼接（或者直接将”::”替换为”;”），也就是转换为csv格式。同时对可以自定义csv表头

```
import org.apache.commons.io.IOUtils
import org.apache.nifi.processor.io.StreamCallback
import java.nio.charset.*

def flowFile = session.get()
if (!flowFile) return
flowFile = session.write(flowFile, { inputStream, outputStream ->
    def stringBuilder = new StringBuilder()
//    添加csv表头
    stringBuilder.append("id;director;type\n")
    def tellTaleHeart = IOUtils.toString(inputStream, StandardCharsets.UTF_8)
    def words = tellTaleHeart.split("::|\\n")
    def length=words.length
    def count=0
    for(int i=0;i<length;i++){
        String word= words[i]
        if(word!=null&&word.length()>0){
            stringBuilder.append(word)
            count=count+1
            if(count!=0&&count%3==0)
                stringBuilder.append("\n")
            else
                stringBuilder.append(";")
        }
    }
outputStream.write(stringBuilder.toString().getBytes(StandardCharsets.UTF_8))
} as StreamCallback)
flowFile = session.putAttribute(flowFile, 'filename', 'movies')
session.transfer(flowFile, REL_SUCCESS)
```

## AddSchemaNameAttribute

对处理的flowfile添加一个属性 
  ![](https://upload-images.jianshu.io/upload_images/12325689-6d165f3652df2732.png?imageMogr2/auto-orient/strip%7CimageView2/2/w/1240)

直接点击右上角的＋号，添加schema.name这个属性，并把value设置为movies

## ConvertRecord

将处理后的用”;”分割的数据转化为json格式 
![](https://upload-images.jianshu.io/upload_images/12325689-1fe23b5dd10ce130.png?imageMogr2/auto-orient/strip%7CimageView2/2/w/1240)



### Record Reader

CSVReader（根据所要读入数据的格式进行设定） 
点击右侧的箭头，对CSVReader的属性进行设定 
 ![](https://upload-images.jianshu.io/upload_images/12325689-8a57266a7f8ebc27.png?imageMogr2/auto-orient/strip%7CimageView2/2/w/1240)

主要涉及到一下两个属性： 

####  Schema Access Strategy

在之前的一个处理器中我们给flowfile添加了schema属性，因此选择Use Schema Name Property 

####  Schema Registry

选择 AvroSchemaRegistry，并点击右侧的箭头进行配置： 

##### AvroSchemaRegistry

 ![](https://upload-images.jianshu.io/upload_images/12325689-813981ff45840b93.png?imageMogr2/auto-orient/strip%7CimageView2/2/w/1240)


这里property跟之前添加的schema.name相同，对于value需要根据输入数据的属性进行设置 
例如: 我们之前的输入数据，每一行包含三个部分，我们分别命名为id,director,filmType

```
{
    "type":"record",
    "name":"MovieRecord",
    "fields":[
        {"name":"id","type":"long"},
        {"name":"director","type":["null","string"]},
        {"name":"filmType","type":["null","string"]}
    ]
}
```

Value Separator:这里选择的是”;” 



### Record Writer

JsonRecordSetWriter(根据处理后的数据格式设定) 
![](https://upload-images.jianshu.io/upload_images/12325689-1909f9ca65c4409c.png?imageMogr2/auto-orient/strip%7CimageView2/2/w/1240)

   设置方法跟CSVReader类似 



## SplitJson

将json进行拆分。现在得到的是一个大的Json记录，现在需要将每一条记录单独封装为一个flowfile，并insert到数据库中 

![](https://upload-images.jianshu.io/upload_images/12325689-ed6b0a8bc3d11478.png?imageMogr2/auto-orient/strip%7CimageView2/2/w/1240)


JsonPath Expression: 这个需要根据当前flowfile内容中的格式进行设定 
我们当前输入数据的格式如下，因此我们的JsonPath Expression为$.*

```
[
{"id":115,"director":"Happiness Is in the Field (Bonheur est dans le pr茅, Le) (1995)","filmType":"Comedy"},
{"id":116,"director":"Anne Frank Remembered (1995)","filmType":"Documentary"},
{"id":117,"director":"Young Poisoner's Handbook, The (1995)","filmType":"Crime|Drama"},
{"id":118,"director":"If Lucy Fell (1996)","filmType":"Comedy|Romance"},
{"id":119,"director":"Steal Big, Steal Little (1995)","filmType":"Comedy"},{"id":120,"director":"Race the Sun (1996)","filmType":"Drama"},{"id":121,"director":"Boys of St. Vincent, The (1992)","filmType":"Drama"},
....
]
```

## ConvertJsonToSQL

![](https://upload-images.jianshu.io/upload_images/12325689-a4b005855a61975c.png?imageMogr2/auto-orient/strip%7CimageView2/2/w/1240)

这部分之前涉及过，可以参考上一篇博客

*   PutSQL：执行生成的sql语句，也就是执行sql语句将数据插入到数据库中