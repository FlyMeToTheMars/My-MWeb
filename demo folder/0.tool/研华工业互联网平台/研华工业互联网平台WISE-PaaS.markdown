# 研华工业互联网平台WISE-PaaS  

## 1.工业互联网平台定义  

![image](assets/image-1542276776654-1542276778162.png)



**“ 数据采集是基础 ， 工业PaaS是核心 ， 工业App是关键 。”**  

在最新发布的《工业互联网平台白皮书（2017）》中，这句话比较准确的描述工业互联网平台。  `工业互联网平台`作为工业互联网的三大要素之一，是工业全要素链接的枢纽，是工业资源配置的核心。  
`工业互联网平台`是面向制造业数字化、网络化、智能化需求，构建基于海量数据采集、汇聚、分析的服务体系，支撑制造资源泛在连接、弹性供给、高效配置的工业云平台，包括**`边缘`、`平台（工业 PaaS）`、`应用`**三大核心层级。  

## 2.WISE-PaaS 2.0架构  

![image](assets/image.png)

- **WISE-PaaS 物智联软件平台:**为系统整合商、制造业、传统产业、各领域市场提供关键核心软件服务，从设备联网与无线感测整合的EdgeSense、视频与多媒体影像分析的VideoSense、数据采集与可视化的WebAccess、到云服务平台的EnSaaS，将持续携手合作伙伴推出更多样化软件与云服务，以推动实体产业数位转型，并加速实践产业智能化的目标。  

- **WebAccess:**是工业物联网应用软件平台，用于大数据收集、分析及可视化，并提供开放的API界面，可进行二次开发，整合第三方系统。使用者通过电脑、手机、平板，能随时进行远端设备监控，掌握重要讯息，助力经营决策。  
- **VideoSense:**是物联网智能影像应用服务平台，提供数据感测、影像分析、数据可视化与即时派送播放等智能管理系统，提供工业安防、零售、物流、交通、医疗等应用领域，重要的影像技术模组。  
- **EdgeSense:**是设备联网与无线感测整合的软件服务，可进行资料撷取串接、远程软件即时升级、感测器资料汇流、连接云端、即时下达命令，并落实端到端资料安全，实现物联网端到云的快速沟通串流。  
- **EnSaaS:**是物联网云平台服务，有多租户应用，自动调整需求资源、数据整合、计价模式、安全性、全时运行等特色，通过数据分析与机器学习，将运算模型依需求导入云端，提供和产业引用云平台服务。  

### 2.1 WISE-PaaS/EdgeSense  

![image](assets/image-1542277004069.png)

* 通过WISE-PaaS/EdgeSense 的解决方案，提供客户进行数据上传至云端的途径  
### 2.2 WebAccess  

![0e5d70769efec00d9e9c2557553a4a9e](assets/0e5d70769efec00d9e9c2557553a4a9e.jpg)

WebAccess软件平台目前主要由四个软件架构组成，分别为WebAccess/SCADA、WebAccess/Dashboard、WebAccess/TagLink以及WebAccess/CNC。  
-  WebAccess/SCADA拥有强大的**数据采集能力**，其具备独有的网络架构与灵活的可扩展性，可让用户容易地透过网络开发项目及远程维护与监控。  

-  WebAccess/TagLink则可视作“轻量化”的SCADA，基于Linux开发，其优势在于可建置在低成本的装置上进行数据采集，并且针对远程设备的链接具有强大的通讯功能。  
-  WebAccess/CNC则是研华专门为工具机所设计开发的软件服务，针对工具机市场提供跨厂牌，包括西门子、发那科、三菱等进行数据平台的整合。  

-  WebAccess/Dashboard可跨平台进行数据可视化的呈现，虽过去多以在终端与SCADA整合，不过，为发挥数据数据显示功能更多潜在价值，未来研华也计划将其作为WISE-PaaS平台中，数据可视化的标准工具之一，与其他应用软件结合，发挥更多效益。  

### 2.3  WISE-PaaS私有云  

![image](assets/image-1542277081353.png)


#### 2.3.1 私有云技术架构
![image](assets/image-1542277095716.png)
​     

#### 2.3.2 私有云硬件技术架构 
![image](assets/image-1542277121555.png) 

### 2.4 IoT Hub  

![image](assets/image-1542277251075.png)

