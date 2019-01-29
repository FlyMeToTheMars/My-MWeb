 

# Linux环境配置

## 修改ip地址

1，图形化界面

2，setup 命令虚拟界面

3，修改配置文件（以网络方式为NAT示例）

vi /etc/sysconfig/network-scripts/ifcfg-eth0

BOOTPROTO=static

ONBOOT=yes

IPADDR=192.168.2.129

NETMASK=255.255.255.0

GATEWAY=192.168.2.**2**      #网段2任意，IP地址2固定，网段为vmnet8的设置的IP网段

DNS1=114.114.114.114   

DNS2=8.8.8.8

重启网络生效：

service network restart

 

## 网络通信命令

### ping 

命令路径：/bin/ping       执行权限：所有用户

作用：测试网络的连通性

语法：ping 选项 IP地址 

 -c 指定发送次数    

ping 命令使用的是icmp协议，不占用端口

eg: # ping -c 3 127.0.0.1

### ifconfig 

英文：interface configure 命令路径：/sbin/ifconfig            执行权限：root

作用：查看和设置网卡网络配置

语法：ifconfig [-a] [网卡设备标识]   

-a：显示所有网卡信息

ifconfig [网卡设备标识] IP地址             修改ip地址

### netstat 

英文：network statistics        命令路径：/bin/netstat          执行权限：所有用户

作用：主要用于检测主机的网络配置和状况

-a  all显示所有连接和监听端口

-t (tcp)仅显示tcp相关选项

-u (udp)仅显示udp相关选项

-n 使用数字方式显示地址和端口号

-l （listening）  显示监控中的服务器的socket

eg:# netstat -tlnu      查看本机监听的端口

tcp 0 0 0.0.0.0:111 0.0.0.0:* LISTEN

协议  待收数据包  待发送数据包  本地ip地址：端口 远程IP地址：端口

\# netstat –antpl  

netstat -ntlp | grep httpd  查看某一个程序的端口信息

netstat -atnp | grep httpd  

netstat -atnp | grep 80   查看端口

## 修改主机名

临时生效：

hostname 主机名   

​                                                  

永久生效：修改配置文件

vim /etc/sysconfig/network

   

## 修改映射关系

修改主机名和ip地址之间的映射关系

vim /etc/hosts

192.168.2.120 node-1.edu.cn node-1

可配置别名

   

# Linux常用管理命令

## 磁盘空间命令

### df命令

作用：用于查看Linux文件系统的状态信息,显示各个分区的容量、已使用量、未使用量及挂载点等信息。看剩余空间

语法：df [-hkam] [挂载点]

-h（human-readable）根据磁盘空间和使用情况 以易读的方式显示 KB,MB,GB等
 -k 　以KB 为单位显示各分区的信息，默认

-M   以MB为单位显示信息
 -a 　显示所有分区包括大小为0 的分区

### du命令

作用：用于查看文件或目录的大小（磁盘使用空间）

语法：du [-ahs] [文件名目录]

​       -a 显示子文件的大小

​       -h以易读的方式显示 KB,MB,GB等

​       -s summarize 统计总占有量

eg:
 du -a(all) /home 　显示/home 目录下每个子文件的大小,默认单位为kb

du -h /home 以K，M,G为单位显示/home 文件夹下各个子目录的大小

du -sh /home 　以常用单位（K,M,G）为单位显示/home 目录的总大小 -s summarize

 

df命令和du命令的区别：

df命令是从文件系统考虑的，不仅考虑文件占用的空间，还要统计被命令或者程序占用的空间。

du命令面向文件，只计算文件或目录占用的空间。

\#df –h /

\#du –sh /

 

### free 

作用：查看内存及交换空间使用状态

语法： free [-kmg]

选项：

-k:    以KB为单位显示，默认就是以KB为单位显示

-m:    以MB为单位显示

-g:    以GB为单位显示

清理缓存命令：

echo 1 > /proc/sys/vm/drop_caches

 

## 用户管理命令

### useradd

添加用户

语法：useradd [选项] 用户名

### passwd

修改密码命令

语法：passwd [选项] [用户名]

用户密码：生产环境中，用户密码长度8位以上，设置大小写加数字加特殊字符，要定期更换密码。

ys^h_L9t  

 

### userdel（user delete）

删除用户

-r 删除账号时同时删除宿主目录（remove）

 

## 进程管理命令

**进程和程序的区别：**

