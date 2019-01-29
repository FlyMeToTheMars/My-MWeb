# 如何卸载CDH(附一键卸载github源码)

> 温馨提示：要看高清无码套图，请使用手机打开并单击图片放大查看。



## 1.前置条件

本文档将介绍Cloudera Manager与CDH的卸载，并基于CDH使用parcels安装且未配置安全（AD/LDAP, Kerberos, Data Encryption）的集群，以下是本次测试环境，但不是本操作手册的硬限制：

1.操作系统版本：CENTOS6.5

2.MySQL数据库版本为5.1.73

3.CM版本：CM 5.11

4.CDH版本：CDH 5.11

5.采用root或有sudo权限用户对集群进行卸载



## 2.用户数据备份

### 2.1备份HDFS数据

- hdfs数据备份

使用distcp进行集群之间数据复制进行hdfs数据备份，备份操作如下：

```shell
hadoop distcp hftp://namenodeA:port/xxx/  hdfs://namenodeB/xxx
```

> 注：此命令需运行在目标集群中执行，确保目标集群空间足够，以上数据目录根据自己集群的真实环境做相应的修改；

namenodeA：源集群namenode节点ip地址

port：源集群端口，默认50070

namenodeB：目标集群namenode节点ip地址

xxx：对应hdfs的数据目录

- namenode节点元数据备份

登录namenode服务器上，进行如下操作：

```shell
#进入safemode模式
[root@ip-172-31-3-217 ~]# sudo -u hdfs hadoop dfsadmin  -safemode enter
DEPRECATED: Use of this script to execute hdfs command is  deprecated.
Instead use the hdfs command for it.
Safe mode is ON

#将所有edits修改flush到fsimage
[root@ip-172-31-3-217 ~]# sudo -u hdfs hadoop dfsadmin –saveNamespace
DEPRECATED: Use of this script to execute hdfs command is  deprecated.
Instead use the hdfs command for it.

Save namespace successful
```

将namenode元数据备份，根据自己集群namenode目录进行如下操作：

```shell
[root@ip-172-31-3-217 ~]# mkdir namenode_back

[root@ip-172-31-3-217 ~]# cd namenode_back/

[root@ip-172-31-3-217 ~]# cd /dfs/nn/

#将nn目录下所有文件压缩至/root/namenode_back/nn_back.tar.gz目录下

[root@ip-172-31-3-217 nn]# tar -czvf  /root/namenode_back/nn_back.tar.gz . ././current/./current/fsimage./current/fstime./current/VERSION./current/edits./image/./image/fsimage
```



### 2.2备份MySQL元数据

- 在Mysql安装的服务器上，执行如下操作，备份hive元数据信息

```shell
[root@ip-172-31-3-217 ~]# mkdir mysql_back
[root@ip-172-31-3-217 ~]# cd mysql_back
#-u后面是mysql用户名，-p单引号中是用户对应的密码，metastore为库名，metastore.sql为备份输出文件
[root@ip-172-31-3-217 mysql_back]# mysqldump -uroot  -p'mysql' metastore > metastore.sql
[root@ip-172-31-3-217 mysql_back]# mysqldump -uroot  -p'mysql' cm > cm.sql
[root@ip-172-31-3-217 mysql_back]# mysqldump -uroot  -p'mysql' am > am.sql
[root@ip-172-31-3-217 mysql_back]# mysqldump -uroot  -p'mysql' rm > rm.sql
#执行完成后，产生如下sql文件
[root@ip-172-31-3-217 mysql_back]# ll
total 36452
-rw-r--r-- 1 root root   2074077 May 30 02:39 am.sql
-rw-r--r-- 1 root root 35182945 May 30 02:39 cm.sql
-rw-r--r-- 1 root root     54030 May 30 02:36 metastore.sql
-rw-r--r-- 1 root root      7542 May 30 02:39 rm.sql
```

注：如果有hue，sentry，Navigator数据库可以同样备份



### 2.3备份CDH集群配置数据

通过Cloudera Manager提供的API接口，导出一份JSON文档，该文档包含Cloudera 管理器实例的配置数据，可以通过这份JSON文档备份或恢复Cloudera管理器的部署。

- 备份集群配置数据
- 登录到Cloudera Manager所在服务器
- 运行如下命令：

```shell
[root@ip-172-31-3-217 ~]# curl -u  admin_username:admin_pass  "http://cm_server_host:7180/api/v16/cm/deployment" > path_to_file/cm-deployment.json
```

