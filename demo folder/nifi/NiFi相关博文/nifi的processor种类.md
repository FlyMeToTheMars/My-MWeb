## 数据吸收类

|                              |                                                              |      |
| ---------------------------- | ------------------------------------------------------------ | ---- |
| **GetFile**                  | 用流的方式读取本地路径的文件并删除原文件。                   |      |
| **GetFTP**                   | 用FTP的方式读取FTP服务器的文件并删除FTP文件。                |      |
| **GetSFTP**                  | 用SFTP的方式读取SFTP服务器的文件并删除SFTP文件。             |      |
| **GetJMSQueue**              | 从JMS队列中获取一条消息并建立一个Flowfile。                  |      |
| **GetJMSTopic**              | 从JMS主题中获取一条消息并建立一个Flowfile。                  |      |
| **GetHTTP**                  | 从HTTP服务器或者HTTPS服务器上下载内容。                      |      |
| **ListenHTTP**               | 启动一个HTTP的服务，接收POST的请求。POST的body会被制作为Flowfile传到后面的Processor，同时返回200。 |      |
| **ListenUDP**                | 启动一个UDP的服务，对每一个包或者一捆包制作Flowfile传到后面的Processor。 |      |
| **GetHDFS**                  | 监视一个HDFS的目录，每当有文件生成时，复制到nifi并删除HDFS文件。 |      |
| **ListHDFS** / **FetchHDFS** | 监视一个HDFS的目录，每当有文件生成时，获取文件名称，配合把文件名称分布式的传给FetchHDFS，可以达到并行处理的目的。 |      |
| **FetchS3Object**            | 获取S3                                                       |      |
| **GetKafka**                 | 从kafka获取数据，可以一条一条形成Flowfile，也可以一批形成Flowfile。 |      |
| **GetMongo**                 | 执行mongo的查询语句并写成Flowfile                            |      |
| **GetTwitter**               |                                                              |      |
|                              |                                                              |      |

## 数据出口／发送类

|              |                                                              |      |
| ------------ | ------------------------------------------------------------ | ---- |
| **PutEmail** | 把Flowfile的内容作为附件发送email                            |      |
| **PutFile**  | 把Flowfile的内容写到本地文件                                 |      |
| **PutFTP**   | 把Flowfile的内容写到FTP服务器                                |      |
| **PutSFTP**  | 把Flowfile的内容写到SFTP服务器                               |      |
| **PutJMS**   | 把Flowfile的内容作为一条消息写到JMS的broker                  |      |
| **PutSQL**   | 把Flowfile的内容作为sql语句执行。必须是update，insert，或者delete |      |
| **PutKafka** | 把Flowfile的内容写到kafka。可以把内容作为一个消息写，也可以指定分隔符去分割内容，然后作为多条消息写。 |      |
| **PutMongo** | 把Flowfile的内容写到mongo。必须是update，insert。            |      |
|              |                                                              |      |

## 数据转换类

|                         |                            |      |
| ----------------------- | -------------------------- | ---- |
| **CompressContent**     | 压缩或解压内容             |      |
| **ConvertCharacterSet** | 变换字符集                 |      |
| **EncryptContent**      | 编码和解码                 |      |
| **ReplaceText**         | 正则表达式修改文本         |      |
| **TransformXml**        | XML之间的转换（通过XSLT）  |      |
| **JoltTransformJSON**   | json之间的转换（通过JOLT） |      |
|                         |                            |      |

## 路由／调解类

|                      |                                                       |      |
| -------------------- | ----------------------------------------------------- | ---- |
| **ControlRate**      | 压制数据流动的速度                                    |      |
| **DetectDuplicate**  | 侦测重复的Flowfiles                                   |      |
| **DistributeLoad**   | 分散负载                                              |      |
| **MonitorActivity**  | 当长时间（用户可定义）没有数据流入的时候，进行通知    |      |
| **RouteOnAttribute** | 根据Flowfiles里面的属性不同进行路由                   |      |
| **ScanAttribute**    | 扫描Flowfiles里面用户定义的属性                       |      |
| **RouteOnContent**   | 根据Flowfiles里面的内容不同进行路由（支持正则表达式） |      |
| **ScanContent**      | 扫描Flowfiles里面的内容                               |      |
| **ValidateXml**      | 检查内容是否符合规定的xml schema，然后可以进行路由    |      |
|                      |                                                       |      |

## 访问数据类

