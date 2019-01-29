### [ActiveMQ的queue以及topic两种消息处理机制分析](http://coderbase64.iteye.com/blog/2081937)

上一期介绍了我们项目要用到activeMQ来作为jms总线，并且给大家介绍了activeMQ的集群和高可用部署方案，本期给大家再介绍下，如何根据自己的项目需求，更好地使用activeMQ的两种消息处理模式。

​       

##### 1    queue与topic的技术特点对比

 



| 对比项               | **Topic**                                                    | **Queue**                                                    |
| -------------------- | ------------------------------------------------------------ | ------------------------------------------------------------ |
| **概要**             | Publish Subscribe messaging 发布订阅消息                     | Point-to-Point 点对点                                        |
| **有无状态**         | topic数据默认不落地，是无状态的。                            | Queue数据默认会在mq服务器上以文件形式保存，比如Active MQ一般保存在$AMQ_HOME\data\kr-store\data下面。也可以配置成DB存储。 |
| **完整性保障**       | 并不保证publisher发布的每条数据，Subscriber都能接受到。      | Queue保证每条数据都能被receiver接收。                        |
| **消息是否会丢失**   | 一般来说publisher发布消息到某一个topic时，只有正在监听该topic地址的sub能够接收到消息；如果没有sub在监听，该topic就丢失了。 | Sender发送消息到目标Queue，receiver可以异步接收这个Queue上的消息。Queue上的消息如果暂时没有receiver来取，也不会丢失。 |
| **消息发布接收策略** | 一对多的消息发布接收策略，监听同一个topic地址的多个sub都能收到publisher发送的消息。Sub接收完通知mq服务器 | 一对一的消息发布接收策略，一个sender发送的消息，只能有一个receiver接收。receiver接收完后，通知mq服务器已接收，mq服务器对queue里的消息采取删除或其他操作。 |

​          Topic和queue的最大区别在于topic是以广播的形式，通知所有在线监听的客户端有新的消息，没有监听的客户端将收不到消息；而queue则是以点对点的形式通知多个处于监听状态的客户端中的一个。

 

##### 2    topic和queue方式的消息处理效率比较

​        通过增加监听客户端的并发数来验证，topic的消息推送，是否会因为监听客户端的并发上升而出现明显的下降，测试环境的服务器为ci环境的ActiveMQ，客户端为我的本机。

​        从实测的结果来看，topic方式发送的消息，发送和接收的效率，在一个订阅者和100个订阅者的前提下没有明显差异，但在500个订阅者（线程）并发的前提下，效率差异很明显（由于500线程并发的情况下，我本机的cpu占用率已高达70-90%，所以无法确认是我本机测试造成的性能瓶颈还是topic消息发送方式存在性能瓶颈，造成效率下降如此明显）。

​        Topic方式发送的消息与queue方式发送的消息，发送和接收的效率，在一个订阅者和100个订阅者的前提下没有明显差异，但在500个订阅者并发的前提下，topic方式的效率明显低于queue。

​        Queue方式发送的消息，在一个订阅者、100个订阅者和500个订阅者的前提下，发送和接收的效率没有明显变化。

Topic实测数据：

 

|           | 发送者发送的消息总数 | 所有订阅者接收到消息的总数 | 消息发送和接收平均耗时 |
| --------- | -------------------- | -------------------------- | ---------------------- |
| 单订阅者  | 100                  | 100                        | 101ms                  |
| 100订阅者 | 100                  | 10000                      | 103ms                  |
| 500订阅者 | 100                  | 50000                      | 14162ms                |

 

Queue实测数据：

 

|           | 发送者发送的消息总数 | 所有订阅者接收到消息的总数 | 消息发送和接收平均耗时 |
| --------- | -------------------- | -------------------------- | ---------------------- |
| 单订阅者  | 100                  | 100                        | 96ms                   |
| 100订阅者 | 100                  | 100                        | 96ms                   |
| 500订阅者 | 100                  | 100                        | 100ms                  |

 

##### 3     topic方式的消息处理示例

###### 3.1     通过客户端代码调用来发送一个topic的消息：

