

## 场景1: 把一个文件夹的文件传送到另一个文件夹

| 需要的Processor | 作用                                                      | RelationShip                        | 说明                                    |
| --------------- | --------------------------------------------------------- | ----------------------------------- | --------------------------------------- |
| GetFile         | 从输入文件夹读文件                                        | Success→UpdaeAttribute              |                                         |
| PutFile         | 写文件到输出文件夹                                        | Success→None， Failure→LogAttribute | 重名文件会导致failure                   |
| LogAttribute    | 记录错误发生时的日志，日志的形式是打印Flowfile的Attribute | Success→None                        |                                         |
| UpdateAttribute | 把文件名加个时间前缀                                      | Success→PutFile                     | ${now():format('hh_mm_ss')}_${filename} |



## 场景2: 把多个文件夹的文件分类传送到一个文件夹的不同目录



多个GetFile，每个GetFile后面跟一个UpdateAttribute，在UpdateAttribute里面定义一个属性叫做type，然后给type赋值。最后共同使用同一个PutFile，把PutFile的directory属性配置为/xx/${type}。

另外在UpdateAttribute里面的property里面的advanced里面，可以设置规则，即if filename符合什么正则，就设置type什么值。这样多个UpdateAttribute也可以只用一个UpdateAttribute了。

 