# Git学习之思维导图

> 用思维导图的形式学习Git，本文只是整理了git快速使用的导图，如果想要更深入的理解git，或者完成更加复杂的操作，需要系统性的学习。
>  注：思维导图的最后是终端命令，由于字体的关系--连成一起，读者看到长的-其实就是--

在使用git前，可以看看我整理的终端中最基本的文件操作：



![img](https:////upload-images.jianshu.io/upload_images/931502-905bf069f63ff985.png?imageMogr2/auto-orient/strip%7CimageView2/2/w/643/format/webp)

常用终端操作.png

## Git简介

一种分布式版本管理工具
 **版本工具：**用来管理一个文件夹中文件内容的变更，并记录下每个版本。
 **版本工具分类：**1.分布式  2.集中式
 **集中式版本控制：**SVN等、适合公司里用，服务器管理，每个人的版本都是提交到服务器，以服务器为主，服务器坏了就拉不到。
 **分布式版本控制：**安全，每人本地有个版本库，每个人都可以充当‘服务器’

## Git应用分类

**我主要把Git分成下面几个大类**



![Git应用分类](https:////upload-images.jianshu.io/upload_images/931502-2efa1352aa1fdb0a.png?imageMogr2/auto-orient/strip%7CimageView2/2/w/299/format/webp)

## 1.版本库

**什么是版本库？**
 一个文件仓库，仓库里面的文件的增删改，git都能跟踪到。



![版本库](https:////upload-images.jianshu.io/upload_images/931502-43a17ddb5ef6853d.png?imageMogr2/auto-orient/strip%7CimageView2/2/w/421/format/webp)



**那怎么才能追踪文件的变化呢？**---->创建版本库

当创建了一个版本库，那么就会生成一个.git的文件，这个文件就是用来追踪版本的，千万不要没事去动它



![img](https:////upload-images.jianshu.io/upload_images/931502-65c5c3351ac46ee9.png?imageMogr2/auto-orient/strip%7CimageView2/2/w/581/format/webp)

创建版本库.png

本地在提交到版本库前，会先进入暂存区，再提交到版本库。



![img](https:////upload-images.jianshu.io/upload_images/931502-fa1fe5494104a020.png?imageMogr2/auto-orient/strip%7CimageView2/2/w/715/format/webp)

添加到版本库.png

------

## 2.版本之间的穿梭

Git在不同版本之间可以穿梭，通过版本号和次序。



![img](https:////upload-images.jianshu.io/upload_images/931502-c1ba939fd7c1c07e.png?imageMogr2/auto-orient/strip%7CimageView2/2/w/353/format/webp)

版本穿梭.png

版本列表中会带有版本号，这个版本号可以指定版本回退



![img](https:////upload-images.jianshu.io/upload_images/931502-46b0eab36ad9d486.png?imageMogr2/auto-orient/strip%7CimageView2/2/w/732/format/webp)

查看版本列表.png



![img](https:////upload-images.jianshu.io/upload_images/931502-85a0e2b73458ee59.png?imageMogr2/auto-orient/strip%7CimageView2/2/w/731/format/webp)

回退版本.png

当你回退过版本，并不会导致，你回退前的版本消失，它还在，你可以撤销回退。



![img](https:////upload-images.jianshu.io/upload_images/931502-fa3821d69b661837.png?imageMogr2/auto-orient/strip%7CimageView2/2/w/651/format/webp)

重返未来版本.png

由这幅图能看出，版本库的撤销可以通过回退版本，而暂存区，则可以细分回退，单个文件回退。



![img](https:////upload-images.jianshu.io/upload_images/931502-18d343d22c4ea959.png?imageMogr2/auto-orient/strip%7CimageView2/2/w/803/format/webp)

撤销修改.png



![img](https:////upload-images.jianshu.io/upload_images/931502-3f0b4a9d1c26978a.png?imageMogr2/auto-orient/strip%7CimageView2/2/w/851/format/webp)

删除文件.png

------

## 3.分支



![img](https:////upload-images.jianshu.io/upload_images/931502-1fa6c35a565fb4de.png?imageMogr2/auto-orient/strip%7CimageView2/2/w/350/format/webp)

版本分支.png

###### 创建与合并分支

使用git可以设计适用不同团队的分支策略，推荐大家看一下gitflow，有一套很不错的项目分支策略，和基于git的更加简单的代码

当一个分支没有commit的时候，是不能切换到其他的分支的。



![img](https:////upload-images.jianshu.io/upload_images/931502-fa964b322f13440f.png?imageMogr2/auto-orient/strip%7CimageView2/2/w/860/format/webp)

创建与合并分支.png

###### stash储藏工作现场

当你手头的代码写了一半，这个时候你的老大叫你马上切回develop，修改一个紧急的BUG，这个时候提交到暂存区不是个好的方法，那么久用到stash操作，它可以保存工作现场，让你可以切换到其他的分支去，等在其他分支解决完BUG，再回来，可以恢复工作现场



![img](https:////upload-images.jianshu.io/upload_images/931502-f784e4b28a64acfc.png?imageMogr2/auto-orient/strip%7CimageView2/2/w/701/format/webp)

stash.png

###### 多人协作



![img](https:////upload-images.jianshu.io/upload_images/931502-c9f555e1846c3c43.png?imageMogr2/auto-orient/strip%7CimageView2/2/w/847/format/webp)

多人协作.png

------

## 4.版本标签

用来记录众多提交的小版本中，重大意义的版本（打包上传APP活安卓市场）对应的版本，这样一来，就可以找到历史中是哪个是大版本了。



![img](https:////upload-images.jianshu.io/upload_images/931502-f328c9efbe7a18a8.png?imageMogr2/auto-orient/strip%7CimageView2/2/w/893/format/webp)

版本标签.png

作者：Jadyn_Wu

链接：https://www.jianshu.com/p/e2f553942317

來源：简书

简书著作权归作者所有，任何形式的转载都请联系作者获得授权并注明出处。