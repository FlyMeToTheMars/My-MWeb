# [HowTo – Wrap SOAP web service around a database](https://blogs.mulesoft.com/dev/howto/wrap-soap-web-service-around-a-database/)

We recently [introduced](https://blogs.mulesoft.com/dev/questions-about-mulesoft-check-out-our-howto-series/) our [HowTo](https://blogs.mulesoft.com/tag/howto/) blog series, which is designed to present simple use-case tutorials to help you as you evaluate [Anypoint Platform](https://www.mulesoft.com/platform/enterprise-integration).This first blog in Series 1 will show you how to insulate your backend systems like databases by exposing a system [API](http://www.mulesoft.com/platform/api) using SOAP over HTTP. The principle behind this approach is our [API led connectivity methodology,](https://www.mulesoft.com/ty/wp/api-led-connectivity) which is an evolution of SOA.

For years, most organizations have tightly coupled their front end applications with the backend enterprise systems like [ERP](http://www.mulesoft.com/integration-solutions/soa/sap) and databases.The logic to access and process data from backend systems is baked directly into these front end applications.If there is any change in the backend system, it turns into a very costly exercise to propagate that change to each dependent application.

[![decoupling_transform](https://blogs.mulesoft.com/wp-content/uploads/2015/10/decoupling_transform3-1024x521.png)](https://blogs.mulesoft.com/wp-content/uploads/2015/10/decoupling_transform3.png)

Therefore, there is a need to insulate these enterprise systems and provide an abstraction layer using a system level [API](http://www.mulesoft.com/platform/api).Having a system [API](http://www.mulesoft.com/platform/api) decouples the front end consuming applications from interface changes in the backend enterprise systems, exposes information in your business specific semantics and provides flexibility to make changes with less impact.Although some systems like [SaaS](http://www.mulesoft.com/platform/saas) applications do have vendor provided [APIs](http://www.mulesoft.com/platform/api), having a system [API layer](https://www.mulesoft.com/resources/api/api-layer) still allows the user to abstract the complexity of these vendor [APIs](http://www.mulesoft.com/platform/api).These [APIs](http://www.mulesoft.com/platform/api) will be highly reusable for different integrations, will change more infrequently and will be governed by Central IT given the importance of the underlying systems. As a best practice, we first define the [API](http://www.mulesoft.com/platform/api) contract (in this case, for a SOAP interface, so we’ll use a WSDL) before implementing the [API](http://www.mulesoft.com/platform/api).This approach helps to decouple the consumers of the [API](http://www.mulesoft.com/platform/api) from the provider to speed development, provide reusability of assets like schemas, security schemes, and transport resources and help with versioning of the [APIs](http://www.mulesoft.com/platform/api).

## Pre-requisites:

- [Anypoint Platform](http://www.mulesoft.com/platform/enterprise-integration) – [MuleSoft ](https://www.mulesoft.com/platform/studio)[Anypoint Studio](http://www.mulesoft.com/platform/mule-studio).
- WSDL created with [Eclipse editor](https://eclipse.org/webtools/ws/).The eclipse plugin [installed](https://docs.mulesoft.com/studio/5/studio-update-sites) into Mulesoft [Anypoint Studio](http://www.mulesoft.com/platform/mule-studio).
- SOAP UI for testing.
- A database where we can create and load a sample table required for this project.In this example, we will use an instance of the [MySQL database](https://www.mysql.com/).
- The Mule project downloadable from [Anypoint Exchange](https://anypoint.mulesoft.com/exchange/#!/expose-database-through-soap-web-service).
- To follow the example in this guide, run the SQL script loan.sql to set up the table and load it with some sample data.You will find the loan.sql file in the [project](https://www.mulesoft.com/exchange/#!/expose-database-through-soap-web-service) under the folder src/main/resources

## Steps:

### 1.new workspace

Start Mulesoft [Anypoint Studio](https://www.mulesoft.com/platform/studio) and point to a new workspace.

### 2.new project

Create a new project.File -> New -> Mule Project

[![picture2](https://blogs.mulesoft.com/wp-content/uploads/2015/09/picture21.png)](https://blogs.mulesoft.com/wp-content/uploads/2015/09/picture21.png)

### 3. Mule flows

Give a name to the project and click finish.You will see the mule configuration file where we can now add the Mule flows.

   Here is [more information](https://docs.mulesoft.com/mule-user-guide/v/3.7/understanding-mule-configuration) to understand Mule configuration.[![picture3](https://blogs.mulesoft.com/wp-content/uploads/2015/09/picture31.png)](https://blogs.mulesoft.com/wp-content/uploads/2015/09/picture31.png)

### 4.Copy the schema and WSDL

Copy the schema and WSDL for loan service in the following directory path of the project, loan_system_api /src/main/resources

 [![DevBlogSeries1Part1](https://blogs.mulesoft.com/wp-content/uploads/2015/09/picture4.png)](https://blogs.mulesoft.com/wp-content/uploads/2015/09/picture4.png)

### 5.Add HTTP endpoint 

Add HTTP endpoint to the Mule configuration file.Dropping the HTTP endpoint on the canvas will automatically create a flow ([What is a mule flow?](https://docs.mulesoft.com/mule-fundamentals/v/3.7/flows-and-subflows)).In the HTTP endpoint properties tab below click on [connector](https://www.mulesoft.com/exchange#!/?types=connector) configuration.[![picture4](https://blogs.mulesoft.com/wp-content/uploads/2015/09/picture41.png)](https://blogs.mulesoft.com/wp-content/uploads/2015/09/picture41.png)

### 6.Configure HTTP Listener

Configure as below and click Ok.[![picture5](https://blogs.mulesoft.com/wp-content/uploads/2015/09/picture51.png)](https://blogs.mulesoft.com/wp-content/uploads/2015/09/picture51.png)

### 7.Add path

Add value “loan” to the path variable in HTTP property.
   [![picture6](https://blogs.mulesoft.com/wp-content/uploads/2015/09/picture61.png)](https://blogs.mulesoft.com/wp-content/uploads/2015/09/picture61.png)

### 8.Add CXF component

Add the CXF component to the flow.
   (Here is [more detail](https://docs.mulesoft.com/mule-user-guide/v/3.7/cxf-module-reference) on the CXF component.)
   [![picture7](https://blogs.mulesoft.com/wp-content/uploads/2015/09/picture7.png)](https://blogs.mulesoft.com/wp-content/uploads/2015/09/picture7.png)

### 9.configure the CXF 

Change the configurations for the CXF component to match the parameter from the WSDL.Add the WSDL location in the advanced tab.
   [![picture8](https://blogs.mulesoft.com/wp-content/uploads/2015/09/picture8.png)](https://blogs.mulesoft.com/wp-content/uploads/2015/09/picture8.png)
   [![picture9](https://blogs.mulesoft.com/wp-content/uploads/2015/09/picture9.png)](https://blogs.mulesoft.com/wp-content/uploads/2015/09/picture9.png)

### 10.Dom to XML

Add transformer “Dom to XML”.

​    (Note: This transformer will convert the org.w3c.dom.Document object to XML message.This way we can apply XPath expressions to extract various values from the incoming message payload.)[![picture10](https://blogs.mulesoft.com/wp-content/uploads/2015/09/picture10.png)](https://blogs.mulesoft.com/wp-content/uploads/2015/09/picture10.png)

### 11.namespace-manager

To parse the XML, SOAP request message switch to the Configuration XML view and add the following.


```xml
<mulexml:namespace-manager includeConfigNamespaces="true">
    <mulexml:namespace prefix="sch" uri="http://www.mulesoft.com/schemas/Mule/Schema.xsd"/>
</mulexml:namespace-manager>
```
This namespace is obtained from the WSDL (Here are more details on how namespaces are handled in MuleSoft).
![picture11](https://blogs.mulesoft.com/wp-content/uploads/2015/09/picture111.png)

### 12.Add the database

Add the database [connector](https://www.mulesoft.com/exchange#!/?types=connector) to look up the table.
    [![picture12](https://blogs.mulesoft.com/wp-content/uploads/2015/09/picture121.png)](https://blogs.mulesoft.com/wp-content/uploads/2015/09/picture121.png)

### 13.Configure database 

Configure the database with all the parameters.

### 14.Configure select query 

Configure the database [connector](https://www.mulesoft.com/exchange#!/?types=connector) property with the following select query by using the XPath query to extract the input parameter from the request payload.`select * from loan where loan_id = #[xpath3("sch:getLoanRequest/sch:loanId")] ` [![picture13](https://blogs.mulesoft.com/wp-content/uploads/2015/09/picture13.png)](https://blogs.mulesoft.com/wp-content/uploads/2015/09/picture13.png)  

### 15.Add a logger component.

Add a logger component.Configure the metadata of the logger component with the schema object of the SOAP response message.This is done to assist with data mapping in the next step.[![picture14](https://blogs.mulesoft.com/wp-content/uploads/2015/09/picture14.png)](https://blogs.mulesoft.com/wp-content/uploads/2015/09/picture14.png)[![picture15](https://blogs.mulesoft.com/wp-content/uploads/2015/09/picture15.png)](https://blogs.mulesoft.com/wp-content/uploads/2015/09/picture15.png)
    [![picture24](https://blogs.mulesoft.com/wp-content/uploads/2015/09/picture24.png)](https://blogs.mulesoft.com/wp-content/uploads/2015/09/picture24.png)

### 16.Transform Message

Add the component “Transform Message” in between the database [connector](https://www.mulesoft.com/exchange#!/?types=connector) and logger (Here is [more detail](https://docs.mulesoft.com/mule-user-guide/v/3.9/dataweave) on Transform Message).[![picture17](https://blogs.mulesoft.com/wp-content/uploads/2015/09/picture17.png)](https://blogs.mulesoft.com/wp-content/uploads/2015/09/picture17.png)

### 17.show output structure

To see all the fields click the button to show the scaffold output structure.
    [![picture18](https://blogs.mulesoft.com/wp-content/uploads/2015/09/picture18.png)](https://blogs.mulesoft.com/wp-content/uploads/2015/09/picture18.png)

### 18.Map the response

Map the response from the database [connector](https://www.mulesoft.com/exchange#!/?types=connector) to the SOAP response message.
    [![picture21](https://blogs.mulesoft.com/wp-content/uploads/2015/09/picture211.png)](https://blogs.mulesoft.com/wp-content/uploads/2015/09/picture211.png)

### 19.run the project

Right-click the project and choose the run as “Mule Application” option.This will run the project in [Anypoint Studio](http://www.mulesoft.com/platform/mule-studio) embedded Mule runtime.                                                                                     [![picture22](https://blogs.mulesoft.com/wp-content/uploads/2015/09/picture22.png)](https://blogs.mulesoft.com/wp-content/uploads/2015/09/picture22.png)

### 20.Start SOAP UI 

Start SOAP UI and create a new project.Add a new WSDL and enter the link as follows: http://localhost:8081/bank/loan?wsdl
    Run the request and check the response.
    [![picture23](https://blogs.mulesoft.com/wp-content/uploads/2015/09/picture23.png)](https://blogs.mulesoft.com/wp-content/uploads/2015/09/picture23.png)

 

## Review

We have now successfully created a system [API](http://www.mulesoft.com/platform/api) in front of a database, thus decoupling it from the user requesting the data.

To create this system [API](http://www.mulesoft.com/platform/api) we have leveraged the following features of the [Anypoint Platform](https://anypoint.mulesoft.com/apiplatform/):

- Open standards support i.e.full support for [WS* standards](https://docs.mulesoft.com/mule-user-guide/v/3.7/supported-web-service-standards) and open source services framework like Apache CXF.
- Drag and drop and configure the [CXF components](https://docs.mulesoft.com/mule-user-guide/v/3.7/cxf-module-reference) that speed up development.
- [Database Connector](https://docs.mulesoft.com/mule-user-guide/v/3.7/database-connector): Allows you to connect to almost any relational database.
- [DataSense](https://docs.mulesoft.com/connector-devkit/3.9/adding-datasense-query-language) uses message metadata to facilitate application design.
- [Mule Expression Language (MEL):](https://docs.mulesoft.com/mule-user-guide/v/3.6/mule-expression-language-mel) Lightweight Mule-specific expression language that can be used to access/evaluate the data in the payload.
- [Transformers](https://docs.mulesoft.com/mule-user-guide/v/3.7/transformers)/[DataWeave](https://docs.mulesoft.com/mule-user-guide/v/3.7/dataweave-reference-documentation):  A simple, powerful way to query and transform data using the platform. 

We have seen a growing need for [APIs](http://www.mulesoft.com/platform/api) emerging from new business processes, applications, devices, and interfaces.These requirements from several consumers, it becomes necessary to define a lightweight and easy to consume REST [API](http://www.mulesoft.com/platform/api).

In part 2 of this series we will walk through creating a REST [API](http://www.mulesoft.com/platform/api) on top of an existing SOAP service.



## Resources

[Expose a Database through a SOAP Web Service](https://anypoint.mulesoft.com/exchange/org.mule.examples/expose-database-through-soap-web-service/)