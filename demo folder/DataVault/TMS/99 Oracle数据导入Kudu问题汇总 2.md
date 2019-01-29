**1. ExecuteSQL查询结果中的数据类型问题**

执行ExecuteSQL时，默认得出的avro结果中的每个字段都是以 字符串形式存在的，如果直接写入其他数据库时会出现数据类型冲突，导致无法写入；

另外，当遇到Float类型时，Avro容易出错，此时需要对Float字段进行强制转化：

`CAST (tsk.LONGITUDE AS DECIMAL(10,2))` 

> 详见：
>
> [IllegalArgumentException: Invalid decimal scale: -127 (must be positive)](https://community.hortonworks.com/questions/144420/apache-nifi-executesql-processor-error-orgapacheav.html)
>
> [docs.oracle.com/javadb/CAST function](https://docs.oracle.com/javadb/10.8.3.0/ref/rrefsqlj33562.html)



> 注： TaskManagement表中两个Float类型的字段长度为126。。。



**2.putKudu成功却没有记录**

当以单挑记录写入时，注意`skip head line` 是否开启



**3.PutKudu大小写敏感问题**

在Select 子句的别名中，尽量用小写字母，避免在PutKudu处理器中出现匹配不到字段无法写入问题。



**4.Oracle中在Select子句中，指定别名的用法：**

- `select field as a` 显示结果抬头为`A`
- `select field as "a"`显示结果抬头为`a`

**5. Nifi 中，putkudu 处理器不能有效地支持null值的写入**

**6. 由于PutKudu无法写入null值，只能通过自己开发一个putkudu类似功能的proccessor或者改用其他方案，本处改用impala来写入数据库记录！**

>  [(NIFI-5064) Fixes and improvements to PutKudu processor: 1. Currently, PutKudu fails with NPE on null or missing values.](http://mail-archives.apache.org/mod_mbox/nifi-issues/201804.mbox/%3CJIRA.13151284.1523341876000.224228.1523341980662@Atlassian.JIRA%3E)



7.Oracle中clob类型数据查询出来会乱码；

8.调用Impala JDBC写入kudu时，汉字长的会被识别成CHAR，最终导致写入的字数不够，还会出现最后一个字符乱码的问题

