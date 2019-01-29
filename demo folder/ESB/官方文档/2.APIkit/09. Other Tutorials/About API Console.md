# About API Console

By default, APIkit automatically opens an **APIkit Console** panel in Studio when you run a RAML-based APIkit project. API Console gives you access to the generated documentation for the API.

![apiConsole](https://docs.mulesoft.com/apikit/3.x/_images/apiconsole.png)

By default, the console is offered at the same host, port, and path as the routing flow listener, with the addition of the path `/console`. You can customize the path in the router global configuration. You can also disable the console completely.

![routerconfig console](https://docs.mulesoft.com/apikit/3.x/_images/routerconfig-console.png)

To access the console in a browser, go to the full address of your project routing flow and append the console path, `/console` by default, to the end of the address. For example, if your API is hosted at `http://localhost:8081/api`, then the URL for accessing the console is `http://localhost:8081/api/console`.

The Show APIkit Console configuration determines whether or not API Console opens automatically when running an APIkit API.

## Using API Console and a Reverse Proxy

APIkit 3.8.3 and later solves the problem accessing APIkit Console when a load balancer or reverse proxy is configured in front of an APIKit application. By default, the console uses the URL defined in the listener or provided by Cloudhub, making the console inaccessible.

If the RAML baseUri is relative, APIKit 3.8.3 and later uses the relative URI without overwriting it. When using a load balancer or reverse proxy, set the `keepRamlBaseUri` attribute in the `apikit:config`element to true. When you set the attribute to true, the console uses the URL of a the baseUri property of the RAML, and you can access API Console. By default, the attribute is false.

If the RAML baseUri is relative, APIKit 3.8.3 and later uses the relative URI without overwriting it.

## Hosting Additional Consoles

Because the APIkit Console is a client that is accessing your API by making calls against it, hosting the console in the same URI as the API itself can cause policies to restrict calls more than you intended. Calls to populate the console and the favicon.ico count can have an impact, depending on applied policies. For example, if you applied a rate-limiting policy, loading the API Console consumes two of your allotted API calls, one to load the console in the browser and one for the favicon.ico. If your HTTP listener is protected with Basic Authentication, you need to authenticate in order to access or use the console. In particular, the APIkit Console doesn’t know the steps of the OAuth dance, so if you apply an OAuth policy to the API, you will not be able to access the API Console if you attempt to host multiple consoles in the same URI.

## See Also

- [To Host an Additional API Console](https://docs.mulesoft.com/apikit/3.x/apikit-add-console)
- [Show APIkit Console](https://docs.mulesoft.com/apikit/3.x/apikit-configure-show-console-task)





# 关于API控制台

默认情况下，当您运行基于RAML的APIkit项目时，APIkit会在Studio中自动打开**APIkit控制台**面板。通过API控制台，您可以访问API生成的文档。

![apiConsole](https://docs.mulesoft.com/apikit/3.x/_images/apiconsole.png)

默认情况下，控制台与路由流监听器在同一主机，端口和路径上提供，并添加路径`/console`。您可以在路由器全局配置中自定义路径。您也可以完全禁用控制台。

![routerconfig控制台](https://docs.mulesoft.com/apikit/3.x/_images/routerconfig-console.png)

要在浏览器中访问控制台，请转到项目路由流的完整地址，并将控制台路径`/console`（默认情况下）附加到地址的末尾。例如，如果您的API托管在`http://localhost:8081/api`，则访问控制台的URL是`http://localhost:8081/api/console`。

Show APIkit控制台配置确定在运行APIkit API时是否自动打开API控制台。

## 使用API控制台和反向代理

APIkit 3.8.3及更高版本解决了在APIKit应用程序前配置负载均衡器或反向代理时访问APIkit控制台的问题。默认情况下，控制台使用侦听器中定义的URL或Cloudhub提供的URL，使控制台无法访问。

如果RAML baseUri是相对的，则APIKit 3.8.3及更高版本使用相对URI而不覆盖它。使用负载平衡器或反向代理时，请将元素中的`keepRamlBaseUri`属性设置`apikit:config`为true。将该属性设置为true时，控制台将使用RAML的baseUri属性的URL，您可以访问API控制台。默认情况下，该属性为false。

如果RAML baseUri是相对的，则APIKit 3.8.3及更高版本使用相对URI而不覆盖它。

## 托管其他游戏机

由于APIkit控制台是通过对其进行调用来访问API的客户端，因此在与API本身相同的URI中托管控制台会导致策略限制调用超出预期。调用填充控制台和favicon.ico计数会产生影响，具体取决于应用的策略。例如，如果您应用了速率限制策略，则加载API控制台将消耗两个分配的API调用，一个用于在浏览器中加载控制台，另一个用于favicon.ico。如果您的HTTP侦听器受基本身份验证保护，则需要进行身份验证才能访问或使用控制台。特别是，APIkit控制台不知道OAuth舞蹈的步骤，因此如果您将OAuth策略应用于API，如果您尝试在同一URI中托管多个控制台，则无法访问API控制台。

## 也可以看看

- [托管其他API控制台](https://docs.mulesoft.com/apikit/3.x/apikit-add-console)
- [显示APIkit控制台](https://docs.mulesoft.com/apikit/3.x/apikit-configure-show-console-task)