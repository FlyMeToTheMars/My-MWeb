# PowerDesigner逆向生成数据模型--Oracle

## 1. 数据源准备

### 1.1 安装Oracle ODBC驱动 

关键包: 
instantclient-basic-nt-12.2.0.1.0.zip 
instantclient-odbc-nt-12.2.0.1.0-2.zip 
地址: http://www.oracle.com/technetwork/cn/topics/winsoft-095945-zhs.html

解压完成后，点击`odbc_install.exe`进行安装，并把解压目录添加到系统环境变量Path中。

> 详细操作可参考：[使用Powerdesigner 从oracle导出 PDM 添加系统数据源 找不到 '驱动'问题](https://blog.csdn.net/jv_csjh/article/details/79281460)



### 1.2 oracle odbc配置

Win7 64位 下安装oracle odbc 不能使用控制面板中 “管理工具”->“数据源（OBDC）”中安装数据源。

而要在“ 运行” 中输入  `C:\Windows\SysWOW64\odbcad32.exe`  安装数据源。

![img](http://up.2cto.com/2013/0520/20130520110650974.png)

选择添加 

![img](http://up.2cto.com/2013/0520/20130520110754604.png)

选择 [Oracle](https://www.2cto.com/database/Oracle/)  in OraClient11g_home1  点击“完成”

![img](http://up.2cto.com/2013/0520/20130520110803867.png)

填好数据，TNS Server Name 格式为“ip:port/[数据库](https://www.2cto.com/database/)名称” 点击“Test Connection”

![img](http://up.2cto.com/2013/0520/20130520110815491.png)

填好密码 点击“OK”

![img](http://up.2cto.com/2013/0520/20130520110835219.png)

配置完成

> [oracle odbc配置](https://www.2cto.com/database/201305/212209.html)

## 2.逆向生成

2.1 New PDM：点击File --> new Model,并选择物理模型，数据库选择为oracle

2.2.选择数据库菜单(Database)下的Connect。

2.3.把刚刚建立的ODBC连接选中，输入相应信息。连接。(就是前面配置的ODBC)输入密码，并点击连接.

2.4.选择数据库菜单(Database)下的Updata Model from Database...

2.5.选择Using a data source，确定(选择使用的哪一个库)。

2.6.在Database Reverse Engineering中选择你需要反向的具体表。

2.7.等待处理完成即可。

> ![1539310602017](../PowerBuilder/assets/1539310602017.png)

## 注意事项：

### 1.Oracle客户端选择问题

 安装32位客户端

### 2. 配置Path环境变量

当存在多个客户端的情况下，请确保以上安装的客户端在path最前面位置；