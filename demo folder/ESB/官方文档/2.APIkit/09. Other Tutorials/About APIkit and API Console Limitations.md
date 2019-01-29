# About APIkit and API Console Limitations

The following limitations apply:

- APIkit for SOAP works only on Mule EE runtime 3.8.0 or later.

- APIkit for SOAP does not download protected resources from the web.

  For example, a WSDL file behind a schema model, such as Basic Authentication, is not supported. You need to manually download the WSDL file and all dependencies, such as XSD, and select those files locally.

## Security, Protocol, and baseUriParameter Limitations

APIkit 3.8.1 and later supports RAML 1.0. Mule 3.8.0 runtime limitations related to earlier versions of APIkit are covered in the RAML 1.0 early access document.

In API Gateway Runtime 2.x and earlier, APIkit is designed to work very tightly with RAML interfaces, but does not automatically import the following items from the RAML definition:

- securitySchemes
- protocols
- baseUriParameters

The protocol, URI host, and path defined in the RAML file are disregarded in favor of the ones that you define in the APIkit project’s HTTP Connector.

## API Console Limitations

APIkit does not support the Client Credentials and Resource Owner Password Credentials grant types in the embedded API Console. To use these grant types, access the APIkit Console from a web browser. APIkit Console does not support scopes.





# 关于APIkit和API控制台限制

以下限制适用：

- APIkit for SOAP仅适用于Mule EE运行时3.8.0或更高版本。

- APIkit for SOAP不会从Web下载受保护的资源。

  例如，不支持模式模型后面的WSDL文件，例如基本身份验证。您需要手动下载WSDL文件和所有依赖项（如XSD），并在本地选择这些文件。

## 安全性，协议和baseUriParameter限制

APIkit 3.8.1及更高版本支持RAML 1.0。RAML 1.0早期访问文档中介绍了与早期版本的APIkit相关的Mule 3.8.0运行时限制。

在API Gateway Runtime 2.x及更早版本中，APIkit旨在与RAML接口紧密配合，但不会自动从RAML定义中导入以下项：

- securitySchemes
- 协议
- baseUriParameters

RAML文件中定义的协议，URI主机和路径将被忽略，以支持您在APIkit项目的HTTP连接器中定义的协议，URI主机和路径。

## API控制台限制

APIkit不支持嵌入式API控制台中的客户端凭据和资源所有者密码凭据授权类型。要使用这些授权类型，请从Web浏览器访问APIkit控制台。APIkit控制台不支持范围。