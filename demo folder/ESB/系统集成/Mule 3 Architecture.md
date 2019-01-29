# [Mule 3 Architecture, Part 1: Back to Basics](https://blogs.mulesoft.com/dev/mule-dev/mule-3-architecture-part-1-back-to-basics/)

As you may have [heard](https://blogs.mulesoft.com/mule-story-3-power-to-the-user/), Mule 3 has undergone a streamlining of its internal architecture. It’s now my job to explain what’s changed, why and what this means to you. I can’t promise it will be as exciting as a children’s movie but I will attempt to explain things as clearly as possible so that everyone can understand the concepts which in turn will help you use Mule 3 to its fullest.

This series of posts should be very useful both for existing Mule users wanting to understand the changes in Mule 3 and also for people who want to learn more about how Mule can be used to satisfy integration and [messaging](https://blogs.mulesoft.com/tag/messaging/) needs.

In this first blog post I’ll be taking a step back, away from Mule and its architecture and internals. We’ll remind ourselves what *integration* and *messaging* are all about, before going on to talk about the type of architecture that should ideally be used for integration or message-processing projects or frameworks.



### What is Integration?

Integration, often called “[Enterprise Application Integration](http://www.mulesoft.com/platform/enterprise-integration)“, is simply the interconnection of more than one system that needs to share information such that each system has the right data at the right time. Integration is hugely important as different systems are no longer used in isolation but are rather used together. This has been the case for quite a time in the enterprise and can now even be seen in other spheres of life with the convergence of social platforms, business applications and even governmental systems.

There are different ways to *integrate* but the commonality you will find in all of them is that there is a **source system** that produces the **data**, a **data format** of some kind and other systems, let’s call them **target systems**, that either consume or observe (listen to) the data produced by the source system. The systems that consume this data may then in turn produce other data that will be consumed or observed by a third system, or even multiple systems, and so forth.

![integration](https://blogs.mulesoft.com/wp-content/uploads/2010/08/integration.jpg)

This is integration; the concept sounds simple but there are a number of challenges:

- **Protocol:** Are all the systems to be integrated living in a nice homogenous environment where all communications use a single protocol?
- **Time:** Is it safe to assume that the target system is always available? If that’s not the case, is it only processing data at certain times of day?
- **Data Format:** Do all systems, whether internal or external, new or old, on Java, .NET or other platforms, use the same data format?
- **Non-functional Requirements:** We also need to take performance, scalability, availability, reliability and security into account as well as maintainability and extensibility.

These challenges along with with the [Fallacies of Distributed Computing](http://en.wikipedia.org/wiki/Fallacies_of_Distributed_Computing), which must always been taken into account, are what makes [Enterprise Application Integration](http://www.mulesoft.com/platform/enterprise-integration) so much fun 🙂

### Enter Messaging

Messaging deals with integration and its complexities using the following concepts:

- A **Message** is an abstraction for the data that travels between systems, abstracting both its data format and content.
- A **Message Channel** is an abstraction for the way in which two systems communicate with each other abstracting both the protocol used and its implementation. A *Message Channel* may allow *Messages*to be sent asynchronously.
- A **Message Endpoint** allows systems to communicate with other systems via *Message Channels*, abstracting the system from the Message Channel used as well as the data format used by the channel and the target system.
- A **Message Transformer** is used to transform a **Message** from one data format to another.
- A **Message Router** allows the target system to be resolved by the messaging system.
- A **Messaging System** provides the infrastructure required to create or define both *Message Channels* and *Message Endpoints* as well as specifying which *Message Transformers* and *Message Routers* are required and where.

> *For a more thorough discussion of these concepts I recommend you read the **Enterprise Integration Patterns**book.*

These concepts and abstractions help simplify some of the complexities of integration. Message endpoints shield applications from the details of the “*protocol”* used, Message Translators allow the “*data format”* to be converted by the messaging system without the source or destination systems knowing about it, Message Routers can be used to choose the correct target system either at runtime or at configuration time without the source and destination systems needing to be hard-wired to each other. Moreover, because of the nature of messaging and the ability to send message asynchronously, we can decouple source and target systems in terms of *“time”*.
Another big advantage of Messaging is the ability to build solutions that are easily testable, modifiable and extensible.  The ability to do this though depends on the architecture used by you, or the framework you use, when designing and implementing your solution.

> **Note:** I talk about systems but everything applies equally to the integration of unique services in the same or multiple systems

### An architecture for Messaging

Why is the architecture of [integration solutions ](http://www.mulesoft.com/integration-solutions)so important?  The best way to answer this question is to think about the ways in which you might need to modify or extend your solution:



- Incorporate a new system that has a different data format and/or protocol.
- Move a service to a different data-center or to the cloud.
- Add validation, auditing or monitoring without affecting the existing solution
- Provision additional instances of a system/service to assure availability or manage load.

The best way in which we can achieve these requirements though an easily modifiable and extensible solutions is by using the **“Pipes and Filters****”** architectural style.

![pipesfilters](https://blogs.mulesoft.com/wp-content/uploads/2010/08/pipesfilters1.jpg)

The key thing about this architectural style is that each and every Filter has a **single identical interface**. This allows [integration solutions ](http://www.mulesoft.com/integration-solutions)to be constructed very easily by simply building message flows from endpoints, translators, routers and other moving parts of the [integration platform](http://www.mulesoft.com/platform/enterprise-integration).

The nature of the Pipes and Filters style allows for easy c*omposition* of filters, transparent *i**nterception* of filters by adding additional filters in between others, as well a things like transparent *proxying* of filter implementations.

### So what’s all this got to do with Mule 3 Architecture?

Our main driving motivation for almost all of what we have done with Mule 3 has been all about [Power to the User](https://blogs.mulesoft.com/mule-story-3-power-to-the-user/) and Simplicity. Over the next few weeks and months you’ll be able to read more about these improvements and new features in Mule 3 along with example usage.

In order to do everything we wanted to do with Mule 3 we needed to ensure that Mules core message processing architecture was as decoupled and flexible as possible, and we did this by reviewing our existing architecting and improving it to more consistently use the *Pipes and Filters* architectural style. These changes simplified some parts of Mules internals and improved testability but most importantly laid the foundation for the following:



- Simpler [pattern based configuration](https://blogs.mulesoft.com/sweet-xml-how-pattern-based-configuration-will-sugarize-your-mule/), dramatically reduces the learning curve and xml verbosity  for the most common use cases.
- A much more flexible flow based configuration approach that allows you to simply build message flows, block by block as your design dictates.  I’ll introduce this in a upcoming blog post.
- Other higher level of abstractions that will come in the future like the [new Graphical Mule IDE](https://blogs.mulesoft.com/new-mule-ide-coming/).

In the [next blog post](https://blogs.mulesoft.com/mule-3-architecture-part-2-introducing-the-message-processor/) I’ll return to Mule and talk about how the *Pipes and Filters architectural style* has been implemented in Mule 3.





# [Mule 3 Architecture, Part 2: Introducing the Message Processor](https://blogs.mulesoft.com/dev/mule-dev/mule-3-architecture-part-2-introducing-the-message-processor/)

In my [last post](https://blogs.mulesoft.com/mule-3-architecture-part-1-back-to-basics/) I went back to basics and talked about how integration systems are built using messaging and explained the motivation for the architectural changes in Mule 3.0.  Now I’ve set the stage and clearly explained the “Why?” we are ready to talk about the “What?”; the architectural changes themselves.

In this post we’ll zoom in and look, more concretely, at how the Pipes and Filters style is used for message processing in Mule 3’s with some [API](http://www.mulesoft.com/platform/api)snippets to really bring things down to earth.





### From Architectural Style to API

Let’s start my revisiting the definition of the *Pipes and Filters* architectural style:

- A **Filter** can be thought of as a black-box processing unit with a single entry-point that receives a message and processes before making the result of this processing available.
- A **Pipe** simply represents the connections between *Filters such that result of Filter n is passed onto and used as the the input of Filter n + 1.*

This architectural style can be used in distributed fashion where each Filter can potentially be located in different places, on different hardware or operating systems.  It can also be used within a single system as a way of architecting a very flexible and modular design; and this is the model we have used for Mule’s internal architecture.

Mule’s architecture needs to allow you to chain and compose Filters in order to implement and expose message processing flows.  In it’s simplest form the chaining of *Filters* is all done in a single virtual machine and no explicit *pipes* need to exist .  The way I chose to implement this was to use the *Decorator* variant of the *Intercepting Filter* pattern where each filter has a reference to the next filter.  The reason for the use of this variant is that it better supports the forking of message flows and runtime resolution of the next Filter as compared to the variant that uses a Chain object and iterates over the Filters.

![interceptingfilter](https://blogs.mulesoft.com/wp-content/uploads/2010/09/interceptingfilter.jpg)While pipes don’t explicitly exist, they can very easily be added as required by simply implementing the same Filter interface.  This technique could easily be used to transparently add message queuing between filters or more explicitly to distribute a flow.

### **The MessageProcessor**

We choose to call our implementation of the Filter **“Message Processor”** for two reasons.  Firstly because it more accurately describes the application of Filters in the context of Mule and secondly to prevent any confusion with message filtering or the interfaces we currently have for filtering messages.

As you can see from the interface below the MessageProcessor interface is very simple:

This is the single identical filter interface I talked about in the last blog post.  It defines a single *process* method that is called with a *MuleEvent.* The return value is also a *MuleEvent* and this is the result of the invocation*.  A MuleEvent* encapsulates the *message* that is being processed with additional context information such as the inbound endpoint, security credentials etc*.* In Mule 3 you’ll notice that almost everything that does anything with a message now implements this interface.

In the [Building Blocks](https://docs.mulesoft.com/anypoint-studio/v/5/anypoint-studio-essentials) page of the [Mule 3 User Guide](https://docs.mulesoft.com/mule-user-guide/v/4.1/) you’ll find information about the different types of message processor that can be used with Mule organized by category.

### Where do messages come from? The MessageSource!

I said that almost everything in Mule 3 now implements *MessageProcessor*. One of the few things that are not MessageProcessors are inbound endpoints. Why not? Because they do not process messages but rather act as sources of messages. We could potentially also have other types of message sources in the future too. A message source may receive or generate messages in different ways depending on their implementation means,  but from the perspective of the rest of the flow it is just a source.

The MessageSource interface is simply one that allows a *MessageProcessor*listener to be set as you can see below.  This listener may be a single *MessageProcessor*, or a chain of *MessageProcessor*s: this does not matter and neither does the source need to know, that’s the beauty of this model.

### **Let’s create a chain…**

Ok, so we now have the *MessageProcessor* and the *MessageSource,* and *a* MessageProcessor can be set as a MessageSource *listener* connecting *them.*This is all great, but it doesn’t allow us to chain two or more message processors as described above.  The chosen approach does not rely on iterating through a list of MessageProcessors but rather relies on each MessageProcessor knowing which MessageProcessor comes next.  What this comes down to is that each MessageProcessors needs to be MessageSources too.  So thats what we have, the **InterceptingMessageProcessor** that implements both *MessageProcessor* and a *MessageSource* .

An InterceptingMessageProcessor is used where the next item in the chain is known when the chain is created, otherwise alternative MessageProcessor implementations can be used determine the next message processor to be used in runtime.  One example of where this is *message routing*.

### **How about routing?**

With the above interfaces we can easily chain together as many MessageProcessors as we like but you’ll notice that an *InterceptingMessageProcessor,* as it is a *MessageSource,* only has a single listener. This allows us to filter the flow or proxy the next MessageProcessor, but not route to a processor resolved in runtime or to multiple processors.

A **MessageRouter** by definition has multiple possible routes and is responsible for choosing which route should be used to continue message processing of a particular message. The *MessageRouter* interface below is a *MessageProcessor* (of course) but rather than allowing a single listener to be set, it allows multiple routes to be added (or removed).

MessageRouter implementations determine which route(s) should be used.

### Summary

The quickest and easiest way to summarize is with a UML class diagram 🙂

### ![classdiagram](https://blogs.mulesoft.com/wp-content/uploads/2010/09/classdiagram1.jpg)

### What next?

I don’t have another post for this series planned but if there is anything people would like me to cover I’m quite happy to cover it, just let me know via a comment.

Anyhow, now we’ve learnt about the streamlined architecture and it’s [API](http://www.mulesoft.com/platform/api)you are probably wondering what this means to you the user.   we have a couple of blog posts on the way for you.

- [Configuring Message Processors on Endpoints](https://blogs.mulesoft.com/configuring-message-processors-on-endpoints/) describes how endpoints have been made more extensible and configurable using Message Processors.
- “*Going with the <flow> in Mule 3*” will describe and explain how to use the new <flow> construct in Mule 3 that allows you to build flow’s how you want.

I’m sure others will also follow…