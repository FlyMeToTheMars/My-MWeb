# CM + CDH 离线部署

## 适用环境

适用但不仅限于： Ubuntu16 + Mysql5.7 +  CM5.15 + CDH 5.15.0

## 资源

cloudera-manager-xenial-cm5.15.0_amd64.tar.gz

CDH-5.15.0-1.cdh5.15.0.p0.21-xenial.parcel

CDH-5.15.0-1.cdh5.15.0.p0.21-xenial.parcel.sha1

manifest.json

mysql-jdbc-connecter-xxx.jar

### 准备工作

1. 集群域名配置
2. 集群免密登陆
3. JDK安装
4. Mysql安装

## ClouderaManager安装

todo..



## CDH安装

todo..



## 注意事项

场景4

NiFi中需要用到HDFS的core-site.xml , hdfs-site.xml 时，需要去哪里找？

路经查找方法： 

点击CZCluster（集群首页）--> 本地数据目录和文件 -->左边栏可选中HDFS --> 拉到最下面可以看到：部署目录（将要在其中部署客户端配置的目录）

`/etc/hadoop/conf.cloudera.hdfs`





### 问题3 

场景： Hue访问HDFS时，报错` you are a Hue admin but not a HDFS superuser, "hdfs" or part of HDFS supergroup, "supergroup".`

处理方法： 



> [Hue accessing HDFS permission issues](https://stackoverflow.com/questions/28961714/hue-accessing-hdfs-permission-issues)



### 问题2 

场景：

初始化CM需要的数据库环境时报错

解决方法

主从分库时，`/etc/mysql/mysql.conf.d/mysqld.cnf`中的 `gtid_mode=ON ，enforce_gtid_consistency=ON`属性会导致初始化失败！

可以将GTID开关先OFF，之后再进行数据库初始化；



### 问题1.  

场景： server跟agent1，2已启动， 但是agent3未启动

通过`cat /opt/cm-5.15.0/log/cloudera-scm-agent/cloudera-scm-agent.log`查看日志：

```
[23/Aug/2018 09:54:45 +0000] 12193 MainThread agent        ERROR    Failed to connect to previous supervisor.
Traceback (most recent call last):
  File "/opt/cm-5.15.0/lib/cmf/agent/build/env/lib/python2.7/site-packages/cmf-5.15.0-py2.7.egg/cmf/agent.py", line 2137, in find_or_start_supervisor
    self.get_supervisor_process_info()
  File "/opt/cm-5.15.0/lib/cmf/agent/build/env/lib/python2.7/site-packages/cmf-5.15.0-py2.7.egg/cmf/agent.py", line 2281, in get_supervisor_process_info
    self.identifier = self.supervisor_client.supervisor.getIdentification()
  File "/usr/lib/python2.7/xmlrpclib.py", line 1243, in __call__
    return self.__send(self.__name, args)
  File "/usr/lib/python2.7/xmlrpclib.py", line 1602, in __request
    verbose=self.__verbose
  File "/opt/cm-5.15.0/lib/cmf/agent/build/env/lib/python2.7/site-packages/supervisor-3.0-py2.7.egg/supervisor/xmlrpc.py", line 470, in request
    '' )
ProtocolError: <ProtocolError for 127.0.0.1/RPC2: 401 Unauthorized>
```

处理方式： 

```SHELL
# rm -rf /opt/cm-5.15.0/lib/cloudera-scm-agent
$> ps -ef | grep supervisord
$> kill -9 <processID>
sudo service  cloudera-scm-agent restartS
```











todo..





## 参考引用

todo..