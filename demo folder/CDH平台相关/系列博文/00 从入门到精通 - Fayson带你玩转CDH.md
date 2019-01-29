## 从入门到精通 - Fayson带你玩转CDH

> Fayson的github：
>
> https://github.com/fayson/cdhproject

本文更新时间：2018年8月22日00:05:14

Fayson会持续的写作，本文会定期更新。另外大家可以留言推荐比较方便做目录的工具，或者在公众号里展示文章的方式。

Fayson正在调研网页端的方式，因为腾讯云+社区没有分类功能，对于找寻文章还是非常不方便，如果大家有比较好的社区，博客或者电子书的网站/工具推荐，也可以留言，目前看来gitbook还不错。不过网页端优先级没那么高，因为实在没时间，所以会优先考虑微信的方式。

重要的事情说三遍：

**以下所有文章均为超链接，可以直接点击文章名跳转。**

**以下所有文章均为超链接，可以直接点击文章名跳转。**

**以下所有文章均为超链接，可以直接点击文章名跳转。**



## 1.规划设计

### 1.1.on-premise部署规划

0001-《[CDH网络要求(Lenovo参考架构)](http://mp.weixin.qq.com/s?__biz=MzI4OTY3MTUyNg==&mid=2247483653&idx=1&sn=f2f35bf9ac30e5e61fc5c569f53a9dab&chksm=ec2ad10cdb5d581a7355ba7056ed4b3e30f9bd1bc5412532cfe690f3c9a42000418e8afd4dba&scene=21#wechat_redirect)》

0062-《[如何为Hadoop集群选择正确的硬件](http://mp.weixin.qq.com/s?__biz=MzI4OTY3MTUyNg==&mid=2247485329&idx=1&sn=7d4fb9f9ea3f1fb08d2aaa0a808f9302&chksm=ec2ad798db5d5e8e67859afbffa977ff86db86a0e667840dbf0bb9dfc89262dd4ee4fee0a06b&scene=21#wechat_redirect)》

0158-《[如何给Hadoop集群划分角色](http://mp.weixin.qq.com/s?__biz=MzI4OTY3MTUyNg==&mid=2247487209&idx=1&sn=a9d7b1cba01526fe1b1fb7a085dd9e9c&chksm=ec2adee0db5d57f687ef5be19077dfc2f94428950c7b95865f62d790bd46363ee6e039341702&scene=21#wechat_redirect)》



### 1.2.on private cloud部署规划





0200- 《[如何在VMware上部署Hadoop](http://mp.weixin.qq.com/s?__biz=MzI4OTY3MTUyNg==&mid=2247488093&idx=1&sn=9b0497104edaf7720d441b4e3223d24a&chksm=ec2ac254db5d4b42831eba7cd9c8bdcafe2c429ca9865767cf5ff2ac8856635b88be785e8771&scene=21#wechat_redirect)》





### 1.3.on public cloud部署规划







0195- 《[公有云中的Hadoop](http://mp.weixin.qq.com/s?__biz=MzI4OTY3MTUyNg==&mid=2247487940&idx=1&sn=57c2a1a76f006f76d4b649c802a2951c&chksm=ec2ac1cddb5d48dbf447e9e6283a080a5913bed095c7d8ec79c10598b66cb0fedaff6b0249f0&scene=21#wechat_redirect)》



## 2.安装/升级/卸载

### 2.1.安装

0002-《[CENTOS7.2安装CDH5.10和Kudu1.2(一)](http://mp.weixin.qq.com/s?__biz=MzI4OTY3MTUyNg==&mid=2247483731&idx=1&sn=e5a80a84cf54b69d21c7af56ca6c63b4&chksm=ec2ad15adb5d584c95978010108181386bd2697abadc1107985ce3cc264def70929af70f7e07&scene=21#wechat_redirect)》

0002-《[CENTOS7.2安装CDH5.10和Kudu1.2(二)](http://mp.weixin.qq.com/s?__biz=MzI4OTY3MTUyNg==&mid=2247483731&idx=2&sn=f88151af779e21beabd00645aea3b62f&chksm=ec2ad15adb5d584c63addfb568f1e8faf537a9f25acc765e8083b18cddd9c612474fc4b95f00&scene=21#wechat_redirect)》

0024-《[CENTOS6.5安装CDH5.12.1(一)](http://mp.weixin.qq.com/s?__biz=MzI4OTY3MTUyNg==&mid=2247484386&idx=1&sn=8cf1a8fd4847c5cb5d03774bea12119a&chksm=ec2ad3ebdb5d5afd2efe93ef442113e9c5e284626ec02b715b54a99d104104a6c42eb7350b05&scene=21#wechat_redirect)》

0025-《[CENTOS6.5安装CDH5.12.1(二)](http://mp.weixin.qq.com/s?__biz=MzI4OTY3MTUyNg==&mid=2247484459&idx=1&sn=02632f0e7909fc912e80bd8904e50279&chksm=ec2ad422db5d5d34680430cf6cb42f31be78486c854d021fbc27be47c815f4589aa4755f1901&scene=21#wechat_redirect)》

0030-《[如何在CDH中安装Kudu&Spark2&Kafka](http://mp.weixin.qq.com/s?__biz=MzI4OTY3MTUyNg==&mid=2247484809&idx=1&sn=b126d97ab27c0b96e7c1b8ef4948ef71&chksm=ec2ad580db5d5c96bc8aade109fd416ad09956b061a804a9a901734cdc28deddf4e8a2bd1c68&scene=21#wechat_redirect)》

0072-《[CDH安装前置准备](http://mp.weixin.qq.com/s?__biz=MzI4OTY3MTUyNg==&mid=2247485512&idx=1&sn=9e953a7eb8b3b2a64a011550ab7da184&chksm=ec2ad841db5d51573f5913d14c33135180bca023de1c349fc431f561c055d1d085527107b66e&scene=21#wechat_redirect)》

0073-《[CentOS6.5安装CDH5.13](http://mp.weixin.qq.com/s?__biz=MzI4OTY3MTUyNg==&mid=2247485557&idx=1&sn=539fd04afd3000d7c83a28f9b461a86d&chksm=ec2ad87cdb5d516a071c453afb7acb6dcca4b3fda6539d4d86bf83451f18fa5411c553c7065e&scene=21#wechat_redirect)》

0167-《[如何在Redhat7.3安装CDH5.14](http://mp.weixin.qq.com/s?__biz=MzI4OTY3MTUyNg==&mid=2247487399&idx=1&sn=24121261b009147418e9d8e58ca26d24&chksm=ec2adfaedb5d56b86a3c6668ce2884f6200a6978da1f8f80cc2595c9ddb025e21c8ee5b2a552&scene=21#wechat_redirect)》

0270- 《[如何在Redhat7.4安装CDH6.0.0_beta1](http://mp.weixin.qq.com/s?__biz=MzI4OTY3MTUyNg==&mid=2247489747&idx=1&sn=5382c7136f100f736f4eeb4efedad783&chksm=ec2ac8dadb5d41ccb083d3180a48adbf33afd3f464cc431347112d7d35de1ef05ca717cd379c&scene=21#wechat_redirect)》

0317- 《[如何在Redhat7.4安装CDH5.15](http://mp.weixin.qq.com/s?__biz=MzI4OTY3MTUyNg==&mid=2247491089&idx=1&sn=0a3e99e7c1523387b57467fd4f3d0943&chksm=ec2ace18db5d470ec4057b87e6fc2242d556a93e94720fa9713c5a0c06f979c1612f65ff569b&scene=21#wechat_redirect)》

### 2.2.一键安装

计划中...



### 2.3.升级

0009-《[如何升级Cloudera Manager和CDH](http://mp.weixin.qq.com/s?__biz=MzI4OTY3MTUyNg==&mid=2247484135&idx=1&sn=a701525a61743198d32ed21d85eeda5d&chksm=ec2ad2eedb5d5bf8945abc519fb7079c87d4feee48f341656cba3f906933cf75efcb346b1433&scene=21#wechat_redirect)》

0095-《[如何通过CM升级Kafka0.11及Spark2.2](http://mp.weixin.qq.com/s?__biz=MzI4OTY3MTUyNg==&mid=2247486091&idx=1&sn=d08ec43614d4ff4a522c8983b52052d2&chksm=ec2ada82db5d53943caa0a751e783389643edf7eea4165d1f6204590a606718277bcf0c8b5b6&scene=21#wechat_redirect)》

0171- 《[如何使用Cloudera Manager升级Spark2.1版本至Spark2.2](http://mp.weixin.qq.com/s?__biz=MzI4OTY3MTUyNg==&mid=2247487453&idx=1&sn=5204f4f4896cedcd1312008c731ab07e&chksm=ec2adfd4db5d56c2dd5e1eb0dc19cff3825fdce966c46be05e2184174cc19ec1af84ae996e4f&scene=21#wechat_redirect)》

0284- 《[CDH集群跨多版本滚动升级](http://mp.weixin.qq.com/s?__biz=MzI4OTY3MTUyNg==&mid=2247490242&idx=1&sn=e348a2672bd6781253b3836673f24a30&chksm=ec2acacbdb5d43dde0291cb3fb4e0a03dbe0e24eb5710c103cc07ea00284fd49b8b0187e2789&scene=21#wechat_redirect)》

### 2.4.迁移

0007-《[如何迁移Cloudera Manager节点](http://mp.weixin.qq.com/s?__biz=MzI4OTY3MTUyNg==&mid=2247483970&idx=1&sn=6d847a32e90ab485713f02f0b676110c&chksm=ec2ad24bdb5d5b5d24b51349494d8f3e0a5873a8ea739d283d5eea41d9aac6d96bbcedda5d1f&scene=21#wechat_redirect)》



### 2.5.卸载

0008-《[如何卸载CDH(附一键卸载github源码)](http://mp.weixin.qq.com/s?__biz=MzI4OTY3MTUyNg==&mid=2247484118&idx=1&sn=e7109978013a286fe1f172f99459c45a&chksm=ec2ad2dfdb5d5bc96fcaeb6ce2ed42a025e1d95ab251372fb4769c29434f0d84fb66bbfec1d2&scene=21#wechat_redirect)》

## 3.Cloudera Manager

### 3.1.产品介绍

0053-《[CDH5.13和CM5.13的新功能](http://mp.weixin.qq.com/s?__biz=MzI4OTY3MTUyNg==&mid=2247485205&idx=1&sn=7280c18e14347e32619476e084d5819c&chksm=ec2ad71cdb5d5e0ae7fa3278726760632f5eb98b99c1fab3285c5a597203827454da92025f7d&scene=21#wechat_redirect)》

0160-《[CDH5.14和CM5.14的新功能](http://mp.weixin.qq.com/s?__biz=MzI4OTY3MTUyNg==&mid=2247487265&idx=1&sn=d4d2eaeda0434c2e83b732241cc57162&chksm=ec2adf28db5d563e06dcc68198f86d45f492311063869728311842b72f6e7ecd7c4c38b3f255&scene=21#wechat_redirect)》

0216- 《[Cloudera Manager管理控制台](http://mp.weixin.qq.com/s?__biz=MzI4OTY3MTUyNg==&mid=2247488437&idx=1&sn=ce35a699b363cbbff7966bbd61e79d0b&chksm=ec2ac3bcdb5d4aaa5a07fee2f356690d63d90d823801503073dbc0aef435a4aa0a43081b8645&scene=21#wechat_redirect)》

0217- 《[Cloudera Manager首页](http://mp.weixin.qq.com/s?__biz=MzI4OTY3MTUyNg==&mid=2247488461&idx=1&sn=9259d9127ffd17a5e2a182a4ea4ba533&chksm=ec2ac3c4db5d4ad273a4c1caea387e54cb07316c71b29496e7a83ab8318609051e705938fe72&scene=21#wechat_redirect)》

0269- 《[Cloudera Enterprise 6 Beta发布](http://mp.weixin.qq.com/s?__biz=MzI4OTY3MTUyNg==&mid=2247489680&idx=1&sn=8a214d352972d930f2f4ef2502a141c4&chksm=ec2ac899db5d418f954b4c3a8089e6578b7e498965840d03de9d0a31999d512adfad84aa0a3f&scene=21#wechat_redirect)》

0274- 《[CDH5弃用的项目](http://mp.weixin.qq.com/s?__biz=MzI4OTY3MTUyNg==&mid=2247489917&idx=1&sn=035645ad4703bd93d79c062476793fd2&chksm=ec2ac974db5d40627c63a783d80963912e1ce1b36d06fbdc9681ee3d0cb454739e7ae081ac18&scene=21#wechat_redirect)》

0303- 《[CDH5.15和CM5.15的新功能](http://mp.weixin.qq.com/s?__biz=MzI4OTY3MTUyNg==&mid=2247490765&idx=1&sn=c976f5d5445290bb60644b6c9c23d808&chksm=ec2accc4db5d45d2c0851484d1e1df3be6885f7206c712f7573d96b03b86ee0bce1e67d42103&scene=21#wechat_redirect)》

0336- 《[Kudu1.7的新功能](http://mp.weixin.qq.com/s?__biz=MzI4OTY3MTUyNg==&mid=2247491475&idx=1&sn=e58736f1e06a3ac576e48d239220523a&chksm=ec2acf9adb5d468c678b983619df9279da8a1bd4aba9fe7fdc6cecf50e8f4a9d3c4d62b19605&scene=21#wechat_redirect)》

0365- 《[关于CDH相关服务启动用户的说明](http://mp.weixin.qq.com/s?__biz=MzI4OTY3MTUyNg==&mid=2247491993&idx=3&sn=9b189e480e8b15f7edb283e76185a14e&chksm=ec293190db5eb88699906fd4f6e554d15e67ba7ee3360d170d76d937b3334a53d863186dc6a7&scene=21#wechat_redirect)》

### 3.2.扩容

0080-《[如何在CDH集群中加入异构设备](http://mp.weixin.qq.com/s?__biz=MzI4OTY3MTUyNg==&mid=2247485756&idx=1&sn=11d28b87c73424478c7477bc6f111ffb&chksm=ec2ad935db5d502340945a7cffa5ea35589ec255b13e96d9dcace28c8ef168ea178316937a6a&scene=21#wechat_redirect)》

0089-《[如何给CDH集群增加Gateway节点](http://mp.weixin.qq.com/s?__biz=MzI4OTY3MTUyNg==&mid=2247485917&idx=1&sn=9e73e97029f58eeea004f5be4ffa45eb&chksm=ec2ad9d4db5d50c21bf967e835e963409c16e78bc2cbbda3c6a50d07f577532fd44d5fc9278c&scene=21#wechat_redirect)》

0110-《[如何给Kerberos环境下的CDH集群添加Gateway节点](http://mp.weixin.qq.com/s?__biz=MzI4OTY3MTUyNg==&mid=2247486320&idx=1&sn=9017f32f2e035fab859ba69392a8bf16&chksm=ec2adb79db5d526f6f7f122ea81ba622dd91d1ddfca7a6c2864cf73a6f861643812e2618b98f&scene=21#wechat_redirect)》

0112-《[如何在非Kerberos环境下对CDH进行扩容](http://mp.weixin.qq.com/s?__biz=MzI4OTY3MTUyNg==&mid=2247486394&idx=1&sn=bfd95038660b9974269b5718566da8ed&chksm=ec2adbb3db5d52a56138bf2ad731f7f8e4827c0de69e4a6d86bb2bd20974d423ec344cbe473e&scene=21#wechat_redirect)》

0126-《[如何为Kerberos环境的CDH集群在线扩容数据节点](http://mp.weixin.qq.com/s?__biz=MzI4OTY3MTUyNg==&mid=2247486682&idx=1&sn=de44a67e46af1d0debba4dfa40b6b5ff&chksm=ec2adcd3db5d55c5ed527a4b94f18fa0ccfa227219792b760f6a5eef964372eee43cd84747a9&scene=21#wechat_redirect)》

0344- 《[如何Redhat7的CDH集群中扩容增加Redhat6的节点](http://mp.weixin.qq.com/s?__biz=MzI4OTY3MTUyNg==&mid=2247491671&idx=1&sn=776fc70e872b8eb68c8bff37209c1c01&chksm=ec29305edb5eb948176211741e2c13331de06ef8ba9645ac4b452dfa14ed31cf8ecbf5e8fc5d&scene=21#wechat_redirect)》

### 3.3.减容

0115-《[如何使用Cloudera Manager在线为集群减容](http://mp.weixin.qq.com/s?__biz=MzI4OTY3MTUyNg==&mid=2247486448&idx=1&sn=0925710214d7a215b233fcdf8c60fc95&chksm=ec2adbf9db5d52efc0f4a3634f2ac64f420a7d328c31cb1afd92c63d6c70d54a885f98dbb694&scene=21#wechat_redirect)》

### 3.4.使用

0003-《[如何在CDH中使用LZO压缩](http://mp.weixin.qq.com/s?__biz=MzI4OTY3MTUyNg==&mid=2247483781&idx=1&sn=dadf927aacb0e93d9901c2ec0ee915a4&chksm=ec2ad18cdb5d589a5915e1591708f0b1c8ee323c407cbd3ffe62c11644300d19bfcc0e1861f7&scene=21#wechat_redirect)》

0036-《[如何通过CM API优雅的获取元数据库密码](http://mp.weixin.qq.com/s?__biz=MzI4OTY3MTUyNg==&mid=2247484894&idx=1&sn=69fcd92cedec639197437f7b0daa3fc8&chksm=ec2ad5d7db5d5cc1f3b6825bd62e151aa7f821d505c4202595e113765148094615a86285b0bf&scene=21#wechat_redirect)》

0040-《[如何重置Cloudera Manager的admin密码](http://mp.weixin.qq.com/s?__biz=MzI4OTY3MTUyNg==&mid=2247484965&idx=1&sn=f9a59d14351766f24081cd89a5307f64&chksm=ec2ad62cdb5d5f3aa8720086287f5ebd3b84d78d1b8fbca083de85c74c47362456245c0d6dd2&scene=21#wechat_redirect)》

0088-《[如何将CDH集群JAVA升级至JDK8](http://mp.weixin.qq.com/s?__biz=MzI4OTY3MTUyNg==&mid=2247485886&idx=1&sn=15ae709b285872f9b038a0011f703c26&chksm=ec2ad9b7db5d50a12f54d65a75561dca16e547ad8bc691c8658eb194993fe12f62808de9b89c&scene=21#wechat_redirect)》

0090-《[如何将CDH从企业版降级为免费版](http://mp.weixin.qq.com/s?__biz=MzI4OTY3MTUyNg==&mid=2247485942&idx=1&sn=33d7019db4b3b67cda064efe8452872e&chksm=ec2ad9ffdb5d50e934ad0de44568a067591a3672d0c833a9db95f277c7a74a30f87aa82068d6&scene=21#wechat_redirect)》

0091-《[如何将Kerberos环境下CDH集群JAVA升级至JDK8](http://mp.weixin.qq.com/s?__biz=MzI4OTY3MTUyNg==&mid=2247485967&idx=1&sn=eb23e9913f7298d37daf255625e54f1e&chksm=ec2ada06db5d531015e66dd6af30fd37a0be7869d23416482efe15c310bcaf2370f1ce57990f&scene=21#wechat_redirect)》

0096-《[如何使用Cloudera Manager启用HDFS的HA](http://mp.weixin.qq.com/s?__biz=MzI4OTY3MTUyNg==&mid=2247486124&idx=1&sn=bb5fc5a1343176eacd694f0568437a6d&chksm=ec2adaa5db5d53b3e92c8a101a0efdecbf79ba5d29378c6eace46a4542f158aec049e505c0de&scene=21#wechat_redirect)》

0098-《[如何使用Cloudera Manager禁用HDFS HA](http://mp.weixin.qq.com/s?__biz=MzI4OTY3MTUyNg==&mid=2247486160&idx=1&sn=c1ffd55e0d5c8036591629cc7e7be22f&chksm=ec2adad9db5d53cf57e85f867050f581063180cb3b559ddbac8c444bc6fc934a5de86e209011&scene=21#wechat_redirect)》

0100-《[如何使用Cloudera Manager启用YARN的HA](http://mp.weixin.qq.com/s?__biz=MzI4OTY3MTUyNg==&mid=2247486188&idx=1&sn=9568740650b3cb457f474cecc049ad95&chksm=ec2adae5db5d53f39e95d0d28f912a7575ee393bb6a9453cc3af25f71ecacf0a618208346011&scene=21#wechat_redirect)》

0104-《[如何使用Cloudera Manager禁用YARN的HA](http://mp.weixin.qq.com/s?__biz=MzI4OTY3MTUyNg==&mid=2247486224&idx=1&sn=b59139109ce7f05c621e4ba83059be09&chksm=ec2adb19db5d520f0d2c2ce80bb166ba56d9dbaded0c75fdb7bcc397545f9105829f140cb47e&scene=21#wechat_redirect)》

0117-《[如何修改CDH集群的DataNoe节点HOSTNAME](http://mp.weixin.qq.com/s?__biz=MzI4OTY3MTUyNg==&mid=2247486485&idx=1&sn=d2bc57da0d0f4ece911554c7396c9a41&chksm=ec2adc1cdb5d550a56f0faf43f43d833f1076ad7458e50eaab9fca1a933b81a556d8b1037c14&scene=21#wechat_redirect)》

0163-《[如何修改CDH集群的IP地址](http://mp.weixin.qq.com/s?__biz=MzI4OTY3MTUyNg==&mid=2247487280&idx=1&sn=52e9fdc58a880c6450763831eee28225&chksm=ec2adf39db5d562feb479c3341916f73fa20df4510a2974be5ca96f4458a036dc66100ad357b&scene=21#wechat_redirect)》

0187- 《[如何降级Cloudera Manager和CDH](http://mp.weixin.qq.com/s?__biz=MzI4OTY3MTUyNg==&mid=2247487785&idx=1&sn=267ee966e531d68c7a2164d19494db93&chksm=ec2ac120db5d4836dde6f0625ba71eadcef87790aff10c6124e26f59c0062e1c6b19ed9cb61d&scene=21#wechat_redirect)》

0271- 《[如何修改Kerberos的CDH集群的HOSTNAME](http://mp.weixin.qq.com/s?__biz=MzI4OTY3MTUyNg==&mid=2247489870&idx=1&sn=aa876289f09916b14b8528f01b172c7f&chksm=ec2ac947db5d4051bacc8c7a93fb7daf0b4ccb0134933f43e65764b3ed87875c413b4d1afb33&scene=21#wechat_redirect)》

0297- 《[如何在CDH集群外配置非Kerberos环境的Gateway节点](http://mp.weixin.qq.com/s?__biz=MzI4OTY3MTUyNg==&mid=2247490591&idx=1&sn=d8da8404cffb1169a27892102f1cd598&chksm=ec2acc16db5d45007c0689a6062689070936f43ac278e869686a015806ed3cb93d53c585c2e0&scene=21#wechat_redirect)》

0300- 《[如何在CDH集群中为数据节点热插拔硬盘](http://mp.weixin.qq.com/s?__biz=MzI4OTY3MTUyNg==&mid=2247490670&idx=1&sn=3160c8469ee0b0984916282954365c92&chksm=ec2acc67db5d4571f648ca726d0cae5bb0f4c4a535af007a2ffd6f363e0c7b3033af92e70d5f&scene=21#wechat_redirect)》

0306- 《[如何在CDH集群外配置Kerberos环境的Gateway节点](http://mp.weixin.qq.com/s?__biz=MzI4OTY3MTUyNg==&mid=2247490795&idx=1&sn=e17c0574c2c6a4a58256de1ba7ff83bc&chksm=ec2acce2db5d45f43902903b1e420576e5e552d5b3fd7fa7f5196d3b5dcab1fbbf84386a6096&scene=21#wechat_redirect)》

0311- 《[如何在CDH集群外配置非Kerberos环境的Spark2和Kafka客户端环境](http://mp.weixin.qq.com/s?__biz=MzI4OTY3MTUyNg==&mid=2247490925&idx=1&sn=d447f08bcd5adc0b0ae6e25b502dd6dc&chksm=ec2acd64db5d447272a5f76c904a6c30df0d2002a013becf9cefdb924b9268fcfc3ec26b15da&scene=21#wechat_redirect)》

0314- 《[如何在CDH集群外配置Kerberos环境的Spark2和Kafka客户端环境](http://mp.weixin.qq.com/s?__biz=MzI4OTY3MTUyNg==&mid=2247490974&idx=1&sn=bda1eff02b0c7bcad17267f09f22a8b0&chksm=ec2acd97db5d4481ea66f197b11223bc13780464f8e94880671956ff183e4291c137320ab968&scene=21#wechat_redirect)》

0332- 《[如何修改CDH集群元数据库地址](http://mp.weixin.qq.com/s?__biz=MzI4OTY3MTUyNg==&mid=2247491423&idx=1&sn=fcab6050eab8832e3100b600061a3ad7&chksm=ec2acf56db5d4640af341aa85304678acff2167dbfddc23ea8a4fd7b3326b12f19e62612f14e&scene=21#wechat_redirect)》

0349- 《[如何迁移CDH的opt目录](http://mp.weixin.qq.com/s?__biz=MzI4OTY3MTUyNg==&mid=2247491727&idx=1&sn=c11f9e1ef59bebe4d4db899c0b75d54c&chksm=ec293086db5eb990fd66a7ff09e8a9d0c4cbc083f822de29db840a11b6010beaa06af88afb2b&scene=21#wechat_redirect)》

### 3.5.异常分析

0023-《[HOSTS配置问题导致集群异常故障分析](http://mp.weixin.qq.com/s?__biz=MzI4OTY3MTUyNg==&mid=2247484385&idx=1&sn=9f78cecfd7430960af0e9f8027018a45&chksm=ec2ad3e8db5d5afeebda6d24a9cb95f83c444f1ed3d1aaaa3110b8b39ff39dfb279bbaaef8ed&scene=21#wechat_redirect)》

0034-《[CM启动报InnoDB engine not found分析](http://mp.weixin.qq.com/s?__biz=MzI4OTY3MTUyNg==&mid=2247484859&idx=1&sn=ef08edb6a30379b8297554fcaa69f329&chksm=ec2ad5b2db5d5ca430b83017ed8323f1b645ae27f4e738154682557aeee1252f6dd15d720c4b&scene=21#wechat_redirect)》

0044-《[CDH高可用集群误删NameNode故障恢复](http://mp.weixin.qq.com/s?__biz=MzI4OTY3MTUyNg==&mid=2247485038&idx=1&sn=89a425c250e8500d1a5e698438f0b69c&chksm=ec2ad667db5d5f71e2bf63f3a5a61e69c22b9f5da3105c5c7341b405418f814e006da3c8d629&scene=21#wechat_redirect)》

0086-《[Cloudera Manager Server服务在RedHat7状态显示异常分析](http://mp.weixin.qq.com/s?__biz=MzI4OTY3MTUyNg==&mid=2247485834&idx=1&sn=d93c2a3d407988c00063eaa2f721cc5f&chksm=ec2ad983db5d509521c420bcbdbf333bf3a8792bda31188bd82f7089b5509c0ad45d9c9fea51&scene=21#wechat_redirect)》

0170- 《[Cloudera Manager分发Parcel异常分析](http://mp.weixin.qq.com/s?__biz=MzI4OTY3MTUyNg==&mid=2247487430&idx=1&sn=a24ce6f41265134fa04364c9cbf8cb9f&chksm=ec2adfcfdb5d56d92be2e94fb7f9c9610d008a2db920d25c4d40a98168e2f6091454d58eb337&scene=21#wechat_redirect)》

0196- 《[CDH内存调拨过度警告分析](http://mp.weixin.qq.com/s?__biz=MzI4OTY3MTUyNg==&mid=2247487957&idx=1&sn=fa0e6201ad4183d4f4ed5ecfc8b5ee93&chksm=ec2ac1dcdb5d48ca9b9e1ccc30b61b9536ec39244dc6d7acf2a453d96f33e9055b225a4336f8&scene=21#wechat_redirect)》

0350- 《[Redhat7.4安装CDH6.0_beta1时分发Parcel异常分析](http://mp.weixin.qq.com/s?__biz=MzI4OTY3MTUyNg==&mid=2247491764&idx=1&sn=14c1f412f1897761bec7ee5bcf221a7f&chksm=ec2930bddb5eb9abff172473430a3c65144434c4997b11db72b8225e876fad73afd76ee64fd1&scene=21#wechat_redirect)》



## 4.Navigator

### 4.1.Navigator安装

0197- 《[Cloudera Navigator介绍与安装](http://mp.weixin.qq.com/s?__biz=MzI4OTY3MTUyNg==&mid=2247487976&idx=1&sn=76c5f7ceb1fb30d839d62ef0a25d2960&chksm=ec2ac1e1db5d48f7ff50545e01d793bd8da3382a566b76805275b12209cd681c66fdb8ef2ac3&scene=21#wechat_redirect)》

### 4.2.Navigator使用

0203- 《[Navigator的使用](http://mp.weixin.qq.com/s?__biz=MzI4OTY3MTUyNg==&mid=2247488174&idx=1&sn=9833a4a6e7c48a1f7ded9f998d320122&chksm=ec2ac2a7db5d4bb1045fa13f6444f54cb85532031b97b87389313111835dc0b45295c10f358b&scene=21#wechat_redirect)》

0205- 《[Cloudera Navigator异常分析](http://mp.weixin.qq.com/s?__biz=MzI4OTY3MTUyNg==&mid=2247488207&idx=1&sn=fe765d6bb8b6e1b6f4909f1996843fe1&chksm=ec2ac2c6db5d4bd04dbfbbe962e48f39f3f8a3402209ffa702bb3210291acb94b4749baf5ca4&scene=21#wechat_redirect)》

## 5.数据科学

### 5.1.基础环境

0012-《[什么是数据科学工作台？为什么数据科学家需要它？](http://mp.weixin.qq.com/s?__biz=MzI4OTY3MTUyNg==&mid=2247484180&idx=1&sn=76e859f93fd8c25ce08de2589dea96da&chksm=ec2ad31ddb5d5a0b311fba0193b24605b61d712b86cfd6eb48c592d181c602655fcd8447419b&scene=21#wechat_redirect)》

0038-《[如何在CDH集群安装Anaconda&搭建Python私有源](http://mp.weixin.qq.com/s?__biz=MzI4OTY3MTUyNg==&mid=2247484963&idx=1&sn=3fbfcecc6c80be41538437fa046cac83&chksm=ec2ad62adb5d5f3c4825415472a3f30c3be62da2259d25aa721f95e74c17955f94c4be8e1852&scene=21#wechat_redirect)》

0049-《[什么是sparklyr](http://mp.weixin.qq.com/s?__biz=MzI4OTY3MTUyNg==&mid=2247485126&idx=1&sn=676f4bbfe8b6e000e02f7176f913cb23&chksm=ec2ad6cfdb5d5fd9f85f88e462cf187262e44e6c0be3e78a4f0fbc7b189e54461a851c45336b&scene=21#wechat_redirect)》

0050-《[如何在Redhat中配置R环境](http://mp.weixin.qq.com/s?__biz=MzI4OTY3MTUyNg==&mid=2247485165&idx=1&sn=609644a6118481ec09b6be036e20e0e6&chksm=ec2ad6e4db5d5ff2b0bba4c85cdf838feeb56e31d50250ac095e4e7fef871b624a7512a8bb1c&scene=21#wechat_redirect)》

0051-《[如何在Redhat中安装R的包及搭建R的私有源](http://mp.weixin.qq.com/s?__biz=MzI4OTY3MTUyNg==&mid=2247485176&idx=1&sn=cc846c81d4f701c07144f566ae2ef72d&chksm=ec2ad6f1db5d5fe79a5cf632e0fa66d19518d36ac399d658bcaab2211e0e5020edc2d00f8923&scene=21#wechat_redirect)》

0052-《[如何使用R连接Hive与Impala](http://mp.weixin.qq.com/s?__biz=MzI4OTY3MTUyNg==&mid=2247485199&idx=1&sn=cef0ced75ff7727c6a9b7c7289dd84db&chksm=ec2ad706db5d5e1009a337368e8ee8a56c7a121e297efcfc98e026cdba6d8fd3cc3712ab7046&scene=21#wechat_redirect)》

0057-《[PySpark数据类型转换异常分析](http://mp.weixin.qq.com/s?__biz=MzI4OTY3MTUyNg==&mid=2247485229&idx=1&sn=2e0c485de52499919398b90277a01e48&chksm=ec2ad724db5d5e32ae725b8a1760962c495a56193f836aec519540d5a97503da626fda112f80&scene=21#wechat_redirect)》

0118-《[如何在CDH集群上部署Python3运行环境及运行Python作业](http://mp.weixin.qq.com/s?__biz=MzI4OTY3MTUyNg==&mid=2247486512&idx=1&sn=1c90ba2b5812bcdae79279e8283367d4&chksm=ec2adc39db5d552f88909c2d149f99301ad1b0a3d70466ecf0709ef811c74cbbcb1d5f2d9177&scene=21#wechat_redirect)》

0334- 《[CDH集群升级Python3异常问题分析](http://mp.weixin.qq.com/s?__biz=MzI4OTY3MTUyNg==&mid=2247491452&idx=1&sn=44242b766bb85ef0bd1dc3b5cde7821f&chksm=ec2acf75db5d4663efb3d4e7f88139b27ac3177d7a081e978ea68725d8247880780be285b328&scene=21#wechat_redirect)》

0339- 《[Python3环境通过JDBC访问非Kerberos环境的Hive](http://mp.weixin.qq.com/s?__biz=MzI4OTY3MTUyNg==&mid=2247491597&idx=1&sn=e57c0a370da85b590cba389713d7e338&chksm=ec293004db5eb912698941220d77f4ca14ce2bc51cb35573caf8ab1990a480a0560c554b6a5a&scene=21#wechat_redirect)》

0340- 《[Python3通过JDBC访问非Kerberos环境的Impala](http://mp.weixin.qq.com/s?__biz=MzI4OTY3MTUyNg==&mid=2247491607&idx=1&sn=811e207bfeb6bad316b77b70afe7258d&chksm=ec29301edb5eb9086110a9760c179ee064f3f6a1d1cfe7c900090a75023b90dcb1150a4a9e02&scene=21#wechat_redirect)》



### 5.2.CDSW

#### 5.2.1.安装







0037-《[如何在Windows Server2008搭建DNS服务并配置泛域名解析](http://mp.weixin.qq.com/s?__biz=MzI4OTY3MTUyNg==&mid=2247484962&idx=1&sn=8ff9542fa7359a8752c4460c699efd97&chksm=ec2ad62bdb5d5f3d3cb1305dd0b52433fd3174243ca40d495a5adb57d2fabaa27ed3844f25fa&scene=21#wechat_redirect)》

0047-《[如何利用Dnsmasq构建小型集群的本地DNS服务器](http://mp.weixin.qq.com/s?__biz=MzI4OTY3MTUyNg==&mid=2247485109&idx=1&sn=3d5a8e35e72468fcf2857d76903c85f3&chksm=ec2ad6bcdb5d5faab9c20baa96e55b98ca891398b084c5a46aeebefbc6994a9e518b68bb9685&scene=21#wechat_redirect)》

0077-《[如何在Windows Server2012搭建DNS服务并配置泛域名解析](http://mp.weixin.qq.com/s?__biz=MzI4OTY3MTUyNg==&mid=2247485679&idx=1&sn=c641d6f5fa5da2ed897a4e04d641bfb8&chksm=ec2ad8e6db5d51f0791f0d3aadc30a9a8edf6be4050ecbbad260a8efa21b49549ac9c29dbcef&scene=21#wechat_redirect)》

0078-《[如何在CDH5.13中安装CDSW1.2](http://mp.weixin.qq.com/s?__biz=MzI4OTY3MTUyNg==&mid=2247485710&idx=1&sn=eedcbbf0fe26e97bfbf59aaf08cd8151&chksm=ec2ad907db5d5011dfab0b8b99b556a61492a45e20ef95c5dbde402d0f55748ff8c9deecf0dd&scene=21#wechat_redirect)》

0172- 《[如何在RedHat6上使用Bind搭建DNS服务](http://mp.weixin.qq.com/s?__biz=MzI4OTY3MTUyNg==&mid=2247487475&idx=1&sn=27fd1b2a05c28b11d646447b3917fc8a&chksm=ec2adffadb5d56ecde23360f42eea54cf879ccc6ef30ee6197195ebddb279b6770c2bedf69e6&scene=21#wechat_redirect)》

0174- 《[如何在RedHat7上使用Bind搭建DNS服务](http://mp.weixin.qq.com/s?__biz=MzI4OTY3MTUyNg==&mid=2247487533&idx=1&sn=2e89de7b54e3569167f24269690b444f&chksm=ec2ac024db5d49321393f8adf14e2cf4e476f329680854c3b73ca0a6c4fc2ae6d36a1199bec6&scene=21#wechat_redirect)》

0323- 《[如何在CDH5.14中安装CDSW1.3](http://mp.weixin.qq.com/s?__biz=MzI4OTY3MTUyNg==&mid=2247491255&idx=1&sn=34ba394dd86062c219e57b0438a9e25c&chksm=ec2acebedb5d47a8d0f58bcf13d51b48848ae85e62bf7ee2ce359c0cced027342c0f22588a56&scene=21#wechat_redirect)》

0325- 《[如何在CDH5.15中安装CDSW1.4](http://mp.weixin.qq.com/s?__biz=MzI4OTY3MTUyNg==&mid=2247491312&idx=1&sn=33c8a1e61ba350118abc8f0dc83062b6&chksm=ec2acef9db5d47ef53763921624e3221589d89dee960869fe3818cf4b1e5822652f37bda4d8e&scene=21#wechat_redirect)》



#### 5.2.2.产品介绍







0063-《[CDSW1.2的新功能](http://mp.weixin.qq.com/s?__biz=MzI4OTY3MTUyNg==&mid=2247485332&idx=1&sn=98a60bdedce8564b803d6e1332337177&chksm=ec2ad79ddb5d5e8bbcbda60c74a052d2fcdd64b58770db7f8399630e210ec50a144e54ec2a98&scene=21#wechat_redirect)》

0165-《[CDSW1.3的新功能](http://mp.weixin.qq.com/s?__biz=MzI4OTY3MTUyNg==&mid=2247487330&idx=1&sn=9411766eeb1c4436035fe7d8a9bcdb91&chksm=ec2adf6bdb5d567d06ff59d83808a705d6421bdee5947a35600ea64d21e79169c9c1ca9cef75&scene=21#wechat_redirect)》

0304- 《[如何在CDSW中使用GPU运行深度学习](http://mp.weixin.qq.com/s?__biz=MzI4OTY3MTUyNg==&mid=2247490770&idx=1&sn=72510ab1f8a28550b359e60d9502bfce&chksm=ec2accdbdb5d45cdf7481584df243aa96db41ce49015e4cf7ca6514e9298afcf5c7d1e760abf&scene=21#wechat_redirect)》

0313- 《[CDSW1.4的新功能](http://mp.weixin.qq.com/s?__biz=MzI4OTY3MTUyNg==&mid=2247490946&idx=1&sn=9c0c5d7e97e19bffe345be0d00cff6b1&chksm=ec2acd8bdb5d449d12b2ab6bdca858155634a66194f74fd897fb7fdce8f3f4ab7a6f0f1f8658&scene=21#wechat_redirect)》

0355- 《[Hadoop之上的模型训练 - CDSW1.4新功能模块](http://mp.weixin.qq.com/s?__biz=MzI4OTY3MTUyNg==&mid=2247491833&idx=2&sn=744a4e93b97710b0bedbb73057a8be2b&chksm=ec2930f0db5eb9e6913e0f94f5e61f469775f7281791a6bce1c162f9120e7653450c1711394f&scene=21#wechat_redirect)》

0357- 《[Hadoop之上的模型部署 - CDSW1.4新功能模块](http://mp.weixin.qq.com/s?__biz=MzI4OTY3MTUyNg==&mid=2247491860&idx=1&sn=758465807819730053a5b0a0905f2a00&chksm=ec29311ddb5eb80b11baf2e147e33e55143951df251bf36cc6bb5fea4291f9c010bd6c45033a&scene=21#wechat_redirect)》



#### 5.2.3.使用







0042-《[如何在CDSW中使用R绘制直方图](http://mp.weixin.qq.com/s?__biz=MzI4OTY3MTUyNg==&mid=2247484991&idx=1&sn=c0b40a128650f29337f7da00042657d3&chksm=ec2ad636db5d5f206a50a04e6c7d97781587fa57cf2c434d2a1e6d2e68fa059f449673c8b250&scene=21#wechat_redirect)》

0054-《[如何使用CDSW在CDH集群通过sparklyr提交R的Spark作业](http://mp.weixin.qq.com/s?__biz=MzI4OTY3MTUyNg==&mid=2247485219&idx=1&sn=b58d5dc9422b49dedb60882b4243bec1&chksm=ec2ad72adb5d5e3c237489db13fbd976f4798b1f161c6b82bc8aa45caf8e2ddc6366fea9ef7e&scene=21#wechat_redirect)》

0055-《[如何使用CDSW在CDH中分布式运行所有R代码](http://mp.weixin.qq.com/s?__biz=MzI4OTY3MTUyNg==&mid=2247485227&idx=1&sn=8873abfeddc8f3c04a4b640baa955a65&chksm=ec2ad722db5d5e34897733bfe0e405665c14f87ac733c577ba4ac366f576a4c1824f970d8206&scene=21#wechat_redirect)》

0059-《[如何基于CDSW基础镜像定制Docker](http://mp.weixin.qq.com/s?__biz=MzI4OTY3MTUyNg==&mid=2247485304&idx=1&sn=96a6e7c66c20c04ec74eedf92b23daf8&chksm=ec2ad771db5d5e67688044a007588413f4c7a9032a20069fb35767b1759ef8b2687eae3c0ce9&scene=21#wechat_redirect)》

0151-《[如何使用Nginx实现CDSW的跨网段访问](http://mp.weixin.qq.com/s?__biz=MzI4OTY3MTUyNg==&mid=2247487119&idx=1&sn=034fd8c0571547a437546c6ca1462c78&chksm=ec2ade86db5d5790158cc4fbff98d73f31cd1a048194e56ddf20af182553931cb9ca1f79d7be&scene=21#wechat_redirect)》

0156-《[如何修改CDSW服务的DNS和HOSTNAME](http://mp.weixin.qq.com/s?__biz=MzI4OTY3MTUyNg==&mid=2247487173&idx=1&sn=fadd5d8814fea44314af54a93f4d0459&chksm=ec2adeccdb5d57da9928c2fe5bc620fbeee39c551b1280f17cdf5bb7534bf1fd6e889f765fe3&scene=21#wechat_redirect)》

0159-《[如何在CDSW上运行TensorFlow](http://mp.weixin.qq.com/s?__biz=MzI4OTY3MTUyNg==&mid=2247487255&idx=1&sn=27c80ed149d05913a6b696f281f66d3e&chksm=ec2adf1edb5d5608c418aeb0bcd9d249462d8bedb14a963e303d7ad57bd929fda98a9f841f71&scene=21#wechat_redirect)》

0161-《[如何在CDSW中定制Docker镜像](http://mp.weixin.qq.com/s?__biz=MzI4OTY3MTUyNg==&mid=2247487266&idx=1&sn=af6f9cea810b1add3d01f78231b55eee&chksm=ec2adf2bdb5d563de2fccde915b6a75e43acc63303cce6dbd5a4e7ed494d221a12e97d844ad5&scene=21#wechat_redirect)》

0175- 《[如何在CDSW上创建Git工程](http://mp.weixin.qq.com/s?__biz=MzI4OTY3MTUyNg==&mid=2247487569&idx=1&sn=07e5cb5c2a262a72a2fbae5b5d5393fe&chksm=ec2ac058db5d494e357e8f54f85aa04c2715574f76f312a650122b129a014785dda5fd5ad3bd&scene=21#wechat_redirect)》

0265- 《[如何在CDSW上创建Git工程并提交代码](http://mp.weixin.qq.com/s?__biz=MzI4OTY3MTUyNg==&mid=2247489629&idx=1&sn=2578aca6f9bbe5d6a2aeea1872ceb49c&chksm=ec2ac854db5d414287cde21c4e08968652d15e095d91db37bf699b11bf1e10730f40f127f988&scene=21#wechat_redirect)》

0327- 《[如何在CDH中使用PySpark分布式运行GridSearch算法](http://mp.weixin.qq.com/s?__biz=MzI4OTY3MTUyNg==&mid=2247491339&idx=1&sn=0c639f2f7901fc3cd8d79953e4cc6c0f&chksm=ec2acf02db5d46148af82b724e8c8c27c16491df4fb877265ab0f9df03b9f930436336ce7434&scene=21#wechat_redirect)》

0331- 《[如何在CDSW上分布式运行GridSearch算法](http://mp.weixin.qq.com/s?__biz=MzI4OTY3MTUyNg==&mid=2247491400&idx=1&sn=306a79f7c6bdd86a825b81fdc0dd5676&chksm=ec2acf41db5d4657dad052be2f77de61dd8da902551f9ff10eee7640a302cdab3fa41e194cfd&scene=21#wechat_redirect)》

0333- 《[如何在CDSW上调试失败或卡住的Spark应用](http://mp.weixin.qq.com/s?__biz=MzI4OTY3MTUyNg==&mid=2247491436&idx=1&sn=3c2b5259d9a5137afb7e9a643cc49814&chksm=ec2acf65db5d4673c342a759a9da0128f8faf7d1f17cbc340aafb8000e5a9644e67cf211e46c&scene=21#wechat_redirect)》

0347- 《[后台查找CDSW中用户的审计日志](http://mp.weixin.qq.com/s?__biz=MzI4OTY3MTUyNg==&mid=2247491708&idx=1&sn=0ed8d8ef39b96fe8bbb23ecebd62d97c&chksm=ec293075db5eb963957e1012fd973d1d2a33c3161616000b43326c5b4be3929397e561b750c2&scene=21#wechat_redirect)》

0350- 《[如何通过CM将CDSW从1.3升级至1.4](http://mp.weixin.qq.com/s?__biz=MzI4OTY3MTUyNg==&mid=2247491795&idx=1&sn=63ac142824eb4e5adb2da508925d14ec&chksm=ec2930dadb5eb9cc2ab1b71a73a2c6ca8357058ee0ac06c32dab47dde6b479673595c4432e0e&scene=21#wechat_redirect)》

0356- 《[CDSW1.4的Experiments功能使用](http://mp.weixin.qq.com/s?__biz=MzI4OTY3MTUyNg==&mid=2247491849&idx=1&sn=0dcc52377a65c3e0a3c7e9859a294bdb&chksm=ec293100db5eb816f4d712ca24b3d9e0ebbbf2c1c8348e0561c7e98be2cca6dfae1cfc225dec&scene=21#wechat_redirect)》

0358- 《[CDSW1.4的Models功能-创建和部署模型(QuickStart)](http://mp.weixin.qq.com/s?__biz=MzI4OTY3MTUyNg==&mid=2247491879&idx=1&sn=2dc84c5b272bf42190df334116f6d91a&chksm=ec29312edb5eb8387883a6a004936daeeb4a0bdba09c5a422e3f87fa0c6e349b8994899d5f78&scene=21#wechat_redirect)》

0359- 《[模型训练和部署-Iris数据集](http://mp.weixin.qq.com/s?__biz=MzI4OTY3MTUyNg==&mid=2247491903&idx=1&sn=94149f9f5af93bf34a69e393948d903e&chksm=ec293136db5eb8203186e848466333b5060112c5ca806c709f845f33c12f90105af90852f003&scene=21#wechat_redirect)》



## 6.元数据库

### 6.1.MySQL



0029-《[如何实现CDH元数据库MySQL的主备](http://mp.weixin.qq.com/s?__biz=MzI4OTY3MTUyNg==&mid=2247484806&idx=1&sn=04714c756e0999ec68785a916f9bdbe3&chksm=ec2ad58fdb5d5c9960d690402cab9d010bda3c7c6e8ec2d9687f73771508dd67bd4a9cb8f6f7&scene=21#wechat_redirect)》

0058-《[如何在CDH集群的非元数据库节点安装MySQL5.7.12](http://mp.weixin.qq.com/s?__biz=MzI4OTY3MTUyNg==&mid=2247485244&idx=1&sn=949da5c28b56e36f0f158e824a386750&chksm=ec2ad735db5d5e23c324fa1c18a93e08fa922910b52c5da14ccf5a6fcb22595819917b013b20&scene=21#wechat_redirect)》

0134-《[如何实现CDH元数据库MySQL的主主互备](http://mp.weixin.qq.com/s?__biz=MzI4OTY3MTUyNg==&mid=2247486821&idx=1&sn=0df0720a5c1b6b52678d83d55147646b&chksm=ec2add6cdb5d547a32762d324a75e979b3b256e64a5ced43d9f0ec3516b3ea4e856ac4901289&scene=21#wechat_redirect)》

0135-《[如何实现CDH元数据库MySQL的高可用](http://mp.weixin.qq.com/s?__biz=MzI4OTY3MTUyNg==&mid=2247486857&idx=1&sn=9f980c677ec0b32466829ece7c55761b&chksm=ec2add80db5d5496a30ad518e067be74ab138570144b92ea63bef7cd7b8b0710b68d40a4f62e&scene=21#wechat_redirect)》

0136-《[如何修改CM及CDH元数据库配置](http://mp.weixin.qq.com/s?__biz=MzI4OTY3MTUyNg==&mid=2247486877&idx=1&sn=38a36ed5dfd8f60b1513b2414163c7b0&chksm=ec2add94db5d54821255984e9d4df271cef6bb1d3846f561751c9fe95ecec36471b8ffdd97e6&scene=21#wechat_redirect)》



## 7.Hadoop组件

### 7.1.Hive

0004-《[Hive表字段Comment中文乱码](http://mp.weixin.qq.com/s?__biz=MzI4OTY3MTUyNg==&mid=2247483793&idx=1&sn=d11f5a14de01206507811b295ad70bad&chksm=ec2ad198db5d588e5354d2d4003cd168c78fd1eb7d3fadd6fe4b1a84770496bd5e15a340c731&scene=21#wechat_redirect)》

0010-《[Hive多分隔符支持示例](http://mp.weixin.qq.com/s?__biz=MzI4OTY3MTUyNg==&mid=2247484155&idx=1&sn=ac863cc62a99fa9f3b174f7e5e15aa40&chksm=ec2ad2f2db5d5be4bac04b1a37dba1d85f0c22a92f8709e9bb1fb63ed7635b585cbb26d61243&scene=21#wechat_redirect)》

0011-《[如何在Hive&Impala中使用UDF](http://mp.weixin.qq.com/s?__biz=MzI4OTY3MTUyNg==&mid=2247484173&idx=1&sn=e3eff15c962402831da2064827e8357e&chksm=ec2ad304db5d5a12dd31549610ca8dbdd7e1e3fa84ee9cfd7ff940d2360be343a84c7e2d9a66&scene=21#wechat_redirect)》

0014-《[Hive中的Timestamp类型日期与Impala中显示不一致分析](http://mp.weixin.qq.com/s?__biz=MzI4OTY3MTUyNg==&mid=2247484249&idx=1&sn=2763a473dcbfef1423f2c6b7b500be9c&chksm=ec2ad350db5d5a463f8a8590a6ae150470f18d83a9e69f475685abd898a6e98dba6e1712c818&scene=21#wechat_redirect)》

0026-《[Hive使用十六进制分隔符异常分析](http://mp.weixin.qq.com/s?__biz=MzI4OTY3MTUyNg==&mid=2247484499&idx=1&sn=71ceb41e4a0a3575b9cc233ce0e1bcb2&chksm=ec2ad45adb5d5d4ca681f377909d00f1741a6ab2ccc367229f23e25e1cdffccab22856e73270&scene=21#wechat_redirect)》

0043-《[如何在CDH中使用HPLSQL实现存储过程](http://mp.weixin.qq.com/s?__biz=MzI4OTY3MTUyNg==&mid=2247485033&idx=1&sn=43c4f03a4b22c48afd6b0569eb013147&chksm=ec2ad660db5d5f764cf676a43b7766cb316c4102c66706d28b80569523a5dfef4cb9240fde81&scene=21#wechat_redirect)》

0083-《[如何使用HAProxy实现HiveServer2负载均衡](http://mp.weixin.qq.com/s?__biz=MzI4OTY3MTUyNg==&mid=2247485800&idx=1&sn=13e968108e25fcad2db12b16baf9216b&chksm=ec2ad961db5d5077ee93f0f3f5b7d041de5cc9fec34b7541cc8b2299d77da5cfbc3a15c762a2&scene=21#wechat_redirect)》

0084-《[如何使用Zookeeper实现HiveServer2的HA](http://mp.weixin.qq.com/s?__biz=MzI4OTY3MTUyNg==&mid=2247485808&idx=1&sn=5d8c6c65ed04e750768e5219983f0f75&chksm=ec2ad979db5d506f51637090d51ac55d00f3947b42b6f26d1f2bcb66f95d4679ffa114d8fe95&scene=21#wechat_redirect)》

0099-《[如何使用java代码通过JDBC连接Hive(附github源码)](http://mp.weixin.qq.com/s?__biz=MzI4OTY3MTUyNg==&mid=2247486173&idx=1&sn=abe65e0ab05aa06897d19b4a36c014c6&chksm=ec2adad4db5d53c2cd1a6d6b6c9081f19c12b3745493d0b3eab0e7ae2be08c489f13fd4e9066&scene=21#wechat_redirect)》

0102-《[Hive中的Timestamp类型日期与Impala中显示不一致分析（补充）](http://mp.weixin.qq.com/s?__biz=MzI4OTY3MTUyNg==&mid=2247486217&idx=1&sn=965476a7a1d0ffd16cf5eb6ee4bbb2c6&chksm=ec2adb00db5d5216d20f5a41891da2bf33f19239eac4833fe0238a21371f27949e2935dfe2f2&scene=21#wechat_redirect)》

0144-《[Hive Load本地数据文件异常分析](http://mp.weixin.qq.com/s?__biz=MzI4OTY3MTUyNg==&mid=2247487018&idx=1&sn=d0417adb890c2d851d49e06df4c51500&chksm=ec2ade23db5d57358c9e03af23a5fd9da6e6da5bd9ee1e1c0ccd5e7c10923ecca0361e60199b&scene=21#wechat_redirect)》

0146-《[如何向Hive表加载数据](http://mp.weixin.qq.com/s?__biz=MzI4OTY3MTUyNg==&mid=2247487050&idx=1&sn=adacde2e7a2ead5d54ca71fd1ef5776f&chksm=ec2ade43db5d5755434de14f1872c9f428dc7007cb98506d6f5b3297b7331ffaaebc6ea089a4&scene=21#wechat_redirect)》

0149-《[如何使用java代码通过JDBC访问Sentry环境下的Hive](http://mp.weixin.qq.com/s?__biz=MzI4OTY3MTUyNg==&mid=2247487084&idx=1&sn=505e8f09723f9a65d1b390bc12c63eed&chksm=ec2ade65db5d5773c3830afc43cf783172dcd13c5fec82ef33043ed191493c6b101a0406d5b8&scene=21#wechat_redirect)》

0180- 《[Hive与Impala的关键字](http://mp.weixin.qq.com/s?__biz=MzI4OTY3MTUyNg==&mid=2247487720&idx=1&sn=7b1185134455381a126d8b7a2933701e&chksm=ec2ac0e1db5d49f722dad23dd0c3391c7971ec44d5b0b80e8ba5b84112a513196fcd22f1d70b&scene=21#wechat_redirect)》

0181- 《[如何在Kerberos环境下使用Haproxy实现HiveServer2负载均衡](http://mp.weixin.qq.com/s?__biz=MzI4OTY3MTUyNg==&mid=2247487721&idx=1&sn=f6f2308e4ca3f18e3f9ccf394393dfda&chksm=ec2ac0e0db5d49f6b020d4be73dce3bd3ed5f254b05a77554e3afa6a62bab57376e596cfc244&scene=21#wechat_redirect)》

0190- 《[如何获取Hive正在执行或者已结束的的MapReduce作业的SQL语句](http://mp.weixin.qq.com/s?__biz=MzI4OTY3MTUyNg==&mid=2247487835&idx=1&sn=f3a793f4c6f51ebe03a0d3bea661f2e0&chksm=ec2ac152db5d484484ff438e79fe7535d630e75d30a9d4e26fc0aac4a8587e17400e55dc470c&scene=21#wechat_redirect)》

0204- 《[如何编译及使用hive-testbench生成Hive基准测试数据](http://mp.weixin.qq.com/s?__biz=MzI4OTY3MTUyNg==&mid=2247488190&idx=1&sn=3f34824bdadbfa0823823121f86cafd4&chksm=ec2ac2b7db5d4ba1484d6a6cf3161fdb90798d2605d2e79fa8bf633d32766c42cc8e2b41e206&scene=21#wechat_redirect)》

0210- 《[使用Hive SQL插入动态分区的Parquet表OOM异常分析](http://mp.weixin.qq.com/s?__biz=MzI4OTY3MTUyNg==&mid=2247488282&idx=1&sn=e1da38f69ba3ab38aff476daed5eb983&chksm=ec2ac313db5d4a05081e92a26fd0a5527db377976f37db7a61007b6138aeacc739f57d4e0555&scene=21#wechat_redirect)》

0240- 《[如何使用HAProxy实现HiveServer2服务的LDAP和Kerberos认证负载均衡](http://mp.weixin.qq.com/s?__biz=MzI4OTY3MTUyNg==&mid=2247489065&idx=1&sn=68ebc8a1d7010d331962a358a9748775&chksm=ec2ac620db5d4f36d9e0620a4e73b4e0a2f870a926ef6037ec8fb4b50c9bbd751166ffd23dca&scene=21#wechat_redirect)》

0246- 《[在同时使用Hive+Sentry,因HMS死锁导致的高并发写入工作负载时,查询速度缓慢或者停滞](http://mp.weixin.qq.com/s?__biz=MzI4OTY3MTUyNg==&mid=2247489158&idx=1&sn=a841bd1823e6859f1d50a637ba47d072&chksm=ec2ac68fdb5d4f99aec7aba780d15c9e10730dc7778f8801a6ecfd6eef72f4e0a152d8f47408&scene=21#wechat_redirect)》

0247- 《[Parquet格式表重命名列名后Hive查询列数据显示NULL异常分析](http://mp.weixin.qq.com/s?__biz=MzI4OTY3MTUyNg==&mid=2247489169&idx=1&sn=22e0fee6c83de261763930321dfcfc8d&chksm=ec2ac698db5d4f8e917ec5f9ad97de0f770806dd31ef61f48fdb228f722452d337991ad60377&scene=21#wechat_redirect)》

0249- 《[如何在CDH集群中安装Hive2.3.3](http://mp.weixin.qq.com/s?__biz=MzI4OTY3MTUyNg==&mid=2247489211&idx=1&sn=d4900efbe5c9f311ad7d9d39e1466a4a&chksm=ec2ac6b2db5d4fa4f4b00ad6ab38e76fd0dfdec42c84b0a87dd013cd058588e365e2ea47e3f8&scene=21#wechat_redirect)》

0250- 《[如何在Hive中生成Parquet表](http://mp.weixin.qq.com/s?__biz=MzI4OTY3MTUyNg==&mid=2247489244&idx=1&sn=476b0a12d6a665729e0c739047bd91c6&chksm=ec2ac6d5db5d4fc3760d8d3438c720aca9ee9df6cc6964304a8559838be1809a90a66da2b44c&scene=21#wechat_redirect)》

0261- 《[如何强制Hive使用指定时区而非操作系统时区](http://mp.weixin.qq.com/s?__biz=MzI4OTY3MTUyNg==&mid=2247489551&idx=1&sn=ecfb9b470ee23aef41b8df8f5d0a65ee&chksm=ec2ac806db5d41103dd74abda76eb76749a183f2fd56a05dfd72f1597e35acfe893ad8c168bf&scene=21#wechat_redirect)》

0263- 《[Hive2.2.0如何与CDH集群中的Spark1.6集成](http://mp.weixin.qq.com/s?__biz=MzI4OTY3MTUyNg==&mid=2247489577&idx=1&sn=c14f4d1f594b67c3e41debced078f0ac&chksm=ec2ac820db5d41368798ba510ef1e4ebab50d2dd8874ad7590f35e930ae071f0422ed84d547d&scene=21#wechat_redirect)》

0315- 《[如何为Hive2启用Kerberos认证](http://mp.weixin.qq.com/s?__biz=MzI4OTY3MTUyNg==&mid=2247490986&idx=1&sn=7cf5bb15aab041703ee00348414df91f&chksm=ec2acda3db5d44b5b09f9f1098a4aecb83a47332cfa9dc8427f72a780b379fa57d2bda32d1d4&scene=21#wechat_redirect)》

0343- 《[HiveServer2服务异常日志分析](http://mp.weixin.qq.com/s?__biz=MzI4OTY3MTUyNg==&mid=2247491634&idx=1&sn=b0f4022546bf21c9e2be2559238125ad&chksm=ec29303bdb5eb92dbbaa11b7823f68e657cb5d8c9a7f610d7560194143d3213f6ef5fa8c952d&scene=21#wechat_redirect)》

0364- 《[如何使用Nginx实现HiveServer2负载均衡](http://mp.weixin.qq.com/s?__biz=MzI4OTY3MTUyNg==&mid=2247491993&idx=2&sn=a2adc2a0d1528adebdbe478ab1420b5a&chksm=ec293190db5eb8868b7d63d5df6e663f6f14fd1b57cb4aff69e4148197657f4cdedbb81892ad&scene=21#wechat_redirect)》



### 7.2.Impala



0039-《[如何使用Python Impyla客户端连接Hive和Impala](http://mp.weixin.qq.com/s?__biz=MzI4OTY3MTUyNg==&mid=2247484964&idx=1&sn=4d766e476632aefe6ef4ced9adfe8b9c&chksm=ec2ad62ddb5d5f3b9405069c19fbc7ce3e32147526732a14874ba9f5c1b4037fb2a3c9b272b4&scene=21#wechat_redirect)》

0070-《[如何使用Beeline连接Impala](http://mp.weixin.qq.com/s?__biz=MzI4OTY3MTUyNg==&mid=2247485477&idx=1&sn=a3a9805fd51acd11352926e99680b01f&chksm=ec2ad82cdb5d513aedf059d1e08e9beb4be25c58c6edb149a91893016f2764484804f859ccc4&scene=21#wechat_redirect)》

0081-《[如何使用Nginx实现Impala负载均衡](http://mp.weixin.qq.com/s?__biz=MzI4OTY3MTUyNg==&mid=2247485775&idx=1&sn=fddf2d54e1f715a53a4901db9524d4ea&chksm=ec2ad946db5d50508dfce75e702d906540abf8f8259604d9c5eed98a38ac386b87bea1496908&scene=21#wechat_redirect)》

0082-《[如何使用HAProxy实现Impala的负载均衡](http://mp.weixin.qq.com/s?__biz=MzI4OTY3MTUyNg==&mid=2247485788&idx=1&sn=c37d0e3cd7688d90bfa9f93c81eaf3c9&chksm=ec2ad955db5d5043f808294c4a3c1f8e7a06e57c280ebf2a7b555cd5ca172d9211f4fe6958a9&scene=21#wechat_redirect)》

0097-《[如何使用java代码通过JDBC连接Impala(附Github源码)](http://mp.weixin.qq.com/s?__biz=MzI4OTY3MTUyNg==&mid=2247486137&idx=1&sn=1909e83e4196b6d0d3bdd083c7e373ac&chksm=ec2adab0db5d53a636501d63ceb66d538732bbaa4a3e6a1fd7526bc01fe80528e416898796a1&scene=21#wechat_redirect)》

0113-《[Impala升级为Apache顶级项目](http://mp.weixin.qq.com/s?__biz=MzI4OTY3MTUyNg==&mid=2247486393&idx=1&sn=578c179e12c0a4c3d5c12c7750e22a11&chksm=ec2adbb0db5d52a6fd700a5f3b7eb8a3eeaae34a589ed6deb1b78df2e211fc5da17defd17b75&scene=21#wechat_redirect)》

0124-《[如何使用HAProxy实现Kerberos环境下的Impala负载均衡](http://mp.weixin.qq.com/s?__biz=MzI4OTY3MTUyNg==&mid=2247486616&idx=1&sn=980a09cdfc2ef76db0a7ef3c0f0adebc&chksm=ec2adc91db5d55878077c671c0051543facb8f997ff6c04ed0f04338d1f394e32a8a948216b6&scene=21#wechat_redirect)》

0131-《[如何在Kerberos的Linux上安装及配置Impala的ODBC驱动](http://mp.weixin.qq.com/s?__biz=MzI4OTY3MTUyNg==&mid=2247486776&idx=1&sn=66b65d0663f5bd456db0c462bc967888&chksm=ec2add31db5d542756e31b2da064bdca57d899de45a90834d3b900f67dc521a9bf21adbd9509&scene=21#wechat_redirect)》

0147-《[如何使用Java访问集成OpenLDAP并启用Sentry的Impala和Hive](http://mp.weixin.qq.com/s?__biz=MzI4OTY3MTUyNg==&mid=2247487064&idx=1&sn=c02bfcd54696ad82f7db01061bfc8937&chksm=ec2ade51db5d574735dd1ebd0eaef82eed5676d40ff1a1510513634af5f906227700d8366136&scene=21#wechat_redirect)》

0154-《[如何在Impala中实现拉链表](http://mp.weixin.qq.com/s?__biz=MzI4OTY3MTUyNg==&mid=2247487145&idx=1&sn=c97cd183dd77268b96f6095f659c0c7b&chksm=ec2adea0db5d57b670c8f1a94775b558896e26e7ba27de01c7042479968e6a67073ea77de7a9&scene=21#wechat_redirect)》

0162-《[使用Java代码通过JDBC连接只启用Sentry的Impala异常分析](http://mp.weixin.qq.com/s?__biz=MzI4OTY3MTUyNg==&mid=2247487267&idx=1&sn=1668b7e7ec3d61fee17ecfb181853aaa&chksm=ec2adf2adb5d563c62b6a5d55323e8b7a927beb9211c7f2d17474517e859b339223b5edcb7dc&scene=21#wechat_redirect)》

0206- 《[Impala的Short-Circuit Reads](http://mp.weixin.qq.com/s?__biz=MzI4OTY3MTUyNg==&mid=2247488216&idx=1&sn=3e464809a1122fc4f7c4dbbb0facbe9c&chksm=ec2ac2d1db5d4bc781009aab3d6d919ed36b5763a1cef84ff40c357a5491a034616c15012117&scene=21#wechat_redirect)》

0224- 《[Hive与Impala对VARCHAR/CHAR存放中文字符解析不一致问题分析](http://mp.weixin.qq.com/s?__biz=MzI4OTY3MTUyNg==&mid=2247488705&idx=1&sn=f9f175dbf25b762af9554d4069f8d94d&chksm=ec2ac4c8db5d4ddeb9e51f69cba73007a2e8e8eccc279cc1277486835b573546c186acbfe322&scene=21#wechat_redirect)》

0242- 《[Impala TPC-DS基准测试](http://mp.weixin.qq.com/s?__biz=MzI4OTY3MTUyNg==&mid=2247489095&idx=1&sn=5af481742664f79146c58f425c9429d3&chksm=ec2ac64edb5d4f58860db96ae4b452fda70b108527e4cc78c1978461ed62e67fcf997631d270&scene=21#wechat_redirect)》

0248- 《[如何在Impala中使用Parquet表](http://mp.weixin.qq.com/s?__biz=MzI4OTY3MTUyNg==&mid=2247489186&idx=1&sn=55daaea9da465972b2c86b35aead958d&chksm=ec2ac6abdb5d4fbd1420e65846829cec98c9eb5812828f48538be4098e7ac7da5e5814d1b4ce&scene=21#wechat_redirect)》

0275- 《[当Impala碰到由Hive生成的timestamp数据](http://mp.weixin.qq.com/s?__biz=MzI4OTY3MTUyNg==&mid=2247489928&idx=1&sn=621feb86f011b7bf068acd41cd66625b&chksm=ec2ac981db5d409770309d1f9cf730c215459aba8d6c1562b7ea631d7f314330585658078c53&scene=21#wechat_redirect)》

0276- 《[由Impala-3316导致的并发查询缓慢问题](http://mp.weixin.qq.com/s?__biz=MzI4OTY3MTUyNg==&mid=2247489959&idx=1&sn=ca9690b1b1d710feea1ada0e3ed4930e&chksm=ec2ac9aedb5d40b8fc356bf89f3bcf11ffbb72b2948dfc6a5aa52d96a94db2dc7d511bbc2339&scene=21#wechat_redirect)》

0277- 《[Impala并发查询缓慢问题解决方案](http://mp.weixin.qq.com/s?__biz=MzI4OTY3MTUyNg==&mid=2247490010&idx=1&sn=6cbf6155e4bd15cc7dde11b66a2e143f&chksm=ec2ac9d3db5d40c567751ea643e5702d59fa7fbb2945f895b8d6149e67e21d0154363cd7e5ca&scene=21#wechat_redirect)》

0312- 《[如何在Kerberos环境下使用Spark2通过JDBC访问Impala](http://mp.weixin.qq.com/s?__biz=MzI4OTY3MTUyNg==&mid=2247490942&idx=1&sn=8eb07cd4f9eff424b517aa753546cb5c&chksm=ec2acd77db5d446114160756187abf05ea68074dbbff25f8237ef7c1972a993589d2ccdae0b6&scene=21#wechat_redirect)》

0326- 《[如何为Impala Daemon服务配置Executor和Coordinator角色](http://mp.weixin.qq.com/s?__biz=MzI4OTY3MTUyNg==&mid=2247491327&idx=1&sn=aa48d8b596574941652a0c8a5f8f30e4&chksm=ec2acef6db5d47e08a0180a7e8cd30ee1a2106535d8db65120e8f7b78fc3ea0fc0bb980718b5&scene=21#wechat_redirect)》

0337- 《[Impala最佳实践](http://mp.weixin.qq.com/s?__biz=MzI4OTY3MTUyNg==&mid=2247491585&idx=1&sn=16a55845c203763a7cb28b535a11b2b6&chksm=ec293008db5eb91e702b9d0c60fbea039a0a164157ab282b2bff2f4a51aaf85241fa191b59f3&scene=21#wechat_redirect)》



### 7.3.HBase



0045-《[Cloudera Labs中的Phoenix](http://mp.weixin.qq.com/s?__biz=MzI4OTY3MTUyNg==&mid=2247485039&idx=1&sn=f6eba9bc7fdea9008c28974e5aaff371&chksm=ec2ad666db5d5f700044d7f0f74ef6f9d0bc12466a34b75ab80b29e413f35e6b9ddfa85b7b04&scene=21#wechat_redirect)》

0066-《[如何使用Java连接Kerberos的HBase](http://mp.weixin.qq.com/s?__biz=MzI4OTY3MTUyNg==&mid=2247485435&idx=1&sn=8e7d292cd875e5f9e3f24b4e6f9080f3&chksm=ec2ad7f2db5d5ee42590b1f60a2557b391140ade872c682b4fe7cbb883ee11c54d0dcd531f25&scene=21#wechat_redirect)》

0071-《[如何在CDH中使用HBase快照](http://mp.weixin.qq.com/s?__biz=MzI4OTY3MTUyNg==&mid=2247485478&idx=1&sn=7eb4d071f0d1df9b99aa58a62ab10e5e&chksm=ec2ad82fdb5d5139e0475ab330a73faf2ee34cc3e9223b8ef7eae3b0c1095f924af8fef3252d&scene=21#wechat_redirect)》

0046-《[如何在CDH中使用Phoenix](http://mp.weixin.qq.com/s?__biz=MzI4OTY3MTUyNg==&mid=2247485108&idx=1&sn=695e9cdb9c9b5f3078e9dad6ce7dd434&chksm=ec2ad6bddb5d5fab2ef88e39dafc260fd05a5927898e86b067395e331c9116c2ac911c38a547&scene=21#wechat_redirect)》

0254- 《[如何使用HBase存储文本文件](http://mp.weixin.qq.com/s?__biz=MzI4OTY3MTUyNg==&mid=2247489360&idx=1&sn=54e97d9d5c36fbf1ad5e49deb7af9c92&chksm=ec2ac759db5d4e4f3ea2754e32d339a2e684cf4e15ba992a6e904937e2566bcbcae8f5349ff9&scene=21#wechat_redirect)》

0258- 《[如何使用HBase存储图片](http://mp.weixin.qq.com/s?__biz=MzI4OTY3MTUyNg==&mid=2247489438&idx=1&sn=239b03cd3d3c784f109af591dc05cf4c&chksm=ec2ac797db5d4e81ffb7ea80ccb2981f898ff9486ca719fe0988ab44649a8bc6f2293a62c6d5&scene=21#wechat_redirect)》

0266- 《[如何使用Java调用HBase的 Endpoint Coprocessor](http://mp.weixin.qq.com/s?__biz=MzI4OTY3MTUyNg==&mid=2247489642&idx=1&sn=b9da33743724fd4e75312d7d9b0eb3f5&chksm=ec2ac863db5d4175b9aad8bdd8cec4cb49da9b71077f0910a88af32413ecde7a4477e7975af3&scene=21#wechat_redirect)》

0268- 《[如何开发HBase Endpoint类型的Coprocessor以及部署使用](http://mp.weixin.qq.com/s?__biz=MzI4OTY3MTUyNg==&mid=2247489676&idx=1&sn=c97f7c120edc3072344aff454f4cdfa4&chksm=ec2ac885db5d41939089290aca115e6bd369f71525314975f7463a6d1cf6a0d37e858497d6cd&scene=21#wechat_redirect)》

0307- 《[如何使用Phoenix在CDH的HBase中创建二级索引](http://mp.weixin.qq.com/s?__biz=MzI4OTY3MTUyNg==&mid=2247490823&idx=1&sn=58f23b3356cd7bea272709ee1779628c&chksm=ec2acd0edb5d44184b56947a6586a44176af1ceae6bb1651f07af3318ce670a4950c1b966d5c&scene=21#wechat_redirect)》

0308- 《[如何在CDH5.14.2中安装Phoenix4.14.0](http://mp.weixin.qq.com/s?__biz=MzI4OTY3MTUyNg==&mid=2247490860&idx=1&sn=512abd484bd5dbd922f5c3054ea1d3d8&chksm=ec2acd25db5d44331a1f4a1c778206b1eca3aa7250ee229470885e7f54752ae5e7872a52066a&scene=21#wechat_redirect)》

0321- 《[如何在CDH中使用HBase的ACLs进行授权](http://mp.weixin.qq.com/s?__biz=MzI4OTY3MTUyNg==&mid=2247491202&idx=1&sn=31f44e24430e58e5814964f8aec13d78&chksm=ec2ace8bdb5d479d66a517ae7706a490d2f154369f317c79f46af49ee646d7cbe50c4b8b08c1&scene=21#wechat_redirect)》

0322- 《[如何在CDH中使用HBase的Quotas设置资源请求限制](http://mp.weixin.qq.com/s?__biz=MzI4OTY3MTUyNg==&mid=2247491220&idx=1&sn=25a467d65a6eeeda631e7e161196c3d2&chksm=ec2ace9ddb5d478bb046403358dd90c3eb28dbfea6d78ff7e763ccf61b9630b3799c506c0612&scene=21#wechat_redirect)》

0346- 《[使用Spark通过BulkLoad快速导入数据到HBase](http://mp.weixin.qq.com/s?__biz=MzI4OTY3MTUyNg==&mid=2247491698&idx=1&sn=38f4bca784eb5c55bd158b2884230900&chksm=ec29307bdb5eb96d5fa32420d70b1b75545895478fb9aa052acae150bf72af5c1f407d280385&scene=21#wechat_redirect)》



### 7.4.Hue







0056-《[如何重置Hue用户密码](http://mp.weixin.qq.com/s?__biz=MzI4OTY3MTUyNg==&mid=2247485228&idx=1&sn=8b786511f419d4d1aff64ff90be68583&chksm=ec2ad725db5d5e33c97da03a40b6a3fb7f0cc3c79710094cc5e885c251922592d75f75a1921d&scene=21#wechat_redirect)》

0152-《[如何在Hue中配置已启用SSL的HttpFS服务](http://mp.weixin.qq.com/s?__biz=MzI4OTY3MTUyNg==&mid=2247487120&idx=1&sn=5747b067e3dbee89254d0133f42196f7&chksm=ec2ade99db5d578f0b700b257bde004417144a7576c8738d5e8ef9d8a412c86e5bff2259dbf2&scene=21#wechat_redirect)》

0153-《[Hue禁止用户下载数据问题分析](http://mp.weixin.qq.com/s?__biz=MzI4OTY3MTUyNg==&mid=2247487128&idx=1&sn=4369aecbe733c97abc3376676f87b39b&chksm=ec2ade91db5d57875361b32977360215220b7f937527b4715176ffc8b47cc94b3cbd572db681&scene=21#wechat_redirect)》

0164-《[如何在Hue中配置HiveServer2的负载均衡](http://mp.weixin.qq.com/s?__biz=MzI4OTY3MTUyNg==&mid=2247487291&idx=1&sn=4519e327d48414bec9f257801babab94&chksm=ec2adf32db5d562441dc843f1523dceae5a6f3ca9387f180aa89a4deb6932eae0b445a1875d3&scene=21#wechat_redirect)》

0168-《[如何在Hue中配置Impala的负载均衡](http://mp.weixin.qq.com/s?__biz=MzI4OTY3MTUyNg==&mid=2247487410&idx=1&sn=b689e59c47932cf3528d8a57b81a7a23&chksm=ec2adfbbdb5d56ad696e2d1fcfff073295c8a8b17953fbe8e4cd381b21c37d8dafc23ccad616&scene=21#wechat_redirect)》

0236- 《[Hue中无法删除用户异常分析](http://mp.weixin.qq.com/s?__biz=MzI4OTY3MTUyNg==&mid=2247488991&idx=1&sn=99715ce5be8f8969dd38bd4a009d4fa0&chksm=ec2ac5d6db5d4cc0b8e0eb77554d1e4b228f6bbc3fb2b859b3506767b552f1b1c054d9a8fcc7&scene=21#wechat_redirect)》

0241- 《[如何开启Hue的Debug模式](http://mp.weixin.qq.com/s?__biz=MzI4OTY3MTUyNg==&mid=2247489078&idx=1&sn=063b3fd37d3332ed77bf2391a44f57a3&chksm=ec2ac63fdb5d4f2913dc47ca77a1215954eb9896cb3f4e0f2160fdb3c54bc4d155e851c32390&scene=21#wechat_redirect)》

0251- 《[如何在Hue中集成配置Hive2.3.3服务](http://mp.weixin.qq.com/s?__biz=MzI4OTY3MTUyNg==&mid=2247489243&idx=1&sn=2a3c4ba215feeba7b25e3571a3d4ecbe&chksm=ec2ac6d2db5d4fc4b01a486b678f9e6e660a50a4010be38b71783601acdc627cc9ddada7e469&scene=21#wechat_redirect)》

0328- 《[如何在退出Hue后关闭Spark会话](http://mp.weixin.qq.com/s?__biz=MzI4OTY3MTUyNg==&mid=2247491352&idx=1&sn=5c7caf1514fd62508f8e31b9298c7c49&chksm=ec2acf11db5d4607d2ff5c5aa6fc84624c0fe5d90dd9e8265f1f5ab8cd3f0b8f5701609c5ac7&scene=21#wechat_redirect)》



### 7.5.Sqoop







0121-《[Sqoop抽取Hive Parquet表数据到MySQL异常分析](http://mp.weixin.qq.com/s?__biz=MzI4OTY3MTUyNg==&mid=2247486556&idx=1&sn=243809a65939ed6e436466e01a941800&chksm=ec2adc55db5d55435c599a5a4b0c929a4ff2f57123a252ec2a82adf8f8cea966970514e9e59a&scene=21#wechat_redirect)》

0193- 《[如何使用Sqoop2](http://mp.weixin.qq.com/s?__biz=MzI4OTY3MTUyNg==&mid=2247487918&idx=1&sn=d5c10a21557e5bf1c46ca1058533ec37&chksm=ec2ac1a7db5d48b1768f6834c9eac029194cdab2fe9cb13ade06f338645082c739307500cb30&scene=21#wechat_redirect)》

0342- 《[Sqoop抽数到Hive表异常分析](http://mp.weixin.qq.com/s?__biz=MzI4OTY3MTUyNg==&mid=2247491627&idx=1&sn=5a2b1ab2bbc3cf701a559b76b03c66e4&chksm=ec293022db5eb9341d35b46077e52190ee1694b202e1e0a1c2dfa8b8b2d2f02a7d3c026a3466&scene=21#wechat_redirect)》

0348- 《[Sqoop抽数到Hive表异常分析(之二)](http://mp.weixin.qq.com/s?__biz=MzI4OTY3MTUyNg==&mid=2247491721&idx=1&sn=771c21ff11c7c4735fbd7c85eed29a07&chksm=ec293080db5eb996be6e46d6bce7f3171bfc1ca0ee9f9925f66372846fc7ec30366aed93a236&scene=21#wechat_redirect)》



### 7.6.Solr







0103-《[如何使用Java代码访问CDH的Solr服务](http://mp.weixin.qq.com/s?__biz=MzI4OTY3MTUyNg==&mid=2247486223&idx=1&sn=49140cc8c553cd55ad251ac75c452684&chksm=ec2adb06db5d5210e374431495de196b544ee2b52a619080cdd54ad89b2766d4d136a5393047&scene=21#wechat_redirect)》

0114-《[如何使用Hue通过数据文件创建Collections](http://mp.weixin.qq.com/s?__biz=MzI4OTY3MTUyNg==&mid=2247486413&idx=1&sn=34d16fd739d1aeccb117c74dd675ba96&chksm=ec2adbc4db5d52d2ac8ef19c462ab3775945e46065146d8e91f05b88dd6fbbe0397714962e50&scene=21#wechat_redirect)》

0252- 《[如何在CDH中使用Solr对HDFS中的JSON数据建立全文索引](http://mp.weixin.qq.com/s?__biz=MzI4OTY3MTUyNg==&mid=2247489275&idx=1&sn=192900938dcc87556543edffc2775ec9&chksm=ec2ac6f2db5d4fe4a6a3b526a56f3d760c2e43ce93c6e94ef12430e0e200f880140dc9bd17cc&scene=21#wechat_redirect)》

0253- 《[如何使用Flume准实时建立Solr的全文索引](http://mp.weixin.qq.com/s?__biz=MzI4OTY3MTUyNg==&mid=2247489313&idx=1&sn=133b4374b182829e974e268b032f3258&chksm=ec2ac728db5d4e3e1b59764e5ea9516b5dc4d8c9d9f7c61a887af541f2388d01c8d39a79a9b5&scene=21#wechat_redirect)》

0256- 《[如何使用Lily HBase Indexer对HBase中的数据在Solr中建立索引](http://mp.weixin.qq.com/s?__biz=MzI4OTY3MTUyNg==&mid=2247489380&idx=1&sn=1be8ce70478d294e224a279625bb2627&chksm=ec2ac76ddb5d4e7b5f2f353339e1454e3d1df3b52a2709cd0821bf7e07cdaf09aa55b75dc767&scene=21#wechat_redirect)》

0293- 《[如何在Kerberos下使用Solr](http://mp.weixin.qq.com/s?__biz=MzI4OTY3MTUyNg==&mid=2247490471&idx=1&sn=b333f9717275473c46641ebdba9d24dc&chksm=ec2acbaedb5d42b81dfa69225b46d39dd0311cb016d4f625f6080a4cefb452db5bce0f58b29b&scene=21#wechat_redirect)》

0301- 《[使用命令行创建collection时Sentry给Solr赋权的问题](http://mp.weixin.qq.com/s?__biz=MzI4OTY3MTUyNg==&mid=2247490691&idx=1&sn=f6459e00a17f42eadfbdd226563f784d&chksm=ec2acc8adb5d459c23dbb8eb763aa49dc8b82274dd1993bea85b0d0ba342cd0721f573b435d7&scene=21#wechat_redirect)》



### 7.7.Oozie







0060-《[如何使用Hue创建Spark1和Spark2的Oozie工作流](http://mp.weixin.qq.com/s?__biz=MzI4OTY3MTUyNg==&mid=2247485305&idx=1&sn=00b512e7392a6eaa69f81b15c25ee2b7&chksm=ec2ad770db5d5e6667fb2d9b954db88204b8408b0fef75986bc4f6978d875587352dfdcb0919&scene=21#wechat_redirect)》

0061-《[如何使用Hue创建Spark2的Oozie工作流（补充）](http://mp.weixin.qq.com/s?__biz=MzI4OTY3MTUyNg==&mid=2247485325&idx=1&sn=706c8405d62209a1fd9f065acff39c17&chksm=ec2ad784db5d5e92d4ff820152929ae91959b0fd460b04212e7d025f772bab4c9991adad58a9&scene=21#wechat_redirect)》

0075-《[如何在Hue中创建Ssh的Oozie工作流](http://mp.weixin.qq.com/s?__biz=MzI4OTY3MTUyNg==&mid=2247485589&idx=1&sn=bcbec1391ca7cca0a87a18a901fe6fce&chksm=ec2ad89cdb5d518aeb8f26117dcfe7176500f245a1b2ff23be7b1e68e6dca6f900475bbebbef&scene=21#wechat_redirect)》

0119-《[如何使用Hue上创建一个完整Oozie工作流](http://mp.weixin.qq.com/s?__biz=MzI4OTY3MTUyNg==&mid=2247486534&idx=1&sn=368e14163577c8fa87c1a6e1fad546ab&chksm=ec2adc4fdb5d5559775041391305606fb97cf1fc2a9651c733c6ae15f1739d3b381170e0d573&scene=21#wechat_redirect)》

0120-《[Hue中使用Oozie创建Ssh工作流时sudo命令执行失败问题分析](http://mp.weixin.qq.com/s?__biz=MzI4OTY3MTUyNg==&mid=2247486553&idx=1&sn=89a3798502a17405d27a2a8d474fc806&chksm=ec2adc50db5d5546129990ccda305befe31f0d60f3ed12f5d1783f5252d5c30859f7692daaae&scene=21#wechat_redirect)》

0123-《[Hue中使用Oozie创建Shell工作流在脚本中切换不同用户](http://mp.weixin.qq.com/s?__biz=MzI4OTY3MTUyNg==&mid=2247486600&idx=1&sn=b4140e2bea60e7d20707716d6c4fac24&chksm=ec2adc81db5d5597c4a9d5c0c429a7bf2cd502a1abeacf402aa2151a6a7155dc6fb598697fa1&scene=21#wechat_redirect)》

0132-《[使用Hue创建Ssh的Oozie工作流时重定向输出日志报错分析](http://mp.weixin.qq.com/s?__biz=MzI4OTY3MTUyNg==&mid=2247486786&idx=1&sn=92858c55f0417322c8dbd3814e1ce4ae&chksm=ec2add4bdb5d545d89586dd760de7ea7351c72a75a25f1fc95820de6e5fa0a3a02c674f7bc37&scene=21#wechat_redirect)》

0133-《[在Kerberos环境使用Hue通过Oozie执行Sqoop作业报错异常分析](http://mp.weixin.qq.com/s?__biz=MzI4OTY3MTUyNg==&mid=2247486794&idx=1&sn=91f2b1909aec4b416608745ac50f01ee&chksm=ec2add43db5d54553bd92bc7fe4c0167c966cba327f06420fb90a7cd8016fc484289b0471a80&scene=21#wechat_redirect)》

0184- 《[如何使用Oozie API接口向非Kerberos环境的CDH集群提交Spark作业](http://mp.weixin.qq.com/s?__biz=MzI4OTY3MTUyNg==&mid=2247487724&idx=1&sn=eed5801cce1dcdc2211afc63a28be654&chksm=ec2ac0e5db5d49f380d12b29215cd21f6d92bc2eb6c55b52a998da295d6d668b8f7140a7f570&scene=21#wechat_redirect)》

0185- 《[如何使用Oozie API接口向非Kerberos环境的CDH集群提交Java作业](http://mp.weixin.qq.com/s?__biz=MzI4OTY3MTUyNg==&mid=2247487725&idx=1&sn=c4aba0123b790c2b8bdee7fa78b2ee81&chksm=ec2ac0e4db5d49f292261c590871b2c06167e85ad998a35f5e091d1685fdf062c026ecbde5b2&scene=21#wechat_redirect)》

0186- 《[如何使用Oozie API接口向非Kerberos环境的CDH集群提交Shell工作流](http://mp.weixin.qq.com/s?__biz=MzI4OTY3MTUyNg==&mid=2247487726&idx=1&sn=79f961a7f491eb69a74879e41f32f208&chksm=ec2ac0e7db5d49f13d92e0da808aa170f2a1738dff20139697ad16fb062bafbdaa880bdace78&scene=21#wechat_redirect)》

0188- 《[如何使用Oozie API接口向Kerberos环境的CDH集群提交Spark作业](http://mp.weixin.qq.com/s?__biz=MzI4OTY3MTUyNg==&mid=2247487799&idx=1&sn=69db2dd086816ce2fa4c84140df942ef&chksm=ec2ac13edb5d4828bc438ab7358c0f0ae070c6c786535d549a971200ff06f7375304c79626ec&scene=21#wechat_redirect)》

0189- 《[如何启用Oozie的HA](http://mp.weixin.qq.com/s?__biz=MzI4OTY3MTUyNg==&mid=2247487819&idx=1&sn=71267d0336c234b3ff30bca1302640fe&chksm=ec2ac142db5d48540d90083405182c427916d0952e5ab47d555e5ede273ac664f59cbeba978c&scene=21#wechat_redirect)》

0194- 《[如何使用Oozie API接口向Kerberos集群提交Java程序](http://mp.weixin.qq.com/s?__biz=MzI4OTY3MTUyNg==&mid=2247487931&idx=1&sn=1b698b84ebddc416b827ae847e7e60f1&chksm=ec2ac1b2db5d48a4d5403d804f07786ae674378d5208af987a02afc74561a77861a2646c98b7&scene=21#wechat_redirect)》

0202- 《[如何使用Oozie API接口向Kerberos环境的CDH集群提交Spark2作业](http://mp.weixin.qq.com/s?__biz=MzI4OTY3MTUyNg==&mid=2247488122&idx=1&sn=85c471b8144c5e7f2c8e78e9f03abd74&chksm=ec2ac273db5d4b65ac2274070d7809f6f1c40c90336a49512949abae0e6c541bee1c11c82a1c&scene=21#wechat_redirect)》

0207- 《[如何使用Oozie API接口向Kerberos环境的CDH集群提交Shell作业](http://mp.weixin.qq.com/s?__biz=MzI4OTY3MTUyNg==&mid=2247488230&idx=1&sn=000ccb5892ee3faefd35822e7e1b2ba6&chksm=ec2ac2efdb5d4bf9ffe4e9ad94a2359a38377da56d5707254cf03faff7e531ea5e16357c3ed1&scene=21#wechat_redirect)》

0296- 《[如何在Oozie中创建有依赖的WorkFlow](http://mp.weixin.qq.com/s?__biz=MzI4OTY3MTUyNg==&mid=2247490566&idx=1&sn=2c2d20c94b708fb7f80a71c2fbe0923d&chksm=ec2acc0fdb5d4519cf91d81022c236553c6ae0876c42923af60bc8bfa6d03ef375f1d7edbd1e&scene=21#wechat_redirect)》





### 7.8.HDFS







0068-《[如何在CDH集群使用HDFS快照](http://mp.weixin.qq.com/s?__biz=MzI4OTY3MTUyNg==&mid=2247485437&idx=1&sn=e7c1e091fadafbedb0e68760cd7d4927&chksm=ec2ad7f4db5d5ee2ce4f7c1005f3ae349d7240f0b25bc0e1786d1827db0c1368d92b3b92d369&scene=21#wechat_redirect)》

0105-《[如何使用Java代码访问HDFS.docx](http://mp.weixin.qq.com/s?__biz=MzI4OTY3MTUyNg==&mid=2247486235&idx=1&sn=8c30514bcbefa25bdeff565957acf04b&chksm=ec2adb12db5d5204ad767723c60a9a41da967b7e75c9ae4e640e5be95bf6b93ebc94ad05e81e&scene=21#wechat_redirect)》

0125-《[如何在集群外节点跨网段向HDFS写数据](http://mp.weixin.qq.com/s?__biz=MzI4OTY3MTUyNg==&mid=2247486636&idx=1&sn=c2f94ee6f512e055b642350e2425e51e&chksm=ec2adca5db5d55b30b60c872a09bba5c7de71d5e945cbdf8213f841c05eba4a14bd0f9d9860c&scene=21#wechat_redirect)》

0130-《[如何将HDFS文件系统挂载到Linux本地文件系统](http://mp.weixin.qq.com/s?__biz=MzI4OTY3MTUyNg==&mid=2247486757&idx=1&sn=362f0c04778ac2cab81844c62570c18e&chksm=ec2add2cdb5d543aa0dd8afcce7b60b955a70962d576d95c479d7683e7f9a36f236e35765940&scene=21#wechat_redirect)》

0148-《[如何为HttpFS服务配置SSL](http://mp.weixin.qq.com/s?__biz=MzI4OTY3MTUyNg==&mid=2247487077&idx=1&sn=fd62ae494426c02e4845b0fa846cedff&chksm=ec2ade6cdb5d577a589e2761fd6da1e7727ee451c17be633d7de614d47a253c2430ebac3a5b3&scene=21#wechat_redirect)》

0209- 《[JournalNode的edits目录没有格式化异常分析](http://mp.weixin.qq.com/s?__biz=MzI4OTY3MTUyNg==&mid=2247488270&idx=1&sn=79b25b0281eeeaa287d9ec2ffe685710&chksm=ec2ac307db5d4a114dbf1052c2634e8dd0867f5fe6eb886a519140d0f590166fb257e1c7ba46&scene=21#wechat_redirect)》

0243- 《[Slow ReadProcessor&Error Slow BlockReceiver错误日志分析](http://mp.weixin.qq.com/s?__biz=MzI4OTY3MTUyNg==&mid=2247489099&idx=1&sn=2e1fd131b295470834d48184636ee6ac&chksm=ec2ac642db5d4f54616267c821ed05b9741c0eb09c919a784c915ff14bdd29408a08f03b518f&scene=21#wechat_redirect)》

0262- 《[HDFS部署最佳实践](http://mp.weixin.qq.com/s?__biz=MzI4OTY3MTUyNg==&mid=2247489557&idx=1&sn=65ff210ef504b82aee1435a0ae142747&chksm=ec2ac81cdb5d410af2148c3906e18daacb9dfd315df5c1b87aba69300f84458fcb17420884f5&scene=21#wechat_redirect)》

0264- 《[如何修改启用了高可用HDFS的NameService ID](http://mp.weixin.qq.com/s?__biz=MzI4OTY3MTUyNg==&mid=2247489613&idx=1&sn=4e05ab677e6f5c518c28d3bb66be5e99&chksm=ec2ac844db5d41525edd7996b8b3a6bcaa7dbc7acbc30d631dabfd57297a0a23cf81de920cbe&scene=21#wechat_redirect)》

0292- 《[如何使用Java API访问HDFS为目录设置配额](http://mp.weixin.qq.com/s?__biz=MzI4OTY3MTUyNg==&mid=2247490460&idx=1&sn=40041b4447b82da31201357541a52dbd&chksm=ec2acb95db5d4283d856aaebdb07b06e865ae9d55db0e298c8cff67d5286a7f63f96c0737e2a&scene=21#wechat_redirect)》

0341- 《[集群JournalNode服务重启导致NameNode挂掉分析](http://mp.weixin.qq.com/s?__biz=MzI4OTY3MTUyNg==&mid=2247491618&idx=1&sn=94881ce701931f529c7ed6053137ac7d&chksm=ec29302bdb5eb93d1c298c5f9ec736c1af3cb4be9fd6790e542964f6fb1ed6a881020962b56a&scene=21#wechat_redirect)》

0360- 《[NameNode Metadata备份和恢复最佳实践](http://mp.weixin.qq.com/s?__biz=MzI4OTY3MTUyNg==&mid=2247491916&idx=1&sn=4cf81b529f5d593bba4af1078039689f&chksm=ec293145db5eb85370707cf32ed333c41005a754b0f264eb541cea8d1032e6ab60c50da1ed3d&scene=21#wechat_redirect)》



### 7.9.Kudu



0020-《[使用JDBC向Kudu表插入中文字符-双引号的秘密](http://mp.weixin.qq.com/s?__biz=MzI4OTY3MTUyNg==&mid=2247484358&idx=1&sn=c7722cb3519b7efe2b0c932ac55f5bce&chksm=ec2ad3cfdb5d5ad96a6c5848dc4b450e52f2418d51fe8c9d69573da2ec54dba24c8eda6eba61&scene=21#wechat_redirect)》

0021-《[使用JDBC向Kudu表插入中文字符-cast的秘密](http://mp.weixin.qq.com/s?__biz=MzI4OTY3MTUyNg==&mid=2247484360&idx=1&sn=c4f1e91c73ca47de7f77e93b93495cf9&chksm=ec2ad3c1db5d5ad7c7f97b70006454e273bc191423505c20569f7bd5b52eef35646640c0ce1d&scene=21#wechat_redirect)》

0085-《[如何在Kudu1.5中使用Sentry授权](http://mp.weixin.qq.com/s?__biz=MzI4OTY3MTUyNg==&mid=2247485826&idx=1&sn=89fa626b33f49fb1f81ba8c918ccad0a&chksm=ec2ad98bdb5d509da9ae68328526925f0e31a8bb3edf50ae2e2896e01bd8864d0925c5addbb3&scene=21#wechat_redirect)》

0128-《[如何迁移Kudu1.2的WAL和Data目录](http://mp.weixin.qq.com/s?__biz=MzI4OTY3MTUyNg==&mid=2247486723&idx=1&sn=ebfae8921813c9de78e47f640ed79516&chksm=ec2add0adb5d541cd2eea5e89d432ca1ab789c4bbe0660bfe5f1de5b2fa7c0434a0eff5ca0e1&scene=21#wechat_redirect)》

0267- 《[如何使用Java API访问CDH的Kudu](http://mp.weixin.qq.com/s?__biz=MzI4OTY3MTUyNg==&mid=2247489658&idx=1&sn=0c72573377185f044cf01fda460e4a0e&chksm=ec2ac873db5d4165c5d96edeef9af4811e512db5e7f675794a6be21a71f579a8bf2f77edf3d6&scene=21#wechat_redirect)》



### 7.10.Kafka

0022-《[如何永久删除Kafka的Topic](http://mp.weixin.qq.com/s?__biz=MzI4OTY3MTUyNg==&mid=2247484384&idx=1&sn=334edf7ff79758f2173e02371b1f6675&chksm=ec2ad3e9db5d5aff35c472d7601226ccf027de230c2cac8232d60cc943be5d2b77dc912e9001&scene=21#wechat_redirect)》

0065-《[如何通过Cloudera Manager为Kafka启用Kerberos及使用](http://mp.weixin.qq.com/s?__biz=MzI4OTY3MTUyNg==&mid=2247485371&idx=1&sn=e4c7cc77c2354634059295d5cf63b815&chksm=ec2ad7b2db5d5ea46406cb9d26c95f7d6cf52740e90a131f97909bbfaa10c8d4a751cc2bf1e8&scene=21#wechat_redirect)》

0069-《[如何使用Java连接Kerberos的Kafka](http://mp.weixin.qq.com/s?__biz=MzI4OTY3MTUyNg==&mid=2247485439&idx=1&sn=d8a0cafdb988b0b04fb42f1e41fed35b&chksm=ec2ad7f6db5d5ee071ca4e131635080c73971e2ee9c385b43859493f316f4c1248d947cf255e&scene=21#wechat_redirect)》

0324- 《[如何在CDH中为Kafka设置流量配额](http://mp.weixin.qq.com/s?__biz=MzI4OTY3MTUyNg==&mid=2247491270&idx=1&sn=fefc9a600d49810eeac40586f0eb1680&chksm=ec2acecfdb5d47d9c1c35b836f4405bb085bd71c4f62060131484412dea91b03fb484fa115bc&scene=21#wechat_redirect)》

0362- 《[如何查看Kafka的Topic消费情况](http://mp.weixin.qq.com/s?__biz=MzI4OTY3MTUyNg==&mid=2247491973&idx=2&sn=c3dcc326b419860f0e9ac98ae21e840f&chksm=ec29318cdb5eb89ad04892a409ff090e8a6171366fb933b8c6b4e341ce21e43c0e603bf44449&scene=21#wechat_redirect)》

0363- 《[如何在Spark Streaming应用中使用Kudu管理Kafka的Offset](http://mp.weixin.qq.com/s?__biz=MzI4OTY3MTUyNg==&mid=2247491973&idx=1&sn=aa30019fba49de1e9803e2dc97c72956&chksm=ec29318cdb5eb89a6d05bb8cbfb9aa7ab6da9819a1030169703bcda3a52751bc73d8d1e44559&scene=21#wechat_redirect)》



### 7.11.YARN







0019-《[Yarn的JobHistory目录权限问题导致MapReduce作业异常](http://mp.weixin.qq.com/s?__biz=MzI4OTY3MTUyNg==&mid=2247484326&idx=1&sn=7444df7614437a5ad35f9d0c87c5cf2b&chksm=ec2ad3afdb5d5ab98106d45e6c058d445989258cb67309efb738919e83e52f22c57884629b0e&scene=21#wechat_redirect)》

0107-《[如何跨平台在本地开发环境提交MapReduce作业到CDH集群](http://mp.weixin.qq.com/s?__biz=MzI4OTY3MTUyNg==&mid=2247486257&idx=1&sn=4269786efc005fcedcf5dcf56c4d98d9&chksm=ec2adb38db5d522e1ce68681f4336c0a9744799aac6e1f19628a85f2b7e1d15c4960ceea53fd&scene=21#wechat_redirect)》

0108-《[如何使用hadoop命令向CDH集群提交MapReduce作业](http://mp.weixin.qq.com/s?__biz=MzI4OTY3MTUyNg==&mid=2247486271&idx=1&sn=5d3c407edc9c54d98c5bb81b12d4fdc0&chksm=ec2adb36db5d5220a102634f148df4aa9db007687356ccc4cf8c27d64aabd7dc308f24a84144&scene=21#wechat_redirect)》

0109-《[如何使用java命令从非集群节点向CDH集群提交MapReduce作业](http://mp.weixin.qq.com/s?__biz=MzI4OTY3MTUyNg==&mid=2247486286&idx=1&sn=f4b4a19a6044aefb4e5539ba58fccfc7&chksm=ec2adb47db5d525171db04aaef0a603a6fb621761628ae7bce61e0501b27f8a4e3c5db0723ac&scene=21#wechat_redirect)》

0129-《[如何在HDFS上查看YARN历史作业运行日志](http://mp.weixin.qq.com/s?__biz=MzI4OTY3MTUyNg==&mid=2247486738&idx=1&sn=d2f2dca5ba9ed34cd175e7d3535786f0&chksm=ec2add1bdb5d540d6071356d98631b5393790890d3326eb2cccb8adb37b0717c50dc9e86514d&scene=21#wechat_redirect)》

0291- 《[如何使用Cloudera Manager设置使用YARN队列的ACL](http://mp.weixin.qq.com/s?__biz=MzI4OTY3MTUyNg==&mid=2247490436&idx=1&sn=db264867fa87300ce9a4992509beebc9&chksm=ec2acb8ddb5d429b4834b7c83dbd40b9b83e7b01d88fdc1f44f9960c7aa61458fb8f8d952c10&scene=21#wechat_redirect)》

0353- 《[如何使用curl命令调用CM的API动态配置Yarn资源池](http://mp.weixin.qq.com/s?__biz=MzI4OTY3MTUyNg==&mid=2247491821&idx=1&sn=50b18a40e7afb76a3ae76daadefeb08a&chksm=ec2930e4db5eb9f2959e0886229643e07d0a1eee2f115613b87cc8fd592097ffe9d31d47f528&scene=21#wechat_redirect)》

0354- 《[如何使用Java调用CM的API动态配置Yarn资源池](http://mp.weixin.qq.com/s?__biz=MzI4OTY3MTUyNg==&mid=2247491828&idx=1&sn=ae811a24fa2f341bfe8f6e2cb0c2031a&chksm=ec2930fddb5eb9ebb82ab9fc5ec9b92adef4608c262c8930717e24c825e1b2e5933f7a9374c4&scene=21#wechat_redirect)》



### 7.12.Spark







0016-《[Avro序列化&反序列化和Spark读取Avro数据](http://mp.weixin.qq.com/s?__biz=MzI4OTY3MTUyNg==&mid=2247484262&idx=1&sn=4a51f7164415cb510a44113f0015b877&chksm=ec2ad36fdb5d5a79bf52174087e801f2e8a784139d141c747b7dee4c232009fbd1ddae7d5fb3&scene=21#wechat_redirect)》

0017-《[Spark的HistoryServer不能查看到所有历史作业分析](http://mp.weixin.qq.com/s?__biz=MzI4OTY3MTUyNg==&mid=2247484263&idx=1&sn=7d6441ab1ed4707c3fee552dcc445f1e&chksm=ec2ad36edb5d5a78ee3bfb0271750c9905ebc8c9041198c1eede0474c4a4da89c8a04d2d6f2f&scene=21#wechat_redirect)》

0041-《[如何使用Intellij搭建Spark开发环境](http://mp.weixin.qq.com/s?__biz=MzI4OTY3MTUyNg==&mid=2247484966&idx=1&sn=5fe4b2699cfa6b88491b46d44d3ab77c&chksm=ec2ad62fdb5d5f39089e4d8d6c11858a8663079f4358eca104e57fe95ce8aed089b7fdea4880&scene=21#wechat_redirect)》

0064-《[如何通过Cloudera Manager配置Spark1和Spark2的运行环境](http://mp.weixin.qq.com/s?__biz=MzI4OTY3MTUyNg==&mid=2247485357&idx=1&sn=33429b8ef94b68a0d8c64e5ef76aa4a0&chksm=ec2ad7a4db5d5eb284bece2f47c0c40e437fbcea2f18e963366291b20cc8ae495e6d0eaa8bc6&scene=21#wechat_redirect)》

0079-《[如何在CDH中启用Spark Thrift](http://mp.weixin.qq.com/s?__biz=MzI4OTY3MTUyNg==&mid=2247485731&idx=1&sn=00014c98f0ace15018c82a79ea02a7d9&chksm=ec2ad92adb5d503c56dd0b7e42b84cc0690087f2eea0a698e7bd16890cc89f7e20e0a641c734&scene=21#wechat_redirect)》

0176- 《[Livy，基于Apache Spark的开源REST服务，加入Cloudera Labs](http://mp.weixin.qq.com/s?__biz=MzI4OTY3MTUyNg==&mid=2247487592&idx=1&sn=7963efaa5288d456fb59f0acceb01731&chksm=ec2ac061db5d4977c6a7783e2961cadc3ee09a5a3939bbfa941fa7537f4af05d64bccea9f1f7&scene=21#wechat_redirect)》

0177- 《[如何编译Livy并在非Kerberos环境的CDH集群中安装](http://mp.weixin.qq.com/s?__biz=MzI4OTY3MTUyNg==&mid=2247487626&idx=1&sn=ec203849eaf4fa6809058b89e0a0776f&chksm=ec2ac083db5d4995d11d08a38362ba90332a8bcec9b02875f40f87878f2ad3d9055a2e384097&scene=21#wechat_redirect)》

0178- 《[如何通过Livy的RESTful API接口向非Kerberos环境的CDH集群提交作业](http://mp.weixin.qq.com/s?__biz=MzI4OTY3MTUyNg==&mid=2247487686&idx=1&sn=2d64bcdb7cced159508fd98b7e1ad623&chksm=ec2ac0cfdb5d49d944bcb74173c8914c8a9fbda3743cde459aeb053253237875101558a8147e&scene=21#wechat_redirect)》

0182- 《[如何在Kerberos环境的CDH集群部署Livy](http://mp.weixin.qq.com/s?__biz=MzI4OTY3MTUyNg==&mid=2247487722&idx=1&sn=e17aa3cb46a8924d296f9ab9b8ba1588&chksm=ec2ac0e3db5d49f51f5ac299e9619c7a25f354290117a127f5c1b49a467d1f2e9479f4654210&scene=21#wechat_redirect)》

0183- 《[如何通过Livy的RESTful API接口向Kerberos环境的CDH集群提交作业](http://mp.weixin.qq.com/s?__biz=MzI4OTY3MTUyNg==&mid=2247487723&idx=1&sn=f38eb15dd240dcc0a403221d77ad9fe5&chksm=ec2ac0e2db5d49f401311818ae5934ca49a8802b25ef39d8a25965af0ba1d5e254030b7e9df6&scene=21#wechat_redirect)》

0278- 《[如何在Kerberos环境下的CDH集群部署Spark1.6 Thrift及spark-sql客户端](http://mp.weixin.qq.com/s?__biz=MzI4OTY3MTUyNg==&mid=2247490036&idx=1&sn=754dc2a3138c20e10a717780aa58c8fe&chksm=ec2ac9fddb5d40ebe5e409257d99016d5670c8c9dedfaef1035ab9c8e46b5bf9af09092deed6&scene=21#wechat_redirect)》

0280- 《[如何在Kerberos环境下的CDH集群部署Spark2.1的Thrift及spark-sql客户端](http://mp.weixin.qq.com/s?__biz=MzI4OTY3MTUyNg==&mid=2247490081&idx=1&sn=863a4aa895d320a77f1e37a3a14e1fd7&chksm=ec2aca28db5d433e292d09c1847f29cdea66d369784af9e7bdfc8ef96be8d11ff73e5008ae58&scene=21#wechat_redirect)》

0281- 《[如何在Kerberos环境下的CDH集群部署Spark2.1的Thrift及spark-sql客户端](http://mp.weixin.qq.com/s?__biz=MzI4OTY3MTUyNg==&mid=2247490110&idx=1&sn=6f354a99cc04cba71d2a899515a68fe7&chksm=ec2aca37db5d4321caeab129feee5715c252ad165aa221474c8e019f61b795116bae87a2f262&scene=21#wechat_redirect)》

0285- 《[如何使用java连接Kerberos和非kerberos和kerberos的Spark1.6 ThriftServer](http://mp.weixin.qq.com/s?__biz=MzI4OTY3MTUyNg==&mid=2247490265&idx=1&sn=3a49ed0d35b397b1c440ca803634f30d&chksm=ec2acad0db5d43c669d1b0f2e51dec72e77ccbe07e4cd45aed9e474bd9c1348dc96a59bf6776&scene=21#wechat_redirect)》



### 7.13.Zookeeper







0006-《[Zookeeper指标分析](http://mp.weixin.qq.com/s?__biz=MzI4OTY3MTUyNg==&mid=2247483854&idx=1&sn=9362310c2715e04060dd58f25ee9e5bb&chksm=ec2ad1c7db5d58d1caec15ca32e9f5b6fb150a1b1f8ea5025e59ba5cd4c43b4cba3f0fc0ccde&scene=21#wechat_redirect)》

0101-《[Kerberos环境下删除ZooKeeper服务注册信息问题分析](http://mp.weixin.qq.com/s?__biz=MzI4OTY3MTUyNg==&mid=2247486195&idx=1&sn=8e86535a9a56ce050825ca6afe4c0099&chksm=ec2adafadb5d53ecfd253a3b49664d4c0d273a99f6623b9ae45a5aa503380be169c4f766041e&scene=21#wechat_redirect)》

0239- 《[集群启用Kerberos后对Zookeeper的Znode操作异常分析](http://mp.weixin.qq.com/s?__biz=MzI4OTY3MTUyNg==&mid=2247489047&idx=1&sn=6e7b3b35408b1b7d09f8c9cf4e18e38a&chksm=ec2ac61edb5d4f086fb350eb90717c71c722ec47d54f7c079b6dc82f8f06cf6c4250e0b5a75c&scene=21#wechat_redirect)》



## 8.多租户

### 8.1.静态资源管理

计划中...

### 8.2.动态资源管理/YARN

计划中...



### 8.3.动态资源管理/Impala



计划中...



### 8.4.安全

#### 8.4.1.认证

##### 8.4.1.1.Kerberos

0005-《[Windows Kerberos客户端配置并访问CDH](http://mp.weixin.qq.com/s?__biz=MzI4OTY3MTUyNg==&mid=2247483853&idx=1&sn=442a8ba87c922857253a437affe42506&chksm=ec2ad1c4db5d58d2933ae5cde4ab1a7443c944e94aca85b51cbd8e9f4f3772162a39074da49d&scene=21#wechat_redirect)》

0027-《[如何在CDH集群启用Kerberos](http://mp.weixin.qq.com/s?__biz=MzI4OTY3MTUyNg==&mid=2247484735&idx=1&sn=b021eb28562d566b5d3c97f3d4024905&chksm=ec2ad536db5d5c2017b61638eeb3bbc5640cff080e2a376923f3cb06ba4e57211fee4fc027e8&scene=21#wechat_redirect)》

0087-《[如何配置Kerberos服务的高可用](http://mp.weixin.qq.com/s?__biz=MzI4OTY3MTUyNg==&mid=2247485861&idx=1&sn=bb930a497f63ac5e63ed20c64643eec5&chksm=ec2ad9acdb5d50ba9f3989f582bd041373733a2916b9e9eee1cb83d8195b3f50dcee9c95e83c&scene=21#wechat_redirect)》

0173- 《[如何在Redhat7.3的CDH5.14中启用Kerberos](http://mp.weixin.qq.com/s?__biz=MzI4OTY3MTUyNg==&mid=2247487514&idx=1&sn=10c67e4e6456c32d4d4375925c3544aa&chksm=ec2ac013db5d490584631e58745e7306e991605decd7e0931865fb7dc04eb00b29eb074eb221&scene=21#wechat_redirect)》

0271- 《[如何禁用CDH集群Kerberos](http://mp.weixin.qq.com/s?__biz=MzI4OTY3MTUyNg==&mid=2247489817&idx=1&sn=e526d7fb471016b3db3fd61be3b77441&chksm=ec2ac910db5d40069f927fe8f69cd3728eddea50997523952b56fad0ccc58bfcdd75bae39f0f&scene=21#wechat_redirect)》

0273- 《[如何在CDH6.0.0-beta1中启用Kerberos](http://mp.weixin.qq.com/s?__biz=MzI4OTY3MTUyNg==&mid=2247489911&idx=1&sn=ddbcccaea06a27b14900c997e60a1c25&chksm=ec2ac97edb5d4068d121d375d6f9484edb8c6f242de3026d72405f93c2fe26495dddae243829&scene=21#wechat_redirect)》

0319- 《[如何在Redhat7.4的CDH5.15中启用Kerberos](http://mp.weixin.qq.com/s?__biz=MzI4OTY3MTUyNg==&mid=2247491142&idx=1&sn=61f64b37b4ed548ccbb7f92d57406885&chksm=ec2ace4fdb5d4759cf3dd697c55fc62dd18bcf7f7bc4c966e55d032ad7f58c16ad0da5ec8dfb&scene=21#wechat_redirect)》

0345- 《[如何将CDH集群的KDC从RedHat7迁移到RedHat6](http://mp.weixin.qq.com/s?__biz=MzI4OTY3MTUyNg==&mid=2247491686&idx=1&sn=33e9db982560db9190d3fedf3bbb6bf7&chksm=ec29306fdb5eb9792cd3715169befe1be549ef7aa1e8008e91ec2fae3fe34c66312c7a6919b2&scene=21#wechat_redirect)》



##### 8.4.1.2.OpenLDAP



0137-《[1.如何在CentOS6.5安装OpenLDAP并配置客户端](http://mp.weixin.qq.com/s?__biz=MzI4OTY3MTUyNg==&mid=2247486919&idx=1&sn=3bb31ebea466b8f218ee7a3f09c50dac&chksm=ec2addcedb5d54d8cef30688a1c0b2e1e83699696e403a209100fa0d5878e44180bfe9b48755&scene=21#wechat_redirect)》

0138-《[2.OpenLDAP集成SSH登录并使用SSSD同步用户](http://mp.weixin.qq.com/s?__biz=MzI4OTY3MTUyNg==&mid=2247486920&idx=1&sn=10a6a3f9c8970619b4fe8702e650d7f9&chksm=ec2addc1db5d54d739c924e11e4844b5d97e28ce05e4e0e6e55c1c59dd7d3eafffc1684b3325&scene=21#wechat_redirect)》

0139-《[3.如何实现OpenLDAP的主主同步](http://mp.weixin.qq.com/s?__biz=MzI4OTY3MTUyNg==&mid=2247486942&idx=1&sn=0179d7e946ea3e938f3d943f19c523d5&chksm=ec2addd7db5d54c1e5cebb7d5ccab538115b8553ed65276a21f04600e5451616e81190cdb3dc&scene=21#wechat_redirect)》

0140-《[4. 如何为Hive配置OpenLDAP认证](http://mp.weixin.qq.com/s?__biz=MzI4OTY3MTUyNg==&mid=2247486964&idx=1&sn=56e9061c549043d2a05b251ab1cfb1a6&chksm=ec2addfddb5d54eb148233209ece54dd0c515c534c1e2f9038ac70c4b7c7d9024c561dd40b9b&scene=21#wechat_redirect)》

0141-《[5.如何为Impala配置OpenLDAP认证](http://mp.weixin.qq.com/s?__biz=MzI4OTY3MTUyNg==&mid=2247486973&idx=1&sn=af950732b28a18dc9b628bf0f0f09197&chksm=ec2addf4db5d54e2c722059f307571aa9dbbc2f0e2badc37e9bb001e55ac0b793ba78df91147&scene=21#wechat_redirect)》

0142-《[6.如何为Hue配置OpenLDAP认证](http://mp.weixin.qq.com/s?__biz=MzI4OTY3MTUyNg==&mid=2247487008&idx=1&sn=b6e2f9a401352d6781a8aa2133ab3924&chksm=ec2ade29db5d573f53d859cfb0103cda6da32246c3d0f0d0fec39597b551f83878ee9018003f&scene=21#wechat_redirect)》

0150-《[7.如何在OpenLDAP中实现将一个用户添加到多个组](http://mp.weixin.qq.com/s?__biz=MzI4OTY3MTUyNg==&mid=2247487095&idx=1&sn=4d59949200afe3f48d899734e84ea93a&chksm=ec2ade7edb5d5768ee55958afc35d7e1b61f16dbfeb4ab0c2497a8865fce73200df2ad17e680&scene=21#wechat_redirect)》

0166-《[如何集成OpenLDAP+Sentry.docx](http://mp.weixin.qq.com/s?__biz=MzI4OTY3MTUyNg==&mid=2247487331&idx=1&sn=1f956cacbff1ad2994e529e21989ce87&chksm=ec2adf6adb5d567c789bad59e64c7f19256d13173dacb01263993a2887b59dc1b57f7057699d&scene=21#wechat_redirect)》

0226- 《[1.如何在RedHat7上安装OpenLDA并配置客户端](http://mp.weixin.qq.com/s?__biz=MzI4OTY3MTUyNg==&mid=2247488759&idx=1&sn=26139ca87d4fb3d19c78178ea07cd0cd&chksm=ec2ac4fedb5d4de871236fea9b15140cbd529c57d1292b4ae1d64e6f4ba2d595730066e4b9c9&scene=21#wechat_redirect)》

0227- 《[2.如何在RedHat7中实现OpenLDAP集成SSH登录并使用sssd同步用户](http://mp.weixin.qq.com/s?__biz=MzI4OTY3MTUyNg==&mid=2247488780&idx=1&sn=bbce4474b62ba35962ecbcf94598222e&chksm=ec2ac505db5d4c139927a5bb630eea9d1cdc16e6d8620351cb882b5cf181c9475969fe629416&scene=21#wechat_redirect)》

0229- 《[3.如何RedHat7上实现OpenLDAP的主主同步](http://mp.weixin.qq.com/s?__biz=MzI4OTY3MTUyNg==&mid=2247488809&idx=1&sn=5cb2c35e0784e93f277a6cd94e3d434a&chksm=ec2ac520db5d4c36f2674ff02a21c8f107f31439e0099d011226054ae32ab372e4730e5380af&scene=21#wechat_redirect)》

0233- 《[4.如何为Hive集成RedHat7的OpenLDAP认证](http://mp.weixin.qq.com/s?__biz=MzI4OTY3MTUyNg==&mid=2247488924&idx=1&sn=1b3efd1e71a80a051ff01dd7351a9722&chksm=ec2ac595db5d4c838b583c7e4cb5e323ad41d5b497a64f275a35e3a0625d09eaf4565782677b&scene=21#wechat_redirect)》

0234- 《[5.如何为Impala集成Redhat7的OpenLDAP认证](http://mp.weixin.qq.com/s?__biz=MzI4OTY3MTUyNg==&mid=2247488933&idx=1&sn=d176adad53cad036f059f93eaad8536d&chksm=ec2ac5acdb5d4cbadc3a38efe5315923b02e47a7ef617b83dc15cfcf12bead70e2d949ae3179&scene=21#wechat_redirect)》

0235- 《[6.如何为Hue集成RedHat7的OpenLDAP认证](http://mp.weixin.qq.com/s?__biz=MzI4OTY3MTUyNg==&mid=2247488980&idx=1&sn=f952704d3bc186bf93b2e199d7ac5142&chksm=ec2ac5dddb5d4ccbb9663ff68156aabbffd09aa69c680ddb100ea62018ff2d81354c20d072aa&scene=21#wechat_redirect)》

0237- 《[7.如何在RedHat7的OpenLDAP中实现将一个用户添加到多个组](http://mp.weixin.qq.com/s?__biz=MzI4OTY3MTUyNg==&mid=2247489004&idx=1&sn=a3cfd2ec1f8eb2860f9182521f160f82&chksm=ec2ac5e5db5d4cf3af24db994ee911638f463a3c29c8bee14bd4387d2f5c06d33c4ae2aeea67&scene=21#wechat_redirect)》

0238- 《[8.如何使用RedHat7的OpenLDAP和Sentry权限集成](http://mp.weixin.qq.com/s?__biz=MzI4OTY3MTUyNg==&mid=2247489032&idx=1&sn=203ed1d6899bf704bd30a5b43321ad54&chksm=ec2ac601db5d4f17f06247a6bf23f5318a3abf1613c851e06836981bfdfab619089ff5172b90&scene=21#wechat_redirect)》

0361- 《[9.如何为Navigator集成RedHat7的OpenLDAP认证](http://mp.weixin.qq.com/s?__biz=MzI4OTY3MTUyNg==&mid=2247491942&idx=1&sn=98c1c890928279c6bcb214954b8e3b50&chksm=ec29316fdb5eb879c1eeaacc348f4655acfb780cbfb8738404aa4b26961196afce6b39b02f8a&scene=21#wechat_redirect)》

0367- 《[10.如何在OpenLDAP启用MemberOf](http://mp.weixin.qq.com/s?__biz=MzI4OTY3MTUyNg==&mid=2247492025&idx=1&sn=570146059a70d6d8823e44af2a1f3ae5&chksm=ec2931b0db5eb8a636a2d139ed9cc5132a7bc86b6b9d6c173e1573b9490bd9ca2b31fbd92314&scene=21#wechat_redirect)》

##### 8.4.1.3.AD

计划中...



##### 8.4.1.4.SAML

0191- 《[如何使用Shibboleth搭建IDP服务并集成OpenLDAP](http://mp.weixin.qq.com/s?__biz=MzI4OTY3MTUyNg==&mid=2247487857&idx=1&sn=99920666006cdda79f59e8196e111579&chksm=ec2ac178db5d486ebde79099680d6aa83d3c3b51277787b3f7a0d1abd6414fcdc3241296003f&scene=21#wechat_redirect)》

0192- 《[如何使用SAML配置Cloudera Manager的身份验证](http://mp.weixin.qq.com/s?__biz=MzI4OTY3MTUyNg==&mid=2247487884&idx=1&sn=9d5265c4a2700821c59601a8bfa66503&chksm=ec2ac185db5d48938555a89ca0c81242253636e2c4054c8d8ff4df7df74874e6b0dcb52b6ae1&scene=21#wechat_redirect)》

0199- 《[如何使用SAML配置CDSW的身份验证](http://mp.weixin.qq.com/s?__biz=MzI4OTY3MTUyNg==&mid=2247488078&idx=1&sn=d5b912478093d90b33865e6758354ee3&chksm=ec2ac247db5d4b51211cc64f1347c72aa55c0a733d184f0edf78f7dd79c0e99f8f1f148cb398&scene=21#wechat_redirect)》



#### 8.4.2.授权



0015-《[如何使用Sentry管理Hive外部表权限](http://mp.weixin.qq.com/s?__biz=MzI4OTY3MTUyNg==&mid=2247484261&idx=1&sn=516703b6fc8e467e1a64b305ded3d2b2&chksm=ec2ad36cdb5d5a7ae99dcf0ca82bea4de51f455d9788f1369ec130eedeb42f042f2bb8d06251&scene=21#wechat_redirect)》

0028-《[如何在CDH未启用认证的情况下安装及使用Sentry](http://mp.weixin.qq.com/s?__biz=MzI4OTY3MTUyNg==&mid=2247484800&idx=1&sn=c746f6eac50167fe5fc0aa70c1ab85e2&chksm=ec2ad589db5d5c9f2004468999958eb3f7c87c0721b74b9e9546aeef7fae2140b001ab259d31&scene=21#wechat_redirect)》

0031-《[如何在CDH启用Kerberos的情况下安装及使用Sentry(一)](http://mp.weixin.qq.com/s?__biz=MzI4OTY3MTUyNg==&mid=2247484811&idx=1&sn=5d54f0b0e85c2264033575c1b051b5b1&chksm=ec2ad582db5d5c94e7919faca495d4a5a8de21592cd1f95f93c02b98d92686238826a6a3c1fc&scene=21#wechat_redirect)》

0032-《[如何在CDH启用Kerberos的情况下安装及使用Sentry(二)](http://mp.weixin.qq.com/s?__biz=MzI4OTY3MTUyNg==&mid=2247484822&idx=1&sn=2742a260068bd78d101bc1f1f24ee309&chksm=ec2ad59fdb5d5c897f7ffb2fad38e861caf798732a9f6eca984e93e6c67d3adf765a9e4c94b5&scene=21#wechat_redirect)》

0033-《[如何在Hue中使用Sentry](http://mp.weixin.qq.com/s?__biz=MzI4OTY3MTUyNg==&mid=2247484858&idx=1&sn=b7a7b821f38e1d5c657f9f829812add3&chksm=ec2ad5b3db5d5ca5c99730c22f2d68c99e54c3ce723fb3a014dd884f891f9a4059248a840253&scene=21#wechat_redirect)》

0035-《[如何使用Sentry管理Hive外部表（补充）](http://mp.weixin.qq.com/s?__biz=MzI4OTY3MTUyNg==&mid=2247484860&idx=1&sn=0bf3e42c2a923f5e3a6d87744a86611b&chksm=ec2ad5b5db5d5ca38b8602ddebf91f8b153e1a31781a201504701dbba1e84f2438a26d391aab&scene=21#wechat_redirect)》

0067-《[Sentry赋予server1权限给hive以外用户时ACL不同步问题分析](http://mp.weixin.qq.com/s?__biz=MzI4OTY3MTUyNg==&mid=2247485436&idx=1&sn=84c4a9ab742179efcd928d9e2f80022c&chksm=ec2ad7f5db5d5ee32b726dd78c634e0022b8c082ac35a3583d70e3e954b86d832e527adaceba&scene=21#wechat_redirect)》

0074-《[如何在启用Sentry的CDH集群中使用UDF](http://mp.weixin.qq.com/s?__biz=MzI4OTY3MTUyNg==&mid=2247485588&idx=1&sn=023e7946760e624a2580ec62d2836e25&chksm=ec2ad89ddb5d518ba894113a0ba9639dbd49ac8112a769111487cf35377e427e16c1c09ed48d&scene=21#wechat_redirect)》

0155-《[如何查看集成Sentry后Hive作业的真实用户](http://mp.weixin.qq.com/s?__biz=MzI4OTY3MTUyNg==&mid=2247487159&idx=1&sn=81894787bd14fefeda4815fd29880e72&chksm=ec2adebedb5d57a8b9c24f8d53d23c83b13c19b9b907b65692c9e3f46c071faac48be70ee807&scene=21#wechat_redirect)》

0208- 《[如何使用Sentry实现Hive/Impala的数据脱敏](http://mp.weixin.qq.com/s?__biz=MzI4OTY3MTUyNg==&mid=2247488263&idx=1&sn=2dffec2d8ec88b12e25fec390a36e26a&chksm=ec2ac30edb5d4a1882fc73018bc11818c8ec9689ca546076eb7f01e01f7c20fd4daad18f4b8f&scene=21#wechat_redirect)》

0225- 《[如何使用Sentry通过视图实现Impala的行级授权](http://mp.weixin.qq.com/s?__biz=MzI4OTY3MTUyNg==&mid=2247488722&idx=1&sn=128baec685aa50742286fadeb2eab55f&chksm=ec2ac4dbdb5d4dcd3ed6be1ff9dd5e46219d0dff374959b799897696ccd6717ac479e253429b&scene=21#wechat_redirect)》

0279- 《[如何在Kerberos的CDH使用Sentry实现Spark SQL的权限控制](http://mp.weixin.qq.com/s?__biz=MzI4OTY3MTUyNg==&mid=2247490054&idx=1&sn=d7ccb9b00a9a31a80fa7995c2f018663&chksm=ec2aca0fdb5d43195ebacea1d5ebefb92c5b82366c8844aea3ee03d0072ab04fe61d6e7ff71c&scene=21#wechat_redirect)》

0294- 《[如何使用Sentry为Solr赋权](http://mp.weixin.qq.com/s?__biz=MzI4OTY3MTUyNg==&mid=2247490505&idx=1&sn=4440d015993ec16f140d7b1f5eede6eb&chksm=ec2acbc0db5d42d610906b85ce871b60220221d4ed264207cc15b4ecf47bbae909638d02a2ed&scene=21#wechat_redirect)》

0298- 《[如何使用Sentry为Kafka赋权](http://mp.weixin.qq.com/s?__biz=MzI4OTY3MTUyNg==&mid=2247490617&idx=1&sn=1cd09334bfa8edcb454daf444f85da89&chksm=ec2acc30db5d4526e6ea9f4edfb50745922bc424da673eb6d197b6a0b6bed4ff2eaba838ad56&scene=21#wechat_redirect)》

0304- 《[如何在Hue中使用Sentry为Solr赋权](http://mp.weixin.qq.com/s?__biz=MzI4OTY3MTUyNg==&mid=2247490766&idx=1&sn=d24313eda74ac847a5573a160ee673a5&chksm=ec2accc7db5d45d10349e7d6c527e40cb7b29a52f9237ba047429a631cb714d3e18463566dd6&scene=21#wechat_redirect)》



#### 8.4.3.加密







0092-《[什么是HDFS透明加密](http://mp.weixin.qq.com/s?__biz=MzI4OTY3MTUyNg==&mid=2247485971&idx=1&sn=3f30fa5ee67ef18d4efe70866a676e06&chksm=ec2ada1adb5d530ce640fee931e9fcb1853aa7ead426d5bc8d1d792c94d31ce66600f460cba2&scene=21#wechat_redirect)》

0111-《[如何在CDH实现HDFS透明加密](http://mp.weixin.qq.com/s?__biz=MzI4OTY3MTUyNg==&mid=2247486355&idx=1&sn=36ff225a2e7935f1896559f7314556bd&chksm=ec2adb9adb5d528c89e90874ef69a857be69739c64578edae365c56f28cd94524e727e68a1c7&scene=21#wechat_redirect)》



#### 8.4.4.审计







计划中...



### 8.5.集群资源使用报告







0157-《[如何在CM中启用YARN的使用率报告](http://mp.weixin.qq.com/s?__biz=MzI4OTY3MTUyNg==&mid=2247487199&idx=1&sn=aa399c71cf48a59e74d765c7b1f960df&chksm=ec2aded6db5d57c0f0897fcbb7fc5bda3472c3bef7bfff2964b599f186be8bce0f9ac89b4d7d&scene=21#wechat_redirect)》



## 9.灾备

### 9.1.介绍







0244- 《[如何部署active-active的Hadoop集群](http://mp.weixin.qq.com/s?__biz=MzI4OTY3MTUyNg==&mid=2247489111&idx=1&sn=a915e8c73b3dbd74add38edbe7feca81&chksm=ec2ac65edb5d4f48f13590fdf545873b8392d6dac957cea0927aea22926b4adb4fd43dafee50&scene=21#wechat_redirect)》



### 9.2.HDFS





0013-《[如何在Kerberos与非Kerberos的CDH集群BDR不可用时复制数据](http://mp.weixin.qq.com/s?__biz=MzI4OTY3MTUyNg==&mid=2247484227&idx=1&sn=27d2a53e818ec5f865d68cedf18c22bd&chksm=ec2ad34adb5d5a5c491e384b947578719cbb568237554dd7dbd2e31bd628814b3245999003f6&scene=21#wechat_redirect)》



### 9.2.HBase







0076-《[如何使用HBase快照实现跨集群全量与增量数据迁移](http://mp.weixin.qq.com/s?__biz=MzI4OTY3MTUyNg==&mid=2247485678&idx=1&sn=8e630c35bd060da7ce2401591b75a8a5&chksm=ec2ad8e7db5d51f1e0f5ebe0facd3f540153fc6a099dc892aea99dfcc241397549f9ae980edc&scene=21#wechat_redirect)》



## 10.运维

### 10.1.监控







0211- 《[Cloudera Manager监控介绍](http://mp.weixin.qq.com/s?__biz=MzI4OTY3MTUyNg==&mid=2247488286&idx=1&sn=ef701cc00d7b1c1d93d4dd15a4b74f52&chksm=ec2ac317db5d4a01389d9a221f9a4f250f43916dd79bed4dab5b7221d9aac41948ff504ec755&scene=21#wechat_redirect)》

0212- 《[Cloudera Manager的时间轴](http://mp.weixin.qq.com/s?__biz=MzI4OTY3MTUyNg==&mid=2247488306&idx=1&sn=353404a8ce789116d0563837b23a6f04&chksm=ec2ac33bdb5d4a2d8db8e787eaa5da4a273c84b23021c015508acfcda18606feb7bd005c6361&scene=21#wechat_redirect)》

0213- 《[Cloudera Manager的运行状况测试](http://mp.weixin.qq.com/s?__biz=MzI4OTY3MTUyNg==&mid=2247488330&idx=1&sn=7e4f13526dbfce9eb96c431eaec13d2c&chksm=ec2ac343db5d4a5527d449a7b9b41564cde57204a8cdaf6a457f9cff293c8cd4c88c462ee55c&scene=21#wechat_redirect)》

0218- 《[使用Cloudera Manager查看集群，服务，角色和主机的图表](http://mp.weixin.qq.com/s?__biz=MzI4OTY3MTUyNg==&mid=2247488498&idx=1&sn=c6ff1522a18934767d4947a6daa03f3a&chksm=ec2ac3fbdb5d4aed8d45f55c2a76e3bccec4ef782cb4b878e50ee95cab2b46d72f07c83789f8&scene=21#wechat_redirect)》

0289- 《[如何使用Cloudera Manager监控服务](http://mp.weixin.qq.com/s?__biz=MzI4OTY3MTUyNg==&mid=2247490380&idx=1&sn=eacee481a3fcf8e323392f3eae982ff4&chksm=ec2acb45db5d4253559a0d6dcf157adaf269500a50f9c998cdc4b69d608c05a73e3c403ee640&scene=21#wechat_redirect)》



### 10.2.告警







0259- 《[如何通过Cloudera Manager配置使用SNMP方式转发告警](http://mp.weixin.qq.com/s?__biz=MzI4OTY3MTUyNg==&mid=2247489479&idx=1&sn=7e1d1c226dbea5eac34797584d1be2fe&chksm=ec2ac7cedb5d4ed82749cd6d63d177531a9cca93eb5de0182fb6a68d07974369694172f99791&scene=21#wechat_redirect)》



## 11.外部工具集成

### 11.1.Tableau

0093-《[如何安装Tableau并连接CDH的Hive/Impala](http://mp.weixin.qq.com/s?__biz=MzI4OTY3MTUyNg==&mid=2247486022&idx=1&sn=52f29bf3788d1693349ba13c4f98de36&chksm=ec2ada4fdb5d5359175ac939bc8e965f361a3ac16a54c31d06597ec8f1f0ecc11bb21dab4e11&scene=21#wechat_redirect)》

0094-《[如何通过Tableau连接Kerberos的Hive/Impala](http://mp.weixin.qq.com/s?__biz=MzI4OTY3MTUyNg==&mid=2247486063&idx=1&sn=98c4daa23d62937b57e19ac53f9adf66&chksm=ec2ada66db5d53705b220cfaecbaa9d77bbfb9898d8e024545a1bd3db29014b78175299d576b&scene=21#wechat_redirect)》



### 11.2.SAS





0198- 《[如何安装SAS并配置连接Hive/Impala](http://mp.weixin.qq.com/s?__biz=MzI4OTY3MTUyNg==&mid=2247488053&idx=1&sn=70ffd9e1d78058645674b4caed034e7f&chksm=ec2ac23cdb5d4b2a32e1a64e30e151617357b9321b72c3177dada80a5589895ac777ba98538a&scene=21#wechat_redirect)》



### 11.3.Azkaban





0214- 《[如何编译安装Azkaban服务](http://mp.weixin.qq.com/s?__biz=MzI4OTY3MTUyNg==&mid=2247488369&idx=1&sn=2191be3f9880e16e994046f205b1841a&chksm=ec2ac378db5d4a6e392467a2d0b097aa30fb0c88b16306c26da91bf59e0742cc23dd031cdf5e&scene=21#wechat_redirect)》

0215- 《[如何编译Azkaban插件](http://mp.weixin.qq.com/s?__biz=MzI4OTY3MTUyNg==&mid=2247488388&idx=1&sn=91e5e2e3b01bf0ee5bd2303f17c50324&chksm=ec2ac38ddb5d4a9b89f4f73183378ca0067d5a0eccfaa079e91a44842bb883660e63f297e3b3&scene=21#wechat_redirect)》

0219- 《[如何在Azkaban中安装HDFS插件以及与CDH集成](http://mp.weixin.qq.com/s?__biz=MzI4OTY3MTUyNg==&mid=2247488515&idx=1&sn=5e17d1f2b2469aa708a1631ef5e43c96&chksm=ec2ac40adb5d4d1cf9d41359924e1db5680cdb415decb6fa094597f8615938813c4c2e8674dc&scene=21#wechat_redirect)》

0222- 《[如何在Azkaban安装插件(二)](http://mp.weixin.qq.com/s?__biz=MzI4OTY3MTUyNg==&mid=2247488674&idx=1&sn=37c49a7ea0955554dc1e9f1cb41cfda0&chksm=ec2ac4abdb5d4dbd0dd182fe010722063dcb067c974383bee8ae08e50b8c46bdc44091020aed&scene=21#wechat_redirect)》

0223- 《[Azkaban的使用及Command作业创建](http://mp.weixin.qq.com/s?__biz=MzI4OTY3MTUyNg==&mid=2247488693&idx=1&sn=b7a0352aaad9644b257540be036a3d58&chksm=ec2ac4bcdb5d4daaf4f0706ef5281d42ad31a9dd66c9b7a665adb7cd6a65e8c5e9cd1f56d78c&scene=21#wechat_redirect)》



### 11.4.SmartBI



0257- 《[如何安装SmartBI并连接到Impala](http://mp.weixin.qq.com/s?__biz=MzI4OTY3MTUyNg==&mid=2247489419&idx=1&sn=1b0cbd7b35b2046cce6d33958e4f3a0d&chksm=ec2ac782db5d4e9467d72182834ca402cbd2ee78d66003c5ccdb8189126a78e0226c00174fab&scene=21#wechat_redirect)》



### 11.4.StreamSets





0220- 《[如何在CDH中安装和使用StreamSets](http://mp.weixin.qq.com/s?__biz=MzI4OTY3MTUyNg==&mid=2247488566&idx=1&sn=8c4350eb654453b2317de2b347b6e525&chksm=ec2ac43fdb5d4d2964e2b074d02faaeebe202c2ba3565ac00f589b696644bdbfa8f6f4d9754e&scene=21#wechat_redirect)》

0231- 《[如何使用StreamSets从MySQL增量更新数据到Hive](http://mp.weixin.qq.com/s?__biz=MzI4OTY3MTUyNg==&mid=2247488852&idx=1&sn=77d75561820c60c5d9f3eddaf7023dc0&chksm=ec2ac55ddb5d4c4be46b46ae4439d7405deaf51c203c44295f2eabdd3622672977ad58d547da&scene=21#wechat_redirect)》

0232- 《[如何使用StreamSets实现MySQL中变化数据实时写入Kudu](http://mp.weixin.qq.com/s?__biz=MzI4OTY3MTUyNg==&mid=2247488901&idx=1&sn=58e8038e11b6b628c99001c696124c66&chksm=ec2ac58cdb5d4c9a1ca678cfb089681542d1b7d3f543af35b71999065f5b3c7a020ced5c8fca&scene=21#wechat_redirect)》

0255- 《[如何使用StreamSets实时采集Kafka并入库Kudu](http://mp.weixin.qq.com/s?__biz=MzI4OTY3MTUyNg==&mid=2247489340&idx=1&sn=6ab88e12768add3dda48ee9782f8c3ac&chksm=ec2ac735db5d4e23eada0d30899d4a4fbdabdd062acc5ed42e784c281b0769560e44b68a2828&scene=21#wechat_redirect)》

0282- 《[如何使用StreamSets实现MySQL中变化数据实时写入HBase](http://mp.weixin.qq.com/s?__biz=MzI4OTY3MTUyNg==&mid=2247490146&idx=1&sn=2e890590da6ed3f96805c95f194a1869&chksm=ec2aca6bdb5d437dc32c7ae50f19d0785558faa5241d0fea11c38a75a62e4a8affa1df93cd8a&scene=21#wechat_redirect)》

0299- 《[如何使用StreamSets实时采集Kafka数据并写入Hive表](http://mp.weixin.qq.com/s?__biz=MzI4OTY3MTUyNg==&mid=2247490655&idx=1&sn=ecfd89ecef9f89968f59f5503f09eb2e&chksm=ec2acc56db5d4540e59108f48e163554aa708acd79b2c6b8ef28f2b25dab930a4299dd435945&scene=21#wechat_redirect)》

0302 -《[如何使用StreamSets实时采集Kafka中嵌套JSON数据并写入Hive表](http://mp.weixin.qq.com/s?__biz=MzI4OTY3MTUyNg==&mid=2247490761&idx=1&sn=ef7bdb59d529e7fde384649306602b08&chksm=ec2accc0db5d45d60a7dce37bc102953ba5b7f4d1bba58cf373074f7811d3b674eb9c49bbe70&scene=21#wechat_redirect)》

0320- 《[如何使用StreamSets实现Oracle中变化数据实时写入Kudu](http://mp.weixin.qq.com/s?__biz=MzI4OTY3MTUyNg==&mid=2247491173&idx=1&sn=9b416b68bb89582519128bab58abf8ac&chksm=ec2ace6cdb5d477a8d83c11d49d590790e545e35c05e1e7f09c7cd7c49b38b174c7f0fd53c48&scene=21#wechat_redirect)》



### 11.5.Kylin





0260- 《[如何在CDH中部署及使用Kylin](http://mp.weixin.qq.com/s?__biz=MzI4OTY3MTUyNg==&mid=2247489540&idx=1&sn=a9a2c9bbb065987cd8756635c146800d&chksm=ec2ac80ddb5d411b69c49b17d7a3d4ae0807aa7427739320241076fa9f4f217a7a46e1154b04&scene=21#wechat_redirect)》

0295- 《[如何在启用Kerberos的CDH中部署及使用Kylin](http://mp.weixin.qq.com/s?__biz=MzI4OTY3MTUyNg==&mid=2247490548&idx=1&sn=4660373343914470862ba630930ab5ed&chksm=ec2acbfddb5d42eb1fbe9c121e57921ad50d4bbf5c0f7007360fc27793a9856a2feabd02b4d1&scene=21#wechat_redirect)》



### 11.6.Presto





0316- 《[如何在CDH集群中部署Presto](http://mp.weixin.qq.com/s?__biz=MzI4OTY3MTUyNg==&mid=2247491020&idx=1&sn=5c7ae5eea0335dfab22b7da48301817d&chksm=ec2acdc5db5d44d374a83c41c2269d2f0092317a7b64db9bdab5c8cf77be4206b333d1820328&scene=21#wechat_redirect)》

0318- 《[如何为Presto集成Kerberos环境下的Hive](http://mp.weixin.qq.com/s?__biz=MzI4OTY3MTUyNg==&mid=2247491103&idx=1&sn=be62dbac972df9d30b339ff02237b261&chksm=ec2ace16db5d4700bf0b2fec56409190791b3e3ff793a0733fccd78fae7a62ae108c6172abd6&scene=21#wechat_redirect)》



## 12.应用场景

### 12.1.实时

0116-《[如何在Kerberos环境使用Flume采集Kafka数据并写入HDFS](http://mp.weixin.qq.com/s?__biz=MzI4OTY3MTUyNg==&mid=2247486469&idx=1&sn=a88387ecf74df0f6139be0742fc50634&chksm=ec2adc0cdb5d551ac184c36d0b905b53df8a133ab005bc4aa6fa5b5730be45cb356d3aeda0fa&scene=21#wechat_redirect)》

0122-《[非Kerberos环境下Kafka数据到Flume进Hive表](http://mp.weixin.qq.com/s?__biz=MzI4OTY3MTUyNg==&mid=2247486599&idx=1&sn=a45adda9f6a2d955c8073b493b3bf246&chksm=ec2adc8edb5d55984a2536203b61d3b7886db3f649a92e439cd99369f8eaa3a5c0920c4fbf0b&scene=21#wechat_redirect)》

0145-《[如何使用Spark Streaming读取HBase的数据并写入到HDFS](http://mp.weixin.qq.com/s?__biz=MzI4OTY3MTUyNg==&mid=2247487031&idx=1&sn=6cf09e448b1f74a57e32375401bb9fd2&chksm=ec2ade3edb5d57283497e984b61df284fa3ca918ed6a189c12e3369cdb49e17bbef975116c3d&scene=21#wechat_redirect)》

0283- 《[SparkStreaming读Kafka数据写HBase](http://mp.weixin.qq.com/s?__biz=MzI4OTY3MTUyNg==&mid=2247490167&idx=1&sn=40c06fc00495a503fa4eb6cce724f698&chksm=ec2aca7edb5d4368c5cad73a1c0afc4a3907a0c433005e2062638163cca9ff4d5f9017370a9d&scene=21#wechat_redirect)》
0286- 《[SparkStreaming读Kafka数据写Kudu](http://mp.weixin.qq.com/s?__biz=MzI4OTY3MTUyNg==&mid=2247490289&idx=1&sn=e1d00dd722bea8f4933ec9860dfd1a9d&chksm=ec2acaf8db5d43ee4be479460fe23523df26b3d136f877db12cd9ac4317389e5ef57ee932a59&scene=21#wechat_redirect)》

0287- 《[如何使用Flume采集Kafka数据写入Kudu](http://mp.weixin.qq.com/s?__biz=MzI4OTY3MTUyNg==&mid=2247490308&idx=1&sn=ed1a6b7edfab019a12f9c9aba9611a5b&chksm=ec2acb0ddb5d421bfb00456e67daac6b2724e3ab67ba9bffe2b19dd3fadbb1071fc9694cbefe&scene=21#wechat_redirect)》

0288- 《[如何使用Flume采集Kafka数据写入HBase](http://mp.weixin.qq.com/s?__biz=MzI4OTY3MTUyNg==&mid=2247490323&idx=1&sn=cdb20a0fcd6311030f6174bef798f99b&chksm=ec2acb1adb5d420cb8dfac5e35194b17cff9749991d2d6b782ccca0821a5f5d6e6d098a6cec5&scene=21#wechat_redirect)》

0290- 《[如何在Kerberos环境下使用Flume采集Kafka数据写入HBase](http://mp.weixin.qq.com/s?__biz=MzI4OTY3MTUyNg==&mid=2247490402&idx=1&sn=9e4e8fc35aa483f26ea5418df1528a0c&chksm=ec2acb6bdb5d427d9c3d333c0543c912ab16b9c5f30e01cb93cddcecdc2ceea0d11645021f93&scene=21#wechat_redirect)》

0309- 《[Spark2Streaming读Kerberos环境的Kafka并写数据到Kudu](http://mp.weixin.qq.com/s?__biz=MzI4OTY3MTUyNg==&mid=2247490880&idx=1&sn=84c64463981bff2b63f6cb1118cad707&chksm=ec2acd49db5d445f71200a4c01113d28a9c633cf9dd20fcfe0d833a4672b17b4edd7e6c4d519&scene=21#wechat_redirect)》

0310- 《[Spark2Streaming读Kerberos环境的Kafka并写数据到HBase](http://mp.weixin.qq.com/s?__biz=MzI4OTY3MTUyNg==&mid=2247490903&idx=1&sn=2219f3ab03f1761bc51520dcb72e7962&chksm=ec2acd5edb5d4448d78080501bc4eb3285efa4385cabed348147a1215d14a680ce002985a80d&scene=21#wechat_redirect)》

0330- 《[Spark2Streaming读Kerberos环境的Kafka并写数据到Hive](http://mp.weixin.qq.com/s?__biz=MzI4OTY3MTUyNg==&mid=2247491380&idx=1&sn=0450194ccdb493eb0e55964a54fadf87&chksm=ec2acf3ddb5d462b260fde7b8c3f6ec7c5f6e9243ec9c299112eca5e8666692e274fbb20411e&scene=21#wechat_redirect)》

0335- 《[Spark2Streaming读Kerberos环境的Kafka并写数据到HDFS](http://mp.weixin.qq.com/s?__biz=MzI4OTY3MTUyNg==&mid=2247491471&idx=1&sn=dc059fc1248afff8f50cf5f4386c2036&chksm=ec2acf86db5d4690be155588c77ee1a2d1bb4ecbbc0d456af96da021078db5e02b5699b2be42&scene=21#wechat_redirect)》

0338-《[Spark2Streaming读Kafka并写入到HBase](http://mp.weixin.qq.com/s?__biz=MzI4OTY3MTUyNg==&mid=2247491585&idx=2&sn=c288a801d70d66f417794d5946c44b05&chksm=ec293008db5eb91e861731a77cbfd6365b6cebfcb8a5404a2700ef03907002e9cd0b451f4e66&scene=21#wechat_redirect)》

0352- 《[Spark2Streaming读非Kerberos环境的Kafka并写数据到Kudu](http://mp.weixin.qq.com/s?__biz=MzI4OTY3MTUyNg==&mid=2247491810&idx=1&sn=2b7894cb8480230a276040fb94dabccc&chksm=ec2930ebdb5eb9fd1ae3f5bc470ab02b0864c24f2c3a1a88575e0d43c3e462c187145c71a776&scene=21#wechat_redirect)》



## 13.基准测试





0245- 《[如何使用HiBench进行基准测试](http://mp.weixin.qq.com/s?__biz=MzI4OTY3MTUyNg==&mid=2247489153&idx=1&sn=fd19cad4b162d1cdef69420504d9b99c&chksm=ec2ac688db5d4f9e9c66f7c6834e6964fb3694b9a6f48c88cfc20263b0ff122f068959341489&scene=21#wechat_redirect)》

0201- 《[如何编译及使用TPC-DS生成测试数据](http://mp.weixin.qq.com/s?__biz=MzI4OTY3MTUyNg==&mid=2247488108&idx=1&sn=8f34c674bc12990d61a8f4de4ca3c728&chksm=ec2ac265db5d4b731b93c4b7da0b3a24f0bf200274dd763531873bb4dd205e37d704ea2719b6&scene=21#wechat_redirect)》



## 14.其他





0018- 《[大数据售前的中年危机](http://mp.weixin.qq.com/s?__biz=MzI4OTY3MTUyNg==&mid=2247484268&idx=1&sn=29e4ace3de0c7ab9a7b08ba63c6ba16b&chksm=ec2ad365db5d5a73febf528056dc94462af2f932a49a8eced05c9e7a160a80a3250ac6b83023&scene=21#wechat_redirect)》

0048- 《[Hortonworks联合Jethro扩充其数据仓库解决方案](http://mp.weixin.qq.com/s?__biz=MzI4OTY3MTUyNg==&mid=2247485118&idx=1&sn=5fff93677aaea7cebdf04863c7e0363e&chksm=ec2ad6b7db5d5fa1cfae6bb339784c7f3e55d6d54e3c0b5609d6ae5562bd450776756fdd661d&scene=21#wechat_redirect)》

0059- 《[工程师的一天](http://mp.weixin.qq.com/s?__biz=MzI4OTY3MTUyNg==&mid=2247485304&idx=2&sn=45457443b8a9b31ff8cf975a8bcfbfa6&chksm=ec2ad771db5d5e67e55043a27bf45cc50454cadaefe6170ae0ea76013770b9a5fb2eb24f277d&scene=21#wechat_redirect)》

0106- 《[总用户数破1000，后台数据公布](http://mp.weixin.qq.com/s?__biz=MzI4OTY3MTUyNg==&mid=2247486244&idx=1&sn=9b5218c630099690b9d44cd86b13e714&chksm=ec2adb2ddb5d523bd57bd1c142192cc426bd61aab629a15d72aed0e3d866e1e54bee5267c365&scene=21#wechat_redirect)》

0179- 《[Fayson给大家拜年](http://mp.weixin.qq.com/s?__biz=MzI4OTY3MTUyNg==&mid=2247487719&idx=1&sn=cc6ec1ebabc1056d8862ad7543434b49&chksm=ec2ac0eedb5d49f81b9fe528bff7863412d84aa8ff407b5470d259cc0c0ab5a92d91b8fa26ad&scene=21#wechat_redirect)》

0221- 《[冲上云霄](http://mp.weixin.qq.com/s?__biz=MzI4OTY3MTUyNg==&mid=2247488576&idx=1&sn=01ae0dac7c5981630edeebf6003e71e0&chksm=ec2ac449db5d4d5f14e24ba8bb5b87f78019fa8b7fdaa9baed51c002761b458bb6c0c3148a1c&scene=21#wechat_redirect)》

0222- 《[如何在Centos7.2安装HDP2.6](http://mp.weixin.qq.com/s?__biz=MzI4OTY3MTUyNg==&mid=2247488674&idx=2&sn=a7eedc164839fa16d355b529889d5c02&chksm=ec2ac4abdb5d4dbd65ff671990a5fa85c793f6d4326302b1619b2fb8962f0daa289d034cd9b6&scene=21#wechat_redirect)》

0228- 《[Cloudera去年第四季度以及全年财报](http://mp.weixin.qq.com/s?__biz=MzI4OTY3MTUyNg==&mid=2247488784&idx=1&sn=ea3c44f0baae14fcd2b76a5d23613c10&chksm=ec2ac519db5d4c0fdcb93382bca1aa369998ff37f32043728d3b1ff394a8c0695644b43865de&scene=21#wechat_redirect)》

0230- 《[Hortonworks去年第四季度以及全年财报](http://mp.weixin.qq.com/s?__biz=MzI4OTY3MTUyNg==&mid=2247488813&idx=1&sn=2ae0e8ce6a66687177d2b800d81edae4&chksm=ec2ac524db5d4c323cbbd06e59b73ae1585dfa976244b10a46cfc55fdb67a0f2c55f8ffc4144&scene=21#wechat_redirect)》

0259- 《[如何在DELL R730服务器上使用U盘安装linux操作系统](http://mp.weixin.qq.com/s?__biz=MzI4OTY3MTUyNg==&mid=2247489479&idx=2&sn=48844a7bbacf70d800e2eb03aa40c9cf&chksm=ec2ac7cedb5d4ed84bbe676a5911d19b242608f3f639c4593adc88c421e8e5c9c7d8e6b40ecd&scene=21#wechat_redirect)》

0329- 《[Hortonworks正式发布HDP3.0](http://mp.weixin.qq.com/s?__biz=MzI4OTY3MTUyNg==&mid=2247491362&idx=1&sn=472a0fed3dc2f4009cedbd70ce436773&chksm=ec2acf2bdb5d463d05be14e6ea3f197406b329560fa82c1de4eaf5c09a44f349bc6188d3fa14&scene=21#wechat_redirect)》

0366- 《[周年庆](http://mp.weixin.qq.com/s?__biz=MzI4OTY3MTUyNg==&mid=2247492011&idx=1&sn=4c71f8f11cd7417e6a3a36bf9737b094&chksm=ec2931a2db5eb8b401b584489f5028a62a01fde04a3e40d4d58887f87e0518a40bec3e70ef97&scene=21#wechat_redirect)》

《[刘汨春：AI大数据在企业全链业务中的应用和价值（上）](http://mp.weixin.qq.com/s?__biz=MzI4OTY3MTUyNg==&mid=2247491833&idx=1&sn=37adc91d94510d2b14ec31dbfc59922b&chksm=ec2930f0db5eb9e674141e49a1a2ece40d52bb8eae2c681b1166011d75ee602389aa3ef6b5fb&scene=21#wechat_redirect)》

《[HDFS添加 NFS Gateway 角色实例启动失败问题及解决办法](http://mp.weixin.qq.com/s?__biz=MzI4OTY3MTUyNg==&mid=2247491903&idx=2&sn=d7aa62f23f489c8c5fc20d32c5d51bce&chksm=ec293136db5eb82074488287419b20f19dfbb64278398389d566484e3c459e074313a149e8e0&scene=21#wechat_redirect)》

《[近期文章内容预告](http://mp.weixin.qq.com/s?__biz=MzI4OTY3MTUyNg==&mid=2247491903&idx=3&sn=878f1e68df035d8916e9dbbb786d7a89&chksm=ec293136db5eb82031e9b6754013eec9e85a639b31db1bad267953a9e158da197e75054b00a2&scene=21#wechat_redirect)》

《[安装CDSW数据磁盘初始化异常问题分析](http://mp.weixin.qq.com/s?__biz=MzI4OTY3MTUyNg==&mid=2247491903&idx=4&sn=960701011a24eecc89abbc187d18076c&chksm=ec293136db5eb82066a06bac55a19cd86f5cf28758b153c8fcbd9d161dbe4a3fb74bedf8dbb6&scene=21#wechat_redirect)》

《[安装CDSW数据磁盘初始化异常问题分析](http://mp.weixin.qq.com/s?__biz=MzI4OTY3MTUyNg==&mid=2247491903&idx=4&sn=960701011a24eecc89abbc187d18076c&chksm=ec293136db5eb82066a06bac55a19cd86f5cf28758b153c8fcbd9d161dbe4a3fb74bedf8dbb6&scene=21#wechat_redirect)》

《[重庆某项目生产集群扩容问题总结及复盘](http://mp.weixin.qq.com/s?__biz=MzI4OTY3MTUyNg==&mid=2247491903&idx=5&sn=008d5a4d15e81fb3e6f631302794edde&chksm=ec293136db5eb820779ef686ba383a79356c6dbc8e0e075137218cf8f76532e2c98e49f56fa8&scene=21#wechat_redirect)》

《[如何为CDH集群配置机架感知](http://mp.weixin.qq.com/s?__biz=MzI4OTY3MTUyNg==&mid=2247491903&idx=6&sn=6248fa11df061bf81be364c2173c2d37&chksm=ec293136db5eb820cc1bc2174d6ca3f7545c3aeb5e99fe8d36beb568ee6c76b5b8383bca93e9&scene=21#wechat_redirect)》

《[HDFS运行Balancer失败及问题解决办法](http://mp.weixin.qq.com/s?__biz=MzI4OTY3MTUyNg==&mid=2247491903&idx=7&sn=a52684700af78b9e5712a2b407760d4d&chksm=ec293136db5eb8204c6edcecb48cc15ce4c61844c435838e7ef49f7f045f3bae9dde11c2eaa1&scene=21#wechat_redirect)》