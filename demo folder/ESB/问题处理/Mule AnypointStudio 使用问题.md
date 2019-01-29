# Mule AnypointStudio 使用问题

## 1.无法启动

Windows10 环境下，已经配置好的JDK可能遇到无法被识别，此时可以通过调整path变量来解决问题。官方说明如下：

![1542593146424](assets/1542593146424.png)

将 `%JAVA_HOME%\bin;%JAVA_HOME%\jre\bin;`放在Path变量的最前端即可解决AnypointStudio无法启动问题。