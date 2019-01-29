# RAML 100 Tutorial

![RAML Console](https://raml.org/images/console.png)

**Objective:** Learn the basics of `RAML` by designing a very basic API for BookMobile.

**Introduction**

This tutorial will guide you through conceptualizing the design of your API and writing it in RAML, the RESTful API Modeling Language.

**Assumptions**

You know the basics of how RESTful APIs operate: how to send requests and responses, and how to specify the components of a RESTful API.



## ENTER THE ROOT

Let's say you are the API designer for a `BookMobile` startup. You've worked out a business plan, a scaling plan, and Ashton Kutcher is an angel investor. You know you want developers to capitalize on what you've built, so that you can capitalize on what THEY build. You know having a RESTful API is one way to make that happen. So, let's get started by writing a spec.

**First, you'll enter some basic information in a text editor. You can save your API's RAML definition as a text file with a recommended extension `.raml`:**

```yaml
#%RAML 1.0
---
title: e-BookMobile API
baseUri: http://api.e-bookmobile.com/{version}
version: v1
```

Everything you enter in at the [root](https://github.com/raml-org/raml-spec/blob/master/versions/raml-10/raml-10.md#the-root-of-the-document) (or top) of the spec applies to the rest of your API. This is going to come in very handy later as you discover patterns in how you build your API. The baseURI you choose will be used with every call made, so make sure it's as clean and concise as can be.



## ENTER RESOURCES

As a thoughtful API designer, it's important to consider how your API consumers will use your API. It's especially important because in many ways, as the API designer YOU control the consumption. For example, consider the functionality of the BookMobile API. You know you want your users to be able to keep track of what they've read and their favorites. Users should also be able to discover new books and look at other titles written by their favorite authors. To do this, you define various *collections* as your [resources](https://github.com/raml-org/raml-spec/blob/master/versions/raml-10/raml-10.md#resources-and-nested-resources).

**Recalling how your API consumers will use your API, enter the following three resources under your root:**

```yaml
/users:
  /authors:
  /books:
```

Notice that these resources all begin with a slash (/). In RAML, this is how you indicate a resource. Any methods and parameters nested under these top level resources belong to and act upon that resource. Now, since each of these resources is a collection of individual objects (specific authors, books, and users), we'll need to define some sub-resources to fill out the collection.

**Nested resources are useful when you want to call out a particular subset of your resource in order to narrow it. For example:**

```yaml
/authors:
  /{authorname}:
```

This lets the API consumer interact with the key resource and its nested resources. For example a GET request to *http://api.e-bookmobile.com/authors/Mary_Roach* returns details about science writer and humorist Mary Roach. Now, let's think about what we want developers and API consumers to DO.



## ENTER METHODS

Here's where it starts to get interesting, as you decide what you want the developer to be able to do with the resources you've made available. **Let's quickly review the 4 most common HTTP verbs:**

**GET -** Retrieve the information defined in the request URI.

**PUT -** Replace the addressed collection. At the object-level, create or update it.

**POST -** Create a new entry in the collection. This method is generally not used at the object-level.

**DELETE -** Delete the information defined in the request URI.

You can add as many methods as you like to each resource of your BookMobile API, at any level. However, each HTTP method can only be used once per resource. Do not overload the GET (you know who you are).

In this example, you want developers to be able to work at the collection level. For example, your API consumers can retrieve a book from the collection (GET), add a book (POST), or update the entire library (PUT). You do not want them to be able to delete information at the highest level. Let's focus on building out the /books resource.

**Nest the methods to allow developers to perform these actions under your resources. Note that you must use lower-case for methods in your RAML API definition:**

```yaml
/books:
  get:
  post:
  put:
```



## ENTER URI PARAMETERS

The resources that we defined are collections of smaller, relevant objects. You, as the thoughtful API designer, have realized that developers will most likely want to act upon these more granular objects. Remember the example of nested resources above? /authors is made up of individual authors, referenced by {authorName}, for example. This is a URI parameter, denoted by surrounding curly brackets in RAML:

```yaml
/books:
  /{bookTitle}:
```

So, to make a request to this nested resource, the URI for Mary Roach's book, Stiff would look like *http://api.e-bookmobile.com/v1/books/Stiff*

**Time to edit your spec to reflect the inherent granular characteristics of your resources:**

```yaml
/books:
  get:
  put:
  post:
  /{bookTitle}:
    get:
    put:
    delete:
    /author:
      get:
    /publisher:
      get:
```



## ENTER QUERY PARAMETERS

Great job so far! Now, let's say you want your API to allow even more powerful operations. You already have collections-based resource types that are further defined by object-based URI parameters. But you also want developers to be able perform actions like filtering a collection. Query parameters are a great way to accomplish this.

**Start by adding some query parameters under the GET method for books. These can be specific characteristics, like the year a book was published:**

```yaml
/books:
  get:
    queryParameters:
      author:
      publicationYear:
      rating:
      isbn:
  put:
  post:
```

Query parameters may also be something that the server requires to process the API consumer's request, like an access token. Often, you need security authorization to alter a collection or record.

**Nest the access-token query parameter under the PUT method for a specific title:**

```yaml
/books:
  /{bookTitle}
    get:
      queryParameters:
        author:
        publicationYear:
        rating:
        isbn:
    put:
      queryParameters:
        access_token:
```

An API's resources and methods often have a number of associated query parameters. Each query parameter may have any number of optional attributes to further define it. The Quick reference guide contains a full listing.

**Now, specify attributes for each of the query parameters you defined above. As always, be as complete in your documentation as possible:**

```yaml
/books:
  /{bookTitle}
    get:
      queryParameters:
        author:
          displayName: Author
          type: string
          description: An author's full name
          example: Mary Roach
          required: false
        publicationYear:
          displayName: Pub Year
          type: number
          description: The year released for the first time in the US
          example: 1984
          required: false
        rating:
          displayName: Rating
          type: number
          description: Average rating (1-5) submitted by users
          example: 3.14
          required: false
        isbn:
          displayName: ISBN
          type: string
          minLength: 10
          example: 0321736079
    put:
      queryParameters:
        access_token:
          displayName: Access Token
          type: string
          description: Token giving you permission to make call
          required: true
```

To make a PUT call, your URI looks like *http://api.e-bookmobile.com/books/Stiff?access_token=ACCESS* TOKEN



## ENTER RESPONSES

Responses MUST be a map of one or more HTTP status codes, and each response may include descriptions, examples, or schemas. Schemas are more fully explained in the Level 200 tutorial.

```yaml
/books:
  /{bookTitle}:
    get:
      description: Retrieve a specific book title
      responses:
        200:
          body:
            application/json:
              example: |
                {
                  "data": {
                    "id": "SbBGk",
                    "title": "Stiff: The Curious Lives of Human Cadavers",
                    "description": null,
                    "datetime": 1341533193,
                    "genre": "science",
                    "author": "Mary Roach",
                    "link": "http://e-bookmobile.com/books/Stiff"
                  },
                  "success": true,
                  "status": 200
                }
```

**Congratulations! You've just written your first API definition in RAML. Continue to the 200 Tutorial »**





# RAML 100教程



**目标：**通过为BookMobile设计一个非常基本的API来了解RAML的基础知识。

**介绍**

本教程将指导您概念化API的设计并将其编写在RAML（RESTful API建模语言）中。

**假设**

您了解RESTful API如何运行的基础知识：如何发送请求和响应，以及如何指定RESTful API的组件。



## 输入根

假设您是BookMobile初创公司的API设计人员。你已经制定了商业计划，扩展计划，Ashton Kutcher是天使投资人。您知道您希望开发人员利用您构建的内容，以便您可以利用他们构建的内容。您知道拥有RESTful API是实现这一目标的一种方法。所以，让我们开始编写规范。

**首先，您将在文本编辑器中输入一些基本信息。您可以将API的RAML定义保存为具有推荐扩展名.raml的文本文件：**

```yaml
#%RAML 1.0
---
title: e-BookMobile API
baseUri: http://api.e-bookmobile.com/{version}
version: v1
```

您在规范的[根](https://github.com/raml-org/raml-spec/blob/master/versions/raml-10/raml-10.md#the-root-of-the-document)（或顶部）输入的所有内容都适用于API的其余部分。当您发现构建API的模式时，这将变得非常方便。您选择的baseURI将用于每次调用，因此请确保它尽可能简洁明了。



## 输入资源

作为一个深思熟虑的API设计师，重要的是要考虑API使用者将如何使用您的API。这一点尤其重要，因为在很多方面，作为API设计师，您可以控制消耗。例如，考虑BookMobile API的功能。您知道您希望您的用户能够跟踪他们阅读的内容和他们的收藏。用户还应该能够发现新书并查看他们最喜欢的作者撰写的其他书籍。为此，您可以将各种*集合*定义为[资源](https://github.com/raml-org/raml-spec/blob/master/versions/raml-10/raml-10.md#resources-and-nested-resources)。

**回顾一下您的API使用者将如何使用您的API，请在您的根目录下输入以下三个资源：**

```yaml
/users:
  /authors:
  /books:
```

请注意，这些资源都以斜杠（/）开头。在RAML中，这是您指示资源的方式。嵌套在这些顶级资源下的任何方法和参数都属于该资源并作用于该资源。现在，由于这些资源中的每一个都是单个对象（特定作者，书籍和用户）的集合，我们需要定义一些子资源来填充集合。

**当您想要调出资源的特定子集以缩小它时，嵌套资源非常有用。例如：**

```yaml
/authors:
  /{authorname}:
```

这使API使用者可以与密钥资源及其嵌套资源进行交互。例如，对*http://api.e-bookmobile.com/authors/Mary_Roach*的GET请求会返回有关科学作家和幽默家Mary Roach的详细信息。现在，让我们考虑一下我们希望开发人员和API消费者做些什么。



## 输入方法

这是它开始变得有趣的地方，因为您决定了开发人员希望能够使用您提供的资源。**让我们快速回顾4个最常见的HTTP动词：**

**GET -**检索请求URI中定义的信息。

**PUT -**替换已寻址的集合。在对象级别，创建或更新它。

**POST -**在集合中创建一个新条目。此方法通常不在对象级别使用。

**DELETE -**删除请求URI中定义的信息。

您可以在任何级别为BookMobile API的每个资源添加任意数量的方法。但是，每个HTTP方法每个资源只能使用一次。不要超载GET（你知道你是谁）。

在此示例中，您希望开发人员能够在集合级别工作。例如，您的API使用者可以从集合（GET）中检索书籍，添加书籍（POST）或更新整个库（PUT）。您不希望他们能够删除最高级别的信息。让我们专注于构建/ books资源。

**嵌套方法以允许开发人员在您的资源下执行这些操作。请注意，您必须在RAML API定义中使用小写的方法：**

```yaml
/books:
  get:
  post:
  put:
```



## 输入URI参数

我们定义的资源是较小的相关对象的集合。作为深思熟虑的API设计人员，您已经意识到开发人员很可能希望对这些更细粒度的对象采取行动。还记得上面嵌套资源的例子吗？/ authors由个人作者组成，例如{authorName}引用。这是一个URI参数，由RAML中的大括号括起来表示：

```yaml
/books:
  /{bookTitle}:
```

因此，要向这个嵌套资源发出请求，Mary Roach的书，Stiff的URI看起来像*http://api.e-bookmobile.com/v1/books/Stiff*

**是时候编辑您的规范以反映资源的固有粒度特征：**

```yaml
/books:
  get:
  put:
  post:
  /{bookTitle}:
    get:
    put:
    delete:
    /author:
      get:
    /publisher:
      get:
```



## 输入QUERY PARAMETERS

到目前为止工作很棒！现在，假设您希望API允许更强大的操作。您已经拥有基于集合的资源类型，这些资源类型由基于对象的URI参数进一步定义。但是，您还希望开发人员能够执行过滤集合等操作。查询参数是实现此目的的好方法。

**首先在书籍的GET方法下添加一些查询参数。这些可以是特定的特征，例如出版一本书的年份：**

```yaml
/books:
  get:
    queryParameters:
      author:
      publicationYear:
      rating:
      isbn:
  put:
  post:
```

查询参数也可以是服务器处理API使用者请求所需的内容，例如访问令牌。通常，您需要安全授权才能更改集合或记录。

**将访问令牌查询参数嵌套在特定标题的PUT方法下：**

```yaml
/books:
  /{bookTitle}
    get:
      queryParameters:
        author:
        publicationYear:
        rating:
        isbn:
    put:
      queryParameters:
        access_token:
```

API的资源和方法通常具有许多关联的查询参数。每个查询参数可以具有任意数量的可选属性以进一步定义它。快速参考指南包含完整列表。

**现在，为您在上面定义的每个查询参数指定属性。与往常一样，尽可能完整地在您的文档中：**

```yaml
/books:
  /{bookTitle}
    get:
      queryParameters:
        author:
          displayName: Author
          type: string
          description: An author's full name
          example: Mary Roach
          required: false
        publicationYear:
          displayName: Pub Year
          type: number
          description: The year released for the first time in the US
          example: 1984
          required: false
        rating:
          displayName: Rating
          type: number
          description: Average rating (1-5) submitted by users
          example: 3.14
          required: false
        isbn:
          displayName: ISBN
          type: string
          minLength: 10
          example: 0321736079
    put:
      queryParameters:
        access_token:
          displayName: Access Token
          type: string
          description: Token giving you permission to make call
          required: true
```

要进行PUT调用，您的URI看起来像*http://api.e-bookmobile.com/books/Stiff?access_token=ACCESS* TOKEN



## 输入回应

响应必须是一个或多个HTTP状态代码的映射，每个响应可以包括描述，示例或模式。在Level 200教程中更全面地解释了模式。

```yaml
/books:
  /{bookTitle}:
    get:
      description: Retrieve a specific book title
      responses:
        200:
          body:
            application/json:
              example: |
                {
                  "data": {
                    "id": "SbBGk",
                    "title": "Stiff: The Curious Lives of Human Cadavers",
                    "description": null,
                    "datetime": 1341533193,
                    "genre": "science",
                    "author": "Mary Roach",
                    "link": "http://e-bookmobile.com/books/Stiff"
                  },
                  "success": true,
                  "status": 200
                }
```

**恭喜！您刚刚在RAML中编写了第一个API定义。继续阅读200教程»**