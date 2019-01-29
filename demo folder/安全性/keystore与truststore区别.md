# SSL连接初涉

ActiveMQ普通的TCP连接方式，报文在网络中是以明文方式传输的，出于安全的考虑，为了确保报文数据在网络传输过程中不会被截取及窃听，需要使用密文传输，MQ本身是支持SSL加密方式的，开启SSL配置即可满足这一需求，并且不需要修改任何业务代码。

SSL（Secure Socket Layer）为Netscape所研发，用以保障在Internet上数据传输之安全，利用数据加密(Encryption)技术，可确保数据在网络上之传输过程中不会被截取及窃听。一般通用之规格为40 bit之安全标准，美国则已推出128 bit之更高安全标准，但限制出境。只要3.0版本以上之I.E.或Netscape浏览器即可支持SSL。
 当前版本为3.0。它已被广泛地用于Web浏览器与服务器之间的身份认证和加密数据传输。

SSL协议位于TCP/IP协议与各种应用层协议之间，为数据通讯提供安全支持。SSL协议可分为两层： SSL记录协议（SSL Record Protocol）：它建立在可靠的传输协议（如TCP）之上，为高层协议提供数据封装、压缩、加密等基本功能的支持。 SSL握手协议（SSL Handshake Protocol）：它建立在SSL记录协议之上，用于在实际的数据传输开始前，通讯双方进行身份认证、协商加密算法、交换加密密钥等。

## Keystore和TrustStore

一个web应用如果需要提供以https的方式访问的服务的话，我们需要一个数字证书，这个证书的配置是在apache的配置文件或者其他web容器的配置文件中进行配置的。当然这个可以保存在keystore中。

我们自己的应用中通常所说的keystore或者truststore主要是针对于应用本身的需求来的。
 keystore和truststore从其文件格式来看其实是一个东西，只是为了方便管理将其分开
 keystore中一般保存的是我们的私钥，用来加解密或者为别人做签名



![img](https:////upload-images.jianshu.io/upload_images/3320837-4dfc05a2a56deb9c.gif?imageMogr2/auto-orient/strip%7CimageView2/2/w/482/format/webp)



truststore中保存的是一些可信任的证书，主要是Java在代码中访问某个https的时候对被访问者进行认证的，以确保其实可信任的。

truststore是必须的，如果我们没有显式的指定，那么java会默认指定为$JAVA_HOME/lib/security/cacerts 这个文件。

如果要指定的话，可以在java的参数中进行指定

Java代码

```
-Djavax.net.ssl.keyStore=clientKeys   
-Djavax.net.ssl.keyStorePassword=password   
-Djavax.net.ssl.trustStore=clientTrust   
-Djavax.net.ssl.trustStorePassword=password   
```

keystore可以看成一个放key的库，key就是公钥，私钥，数字签名等组成的一个信息。

truststore是放信任的证书的一个store
 truststore和keystore的性质是一样的，都是存放key的一个仓库，区别在于，truststore里存放的是只包含公钥的数字证书，代表了可以信任的证书，而keystore是包含私钥的。

## 使用keytool生成keystone和truststore

根据MQ官网的说法，我们可以通过如下的方法来生成服务端和客户端上的ks和ts文件
 1、生成服务端私钥，并导入到服务端keyStore文件中，此操作生成broker1.ks文件，保存服务端私钥，供服务端使用。
 在命令行输入：

```
keytool -genkey -alias broker -keyalg RSA -keyStore broker1.ks
```

会提示你输入一些基本信息，尽量按真实的信息填写，命令完成后，会在操作目录下生成broker1.ks文件。

2、根据服务端私钥导出服务端证书，此操作生成broker_cert文件，该文件为服务端的证书。
 在命令行输入：

```
keytool -export -alias broker -keyStore broker1.ks -file broker_cert
```

要求输入刚刚创建的密钥文件的密码，命令完成后，会在操作目录下生成broker_cert证书文件。

3、导入服务端证书到客户端的Trust keyStore中。此操作生成client.ts文件，保存服务端证书，供客户端使用。
 在命令行输入：

```
keytool -import -alias broker -keystore client1.ts -file broker_cert
```

要求输入两遍密钥文件密码，并且要确认是否信任证书，选择信任（输入”y”），操作完成后，会在操作目录下生成client1.ts客户端证书文件。

4、生成客户端私钥，并且导入到客户端keyStore文件中，此操作生成client1.ks文件，保存客户端私钥，供客户端使用。
 在命令行输入：

```
keytool -genkey -alias client -keyalg RSA -keyStore client1.ks
```

会提示你输入以下信息，尽量按真实的信息填写，命令完成后，会在操作目录下生成client1.ks客户端密钥文件。

5、根据客户端私钥导出客户端证书。
 在命令行输入：

```
keytool -export -alias client -keystore client1.ks -file client_cert
```

要求输入客户端密钥文件的密码，命令完成后，会在操作目录生成client_cert客户端证书文件。

6、导入客户端证书到服务端的Trust keyStore中，此操作生成broker1.ts文件，保存客户端证书，供服务端使用。
 在命令行输入：

```
keytool -import -alias client -keystore broker1.ts -file client_cert
```

要求输入两次客户端密钥文件的密码，注意是客户端密钥的密码，需要信任该证书，命令完成后会在操作目录下生成broker1.ts服务端证书。

以上6步操作，共生成6个文件

```
broker1.ks  broker_cert client1.ts
broker1.ts  client1.ks  client_cert
```

其中broker1的ks和ts文件供服务端使用，client1的ks和ts文件供客户端使用。

整理一下思路，可以看到整个证书的生成过程经过了以下几步：
 1、生成服务端私钥（Keystore）
 2、生成服务端证书（certificate）
 3、将服务端证书导入到客户端信任列表中（Truststore）
 4、生成客户端私钥（Keystore）
 5、生成客户端证书（certificate）
 6、将客户端证书导入到服务端信任列表中（Truststore）

最后客户端和服务端所需要的就是私钥（Keystore）和信任列表（Truststore）。

剩下一个问题：如何从CA根证书中导出服务端和客户端的keystore和truststore？











> 作者：MisterCH
>
> 链接：https://www.jianshu.com/p/69350676dd96
>
> 來源：简书
>
> 简书著作权归作者所有，任何形式的转载都请联系作者获得授权并注明出处。