研华私有云提供一款很好的中央开发工具——IoT Hub，使用者就不需要自行开发资料传输的功能，有效节省了人力。IoT Hub提供SaaS方案与边缘装置间的信息发送与接收功能，并且支持多种协定：AMQP、MQTT、MOTT Over WebSocket等。  

### 2.5 WISE-PaaS/Dashboard  

#### 2.5.1 Dashboard技术架构图  

![image](assets/image-1542277281757.png)

WISE-PaaS/Dashboard 基于open source Grafana，提供多样化的数据呈现形式。支持各种数据源和数据库。数据源和显示组件支持插件化的开发扩展, Grafana Labs提供各种官方和社区开发的插件。可快速打造demo或战情室的开发。  

> 什么时候用Grafana，什么时候用Superset  
> * 时间序列，选Grafana  
> * 数据量很大，用Grafana  
> * 静态的日报、报表，Superset表现力很好  

Dashboard架构主要分为前端、Plugins、Backend Core、HTTP API以及用户管理部分。  

- 前端数据的呈现配置好查询条件后会通过Data Source Plugin调用Backend Core的接口向远端的Data Source Server查询数据，查询的数据会返回给Panel Plugin呈现各种想要的效果。  
- Plugin有三种：Data Source负责接入某种数据的，Panel 负责某种数据呈现效果的，APP是把Data Source和Dashboard打包的应用。  
- Dashboard支持的数据源种类很多，支持常用的数据库MySQL，PostgreSQL，SQL Server，InfluxDB等。插件式的架构非常灵活，要增加新的数据源支持或呈现只主要开发新的plugin部署即可。  

 ![image](assets/image-1542277334522.png)

### 2.6 应用案例  

#### 2.6.1 风电监控与预测诊断解决方案  

> 风场云服务方案  
>
> ![image](assets/image-1542277469332.png)



> 风电场生产管理界面  
>
> ![image](assets/image-1542277482852.png)



> 风电场维护管理界面  
>
> ![image](assets/image-1542277493151.png)



#### 2.6.2 水处理流程图  

![image](assets/image-1542277540432.png)

> 川源-研华智慧水务案例  
> ![image](assets/image-1542277556348.png)

> 设备水电能耗分析模块  
> ![image](assets/image-1542277564772.png)

> 运维分析模块  
> ![image](assets/image-1542277568514.png)

#### 2.6.3 精益生产！如何让你的车间更智能，提升设备绩效  

> 智能工厂系统架构
>
>  ![image](assets/image-1542277636446.png) 
> ● **在第一层采集层，**通过研华数据采集方案进行**设备信息的收集**，如通过I/O方式采集设备的**三色灯**来获取设备状态，或通过通讯协议如**Modbus**方式；  
> ● **第二层是边缘计算**，通过**WebAccess**特有的节点上移方式将多区域的采集数据进行统合，并且可支持向上传输至**WISE-PaaS云端**；  
> 
> ●**第三层是****云端数据处理和呈现**，通过情景化的管理看板画面进行现场管理，使企业对设备的运行状况一目了然，比如：机器的运转效率是否正常？生产线上的次品率为何突然增高？器械的故障率为何增加？这些都可以在研华OEE系统中找到答案。  

> 智能工厂软件架构  
>
> ![image](assets/image-1542277825252.png)

> 设备稼动率  
>
> ![image](assets/image-1542277844198.png)

> 设备现场看板
>
> ![image](assets/image-1542277848925.png)

### 2.7 WISE-PaaS/SRP  

#### 2.7.1 应用自动化持续发布——DevOps  

##### 2.7.1.1  什么是DevOps  

![image](assets/image-1542278000016.png)

研华DevOps集文化、实践和工具于一身，以开发团队和运维团队的密切合作为核心，通过平时的工作实践将交付过程打造成一条包含开发、构建、测试、发布、部署、运维等步骤的标准化流程，并用各种工具将其自动化，最终**实现产品的快速高质量交付**，并提供7*24小时不间断的服务。  

##### 2.7.1.2  WISE-PaaS SRP持续交付流程

![image](assets/image-1542278050237.png)

##### 2.7.1.3  Jenkins+Kubernetes实现应用自动化持续发布  

> 总体技术架构 
>
> ![image](assets/image-1542278070343.png)