1、程序是静态概念，本身作为一种软件资源长期保存；而进程是程序的执行过程，它是动态概念，有一定的生命期，是动态产生和消亡的。

2、程序和进程无一一对应关系。一个程序可以由多个进程共用；另一方面，一个进程在活动中有可顺序地执行若干个程序。

**进程和线程的区别：**

进程： 就是正在执行的程序或命令，每一个进程都是一个运行的实体，都有自己的地址空间，并占用一定的系统资源。

线程： 轻量级的进程；进程有独立的地址空间，线程没有；线程不能独立存在，它由进程创建；相对讲，线程耗费的cpu和内存要小于进程。

进程管理的作用？

判断服务器的健康状态

查看系统所有的进程

杀死进程

### ps命令

作用：查看系统中的进程信息

语法：ps [-auxle]

常用选项

​    a：显示所有用户的进程

​    u：显示用户名和启动时间

​    x：显示没有控制终端的进程

​    e：显示所有进程，包括没有控制终端的进程

​    l：长格式显示

**查看系统中所有进程**

\# ps aux     #查看系统中所有进程，使用BSD操作系统格式，unix

\# ps -le        #查看系统中所有进程，使用Linux标准命令格式

ps应用实例
​     \# ps -u or ps -l  查看隶属于自己进程详细信息

\# ps aux | grep sam    查看用户sam执行的进程 
​     \# ps -ef | grep init        查看指定进程信息

 

### pstree

**作用：**查看当前进程树

语法：pstree [选项]

​       -p 显示进程PID

​       -u   显示进程的所属用户

 

### top     

作用：查看系统健康状态  

显示当前系统中耗费资源最多的进程,以及系统的一些负载情况。

语法：top [选项]

​       -d 秒数，指定几秒刷新一次，默认3秒（动态显示）

 

### kill 

作用：关闭进程

语法：kill [-选项] pId

kill -9 进程号（强行关闭）  常用

kill -1 进程号（重启进程）

 

# 权限管理

## 三种基本权限 

r 读权限（read）

w 写权限（write）

x 执行权限 （execute）

## 权限说明

   

所有者  所属组  其他人

第1位：文件类型（d 目录，- 普通文件，l 链接文件）

第2-4位：所属用户(所有者)权限，用u（user）表示

第5-7位：所属组权限，用g（group）表示

第8-10位：其他用户（其他人）权限，用o（other）表示

第2-10位：表示所有的权限，用a（all）表示

类型： f 二进制文件   l 软连接文件   d 目录  

| 字符 | 权限     | 对文件的含义     | 对目录的含义                         |
| ---- | -------- | ---------------- | ------------------------------------ |
| r    | 读权限   | 可以查看文件内容 | 可以列出目录的内容（ls）             |
| w    | 写权限   | 可以修改文件内容 | 可以在目录中创建删除文件( mkdir,rm ) |
| x    | 执行权限 | 可以执行文件     | 可以进入目录(cd)                     |

文件：

r-cat,more,head,tail，less

w-echo,vi

x-命令，脚本

目录：

r-ls

w-touch,mkdir,rm,rmdir

x-cd 

能删除文件的权限是对该文件所在的目录有wx权限。

## 权限更改-chmod

英文：change mode (change the permissions mode of a file)

作用：改变文件或目录权限

语法：

chmod [{ugoa}{+-=}{rwx}] [文件名或目录]  

chmod [mode=421] [ 文件或目录]

​       参数：-R 下面的文件和子目录做相同权限操作（Recursive递归的）

思考：一个文件的权限谁可以更改？  root  所有者

root

文件所有者

例如：chmod  u+x  a.txt

chmod u+x,o-x a.txt

用数字来表示权限（r=4，w=2，x=1，-=0）

​       例如：chmod  750  b.txt

rwx和数字表示方式能随意切换

注意：root用户是超级用户，不管有没有权限，root都能进行更改。用普通用户测试权限。

不能用一个普通用户去修改另一个普通用户的权限。

## 更改所有者-chown

英文：change file ownership

作用：更改文件或者目录的所有者 

语法 : chown user[:group] file... 

　-R : 递归修改

参数格式 : 

　　    user : 新的档案拥有者的使用者 ID

group : 新的档案拥有者的使用者群体(group) 

   eg：#chown lee file1   把file1文件的所有者改为用户lee

eg：#chown lee:test file1   把file1文件的所有者改为用户lee,所属组改为test

eg：#chown –R  lee:test dir   修改dir及其子目录的所有者和所属组