|                      |                                                              |            |
| -------------------- | ------------------------------------------------------------ | ---------- |
| **ConvertJSONToSQL** | 把json转换为insert或者update语句                             | 后接PutSQL |
| **ExecuteSQL**       | 执行用户定义的select语句，把结果写成avro格式的Flowfile       |            |
| **PutSQL**           | 执行传入的FlowFile的内容（SQL DDM）                          |            |
| **SelectHiveQL**     | 在Hive中执行用户定义的select语句，把结果写成avro格式或者csv的Flowfile |            |
| **PutHiveQL**        | 在hive中执行传入的FlowFile的内容（SQL DDM）                  |            |
|                      |                                                              |            |
|                      |                                                              |            |

## 属性抽取类

|                      |                                                    |      |
| -------------------- | -------------------------------------------------- | ---- |
| **EvaluateJsonPath** | 用户定义jsonpath表达式，来抽取或者替换json中的数据 |      |
| **EvaluateXPath**    | 用户定义xpath表达式，来抽取或者替换xml中的数据     |      |
| **EvaluateXQuery**   | 用户定义xquery表达式，来抽取或者替换xml中的数据    |      |
| **ExtractText**      | 用户定义正则表达式，来抽取或者替换文本中的数据     |      |
| **HashAttribute**    | 针对用户定义的属性列表，把属性值拼接起来做Hash     |      |
| **HashContent**      | 针对Flowfile的内容进行Hash，并把Hash值作为属性     |      |
| **IdentifyMimeType** | 对Flowfile进行MIME的判断                           |      |
| **UpdateAttribute**  | 增加或者更新Flowfile的用户自定义属性               |      |
|                      |                                                    |      |

## 系统交互类

|                          |                                                              |      |
| ------------------------ | ------------------------------------------------------------ | ---- |
| **ExecuteProcess**       | 执行用户自定的系统命令，系统命令的stdout作为下一个Processor的输入，不能接受上一个Processor传入Flowfile。 |      |
| **ExecuteStreamCommand** | 执行用户自定的系统命令，可以接受上一个Processor传入的Flowfile作为系统命令的stdin。 |      |
|                          |                                                              |      |

## 切和聚

|                    |                                                              |      |
| ------------------ | ------------------------------------------------------------ | ---- |
| **SplitText**      | 把一个文本的Flowfile切为多个文本的Flowfile                   |      |
| **SplitJson**      | 把一个json的Flowfile切为多个json的Flowfile                   |      |
| **SplitXml**       | 把一个xml的Flowfile切为多个xml的Flowfile                     |      |
| **UnpackContent**  | 对一个zip或者tar文件进行解包，包里面的文件每一个都会成为一个Flowfile |      |
| **MergeContent**   | 把多个Flowfile合并到一个Flowfile                             |      |
| **SegmentContent** | 根据字节大小来分割一个Flowfile到多个Flowfile                 |      |
| **SplitContent**   | 根据字节序列来分割一个Flowfile到多个Flowfile                 |      |
|                    |                                                              |      |

## HTTP

|                                                |                                                              |      |
| ---------------------------------------------- | ------------------------------------------------------------ | ---- |
| **GetHTTP**                                    | 从HTTP服务器或者HTTPS服务器上下载内容。                      |      |
| **ListenHTTP**                                 | 启动一个HTTP的服务，接收POST的请求。POST的body会被制作为Flowfile传到后面的Processor，同时返回200。 |      |
| **InvokeHTTP**                                 | 很像GETHTTP和POSTHTTP，不过需要更多配置。它无法成为一个源头的Processor，因为它必须由上一个Processor传给它Flowfile才能触发。 |      |
| **PostHTTP**                                   | 向HTTP服务器POST数据                                         |      |
| **HandleHttpRequest** / **HandleHttpResponse** | 类似于ListenHTTP，不过不会同时返回200。而是等待后续的Flow全部完毕后才返回给客户端。 |      |

## AWS

|                   |                                    |      |
| ----------------- | ---------------------------------- | ---- |
| **FetchS3Object** | S3                                 |      |
| **PutS3Object**   | S3                                 |      |
| **PutSNS**        | Amazon Simple Notification Service |      |
| **GetSQS**        | Amazon Simple Queuing Service      |      |
| **PutSQS**        | Amazon Simple Queuing Service      |      |
| **DeleteSQS**     | Amazon Simple Queuing Service      |      |