admin_username: 登录到ClouderaManager的用户名

admin_pass: 对应admin_username用户的密码

cm_server_host: 是ClouderaManager服务器的主机名

path_to_file: 保存配置文件的路径

将上述提到的四个参数修改当前集群对应的信息即可

导出截图：

![img](https://mmbiz.qpic.cn/mmbiz_png/THumz4762QCvqO26FKtbs4oLibswUtVapjb3NlVzNIUwxxb4bHE2Rd9QJu9hLkAXaFk7nEDgzX3mkbdcdCWsWMg/640?wx_fmt=png&tp=webp&wxfrom=5&wx_lazy=1)

![img](https://mmbiz.qpic.cn/mmbiz_png/THumz4762QCvqO26FKtbs4oLibswUtVapZjftlcLBsiaU5Z57TXIBE3XEF6lw3lDaYRO78o8h6G1oicyATyoJA5Pg/640?wx_fmt=png&tp=webp&wxfrom=5&wx_lazy=1)

- 恢复集群配置数据

> 注意：此功能只有Cloudera许可证才可以使用
>

1.首先进入Cloudera Manager管理平台，进入如下操作

![img](https://mmbiz.qpic.cn/mmbiz_png/THumz4762QCvqO26FKtbs4oLibswUtVapcjZicSibqBYWnzICElhGztqRXbcYuO8yia5OfT3UKib1XIZOR84zyricQiag/640?wx_fmt=png&tp=webp&wxfrom=5&wx_lazy=1)

![img](https://mmbiz.qpic.cn/mmbiz_png/THumz4762QCvqO26FKtbs4oLibswUtVapFSgYptSb1FsIMgKXgPyvSq9AUdicNaPoqibpibpFXw1RjbUCbibyzHCcbA/640?wx_fmt=png&tp=webp&wxfrom=5&wx_lazy=1)

> 注意：如果在进行API调用操作之前未停止集群，那么API调用将在运行作业之前停止所有集群服务，任何运行的作业和数据都会丢失。

2.登录到Cloudera Manager所在的服务器

3.执行如下命令

```shell
curl --upload-file path_to_file/cm-deployment.json -u  admin_uname:admin_pass http://cm_server_host:7180/api/v16/cm/deployment?deleteCurrentDeployment=true
```

admin_uname: 登录到ClouderaManager的用户名

admin_pass: 对应admin_uname用户的密码

cm_server_host: 是ClouderaManager服务器的主机名

path_to_file：JSON配置文件的路径



### 2.4Zookeeper数据目录备份

- 备份所有Zookeeper服务器的数据目录，以172.31.3.217为例操作如下：

```shell
[root@ip-172-31-3-217 ~]# mkdir zookeeper_back
[root@ip-172-31-3-217 ~]# scp -r /var/lib/zookeeper/  /root/zookeeper_back/zookeeper_1
```



### 2.5备份用户数据目录

以下路径为Cloudera默认安装目录下个组件用户数据：

```shell
/var/lib/flume-ng
/var/lib/hadoop*
/var/lib/hue
/var/lib/navigator
/var/lib/oozie
/var/lib/solr
/var/lib/sqoop*
/var/lib/zookeeper   #同步数据
#data_driver_path为集群环境部署时设置的目录，根据自己环境进行调整
data_drive_path/dfs
data_drive_path/mapred
data_drive_path/yarn
```



如需备份相关组件数据，可参考2.4进行数据备份。



## 3.停止所有服务

### 3.1打开Cloudera Manager控制台

![](https://mmbiz.qpic.cn/mmbiz_png/THumz4762QCvqO26FKtbs4oLibswUtVapCDW0y3prZfomiboicxQD3WxS9DibKaa2QiaMibdqerzFN6lk0XyaPe3OUUA/640?wx_fmt=png&tp=webp&wxfrom=5&wx_lazy=1)



### 3.2关闭集群

停止CDH集群，如下图所示操作

![](https://mmbiz.qpic.cn/mmbiz_png/THumz4762QCvqO26FKtbs4oLibswUtVapOl5flozYgHRK5YrRJ8I9IA4PYvpR36puCOEdpuL4L1IJtdK66D57hg/640?wx_fmt=png&tp=webp&wxfrom=5&wx_lazy=1)

点击确认操作，如下图所示

![img](https://mmbiz.qpic.cn/mmbiz_png/THumz4762QCvqO26FKtbs4oLibswUtVap9n0pTDLmO0KBdSCaIs1lpGfFonXH1tqtG13R7FXia0Ck4phC4eym7Hg/640?wx_fmt=png&tp=webp&wxfrom=5&wx_lazy=1)

等待所有服务器停止操作成功，如下图所示

![img](https://mmbiz.qpic.cn/mmbiz_png/THumz4762QCvqO26FKtbs4oLibswUtVapibbLiaNiaUyqAnZmFesiaNSwAzNlPdibFPafp8ia9ia2kuzhZeK2Z8d1dzVIQ/640?wx_fmt=png&tp=webp&wxfrom=5&wx_lazy=1)



### 3.3关闭Cloudera Management Service

停止Cloudera Manager Service，如下图所示

![img](https://mmbiz.qpic.cn/mmbiz_png/THumz4762QCvqO26FKtbs4oLibswUtVaper1mkEGCICrJLTgFslQoUycuUzNLadffGYlHia3VO4IWyTDpknqVicww/640?wx_fmt=png&tp=webp&wxfrom=5&wx_lazy=1)

点击确认对话框，如下图所示

![img](https://mmbiz.qpic.cn/mmbiz_png/THumz4762QCvqO26FKtbs4oLibswUtVap7GdcJXXEYNndGbaAwzGaGdpAicOsM3bNnIf3EuicrySVRxI7VZvn6tRA/640?wx_fmt=png&tp=webp&wxfrom=5&wx_lazy=1)

等待服务停止成功，如下图所示

![img](https://mmbiz.qpic.cn/mmbiz_png/THumz4762QCvqO26FKtbs4oLibswUtVap2co6aib8ntU92MUrsiaiaZnSyCS6NZjjBEbnOIflWyvqOKj0tb4P33Vnw/640?wx_fmt=png&tp=webp&wxfrom=5&wx_lazy=1)



## 4.解除并移除Parcels

在Cloudera Manager管理界面，进行如下操作

![img](https://mmbiz.qpic.cn/mmbiz_png/THumz4762QCvqO26FKtbs4oLibswUtVapeDqvkFR7ghqiaOuWtgJbq5jlv0mJ8TQSAjCMmorhQ4tJuQmdbL0osnw/640?wx_fmt=png&tp=webp&wxfrom=5&wx_lazy=1)

点击上图标识功能，进入如下界面

![img](https://mmbiz.qpic.cn/mmbiz_png/THumz4762QCvqO26FKtbs4oLibswUtVapbpllrDaTgibbr3gxbdfrWHDIDGVPnVibt7tseibyicLpNI4rSIcRTph0uw/640?wx_fmt=png&tp=webp&wxfrom=5&wx_lazy=1)

点击上图标识，选择【仅限停用状态】，点击【确定】

![img](https://mmbiz.qpic.cn/mmbiz_png/THumz4762QCvqO26FKtbs4oLibswUtVapmibDdTKhCBQXj1w47uaZxRCOUiaCI5zf6o2akVWl72M8PkRHeNcMFicxQ/640?wx_fmt=png&tp=webp&wxfrom=5&wx_lazy=1)

停用后，状态变为“激活”，如下图所示

![img](https://mmbiz.qpic.cn/mmbiz_png/THumz4762QCvqO26FKtbs4oLibswUtVapFqJkXF5d9gtF8QicX76jtziaMmgnEBFuicx44p6AGt7WLkKcaf56arbtw/640?wx_fmt=png&tp=webp&wxfrom=5&wx_lazy=1)

点击“激活”旁菜单，选择“从主机删除”，如下图所示

![img](https://mmbiz.qpic.cn/mmbiz_png/THumz4762QCvqO26FKtbs4oLibswUtVapwf97zVZSlR9ngqdJzHXDEhcJtZwms43icgCT3mG4BCgJjOV76HTpAzg/640?wx_fmt=png&tp=webp&wxfrom=5&wx_lazy=1)



## 5.删除集群

点击Clouder Manager进入主页，如下图所示



![img](https://mmbiz.qpic.cn/mmbiz_png/THumz4762QCvqO26FKtbs4oLibswUtVapeS4OibmWXVnHqMtnESic6JuT8yN8bG3L2peVoJUWvJC0BuE2rDeiauPIg/640?wx_fmt=png&tp=webp&wxfrom=5&wx_lazy=1)

删除集群，如下操作



![img](https://mmbiz.qpic.cn/mmbiz_png/THumz4762QCvqO26FKtbs4oLibswUtVapDGz9Kga6JqlhXP3qvcC4F455G55gxoTaHbaVZTB24eQmgz7Lty0b2g/640?wx_fmt=png&tp=webp&wxfrom=5&wx_lazy=1)

点击“删除”操作，如下图所示

![img](https://mmbiz.qpic.cn/mmbiz_png/THumz4762QCvqO26FKtbs4oLibswUtVapnzLJ8riaGCnmPGVkLfibKufz0yddibib6T3iaJLDoPibOEr7UIsE0uh8fEkg/640?wx_fmt=png&tp=webp&wxfrom=5&wx_lazy=1)

删除成功后显示如下

![img](https://mmbiz.qpic.cn/mmbiz_png/THumz4762QCvqO26FKtbs4oLibswUtVapH0iarSvOWAyS6qwbl4ErS5FIOESCLasFnVVCgOcXOv0TJYBPL2mx6qw/640?wx_fmt=png&tp=webp&wxfrom=5&wx_lazy=1)



## 6.卸载Cloudera Manager Server

### 6.1停止Cloudera Manager Server和数据库

在集群master服务器上执行如下命令

```SHELL

[root@ip-172-31-3-217 ~]# service cloudera-scm-server  stop

#如果使用内置db  postgresql需要停止该服务，没有则忽略

[root@ip-172-31-3-217 ~]# service cloudera-scm-server-db  stop
```





### 6.2卸载Cloudera Manager Server和数据库

使用yum卸载cloudera-scm-server和cloudera-scm-server-db-2，命令如下

```SHELL

[root@ip-172-31-3-217 ~]# yum remove  cloudera-manager-server

#如果使用内置db  postgresql需要移除该服务，没有则忽略

[root@ip-172-31-3-217 ~]# yum remove  cloudera-manager-server-db-2
```





## 7.卸载Cloudera Manager Agent和Managed Software

在集群所有的机器上进行如下操作，卸载Cloudera Manager Agent 和Managed Software。

### 7.1停止Cloudera Manager Agent

在所有服务器上使用如下命令停止Cloudera Manager Agent 服务

`[root@ip-172-31-3-217 ~]# sudo service cloudera-scm-agent  hard_stop`

### 7.2卸载软件

在集群所有节点执行如下操作：

```shell
[root@ip-172-31-3-217 ~]# yum remove 'cloudera-manager-*'  avro-tools crunch flume-ng hadoop-hdfs-fuse hadoop-hdfs-nfs3 hadoop-httpfs  hadoop-kms hbase-solr hive-hbase hive-webhcat hue-beeswax hue-hbase  hue-impala hue-pig hue-plugins hue-rdbms hue-search hue-spark hue-sqoop  hue-zookeeper impala impala-shell kite llama mahout oozie pig pig-udf-datafu  search sentry solr-mapreduce spark-core spark-master spark-worker  spark-history-server spark-python sqoop sqoop2 whirr hue-common oozie-client  solr solr-doc sqoop2-client zookeeper
```



### 7.3运行清除命令

在集群所有节点执行如下操作：

[root@ip-172-31-3-217 ~]# yum clean all



## 8.移除Cloudera Manager和用户数据

### 8.1杀死 Cloudera Manager和Managed进程

在集群所有节点执行如下操作，将所有服务器的Cloudera Manager和Managed进程杀死，命令如下：

```shell
for u in cloudera-scm flume hadoop hdfs hbase hive httpfs  hue impala llama mapred oozie solr spark sqoop sqoop2 yarn zookeeper;

do

    sudo kill $(ps  -u $u -o pid=);

done
```



### 8.2移除Cloudera Manager数据

在集群所有节点执行如下命令，删除所有Cloudera Manager数据

```shell
umount cm_processes

rm –rf /usr/share/cmf  /var/lib/cloudera* /var/cache/yum/x86_64/6/cloudera*  /var/log/cloudera* /var/run/cloudera* /etc/cloudera* /usr/lib64/cmf
```



### 8.3移除Cloudera Manager Lock File

在集群中所有节点执行如下命令，删除Cloudera Manager Lock File

```shell
rm –rf /tmp/.scm_prepare_node.lock
```



### 8.4移除用户数据

此步骤将永久删除所有用户数据。为了备份数据，在启动卸载过程之前，使用distcp命令将其复制到另一个集群中。在集群中所有节点执行如下命令，删除用户所有数据：

```shell
#用户数据目录

rm -rf /var/lib/flume-ng /var/lib/hadoop* /var/lib/hue  /var/lib/navigator /var/lib/oozie /var/lib/solr /var/lib/sqoop*  /var/lib/zookeeper

 

rm -rf /usr/lib/hadoop /usr/lib/hadoop* /usr/lib/hive  /usr/lib/hbase /usr/lib/oozie /usr/lib/sqoop* /usr/lib/zookeeper  /usr/lib/bigtop* /usr/lib/flume-ng /usr/lib/hcatalog

 

rm -rf /var/run/hadoop* /var/run/flume-ng  /var/run/cloudera* /var/run/oozie /var/run/sqoop2 /var/run/zookeeper  /var/run/hbase /var/run/hbase /var/run/impala /var/run/hive  /var/run/hdfs-sockets

 

#服务命令

rm -rf /usr/bin/hadoop* /usr/bin/zookeeper*  /usr/bin/hbase* /usr/bin/hive* /usr/bin/hdfs /usr/bin/mapred /usr/bin/yarn  /usr/bin/sqoop* /usr/bin/oozie

#集群配置文件目录

rm -rf /etc/cloudera* /etc/hadoop* /etc/zookeeper*  /etc/hive* /etc/hue /etc/impala /etc/sqoop* /etc/oozie /etc/hbase*  /etc/hcatalog

#集群配置文件目录

rm -rf /etc/alternatives/avro-tools  /etc/alternatives/beeline /etc/alternatives/catalogd /etc/alternatives/cli_*  /etc/alternatives/flume* /etc/alternatives/hadoop* /etc/alternatives/hbase*  /etc/alternatives/hcat /etc/alternatives/hdfs /etc/alternatives/hive*  /etc/alternatives/hue* /etc/alternatives/impala* /etc/alternatives/llama*  /etc/alternatives/load_gen /etc/alternatives/mahout* /etc/alternatives/mapred  /etc/alternatives/oozie* /etc/alternatives/pig* /etc/alternatives/pyspark  /etc/alternatives/sentry* /etc/alternatives/solr* /etc/alternatives/spark*  /etc/alternatives/sqoop* /etc/alternatives/statestored  /etc/alternatives/whirr /etc/alternatives/yarn /etc/alternatives/zookeeper*

#

rm -rf /var/lib/alternatives/avro-tools  /var/lib/alternatives/beeline /var/lib/alternatives/catalogd  /var/lib/alternatives/cli_* /var/lib/alternatives/flume*  /var/lib/alternatives/hadoop* /var/lib/alternatives/hbase*  /var/lib/alternatives/hcat /var/lib/alternatives/hdfs  /var/lib/alternatives/hive* /var/lib/alternatives/hue* /var/lib/alternatives/impala*  /var/lib/alternatives/llama* /var/lib/alternatives/load_gen  /var/lib/alternatives/mahout* /var/lib/alternatives/mapred  /var/lib/alternatives/oozie* /var/lib/alternatives/pig*  /var/lib/alternatives/pyspark /var/lib/alternatives/sentry*  /var/lib/alternatives/solr* /var/lib/alternatives/spark*  /var/lib/alternatives/sqoop* /var/lib/alternatives/statestored  /var/lib/alternatives/whirr /var/lib/alternatives/yarn  /var/lib/alternatives/zookeeper*

 

#请修改 data_drive_path 为自己机器上的路径

rm -rf data_drive_path/dfs data_drive_path/mapred  data_drive_path/yarn

#删除Hadoop相关服务安装目录、服务软件包数据，数据格式为parcels、服务软件包缓存数据

rm -rf /opt/cloudera/
```



### 8.5停止并移除外部数据库

在安装mysql的服务器上进行操作。

- 停止mysql数据库，操作如下：

`service mysqld stop `

- 卸载mysql数据库，操作如下

`yum remove mysql*`

- 删除mysql数据目录，操作如下

`rm –rf /var/lib/mysql`



## 9.一键卸载脚本说明(GitHub地址)

- 卸载脚本说明：

![img](https://mmbiz.qpic.cn/mmbiz_png/THumz4762QCvqO26FKtbs4oLibswUtVap6xDKtZ3smYSOOTicDu5UemChzSe6mGHtt91fpYB6aiaiaeVtNrDOeAibxw/640?wx_fmt=png&tp=webp&wxfrom=5&wx_lazy=1)

autouninstall.sh：自动卸载脚本

components.list：集群所有安装的组件列表

delete.list：需要删除的目录列表，列表中已配置大部分CDH安装默认目录，用户需要对列表末尾的hdfs目录根据自己集群环境进行目录进行相应调整，如下图所示：

![img](https://mmbiz.qpic.cn/mmbiz_png/THumz4762QCvqO26FKtbs4oLibswUtVapb34yClUVc8xtgmMWhZtrA7FvgQzeRyjHSicMEF77rN6FlKsNpnV7CLQ/640?wx_fmt=png&tp=webp&wxfrom=5&wx_lazy=1)

node.list：集群所有节点，根据集群环境进行节点配置

user.list：集群所有组件安装时所使用的用户名

- 脚本使用

```shell
[root@ip-172-31-3-217 shell]# ./autouninstall.sh
params is can not be null.
nodelist 1: 集群所有节点hostname文件
componentlist 2: 卸载执行指令
userlist 3: 集群中组件用户名
deletelist 4: 删除的目录列表
username 5: 登录集群用户名
longinType 6: 登录类型：key密钥文件,password密码登录,free免密认证
password 7: 登录集群的认证文件或者密码,如果为密钥文件则确保文件权限为600
[root@ip-172-31-3-217 shell]# ./autouninstall.sh  node.list components.list user.list delete.list  root key key.pem
```



> 注：脚本是在第五步操作完成后，在namenode节点进行一键卸载

运行截图

![img](https://mmbiz.qpic.cn/mmbiz_png/THumz4762QCvqO26FKtbs4oLibswUtVapvqUs1wL0lU6cRJUWbxInXpJjibaELslBRCKMEUAhC92v7ZbH2REcSjw/640?wx_fmt=png&tp=webp&wxfrom=5&wx_lazy=1)

![img](https://mmbiz.qpic.cn/mmbiz_png/THumz4762QCvqO26FKtbs4oLibswUtVapBFrm796aMx07FicNictt000TkfJhDKOznGnJGk8ttAO9ULZHxBGiaPIYg/640?wx_fmt=png&tp=webp&wxfrom=5&wx_lazy=1)

源码地址：

https://github.com/javaxsky/cdh-shell





## 附件

### README.md

```
# cdh-autouninstall
前置条件：
1.脚本基于CDH5.x版本的一键自动卸载程序，基于如下环境
2.CDH安装方式为parcels模式
3.CDH版本为5.x版本
4.脚本需要在Cloudera Manager服务器上运行
5.脚本仅支持RHEL System

脚本输入参数说明：
username：登录集群的用户名
longinType：登录类型：key密钥文件,password密码登录,free免密认证
password：登录集群的认证文件或者密码,如果为密钥文件则确保文件权限为600


目录文件说明（以下文件不能重命名，否则会导致不脚本不能正常使用）：
autouninstall.sh 卸载脚本
components.list  集群中包含的所有组件
node.list  集群所有节点的hostname，必须为hostname
user.list  集群中所有启动服务的用户

```



### autouninstall.sh

```shell
#!/bin/bash
#---------------------------------------------------
#脚本基于CDH5.x版本的一键自动卸载程序，基于如下环境
#	CDH安装方式为parcels模式
#	CDH版本为5.x版本
# 脚本需要在Cloudera Manager服务器上运行
# 脚本仅支持RHEL System
#Author peach
#Date	2017-05-17
#update 2017-08-23 简化输入参数
#---------------------------------------------------

#判断输入参数是否完整
if [ $# -lt 3 ]; then
	echo "params is can not be null."
	echo "username 1: 登录集群用户名"
	echo "longinType 2: 登录类型：key密钥文件,password密码登录,free免密认证"
	echo "password 3: 登录集群的认证文件或者密码,如果为密钥文件则确保文件权限为600"
	exit 1;
fi

CURRENTPWD=`pwd`
#集群所有节点文件
nodelist=$CURRENTPWD/node.list
##所有组件列表
componentlist=$CURRENTPWD/components.list
#集群各组件用户列表
userlist=$CURRENTPWD/user.list
#需要删除的目录列表
deletelist=$CURRENTPWD/delete.list
#登录用户名
username=$1
#集群登录方式key、password和 free
longinType=$2
#登录秘钥,key文件or密码
#秘钥文件权限为600 ，修改文件权限chmod 600 xxx.pem
password=$3
#获取当前服务器hostname
currentHost=`hostname`


#判断是否安装expect，参考http://stackoverflow.com/questions/592620/check-if-a-program-exists-from-a-bash-script/677212#677212
if [ $longinType = "password" ]; then
  type expect > /dev/null 2>&1 || {
    echo "expect: command not found";
    echo "Please use command install: yum -y install expect";
    exit 1;
  }
fi

#参考 http://www.cnblogs.com/iloveyoucc/archive/2012/05/11/2496433.html
#自定义函数执行远程服务器命令
#需要注意的是，第一个EOF必须以重定向字符<<开始，第二个EOF必须顶格写，否则会报错。
function remote() {
  /usr/bin/expect <<EOF
    set timeout 10
    spawn ssh -t $1@$2 "$3"
    expect {
      "yes/no)?" {
        send "yes\r";exp_continue
      }
      "assword:" {
        send "$4\r";exp_continue
      }
    }
EOF
}

#停止Cloudera Server
echo "Stop Cloudera Scm Server................................."
sudo service cloudera-scm-server stop
sudo service cloudera-scm-server-db stop

#卸载Cloudera Manager Server和its数据库
echo "Uninstall Clouder Manager Server"
sudo yum remove cloudera-scm-server
sudo yum remove cloudera-scm-server-db

#一、停止集群所有节点的cloudera-scm-agent服务
scmAgentCmd="echo '[step 1] Stop cloudera-scm-agent service.....................';"
function stopClouderaScmAgernt() {
  sudo service cloudera-scm-agent hard_stop_confirmed
  scmAgentCmd=${scmAgentCmd}"sudo service cloudera-scm-agent hard_stop_confirmed;"
}


#二、卸载所有组件命令
componentsCmd="echo '[step 2] uninstall all components .........................';"
function executeRemoveComponents() {
  for component in `cat $componentlist`; do
    #在本机执行
    sudo yum -y remove $component
    componentsCmd=${componentsCmd}"sudo yum -y remove $component;"
  done
}

#三、clean yum
cleanYumCmd="echo '[step 3] clean yum...........................................';"
function cleanYum() {
  sudo yum clean all
  cleanYumCmd=${cleanYumCmd}"sudo yum clean all;"
}

#四、杀死所有组件用户进程脚本
killProcessCmd="echo '[step 4] kill all user process............................';"
function killUserProcess() {
  while read u
  do
    i=`cat /etc/passwd |cut -f1 -d':'|grep -w "$u" -c`;
    if [ $i -gt 0 ];then
      sudo kill -9 $(ps -u $u -o pid=);
      killProcessCmd=${killProcessCmd}"sudo kill -9 \$(ps -u $u -o pid=);"
    fi
  done < "$userlist"
}

#五、卸载cm_process
umountCmd="echo '[step 5] uninstall cm_process..................................';"
function umountCmProcesses() {
  sudo umount cm_processes;
  umountCmd=${umountCmd}"sudo umount cm_processes;"
}

#六、删除cm相关的信息，配置信息、依赖包、日志、yum缓存及运行、各组件依赖包等
deleteCmd="echo '[step 6] delete config、dependency、log and other information....';"
function deleteCmInfo() {
  while read line
  do
		content=`echo $line | awk '$0 !~ /#/ {printf($0)}'`
		if [ -n "$content" ]; then
			sudo rm -rf $line
	    deleteCmd=${deleteCmd}"sudo rm -rf $line;"
		fi
  done < $deletelist
}

#进行需要在所有节点执行的操作
for node in `cat $nodelist`; do
	echo "$node uninstall start..................................................."
	if [ $node = $currentHost ]; then
    stopClouderaScmAgernt
    executeRemoveComponents
    cleanYum
    killUserProcess
    umountCmProcesses
    deleteCmInfo
	else
		# cmds=`awk '$0 !~ /#/ {printf("%s", $0c);c=";"}END{print""}' cmd.list`
    # cmds=`awk '$0 !~ /#/ {printf("%s", $0c)}END{print""}' cmd.list`
    cmds=${scmAgentCmd}${componentsCmd}${cleanYumCmd}${killProcessCmd}${umountCmd}${deleteCmd}
		#执行远程命令
		echo "远程执行卸载命令:$node"
    if [ $longinType = "key" ]; then
      ssh -t -i $password $username@$node "$cmds"
    elif [ $longinType = "password" ]; then
      remote $username $node "$cmds" $password
    else
      ssh -t $username@$node "$cmds"
    fi
	fi

	echo "$node uninstall end....................................................."

done

echo "uninstall done"

```

### components.list

```shell
cloudera-manager*
avro-tools
crunch
flume-ng
hadoop-hdfs-fuse
hadoop-hdfs-nfs3
hadoop-httpfs
hadoop-kms
hbase-solr
hive-hbase
hive-webhcat
hue-beeswax
hue-hbase
hue-impala
hue-pig
hue-plugins
hue-rdbms
hue-search
hue-spark
hue-sqoop
hue-zookeeper
impala
impala-shell
kite
llama
mahout
oozie
pig
pig-udf-datafu
search
sentry
solr-mapreduce
spark-core
spark-master
spark-worker
spark-history-server
spark-python
sqoop
sqoop2
whirr
hue-common
oozie-client
solr
solr-doc
sqoop2-client
zookeeper
###m y s q l

```



### delete.list

```shell
#Cloudera Manager安装、配置、数据、日志等目录
/usr/share/cmf
/usr/lib64/cmf
/var/lib/cloudera*
/var/cache/yum/x86_64/6/cloudera*
/var/log/cloudera*
/var/run/cloudera*
/etc/cloudera*
/tmp/.scm_prepare_node.lock

#用户数据目录
/var/lib/flume-ng
/var/lib/hadoop*
/var/lib/hue
/var/lib/navigator
/var/lib/oozie
/var/lib/solr
/var/lib/sqoop*
/var/lib/zookeeper
/var/lib/alternatives/avro-tools
/var/lib/alternatives/beeline
/var/lib/alternatives/catalogd
/var/lib/alternatives/cli_*
/var/lib/alternatives/flume*
/var/lib/alternatives/hadoop*
/var/lib/alternatives/hbase*
/var/lib/alternatives/hcat
/var/lib/alternatives/hdfs
/var/lib/alternatives/hive*
/var/lib/alternatives/hue*
/var/lib/alternatives/impala*
/var/lib/alternatives/llama*
/var/lib/alternatives/load_gen
/var/lib/alternatives/mahout*
/var/lib/alternatives/mapred
/var/lib/alternatives/oozie*
/var/lib/alternatives/pig*
/var/lib/alternatives/pyspark
/var/lib/alternatives/sentry*
/var/lib/alternatives/solr*
/var/lib/alternatives/spark*
/var/lib/alternatives/sqoop*
/var/lib/alternatives/statestored
/var/lib/alternatives/whirr
/var/lib/alternatives/yarn
/var/lib/alternatives/zookeeper*

#配置文件目录
/etc/flume-ng
/etc/hadoop*
/etc/hbase*
/etc/hive*
/etc/hue
/etc/pig
/etc/sentry
/etc/solr
/etc/spark
/etc/sqoop*
/etc/zookeeper*
/etc/alternatives/avro-tools
/etc/alternatives/beeline
/etc/alternatives/catalogd
/etc/alternatives/cli_*
/etc/alternatives/flume*
/etc/alternatives/hadoop*
/etc/alternatives/hbase*
/etc/alternatives/hcat
/etc/alternatives/hdfs
/etc/alternatives/hive*
/etc/alternatives/hue*
/etc/alternatives/impala*
/etc/alternatives/llama*
/etc/alternatives/load_gen
/etc/alternatives/mahout*
/etc/alternatives/mapred
/etc/alternatives/oozie*
/etc/alternatives/pig*
/etc/alternatives/pyspark
/etc/alternatives/sentry*
/etc/alternatives/solr*
/etc/alternatives/spark*
/etc/alternatives/sqoop*
/etc/alternatives/statestored
/etc/alternatives/whirr
/etc/alternatives/yarn
/etc/alternatives/zookeeper*

#Hadoop相关服务安装目录、服务软件包数据，数据格式为parcels、服务软件包缓存数据等
/opt/cloudera/

#日志目录
/var/log/hive
/var/log/hbase
/var/log/hadoop*
/var/log/zookeeper

#mysql数据目录
#/var/lib/mysql

#调整每个主机上的数据驱动器的路径，如果主机包含多个驱动路径，则配置多个每个目录占用一行，例如:
#/mnt/sdb1/dfs
#/mnt/sdb2/dfs
/dfs
/mapred
/yarn

```



### node.list

```shell
ip-172-31-3-217
ip-172-31-14-222
ip-172-31-3-114
ip-172-31-13-148

```



### user.list

```shell
cloudera-scm
flume
hadoop
hdfs
hbase
hive
httpfs
hue
impala
llama
mapred
oozie
solr
spark
sqoop
sqoop2
yarn
zookeeper

```

