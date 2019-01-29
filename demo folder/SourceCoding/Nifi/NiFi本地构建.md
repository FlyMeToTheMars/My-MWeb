# NiFi本地源码构建

## 1.下载源码

https://nifi.apache.org/download.html

## 2.Maven配置

2.1 远程仓库镜像

2.2 Maven运行参数

`$MAVEN_HOME\bin\mvn.cmd`文件中添加`set MAVEN_OPTS=-Xms1024m -Xmx3076m -XX:MaxPermSize=256m`,

如下：

```powershell
······
@setlocal
set MAVEN_OPTS=-Xms1024m -Xmx3076m -XX:MaxPermSize=256m
set ERROR_CODE=0
······
```

2.3 Maven 构建项目

到NiFi源码根目录，如`D:\Workspace\nifi-1.8.0`下，运行

```powershell
mvn -T C2.0 clean install -D maven.test.skip=true
# -D maven.test.skip=true  因为已经是发行版源码包，所以直接跳过Test步骤进行构建
```

构建结束之后，到`D:\Workspace\nifi-1.8.0\nifi-assembly`下，运行

```powershell
mvn clean install
```

至此，构建完成。



## 参考文章

[NiFi Debugging Tutorial](https://community.hortonworks.com/articles/106931/nifi-debugging-tutorial.html)

[Apache NiFi Development Quickstart](https://nifi.apache.org/quickstart.html)







