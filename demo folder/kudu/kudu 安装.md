# kudu 安装
[TOC]

## 1. 安装kudu主程序

### 1.1 安装kudu

1. 上传依赖 ` cloudera-kudu.repo`  文件保存到 `/etc/yum.repos.d/`  
2. 在主机执行命令`sudo yum install kudu` 以及`sudo yum install kudu-master`
3. 在从机执行命令`sudo yum install kudu` 以及`sudo yum install kudu-tserver` 



### 1.2  配置kudu

> 注：配置后如有启动问题，可查看日志`/var/log/kudu/kudu-master.FATAL`

#### 1.2.1 集群域名

```
192.168.33.2 win
192.168.33.101 node1
192.168.33.102 node2
192.168.33.103 node3
192.168.33.104 node4
```

#### 1.2.2 配置marster


> 主要配置信息主要在一下路径：
> > /etc/kudu/conf.dist/master.gflagfile 
> > /etc/default/kudu-master
> > /etc/kudu/conf.dist/tserver.gflagfile 
> > /etc/default/kudu-tserver
> >
> > 
> >
##### 1.2.2.1 配置`master.gflagfile`(不需要调整)
```
# Do not modify these two lines. If you wish to change these variables,
# modify them in /etc/default/kudu-master.
--fromenv=rpc_bind_addresses
--fromenv=log_dir

--fs_wal_dir=/var/lib/kudu/master
--fs_data_dirs=/var/lib/kudu/master
```
##### 1.2.2.2配置文件`kudu-master` : 

```
export FLAGS_log_dir=/var/log/kudu
export FLAGS_rpc_bind_addresses=node1:7051
```

#### 1.2.3 配置tserver

##### 1.2.3.1 配置`tserver.gflagfile`

```
#/etc/kudu/conf.dist/tserver.gflagfile 
# Do not modify these two lines. If you wish to change these variables,
# modify them in /etc/default/kudu-tserver.
--fromenv=rpc_bind_addresses
--fromenv=log_dir

--fs_wal_dir=/var/lib/kudu/tserver
--fs_data_dirs=/var/lib/kudu/tserver
--tserver_master_addrs=node1:7051
```
##### 1.2.3.2 配置`kudu-tserver` : 

```
export FLAGS_log_dir=/var/log/kudu
export FLAGS_rpc_bind_addresses=node2:7050
```




## 2 启动服务

### 2.1 启动Marster

 `sudo service kudu-master start` 

> 注：配置后如有启动问题，可查看日志`/var/log/kudu/kudu-master.FATAL`
>
> 如果启动失败， 需要先设置好时间 `date -s '2018/08/13 00:36:00'`,
>
> 再执行`/etc/init.d/ntpd restart`, 然后再次启动。

### 2.2 启动Tablet Server

`sudo service kudu-tserver start`

>同启动master注意事项： 
>
>1. hosts配置好集群域名+地址
>
>2. 设置好时间及NTP服务
>
>3. 结合启动失败日志
>
>4. 如果出现以下异常，可参考链接解决方式：
>
>   ```
>   Bad status: Not found: Unable to initialize catalog manager: Failed to initialize sys tables async: Could not load tablet metadata from /var/lib/kudu/master/tablet-meta/00000000000000000000000000000000: /var/lib/kudu/master/tablet-meta/00000000000000000000000000000000: No such file or directory (error 2)
>   ```
>    [master fails to start if unable to find metadata files]( https://issues.apache.org/jira/browse/KUDU-1186)

## 3 验证安装情况

打开以下地址，可以进入对应节点查看webUI：

http://node-1:8051/

http://node-2:8050/

http://node-3:8050/

http://node-4:8050/

并且

http://node-1:8051/tablet-servers

该页面可以看到多个tservers

![1534094477017](C:\Users\Jerry Run\Documents\kudu\1534094477017.png)