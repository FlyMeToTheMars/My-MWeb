# Creating an OData-Enabled API

The APIkit OData Extension supports [OData](http://www.odata.org/documentation/odata-version-2-0/overview/) (Open Data Protocol) Version 2 for creating HTTP-based data services. Through these services, you can query the data sources using HTTP. The APIkit OData Extension builds the services from the entity data model (EDM), which OData services uses to formalize its resource descriptions. You write the EDM in RAML using [EDM-compatible data types](https://docs.mulesoft.com/apikit/3.x/apikit-odata-extension-reference#supported-edm-data-types) to represent API entities. The APIkit OData Extension generates Mule flows to handle OData requests. After configuring a data source and adding endpoints to the flows, deploying the app exposes a RESTful API and an OData API accessible through different URLs. The [OData MySQL example](https://docs.mulesoft.com/apikit/3.x/creating-an-odata-api-with-apikit#odata-mysql-example) shows how to use an HTTP-based data service to query a MySQL database.

You can use the APIkit OData Extension to expose a legacy API as an OData API, orchestrate data before exposing it in Salesforce, or create a bidirectional OData API for Oracle, DB2, or Azure DB, for example.

## Prerequisites

The following software is required for creating and using an OData-enabled API with APIkit:

- OData Plugin
- Mule EE 3.8.2 and later
- Studio 6.1.2
- Maven is optional

## Installing the APIKit OData Extension

Using Studio, you install the APIKit OData Extension in Studio as described in the following procedure.

To install the APIKit OData Extension:

1. From the **Help** menu in Anypoint Studio, select **Install New Software**.

2. In the **Work with:** field, select `APIkit for ODATA Update Site - http://studio.mulesoft.org/r5/apikit-for-odata` from the drop-down.

   Studio displays a list of items to select.

3. Check the check box to update APIkit Studio Plugin.

4. Click **Next**.

   An Install Remediation Page might appear.

5. Click Next, and click Next again to install the remedial software.

6. Accept the terms and conditions of the product, then click **Finish**.

7. Restart Studio to complete the installation.

## Using the APIkit OData Extension

After installing the prerequisite software, perform the following high-level steps to use the APIkit OData Extension:

1. [Define an entity data model](https://docs.mulesoft.com/apikit/3.x/apikit-odata-extension-reference#entity-data-model) named odata.raml, formatting the file as a RAML library.

   You can download an [example entity data model](https://docs.mulesoft.com/apikit/3.x/_attachments/odata.raml) to see exactly how to create the file for this example.

2. Create a new Mule project in Studio.

   Select the **Add APIkit Components** on the New Project dialog.

3. Copy the odata.raml to /src/main/api in Studio project explorer.

4. In the project explorer, right-click odata.raml and select **Mule** > **Generate OData API from RAML Types**.

   The OData Extension generates the api.raml and OData library in src/main/api. Generated flows appear on the canvas when you select api.xml.

   ![creating an odata api b2e8e](https://docs.mulesoft.com/apikit/3.x/_images/creating-an-odata-api-b2e8e.png)

5. Make sure to add the extensionEnabled="true" attribute/value to the apikit:config element in the XML view. This will ensure that the OData extension is picked up at runtime:

   ```
   <apikit:config name="apiConfig" raml="api.raml" consoleEnabled="false" doc:name="Router" extensionEnabled="true"/>
   ```

6. Add logic and endpoints for querying a data source as described in ["Implementing Endpoints"](https://docs.mulesoft.com/apikit/3.x/implement-endpoints-odata-task).

7. Deploy the OData API.

## Deploying an OData API

You can deploy the example app in a number of ways, including the following ones:

- Locally

  Right-click your project, then select **Run As** > **Mule Application with Maven**.

- [To CloudHub](https://docs.mulesoft.com/runtime-manager/deploying-to-cloudhub)

  Right-click your project, then select **Anypoint Platform** > **Deploy to Cloud**.

Once deployed, you can also register the OData app in external OData consumer services like [Salesforce](https://help.salesforce.com/HTViewHelpDoc?id=platform_connect_add_external_data_source.htm&language=en_US).

## OData mySQL Example

The OData mySQL example is a fully functional OData API packaged as a Maven project. In this example, the data source, the app, and the service is local. First, you install a MySQL database and load tables using a provided script. You import the compressed project into Studio, which includes a mySQL database driver. You can examine the flows to see how to implement endpoints needed accessing the data. You run the project, and finally, call the REST and OData services.

1. Install a MySQL database. Launch MySQL.

   The Maven project you download in step 3 contains the mysql-connector-java-5.1.37.jar MySQL database driver, so you do not need to make a driver available to the project.

2. Download the [example.sql script](https://docs.mulesoft.com/apikit/3.x/_attachments/example.sql). Run the script using MySQL commands to load data into a database named apikit-odata-example.

3. Download and unpack the [compressed Maven project](https://docs.mulesoft.com/apikit/3.x/_attachments/apikit-odata-example-master.zip), `apikit-odata-example-master.zip`.

   The pom.xml and other project files appear in the apikit-odata-example-master directory.

4. In Studio, Select **File** > **Import**.

   The **Select** dialog appears.

5. Select **Anypoint Studio** > **Maven-based Mule Project from pom.xml**. Click Next.

   The Maven Configuration dialog appears.

6. Enter the path to your Maven installation directory, for example `/usr/local/Cellar/maven/3.3.9`

7. Click Test Maven Configuration, and if the test is successful, click Next; otherwise, troubleshoot your Maven configuration.

   The Import Mule Project dialog appears.

8. Browse to and select the POM file from the apikit-odata-example-master directory. Click **Finish**.

   The test-drive project appears in the project explorer. APIkit OData Extension generates flows that appear in the canvas when you click api.xml in src/main/app in the project explorer.

9. In Studio, in mule-app.properties in src/main/app, set the following properties to access the local MySQL database:

   ```
   ds.db.port=3306
   ds.db.user=<your MySQL user name>
   ds.db.host=<your MySQL host name>
   ds.db.database=apikit-odata-example
   ds.db.password=<your MySQL password>
   ```

10. Run the API locally: Right-click the project, and select **Run As** > **Mule Application with Maven**.

You can now access the REST and OData Service.

## Accessing the REST and OData Service

To run the API locally:

1. Right-click the project, and select **Run As** > **Mule Application with Maven**.

2. Access the REST and OData Service using the following URLs:

   - REST API: `/api`

   - OData API: `/api/odata.svc`

     The following examples cover a few of the many REST calls and OData queries you can use.

### Retrieve a List of Customers

Call the REST API to retrieve the list of customers: `http://localhost:8081/api/customers`

The response is:

```
{
  "entries": [
    {
      "ContactName": "Maria Anders",
      "ContactTitle": "Sales Representative",
      "CompanyName": "Alfreds Futterkiste",
      "CustomerID": ""
    },
    {
      "ContactName": "Maria Anders",
      "ContactTitle": "Sales Representative",
      "CompanyName": "Alfreds Futterkiste",
      "CustomerID": "ALFKI"
    },
```

### Access a Description of the OData Service

Get information about the collections behind this service:

```
http://localhost:8081/api/odata.svc
```

The response is:

```
<service xmlns="http://www.w3.org/2007/app" xmlns:atom="http://www.w3.org/2005/Atom" xmlns:app="http://www.w3.org/2007/app" xml:base="http://localhost:8081">
  <workspace>
    <atom:title>Default</atom:title>
    <collection href="customers">
      <atom:title>customers</atom:title>
    </collection>
    <collection href="orders">
      <atom:title>orders</atom:title>
    </collection>
  </workspace>
</service>
```

### Get OData Service Metadata

The Service Metadata exposes the structure of OData service resources and its operations and EDM for a given service.

Get the metadata for HTTP Services example:

```
http://localhost:8081/api/odata.svc/$metadata
```

The response aligns with the odata.raml EDM you used to build the HTTP Services API example.

```
<edmx:Edmx xmlns:edmx="http://schemas.microsoft.com/ado/2007/06/edmx" Version="1.0">
<edmx:DataServices xmlns:m="http://schemas.microsoft.com/ado/2007/08/dataservices/metadata" m:DataServiceVersion="2.0">
<Schema xmlns="http://schemas.microsoft.com/ado/2008/09/edm" Namespace="odata2.namespace">
<EntityType Name="customers">
<Key>
<PropertyRef Name="CustomerID"/>
</Key>
<Property Name="CompanyName" Type="Edm.String" Nullable="true" MaxLength="40" Unicode="false"/>
<Property Name="ContactName" Type="Edm.String" Nullable="true" MaxLength="30" Unicode="false"/>
<Property Name="ContactTitle" Type="Edm.String" Nullable="true" MaxLength="30" Unicode="false"/>
<Property Name="CustomerID" Type="Edm.String" Nullable="false" MaxLength="5" Unicode="false"/>
</EntityType>
<EntityType Name="orders">
<Key>
<PropertyRef Name="OrderID"/>
<PropertyRef Name="ShipName"/>
</Key>
<Property Name="Freight" Type="Edm.Decimal" Nullable="true" Precision="3" Scale="3" Unicode="false"/>
...
```

### Query the Data Source

Issue OData queries to get the list of customers in XML and JSON format.

```
http://localhost:8081/api/odata.svc/customers
http://localhost:8081/api/odata.svc/customers?$format=json
```

Issue an OData query to get the tenth customer in the customer list:

```
http://localhost:8081/api/odata.svc/customers?$format=json&$top=1&$skip=10
```

The response is:

```
{
"d" : {
"results" : [
{
"__metadata" : {
"uri" : "http://localhost:8081/api/odata.svc/customers('BOTTM')", "type" : "odata2.namespace.customers"
}, "CompanyName" : "Bottom-Dollar Markets", "ContactName" : "Elizabeth Lincoln", "ContactTitle" : "Accounting Manager", "CustomerID" : "BOTTM"
}
]
}
}
```

## See Also

[APIkit OData Extension Reference](https://docs.mulesoft.com/apikit/3.x/apikit-odata-extension-reference)





# 创建启用OData的API

APIkit OData Extension支持[OData](http://www.odata.org/documentation/odata-version-2-0/overview/)（开放数据协议）版本2，用于创建基于HTTP的数据服务。通过这些服务，您可以使用HTTP查询数据源。APIkit OData Extension从实体数据模型（EDM）构建服务，OData服务使用它来形式化其资源描述。您使用[EDM兼容的数据类型](https://docs.mulesoft.com/apikit/3.x/apikit-odata-extension-reference#supported-edm-data-types)在RAML中编写EDM 来表示API实体。APIkit OData Extension生成Mule流以处理OData请求。配置数据源并将端点添加到流后，部署应用程序会公开RESTful API和可通过不同URL访问的OData API。该[OData的MySQL的例子](https://docs.mulesoft.com/apikit/3.x/creating-an-odata-api-with-apikit#odata-mysql-example)展示了如何使用基于HTTP的数据服务来查询MySQL数据库。

您可以使用APIkit OData Extension将旧API公开为OData API，在Salesforce中公开数据之前编排数据，或者为Oracle，DB2或Azure DB创建双向OData API。

## 先决条件

使用APIkit创建和使用支持OData的API需要以下软件：

- OData插件
- Mule EE 3.8.2及更高版本
- Studio 6.1.2
- Maven是可选的

## 安装APIKit OData扩展

使用Studio，您可以在Studio中安装APIKit OData Extension，如以下过程中所述。

要安装APIKit OData扩展：

1. 从Anypoint Studio 的“ **帮助”**菜单中，选择“ **安装新软件”**。

2. 在**Work with：**字段中，`APIkit for ODATA Update Site - http://studio.mulesoft.org/r5/apikit-for-odata`从下拉列表中选择。

   Studio显示要选择的项目列表。

3. 选中复选框以更新APIkit Studio插件。

4. 单击**下一步**。

   可能会出现安装修复页面。

5. 单击“下一步”，再次单击“下一步”以安装补救软件。

6. 接受产品的条款和条件，然后单击“ **完成”**。

7. 重新启动Studio以完成安装。

## 使用APIkit OData扩展

安装必备软件后，执行以下高级步骤以使用APIkit OData扩展：

1. [定义](https://docs.mulesoft.com/apikit/3.x/apikit-odata-extension-reference#entity-data-model)名为odata.raml [的实体数据模型](https://docs.mulesoft.com/apikit/3.x/apikit-odata-extension-reference#entity-data-model)，将文件格式化为RAML库。

   您可以下载[示例实体数据模型，](https://docs.mulesoft.com/apikit/3.x/_attachments/odata.raml)以确切了解如何为此示例创建文件。

2. 在Studio中创建一个新的Mule项目。

   在“新建项目”对话框中选择“ **添加APIkit组件** ”。

3. 将odata.raml复制到Studio项目资源管理器中的/ src / main / api。

4. 在项目资源管理器中，右键单击odata.raml并**从RAML类型中**选择**Mule** > **Generate OData API**。

   OData扩展在src / main / api中生成api.raml和OData库。选择api.xml时，生成的流将显示在画布上。

   ![创建一个odata api b2e8e](https://docs.mulesoft.com/apikit/3.x/_images/creating-an-odata-api-b2e8e.png)

5. 确保将extensionEnabled =“true”属性/值添加到XML视图中的apikit：config元素。这将确保在运行时选择OData扩展：

   ```
   <apikit：config name =“apiConfig”raml =“api.raml”consoleEnabled =“false”doc：name =“Router”extensionEnabled =“true”/>
   ```

6. 添加逻辑和端点以查询数据源，如[“实现端点”中所述](https://docs.mulesoft.com/apikit/3.x/implement-endpoints-odata-task)。

7. 部署OData API。

## 部署OData API

您可以通过多种方式部署示例应用程序，包括以下方法：

- 本地

  右键单击您的项目，然后选择**Run As** > **Mule Application with Maven**。

- [到CloudHub](https://docs.mulesoft.com/runtime-manager/deploying-to-cloudhub)

  右键单击您的项目，然后选择**Anypoint Platform** > **Deploy to Cloud**。

部署后，您还可以在[Salesforce](https://help.salesforce.com/HTViewHelpDoc?id=platform_connect_add_external_data_source.htm&language=en_US)等外部OData消费者服务中注册OData应用程序。

## OData mySQL示例

OData mySQL示例是一个功能齐全的OData API，打包为Maven项目。在此示例中，数据源，应用程序和服务是本地的。首先，使用提供的脚本安装MySQL数据库并加载表。您将压缩的项目导入Studio，其中包括mySQL数据库驱动程序。您可以检查流以查看如何实现访问数据所需的端点。您运行该项目，最后调用REST和OData服务。

1. 安装MySQL数据库。启动MySQL。

   您在步骤3中下载的Maven项目包含mysql-connector-java-5.1.37.jar MySQL数据库驱动程序，因此您无需为项目提供驱动程序。

2. 下载[example.sql脚本](https://docs.mulesoft.com/apikit/3.x/_attachments/example.sql)。使用MySQL命令运行脚本，将数据加载到名为apikit-odata-example的数据库中。

3. 下载解压[压缩Maven项目](https://docs.mulesoft.com/apikit/3.x/_attachments/apikit-odata-example-master.zip)，`apikit-odata-example-master.zip`。

   pom.xml和其他项目文件出现在apikit-odata-example-master目录中。

4. 在Studio中，选择“ **文件”** >“ **导入”**。

   出现“ **选择”**对话框。

5. **从pom.xml中**选择**Anypoint Studio** > **基于Maven的Mule项目**。点击下一步。

   出现Maven配置对话框。

6. 例如，输入Maven安装目录的路径 `/usr/local/Cellar/maven/3.3.9`

7. 单击“测试Maven配置”，如果测试成功，请单击“下一步”; 否则，请对Maven配置进行故障排除。

   将出现“导入Mule项目”对话框。

8. 浏览并从apikit-odata-example-master目录中选择POM文件。单击**完成**。

   测试驱动项目出现在项目浏览器中。当您单击项目资源管理器中的src / main / app中的api.xml时，APIkit OData Extension将生成显示在画布中的流。

9. 在Studio中，在src / main / app中的mule-app.properties中，设置以下属性以访问本地MySQL数据库：

   ```
   ds.db.port = 3306
   ds.db.user = <您的MySQL用户名>
   ds.db.host = <您的MySQL主机名>
   ds.db.database = apikit-OData兼容示例
   ds.db.password = <您的MySQL密码>
   ```

10. 在本地运行API：右键单击该项目，然后选择**Run As** > **Mule Application with Maven**。

您现在可以访问REST和OData服务。

## 访问REST和OData服务

要在本地运行API：

1. 右键单击该项目，然后选择**Run As** > **Mule Application with Maven**。

2. 使用以下URL访问REST和OData服务：

   - REST API： `/api`

   - OData API： `/api/odata.svc`

     以下示例介绍了可以使用的许多REST调用和OData查询中的一些。

### 检索客户列表

调用REST API以检索客户列表： `http://localhost:8081/api/customers`

回应是：

```
{
  “条目”：[
    {
      “ContactName”：“Maria Anders”，
      “ContactTitle”：“销售代表”，
      “CompanyName”：“Alfreds Futterkiste”，
      “顾客ID”： ””
    }，
    {
      “ContactName”：“Maria Anders”，
      “ContactTitle”：“销售代表”，
      “CompanyName”：“Alfreds Futterkiste”，
      “CustomerID”：“ALFKI”
    }，
```

### 访问OData服务的描述

获取有关此服务背后的集合的信息：

```
HTTP：//本地主机：8081 / API / odata.svc
```

回应是：

```
<service xmlns =“http://www.w3.org/2007/app”xmlns：atom =“http://www.w3.org/2005/Atom”xmlns：app =“http：//www.w3 .org / 2007 / app“xml：base =”http：// localhost：8081“>
  <工作空间>
    <原子：标题>默认</原子：标题>
    <collection href =“customers”>
      <原子：标题>客户</原子：标题>
    </收集>
    <collection href =“orders”>
      <原子：标题>订单</原子：标题>
    </收集>
  </工作空间>
</服务>
```

### 获取OData服务元数据

服务元数据公开给定服务的OData服务资源及其操作和EDM的结构。

获取HTTP服务示例的元数据：

```
HTTP：//本地主机：8081 / API / odata.svc / $元
```

响应与您用于构建HTTP服务API示例的odata.raml EDM保持一致。

```
<edmx：Edmx xmlns：edmx =“http://schemas.microsoft.com/ado/2007/06/edmx”Version =“1.0”>
<edmx：DataServices xmlns：m =“http://schemas.microsoft.com/ado/2007/08/dataservices/metadata”m：DataServiceVersion =“2.0”>
<Schema xmlns =“http://schemas.microsoft.com/ado/2008/09/edm”Namespace =“odata2.namespace”>
<EntityType Name =“customers”>
<密钥>
<PropertyRef Name =“CustomerID”/>
</密钥>
<Property Name =“CompanyName”Type =“Edm.String”Nullable =“true”MaxLength =“40”Unicode =“false”/>
<Property Name =“ContactName”Type =“Edm.String”Nullable =“true”MaxLength =“30”Unicode =“false”/>
<Property Name =“ContactTitle”Type =“Edm.String”Nullable =“true”MaxLength =“30”Unicode =“false”/>
<Property Name =“CustomerID”Type =“Edm.String”Nullable =“false”MaxLength =“5”Unicode =“false”/>
</的EntityType>
<EntityType Name =“orders”>
<密钥>
<PropertyRef Name =“OrderID”/>
<PropertyRef Name =“ShipName”/>
</密钥>
<Property Name =“Freight”Type =“Edm.Decimal”Nullable =“true”Precision =“3”Scale =“3”Unicode =“false”/>
...
```

### 查询数据源

发出OData查询以获取XML和JSON格式的客户列表。

```
HTTP：//本地主机：8081 / API / odata.svc /客户
HTTP：//本地主机：8081 / API / odata.svc /客户$格式= JSON
```

发出OData查询以获取客户列表中的第10个客户：

```
HTTP：//本地主机：8081 / API / odata.svc /客户$格式= JSON＆$顶部= 1＆$跳过= 10
```

回应是：

```
{
“d”：{
“结果”：[
{
“__metadata”：{
“uri”：“http：// localhost：8081 / api / odata.svc / customers（'BOTTM'）”，“type”：“odata2.namespace.customers”
}，“CompanyName”：“Bottom-Dollar Markets”，“ContactName”：“Elizabeth Lincoln”，“ContactTitle”：“会计经理”，“CustomerID”：“BOTTM”
}
]
}
}
```

## 也可以看看

[APIkit OData扩展参考](https://docs.mulesoft.com/apikit/3.x/apikit-odata-extension-reference)