# Windows安装OpenSSH支持SSH

> 前言：在管理Linux服务器的时候，我们经常需要使用ssh客户端连接到服务器，或者进行向服务器传文件，特别是对运维或者系统管理员，如果使用Mac或者Linux桌面系统的同学就很容易，使用windows的同学，需要安装xShell、putty等工具，即使安装这些软件也不能直接使用scp，或者ssh-keygen生成密钥等操作。

------

之前看到网上很多文章，有的是安装cygwin 来模拟UNIX 环境，但现在我的需求只是让windows支持ssh一些命令而已，没必要这么麻烦啊，为什么不能给windows安装openssh进行系统支持呢，并且现在微软已经支持openssh，以下是具体的操作步骤：

## 1.下载需要的Openshh文件

 微软的PowerShell团队已经支持openssh，所以安装文件我们可以在github的powershell团队项目下进行下载

 下载地址： 

https://github.com/PowerShell/Win32-OpenSSH/releases

 根据你自己的系统对应下载

## 2.安装OpenSSH

 已经下载好OpenSSH，并且进行解压

![img](https:////upload-images.jianshu.io/upload_images/1226004-d5058d905eb6b376.png?imageMogr2/auto-orient/strip%7CimageView2/2/w/642/format/webp)



看到没，这就是神奇的一面
 把OpenSSH整个目录进行复制到 C:\Program Files (其实哪个目录都可以，不过建议安装在这里)
 回到Windows桌面，在 计算机(windows7)或此电脑(windows10)，右键 --> 属性 -->  高级系统设置 --> 环境变量--系统变量，在此框里面找到 Path 进行编辑,



![img](https:////upload-images.jianshu.io/upload_images/1226004-19b0f8e6824a44b1.png?imageMogr2/auto-orient/strip%7CimageView2/2/w/593/format/webp)



windows7系统编辑时候是以文本形式，所以就需要在最后先添加 “； ”  英文分号，再把你安装路径 如 C:\Program Files\OpenSSH-Win64 粘贴进去
 windows 10系统添加比较方便，进到Path里面，点击 新建直接粘贴进去！



![img](https:////upload-images.jianshu.io/upload_images/1226004-d1ee1222f4380be3.png?imageMogr2/auto-orient/strip%7CimageView2/2/w/596/format/webp)



## 3.进行测试检验

下面只是测试ssh和scp命令，其他的留给你们自己慢慢玩！使用cmd命令打开dos命令行或者打开windows的PowerShell！
 传统dos命令框界面：



![img](https:////upload-images.jianshu.io/upload_images/1226004-3ac122123166e709.png?imageMogr2/auto-orient/strip%7CimageView2/2/w/767/format/webp)



PowerShell 命令框：



![img](https:////upload-images.jianshu.io/upload_images/1226004-94d24e00380d7e82.png?imageMogr2/auto-orient/strip%7CimageView2/2/w/724/format/webp)



## 4.总结：
Windows安装OpenSSH相对方便，比较轻量，比如传文件到Linux服务器，我直接打开一个Dos界面就可以完成，不需要打开Xftp等软件，相对方便，有兴趣的可以继续探究其他命令



## 5.可能遇到的问题

如果是使用私钥登陆，则可能遇到密钥权限问题：[Windows SSH: Permissions for 'private-key' are too open](https://superuser.com/questions/1296024/windows-ssh-permissions-for-private-key-are-too-open)