解决方案最上层提供了CodePipeline服务，CodePipeline是一款具有持续集成/持续交付能力，并能兼容Jenkins的SaaS化产品。通过使用CodePipeline，可以使客户方便的在云端实现从代码到应用的持续集成和交付，方便客户快速的对产品进行功能迭代和演进。  
整个解决方案的核心是Jenkins，Jenkins提供了软件开发的持续集成服务，它通过Master/Agent架构可以实现分布式构建，将不同的任务下发到多台机器（Jenkins Node）执行，提高处理性能。  
解决方案最下层通过Kubernetes来管理Jenkins的节点，当有构建任务时会自动创建一个Docker Container来完成构建任务，当任务结束后Container会自动销毁，资源动态使用动态销毁，避免资源浪费，并且无需担心代码或者构建物外泄。  
传统的 Jenkins Master/Agent方式可以帮助用户实现分布式构建，提高处理性能，但是在使用时还是会存在很多缺点，比如：  
▶当Master节点发生故障时，便无法再进行任何构建任务；  
▶为了完成不同语言的编译打包等任务，会创建很多Jenkins Node，但是这些Node的环境又很难复制，导致管理和维护都很困难；  
▶资源分配不均衡，有些Node使用率比较高，会出现Job排队的情况，但有些使用率比较低的Node却很多时候又处于空闲，导致资源的浪费；  
为了解决以上种种问题，需要寻找一种更可靠更高效的方式来完成 CI/CD 流程，使用Kubernetes 搭建 Jenkins 集群的架构便解决了这些问题，如图所示。

  ![image](assets/image-1542278235771.png)

在这种架构中，Jenkins Master 和 Jenkins Agent以Docker Container 形式运行在 Kubernetes 集群的 Node 上， 创建一个持久化的Volume用来存储Jenkins服务的数据，当Master出现故障时，可以保证数据不会丢失。创建JenkinsAgent使用的Docker Image保存在Docker存储服务中（比如Docker Hub），便于管理和复用。Jenkins Agent会根据需要拉取Docker Image动态创建和销毁，不会一直占用资源。 

 

##### 2.7.1.4  蓝绿部署：实现不间断服务的更新  

 ![image](assets/image-1542278261514.png)







### 2.8 ML  

![image](assets/image-1542278311379.png)

上图描述了机器学习的过程，Learning Machine代表了一个用于学习的机器，通过喂给机器大量的Data，机器可以通过一定的算法产出相应的预测（Predictions）和假设（Hypothesis）等。PaaS上搭建ML环境四步  

1. 研华提供丰富的数据采集设备和模块，确保您将所有有价值的物联网数据传输到通用数据库。WISE-PaaS私有云提供IoT-Hub，能够处理在任何给定时间发送数百万条消息的数百万台设备。  
1. 在WISE-PaaS / EnSaaS中，我们可以支持**多种数据存储类型**：从关系型数据库（PostgreSQL）、非关系型数据库（MangoDB）、时间序列数据库（InfluxDB）到对象存储（ BLOB）。  
1. 通过WISE-PaaS / **Dashboard可视化工具**，用户可通过拖放面板显示原始数据。并在显示的图表上进行注释，做为监督式学习的依据标签。  
1. 使用**大数据分析框架AFS**训练ML模型。通过目录，用户可以浏览并选择完整的AI解决方案或算法作为ML模型构建的起点。然后，选择ML框架：如TensorFlow，Caffe，Torch等来推动模型计算。在将表示数据源、数据预处理功能、算法和推理引擎端点的节点拖放到可视流IDE以设计完整的AI解决方案之前，可以通过代码IDE编辑参数。最后，按下按钮，用户就可以将推理引擎部署到目的地。  

## 3.WISE-PaaS 3.0  

![image](assets/image-1542278323792.png)



### 3.1 WISE-PaaS/SaaS Composer  

**WISE-PaaS/SaaS Composer**  
SaaS Composer是一套**客制化**图型控制系统，可以依照不同垂直领域绘制图本，为用户展现**实时动态**信息及**远端操控**。同时，可以搭配WISE-PaaS/Dashboard强化整体可视化效果，实现管理效益的再升级。  

![image](assets/image-1542278337421.png)

![image](assets/image-1542278342902.png)

### 3.2 WISE-PaaS/APM  

![image](assets/image-1542278356950.png)

### 3.3 WISE-PaaS/AFS  

![image](assets/image-1542278386237.png)

* AFS特性说明  


![image](assets/image-1542278393006.png)

* AFS架构  

### 3.4 微服务(Microservices)开发框架  