```java
import javax.jms.Connection;
import javax.jms.ConnectionFactory;
import javax.jms.DeliveryMode;
import javax.jms.Destination;
import javax.jms.MessageProducer;
import javax.jms.Session;
import javax.jms.TextMessage;
 
import org.apache.activemq.ActiveMQConnection;
import org.apache.activemq.ActiveMQConnectionFactory;
 
publicclass SendTopic {
    privatestaticfinalintSEND_NUMBER = 5;
    publicstaticvoid sendMessage(Session session, MessageProducer producer)
            throws Exception {
        for (int i = 1; i <=SEND_NUMBER; i++) {
            TextMessage message = session
                    .createTextMessage("ActiveMq发送的消息" + i);
            //发送消息到目的地方
            System.out.println("发送消息：" + "ActiveMq 发送的消息" + i);
            producer.send(message);
        }
    }
   
    publicstaticvoid main(String[] args) {
        // ConnectionFactory：连接工厂，JMS用它创建连接
        ConnectionFactory connectionFactory;
        // Connection：JMS客户端到JMS Provider的连接
        Connection connection = null;
        // Session：一个发送或接收消息的线程
        Session session;
        // Destination：消息的目的地;消息发送给谁.
        Destination destination;
        // MessageProducer：消息发送者
        MessageProducer producer;
        // TextMessage message;
        //构造ConnectionFactory实例对象，此处采用ActiveMq的实现jar
        connectionFactory = new ActiveMQConnectionFactory(
                ActiveMQConnection.DEFAULT_USER,
                ActiveMQConnection.DEFAULT_PASSWORD,
                "tcp://10.20.8.198:61616");
        try {
            //构造从工厂得到连接对象
            connection = connectionFactory.createConnection();
            //启动
            connection.start();
            //获取操作连接
            session = connection.createSession(true, Session.AUTO_ACKNOWLEDGE);
            //获取session注意参数值FirstTopic是一个服务器的topic(与queue消息的发送相比，这里是唯一的不同)
            destination = session.createTopic("FirstTopic");
            //得到消息生成者【发送者】
            producer = session.createProducer(destination);
            //设置不持久化，此处学习，实际根据项目决定
            producer.setDeliveryMode(DeliveryMode.PERSISTENT);
            //构造消息，此处写死，项目就是参数，或者方法获取
            sendMessage(session, producer);
            session.commit();
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            try {
                if (null != connection)
                    connection.close();
            } catch (Throwable ignore) {
            }
        }
    }
}
```



###### 3.2     启动多个客户端监听来接收topic的消息：

```java
public class ReceiveTopicimplements Runnable {
      private StringthreadName;
 
      ReceiveTopic(String threadName) {
           this.threadName = threadName;
      }
 
      public void run() {
           // ConnectionFactory：连接工厂，JMS用它创建连接
           ConnectionFactory connectionFactory;
           // Connection：JMS客户端到JMS Provider的连接
           Connection connection =null;
           // Session：一个发送或接收消息的线程
           Session session;
           // Destination：消息的目的地;消息发送给谁.
           Destination destination;
           //消费者，消息接收者
           MessageConsumer consumer;
           connectionFactory = new ActiveMQConnectionFactory(
                      ActiveMQConnection.DEFAULT_USER,
                      ActiveMQConnection.DEFAULT_PASSWORD,"tcp://10.20.8.198:61616");
           try {
                 //构造从工厂得到连接对象
                 connection = connectionFactory.createConnection();
                 //启动
                 connection.start();
                 //获取操作连接,默认自动向服务器发送接收成功的响应
                 session = connection.createSession(false, Session.AUTO_ACKNOWLEDGE);
                 //获取session注意参数值FirstTopic是一个服务器的topic
                 destination = session.createTopic("FirstTopic");
                 consumer = session.createConsumer(destination);
                 while (true) {
                      //设置接收者接收消息的时间，为了便于测试，这里设定为100s
                      TextMessage message = (TextMessage) consumer
                                  .receive(100 * 1000);
                      if (null != message) {
                            System.out.println("线程"+threadName+"收到消息:" + message.getText());
                      } else {
                            continue;
                      }
                 }
           } catch (Exception e) {
                 e.printStackTrace();
           } finally {
                 try {
                      if (null != connection)
                            connection.close();
                 } catch (Throwable ignore) {
                 }
           }
      }
 
      public static void main(String[] args) {
            //这里启动3个线程来监听FirstTopic的消息，与queue的方式不一样三个线程都能收到同样的消息
           ReceiveTopic receive1=new ReceiveTopic("thread1");
           ReceiveTopic receive2=new ReceiveTopic("thread2");
           ReceiveTopic receive3=new ReceiveTopic("thread3");
           Thread thread1=new Thread(receive1);
           Thread thread2=new Thread(receive2);
           Thread thread3=new Thread(receive3);
           thread1.start();
           thread2.start();
           thread3.start();
      }
}
 
```



 

##### 4     queue方式的消息处理示例

​         参考上一期文章：开源jms服务ActiveMQ的负载均衡+高可用部署方案探索。