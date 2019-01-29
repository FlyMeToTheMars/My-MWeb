## Abstract

本文的主要目的是将一个JSON格式的文件写入到数据库中

## 整体流程

包含三个Processor：

GetFile：读取json格式的文件 
ConvertJSONToSQL：将json中的元素转化为sql中的insert语句 
PutSQL：执行上一个processor生成的sql语句，将json中的元素插入到数据库中 
![](https://upload-images.jianshu.io/upload_images/12325689-7057f833ec6c82bf.png?imageMogr2/auto-orient/strip%7CimageView2/2/w/1240)

## 详细配置

###  GetFile处理器

此处理器的配置已经在上一篇文章中进行了介绍，这里将省略此部分内容，输入的文件为包含一个json元素的文件: 
    ![](https://upload-images.jianshu.io/upload_images/12325689-8b43981957789478.png?imageMogr2/auto-orient/strip%7CimageView2/2/w/1240)

### ConvertJSONToSQL处理器

注意：该处理器有一个特性，只能处理flat json，所谓flat是指it consists of a single JSON element and each field maps to a simple type 
    ![](https://upload-images.jianshu.io/upload_images/12325689-388fc87daa9c84e9.png?imageMogr2/auto-orient/strip%7CimageView2/2/w/1240)


    其中的参数： 
    JDBC Connection Pool：根据要连接的数据库类型选择，我要连接的是mysql数据库，因此选择DBCPConnectionPool 
    Statement Type:设置要执行的操作，INSERT和UPDATE等，这里要执行的是插入操作 
    Translate Field Name: 如果json中元素的属性名称与数据表中的列名称一致，则选择false，否则选择true
    
    JDBC Connection Pool的属性后面有一个小箭头，点击箭头对此项进行设置： 
   ![](https://upload-images.jianshu.io/upload_images/12325689-e40fea1f9ab4c25c.png?imageMogr2/auto-orient/strip%7CimageView2/2/w/1240)


    实际上这个java连接数据的设置是一致的， 
    Database Driver Class Name: 根据要连接的数据库类型选择 
    Database Driver location:选择对应数据库连接jar包的完整路径 
    Database User：登录数据库的用户名 
    Password：用户名对应的密码

### PutSQL处理器

这里只设定了 JDBC Connection Pool 
    ![](https://upload-images.jianshu.io/upload_images/12325689-d6d2d74b3745e6d1.png?imageMogr2/auto-orient/strip%7CimageView2/2/w/1240)


对应数据库表的结构： 
![](https://upload-images.jianshu.io/upload_images/12325689-aa23b1c99481bed1.png?imageMogr2/auto-orient/strip%7CimageView2/2/w/1240)


至此已经完成了将一条json数据插入到数据库中 
![](https://upload-images.jianshu.io/upload_images/12325689-e6d103c23275ac9e.png?imageMogr2/auto-orient/strip%7CimageView2/2/w/1240)

目前只能插入单条的json记录，接下来将探索如何将包含多条记录的json文件写入到数据库中





问题： 

1. 小批量导入，任然出现内存溢出现象（json格式错误的情况下。todo: 小数据重现）
2. 出现数据重复或者语法错误无法插入现象
3. 