## 改变所属组chgrp  

英文：change file group ownership

作用：改变文件或目录的所属组

语法 : chgrp [group] file... 

eg:chgrp root test.log 把test.log的所属组修改为root

# RPM软件包管理

RPM软件包也称为二进制软件包

RPM是RedHat Package Manager（RedHat软件包管理工具）的缩写，这一文件格式名称虽然打上了RedHat的标志，但是其原始设计理念是开放式的，现在包括RedHat、CentOS、SUSE等Linux的发行版本都有采用，可以算是公认的行业标准了。RPM文件在Linux系统中的安装最为简便

## RPM命令使用

rpm的常用参数

i：安装应用程序（install）

vh：显示安装进度；（verbose hash） 

U：升级软件包；（update） 

qa: 显示所有已安装软件包（query all）

e：卸载应用程序（erase）

注意：如果其它软件包有依赖关系，卸载时会产生提示信息，可使用--nodeps强行卸载。

查询所有安装的rpm包: # rpm –qa

查询mysql相关的包： # rpm –qa | grep mysql

安装：rpm  -ivh  jdk.rpm

卸载： rpm –e mysql*

强行卸载：rpm –e mysql*  --nodeps

图形化界面，手动挂载

## YUM管理

**yellowdog updater modified**  **软件包管理工具**

**应用yum的好处:**
 1,自动解决软件包依赖关系
 2,方便的软件包升级
 **查询**

yum list     查询所有可用软件包列表

yum search  关键字     搜索服务器上所有和关键字相关的包

可以通过yum info 关键字 来查找包名

**安装**

**yum -y install**   **包名**     -y  自动回答yes  

**升级** 

yum -y update  **包名** 

**注意****：**如果不加包名，就升级所有的，包括内核。必须加包名升级单个软件包，慎用升级所有的

检测升级 yum check-update
 **卸载**

yum  -y remove  包名    
 **帮助** 

yum --help、man yum

yum clean  all                清除缓存和旧的包

yum  repolist                    查看当前可用的yum源

yum deplist httpd            列出一个包所有依赖的包

 

 

## 搭建本地yum源

\#cat /etc/yum.repos.d/CentOS-Base.repo

[base]

name=CentOS-$releasever - Base

mirrorlist=http://mirrorlist.centos.org/?release=$releasever&arch=$basearch&repo=os

\#baseurl=http://mirror.centos.org/centos/$releasever/os/$basearch/

gpgcheck=1

gpgkey=file:///etc/pki/rpm-gpg/RPM-GPG-KEY-CentOS-6

**解释：**

[base]    容器名称，一定要放在[]中

name     容器说明，这个可以自己随便写

mirrorlist    镜像站点，这个可以注释掉

baseurl    yum源服务器的地址。默认是CentOS官方的yum源服务器，

enabled    此容器是否生效，如果不写或写enable=1都是生效，写成enable=0就是不生效

gpgcheck    如果是1是指RPM的数字证书生效，如果是0则不生效

pggkey        数字证书的公匙文件保存位置，不用修改

 

**1，** **挂载光盘**    

\# mkdir /mnt/cdrom

​    \#mount  /dev/cdrom  /mnt/cdrom

​    卸载挂载用umount  /mnt/cdrom

**2****，让网络yum源文件失效**

   cd /etc/yum.repos.d/

   rename  .repo  .repo.bak  *        #重命名所有的.repo文件

   cp  CentOS-Media.repo.bak  CentOS-Media.repo     #配置一个.repo文件

**3****，修改光盘yum源文件**

​    **vi CentOS-Media.repo** 

[c6-media]

name=CentOS-$releasever - Media

baseurl=file:///mnt/cdrom        

\#这里的地址为自己光盘挂载地址，并把不存在的地址注释掉，在行首注释

\# file:///media/cdrom/

\# file:///media/cdrecorder/

gpgcheck=1

enabled=1        #把原来的0改为1，让这个yum源配资文件生效

gpgkey=file:///etc/pki/rpm-gpg/RPM-GPG-KEY-CentOS-6

可使用 yum repolist 查看 当前可用yum源

yum clean all

yum repolist

# 安装minimal镜像

# 搭建集群环境

集群 ：多台机器组成集群

假定使用3台机器

运行模式

1， 单机模式 

2， 伪分布模式 hdfs 

3， 集群模式 master slave1 slave2   namenode datanode

 

## 制作模板机

## 配置免密登录

# 安装jdk