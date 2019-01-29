# impala 环境准备： 



## 1. hadoop

## 2. mysql

2.1 安装包下载

2.2 删除旧依赖 

查看原有依赖`rpm -qa|grep mysql`；

删除已有依赖`rpm -e --nodeps  ***`；

执行rpm安装`rmp -ivh  ***.rmp`；

安装完成后提示： 

```

A RANDOM PASSWORD HAS BEEN SET FOR THE MySQL root USER !
You will find that password in '/root/.mysql_secret'.

You must change that password on your first connect,
no other statement but 'SET PASSWORD' will be accepted.
See the manual for the semantics of the 'password expired' flag.

Also, the account for the anonymous user has been removed.

In addition, you can run:

  /usr/bin/mysql_secure_installation

which will also give you the option of removing the test database.
This is strongly recommended for production servers.

See the manual for more instructions.

Please report any problems at http://bugs.mysql.com/

The latest information about MySQL is available on the web at

  http://www.mysql.com

Support MySQL by buying support/licenses at http://shop.mysql.com

New default config file was created as /usr/my.cnf and
will be used by default by the server when you start it.
You may edit this file to change server settings


[root@node2 ~]# cat /root/.mysql_secret
# The random password set for the root user at Mon Aug 13 03:05:36 2018 (local time): hL5c3HRQ336kX4ub

```



2.3 初始化

2.3.1 启动mysql服务

`service mysql start`

2.3.2 获取初始密码

`cat /root/.mysql_secret`

2.3.3 初始化设置

根据提示即可；

2.4 权限授予 

```mysql
grant all privileges on *.* to'root'@'%' identified by'root'; 
flush privileges;
```

> hive 乱码问题
>
> ```mysql
> 修改 hivemysql 元数据库的以下编码即可：
> -- 修改表字段和表 COMMENT
> ALTERTABLECOLUMNS_V2MODIFYCOLUMNCOMMENTVARCHAR(256)CHARACTERSETutf8; ALTER TABLE TABLE_PARAMS MODIFY COLUMN PARAM_VALUE VARCHAR(4000) CHARACTER SET utf8; 
> -- 修改分区字段 COMMENT 
> ALTER TABLE PARTITION_PARAMS MODIFY COLUMN PARAM_VALUE VARCHAR(4000) CHARACTER SETutf8; ALTER TABLE PARTITION_KEYS MODIFY COLUMN PKEY_COMMENT VARCHAR(4000) CHARACTER SETutf8;
> -- 修改索引 COMMENT 
> ALTER TABLE INDEX_PARAMS MODIFY COLUMN PARAM_VALUE VARCHAR(4000) CHARACTER SET utf8;
> 
> 
> rpm 离线包安装： 
> cp/usr/share/mysql/my-small.cnf/etc/my.cnf vim/etc/my.cnf 
> 在[client]下面增加 
> default-character-set=utf8 
> 在[mysqld]下面增加 
> default-character-set=utf8 init_connect='SETNAMESutf8'
> 
> 
> yum 在线方式： 
> vim/etc/my.cnf 
> 在[mysqld]下面增加 
> init_connect='SETcollation_connection=utf8_unicode_ci' 
> init_connect='SETNAMESutf8' 
> character-set-server=utf8 collation-server=utf8_unicode_ci skip-character-set-client-handshake
> 
> 重启 mysql 服务 servicemysqlrestart
> 查看编码 showvariableslike'char%'; 
> 临时设置编码 SETNAMESutf8;
> ```
>
> 





## 3. hive

3.1 解压hive

`tar -zxvf apache-hive-1.2.2-bin.tar.gz -C /usr/apps/`

3.2 配置hive

3.1.1 hive-site.xml

路径为`/usr/apps/apache-hive-1.2.2-bin/conf`



```
#hive-site.xml(覆盖hive-default.xml.template)
<configuration>
<property>
<name>javax.jdo.option.ConnectionURL</name>
<value>jdbc:mysql://node2:3306/hive?createDatabaseIfNotExist=true</value>
<description>JDBC connect string for a JDBC metastore</description>
</property>

<property>
<name>javax.jdo.option.ConnectionDriverName</name>
<value>com.mysql.jdbc.Driver</value>
<description>Driver class name for a JDBC metastore</description>
</property>

<property>
<name>javax.jdo.option.ConnectionUserName</name>
<value>root</value>
<description>username to use against metastore database</description>
</property>

<property>
<name>javax.jdo.option.ConnectionPassword</name>
<value>root</value>
<description>password to use against metastore database</description>
</property>
</configuration>

```



3.3 加入mysql驱动包

路径： `/usr/apps/apache-hive-1.2.2-bin/lib`



3.4 启动hive服务



3.5 beeline 客户端

!connect jdbc:hivee2://node2:10000

