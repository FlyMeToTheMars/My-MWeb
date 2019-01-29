# 3.5.Enabling WS-Security

**Enterprise**

When a Web service exposes private-network data to the outside world, that data travels through 4 - 7 separate protocol layers thus introducing potential security vulnerabilities. Implementing security at a higher layer on the protocol stack — the application layer, for instance — generally provides better protection than an implementation at the lower transport layer, which provides only HTTPS security.

To implement application-layer security, enable [WS-security](http://msdn.microsoft.com/en-us/library/ms977327.aspx) (a [CXF](http://cxf.apache.org/) configuration) on your Web service. WS-security defines a new SOAP header which is capable of carrying various security tokens that systems use to identify a Web service caller’s identity and privileges, and can include the following:

- Encryption
- Digital signature
- Time stamp

You can also [add a custom token validator](https://docs.mulesoft.com/mule-runtime/3.5/enabling-ws-security#addtokenvalidator) to the SOAP Component.

[Complete Code Example](https://docs.mulesoft.com/mule-runtime/3.5/enabling-ws-security#complete-code-example)

## Enabling WS-Security

To enable WS-security on a CXF Web service in your application, you must add WS-configurations to the **SOAP Component** in your flow. This approach enables WS-security locally within your flow, for one Web service only.

To the Mule flow that involves a Web service, add a [CXF Component](https://docs.mulesoft.com/mule-runtime/3.5/cxf-component-reference) to publish, consume, or proxy a Web service. Complete the following steps to configure WS-security on the SOAP component.

### Studio Visual Editor

1. Search for "cxf" and drag the CXF (SOAP) building block to the canvas.

2. Click the **CXF** element to open the properties menu.

3. Click the **Security** tab.

   ![security](https://docs.mulesoft.com/mule-runtime/3.5/_images/security.png)

4. Click the ![(plus)](https://docs.mulesoft.com/mule-runtime/3.5/_images/add.png) icon in the **Add Configuration Element** pane to create a new key-value pair.

5. Click **cxf:property** key and Enter a key, such as `action`, in the **Key** field and press **Enter**:

   ![key_value_pair](https://docs.mulesoft.com/mule-runtime/3.5/_images/key-value-pair.png)

   In XML, this step mirrors the addition of a key-value pair inside the ws-config child element of a ws-security element. By adding configuration elements to your SOAP component, you are creating a map of key-value pairs that correspond to the CXF WSS4J security-configuration text strings in [WSHandlerConstants](http://people.apache.org/~fadushin/stage/wss4j/1.5.5-RETRACTED/site/apidocs/org/apache/ws/security/handler/WSHandlerConstants.html) and [WSConstants](http://people.apache.org/~fadushin/stage/wss4j/1.5.5-RETRACTED/site/apidocs/org/apache/ws/security/WSConstants.html).

6. Click the **Value** field and specify a [WS Constant ](http://people.apache.org/~fadushin/stage/wss4j/1.5.5-RETRACTED/site/apidocs/org/apache/ws/security/WSConstants.html)(a class to define the kind of access the server allows) or a [WSHandlerConstant](http://people.apache.org/~fadushin/stage/wss4j/1.5.5-RETRACTED/site/apidocs/org/apache/ws/security/handler/WSHandlerConstants.html) (a class to specify the names, actions, and other strings for data deployment of the WSS handler). For example, enter `UsernameToken` in the value field.

   ![open and specify value](https://docs.mulesoft.com/mule-runtime/3.5/_images/open-and-specify-value.png)

7. Open the **Value Reference** field and specify the bean that the key must reference. When the key must reference a bean (for instance, when the key is `passwordCallbackRef`), enter the name of the bean in the **Value Reference** field.

8. Repeat the steps above to add as many ws-security configurations as you wish to your Web service, then click **OK** to save your configurations.

### Studio XML Editor or Standalone

1. To your CXF element (a SOAP component), add a child element for `cxf:ws-security`.

2. Within the `cxf:ws-security` child element, add a child element for `cxf:ws-config`.

3. Within the `cxf:ws-config` child element, add a child element for `cxf:property`.

4. Add two attributes to the cxf:property child element according to the table below. Be sure to enter either a `value`*OR* a `value-ref`; the two are mutually exclusive.

   | **key**       | Specify a name for the property.                             |
   | ------------- | ------------------------------------------------------------ |
   | **value**     | Specify a [WS Constant ](http://people.apache.org/~fadushin/stage/wss4j/1.5.5-RETRACTED/site/apidocs/org/apache/ws/security/WSConstants.html)(a class to define the kind of access the server allows) or a [WSHandlerConstant](http://people.apache.org/~fadushin/stage/wss4j/1.5.5-RETRACTED/site/apidocs/org/apache/ws/security/handler/WSHandlerConstants.html) (a class to specify the names, actions, and other strings for data deployment of the WSS handler). For example, enter `UsernameToken` in the value field. |
   | **value-ref** | Specify the bean that the key must reference. When the key must reference a bean (for instance, when the key is `passwordCallbackRef`), specify the name of the bean as the value-ref. |

5. Repeat the preceding step to add as many WS-security configurations as you wish to your Web service. Refer to sample code below.

   **View the Namespace**

   ```xml
   <mule xmlns:cxf="http://www.mulesoft.org/schema/mule/cxf"
   ...
   xsi:schemaLocation="
   http://www.mulesoft.org/schema/mule/cxf http://www.mulesoft.org/schema/mule/cxf/current/mule-cxf.xsd">
   ```

   ```xml
   <flow name="Creation1Flow1" doc:name="Creation1Flow1">
       <http:inbound-endpoint host="localhost" port="8081"/>
       <cxf:jaxws-service doc:name="SOAP">
           <cxf:ws-security>
               <cxf:ws-config>
                   <cxf:property key="action" value="UsernameToken"/>
               </cxf:ws-config>
           </cxf:ws-security>
       </cxf:jaxws-service>
   </flow>
   ```

## Adding a Token Validator

If you have enabled WS-Security on your Web service in Mule, you can further configure the SOAP component to delegate authentication of the message credentials it transmits or receives.

A SOAP component may get bogged down with the tasks of both processing and authenticating messages. To lighten this load, you can instruct WS-security to delegate certain message authentication tasks to a **Token Validator**, including:

- Validating the `UsernameToken` in cases where the `CallbackHandler` implementation does not have access to the password.
- Validating the attributes of a received SAML assertion.
- Dispatching a received security token to a third-party security service for validation.

Complete the following procedure to add token validators to your Web service.

### Studio Visual Editor

1. In the **Security** tab of your SOAP component, click one or more of the check boxes to delegate message authentication tasks to token validators. Refer to the table below for the activity of each token validator.

   ![token_validators](https://docs.mulesoft.com/mule-runtime/3.5/_images/token-validators.png)

   | Token Validator           | Purpose                                                      |
   | ------------------------- | ------------------------------------------------------------ |
   | **User Name**             | Authenticates the username and password credentials associated with each message in a manner similar to HTTP Digest authentication. |
   | **SAML 1**                | Checks messages against SAML 1.1 assertion statements in order to approve or reject access to the Web service. |
   | **SAML 2**                | Checks messages against SAML 2.0 assertion statements in order to approve or reject access to the Web service. |
   | **Timestamp**             | Examines the timeliness of messages – when they were created and received, and when they expire – to make decisions about which messages to process. The timestamp is in UTC time and is a combination of date and time of day per Chapter 5.4 of ISO 8601, which is known as the dateTime format. |
   | **Signature**             | Examines the digital signature attached to messages to make decisions about which messages to process. |
   | **Binary Security Token** | Examines binary encoded security tokens (such as Kerberos) to make decisions about which messages to process. |

2. In the **Bean** field associated with the token validator you have selected, use the drop-down menu to select an existing bean that your token validator can reference to apply, replace, or extend the default behavior associated with a specific security token.

   If you have not yet created any beans, click the ![(plus)](https://docs.mulesoft.com/mule-runtime/3.5/_images/add.png) button to open a new properties panel in which you can create and configure a new bean. The bean imports the Java class you have built to specify the custom validator’s override behavior.

   ![token_validators_selected](https://docs.mulesoft.com/mule-runtime/3.5/_images/token-validators-selected.png)

   **Java code for Bean Creation**

   ```java
   public class UsernameTokenTestValidator implements Validator
   {
   
       @Override
       public Credential validate(Credential credential, RequestData data) throws WSSecurityException
       {
           UsernameToken usernameToken = credential.getUsernametoken();
   
           if(!"secret".equals(usernameToken.getPassword()))
           {
               throw new WSSecurityException(WSSecurityException.FAILED_AUTHENTICATION);
           }
   
           return credential;
       }
   }
   ```

3. Click **OK** to save changes.

### Studio XML Editor or Standalone

1. Above all flows in your Mule project, create a global `spring:bean` element to import the Java class you have built to specify the token validator’s behavior. Refer to code sample below.

   **Java code for Bean Creation**

   ```java
   public class UsernameTokenTestValidator implements Validator
   {
   
       @Override
       public Credential validate(Credential credential, RequestData data) throws WSSecurityException
       {
           UsernameToken usernameToken = credential.getUsernametoken();
   
           if(!"secret".equals(usernameToken.getPassword()))
           {
               throw new WSSecurityException(WSSecurityException.FAILED_AUTHENTICATION);
           }
   
           return credential;
       }
   }
   ```

2. To the CXF element in your flow, add a child element (below any `cxf:ws-config` elements you may have added) for `cxf:ws-custom-validator`.

3. To the `cxf:ws-custom-validator` child element, add a child element according to the type of action you want the validator to perform. Refer to the table below.

   | Token Validator                   | Purpose                                                      |
   | --------------------------------- | ------------------------------------------------------------ |
   | **cxf:username-token-validator**  | Authenticates the username and password credentials associated with each message in a manner similar to HTTP Digest authentication. |
   | **cxf:saml1-token-validator**     | Checks messages against SAML 1.1 assertion statements in order to approve or reject access to the Web service. |
   | **cxf:saml2-token-validator**     | Checks messages against SAML 2.0 assertion statements in order to approve or reject access to the Web service. |
   | **cxf:timestamp-token-validator** | Examines the timeliness of messages – when they were created and received, and when they expire – to make decisions about which messages to process. The timestamp is in UTC time and is a combination of date and time of day per Chapter 5.4 of ISO 8601, which is known as the dateTime format. |
   | **cxf:signature-token-validator** | Examines the digital signature attached to messages to make decisions about which messages to process. |
   | **cxf:bst-token-validator**       | Examines binary encoded security tokens (such as Kerberos) to make decisions about which messages to process. |

4. Add a `ref` attribute to the validator to reference the global spring:bean element which imports the Java class.

   **View the Namespace**

   ```xml
   <mule xmlns:cxf="http://www.mulesoft.org/schema/mule/cxf"
   ...
   xsi:schemaLocation="
   http://www.mulesoft.org/schema/mule/cxf http://www.mulesoft.org/schema/mule/cxf/current/mule-cxf.xsd">
   ```

   ```xml
   <spring:beans>
       <spring:bean id="customTokenValidator" name="Bean" class="org.mule.example.myClass"/>
   </spring:beans>
   
   <flow name="Creation1Flow1" doc:name="Creation1Flow1">
       <http:inbound-endpoint host="localhost" port="8081"/>
       <cxf:jaxws-service doc:name="SOAP">
           <cxf:ws-security>
               <cxf:ws-config>
                   <cxf:property key="action" value="UsernameToken"/>
               </cxf:ws-config>
               <cxf:ws-custom-validator>
                   <cxf:username-token-validator ref="Bean"/>
               </cxf:ws-custom-validator>
           </cxf:ws-security>
       </cxf:jaxws-service>
   </flow>
   ```

## Complete Code Example

### View the Namespace

```xml
<mule xmlns:cxf="http://www.mulesoft.org/schema/mule/cxf"
...
xsi:schemaLocation="
http://www.mulesoft.org/schema/mule/cxf http://www.mulesoft.org/schema/mule/cxf/current/mule-cxf.xsd">
```

[View the Mule 3.5 CXF schema](http://www.mulesoft.org/schema/mule/cxf/3.5/mule-cxf.xsd).

### View Example Code

```xml
<spring:beans>
        <spring:bean id="Bean" name="samlCustomValidator" class="com.mulesoft.mule.example.security.SAMLCustomValidator"/>
    </spring:beans>

    <flow name="UnsecureServiceFlow" doc:name="UnsecureServiceFlow">
        <http:inbound-endpoint host="localhost" port="63081" path="services/unsecure" />
 <cxf:jaxws-service serviceClass="com.mulesoft.mule.example.security.Greeter" doc:name="Unsecure service"/>
        <component class="com.mulesoft.mule.example.security.GreeterService" doc:name="Greeter Service" />
    </flow>

    <flow name="UsernameTokenServiceFlow" doc:name="UsernameTokenServiceFlow">
        <http:inbound-endpoint host="localhost" port="63081" path="services/username" />
 <cxf:jaxws-service serviceClass="com.mulesoft.mule.example.security.Greeter" doc:name="Secure UsernameToken service">
            <cxf:ws-security>
                <cxf:ws-config>
                    <cxf:property key="action" value="UsernameToken Timestamp"/>
                    <cxf:property key="passwordCallbackClass" value="com.mulesoft.mule.example.security.PasswordCallback"/>
                </cxf:ws-config>
            </cxf:ws-security>
        </cxf:jaxws-service>
        <component class="com.mulesoft.mule.example.security.GreeterService" doc:name="Greeter Service"/>
    </flow>

    <flow name="UsernameTokenSignedServiceFlow" doc:name="UsernameTokenSignedServiceFlow">
        <http:inbound-endpoint host="localhost" port="63081" path="services/signed" />
        <cxf:jaxws-service serviceClass="com.mulesoft.mule.example.security.Greeter" doc:name="Secure UsernameToken Signed service">
            <cxf:ws-security>
                <cxf:ws-config>
                    <cxf:property key="action" value="UsernameToken Signature Timestamp"/>
                    <cxf:property key="signaturePropFile" value="wssecurity.properties"/>
                    <cxf:property key="passwordCallbackClass" value="com.mulesoft.mule.example.security.PasswordCallback"/>
                </cxf:ws-config>
            </cxf:ws-security>
        </cxf:jaxws-service>
        <component class="com.mulesoft.mule.example.security.GreeterService" doc:name="Greeter Service"/>
    </flow>

    <flow name="UsernameTokenEncryptedServiceFlow" doc:name="UsernameTokenEncryptedServiceFlow">
        <http:inbound-endpoint host="localhost" port="63081" path="services/encrypted" />
        <cxf:jaxws-service serviceClass="com.mulesoft.mule.example.security.Greeter" doc:name="Secure UsernameToken Encrypted service">
            <cxf:ws-security>
                <cxf:ws-config>
                    <cxf:property key="action" value="UsernameToken Timestamp Encrypt"/>
                    <cxf:property key="decryptionPropFile" value="wssecurity.properties"/>
                    <cxf:property key="passwordCallbackClass" value="com.mulesoft.mule.example.security.PasswordCallback"/>
                </cxf:ws-config>
            </cxf:ws-security>
        </cxf:jaxws-service>
        <component class="com.mulesoft.mule.example.security.GreeterService" doc:name="Greeter Service"/>
    </flow>

    <flow name="SamlTokenServiceFlow" doc:name="SamlTokenServiceFlow">
        <http:inbound-endpoint host="localhost" port="63081" path="services/saml" />
        <cxf:jaxws-service serviceClass="com.mulesoft.mule.example.security.Greeter" doc:name="Secure SAMLToken service">
            <cxf:ws-security>
                <cxf:ws-config>
                    <cxf:property key="action" value="SAMLTokenUnsigned Timestamp"/>
                </cxf:ws-config>
                <cxf:ws-custom-validator>
                    <cxf:saml2-token-validator ref="samlCustomValidator"/>
                </cxf:ws-custom-validator>
            </cxf:ws-security>
        </cxf:jaxws-service>
        <component class="com.mulesoft.mule.example.security.GreeterService" doc:name="Greeter Service"/>
    </flow>

    <flow name="SignedSamlTokenServiceFlow" doc:name="SignedSamlTokenServiceFlow">
        <http:inbound-endpoint host="localhost" port="63081" path="services/signedsaml" />
        <cxf:jaxws-service serviceClass="com.mulesoft.mule.example.security.Greeter" doc:name="Secure SAMLToken Signed service">
            <cxf:ws-security>
                <cxf:ws-config>
                    <cxf:property key="action" value="SAMLTokenUnsigned Signature"/>
                    <cxf:property key="signaturePropFile" value="wssecurity.properties" />
                </cxf:ws-config>
                <cxf:ws-custom-validator>
                    <cxf:saml2-token-validator ref="samlCustomValidator"/>
                </cxf:ws-custom-validator>
            </cxf:ws-security>
        </cxf:jaxws-service>
        <component class="com.mulesoft.mule.example.security.GreeterService" doc:name="Greeter Service"/>
    </flow>
```

## See Also

- Learn more about configuring a [CXF component](https://docs.mulesoft.com/mule-runtime/3.5/cxf-component-reference) in your Mule application.
- Review an the [Mule example application](https://docs.mulesoft.com/mule-runtime/3.5/soap-web-service-security-example) which demonstrates the use of WS-security.
- Review a [Mule example application](https://docs.mulesoft.com/mule-runtime/3.5/xml-only-soap-web-service-example) which demonstrates a SOAP Web service.



# 3.9.Enabling WS-Security

**Enterprise**

When a Web service exposes private network data to the outside world, that data travels through 4 - 7 separate protocol layers (TCP/IP or OSI) thus introducing potential security vulnerabilities. Implementing security at a higher layer on the protocol stack — the application layer, for instance — generally provides better protection than an implementation at the lower transport layer, which provides only HTTPS security.

To implement application-layer security, enable WS-Security (a CXF configuration) on your Web service. WS-Security defines a new SOAP header which is capable of carrying various security tokens that systems use to identify a Web service caller’s identity and privileges, and can include the following:

- Encryption
- Digital signature
- Timestamp

You can also add a custom token validator to the SOAP Component.

[Complete Code Example](https://docs.mulesoft.com/mule-runtime/3.9/enabling-ws-security#complete-code-example)

## Enabling WS-Security

To enable WS-Security on a CXF web service in your application, you must add WS-configurations to the SOAP Component in your flow. This approach enables WS-Security locally within your flow, for one Web service only.

To the Mule flow that involves a web service, add a CXF component to publish, consume, or proxy a Web service. Complete the following steps to configure WS-Security on the SOAP component.

### Enabling WS-Security in Studio Visual Editor

1. Search for "cxf" and drag the CXF (SOAP) building block to the canvas.

2. Click the CXF element to open the properties menu.

3. Choose an Operation.

4. Click the Security tab.

   ![security](https://docs.mulesoft.com/mule-runtime/3.9/_images/security.png)

5. Click the plus icon in the **Add Configuration Element** pane to create a new key-value pair.

6. Click **cxf:property** key and Enter a key, such as `action`, in the **Key** field and press **Enter**:

   ![key_value_pair](https://docs.mulesoft.com/mule-runtime/3.9/_images/key-value-pair.png)

   In XML, this step mirrors the addition of a key-value pair inside the ws-config child element of a ws-security element. By adding configuration elements to your SOAP component, you are creating a map of key-value pairs that correspond to the CXF WSS4J security-configuration text strings in WSHandlerConstants and WSConstants.

7. Click the Value field and specify a WSConstant (a class to define the kind of access the server allows) or a WSHandlerConstant (a class to specify the names, actions, and other strings for data deployment of the WSS handler). For example, enter `UsernameToken` in the value field.

   ![open and specify value](https://docs.mulesoft.com/mule-runtime/3.9/_images/open-and-specify-value.png)

8. Open the Value Reference field and specify the bean that the key must reference. When the key must reference a bean (for instance, when the key is `passwordCallbackRef`), enter the name of the bean in the Value Reference field.

9. Repeat the steps above to add as many ws-security configurations as you wish to your Web service, then click OK to save your configurations.

### Enabling WS-Security in Studio XML Editor or Standalone

1. To your CXF element (a SOAP component), add a child element for `cxf:ws-security`.

2. Within the `cxf:ws-security` child element, add a child element for `cxf:ws-config`.

3. Within the `cxf:ws-config` child element, add a child element for `cxf:property`.

4. Add two attributes to the cxf:property child element according to the table below. Be sure to enter either a `value`*OR* a `value-ref`; the two are mutually exclusive.

   | Attribute | Description                                                  |
   | --------- | ------------------------------------------------------------ |
   | key       | Specify a name for the property.                             |
   | value     | Specify a WSConstant (a class to define the kind of access the server allows) or a WSHandlerConstant (a class to specify the names, actions, and other strings for data deployment of the WSS handler). For example, enter `UsernameToken` in the value field. |
   | value-ref | Specify the bean that the key must reference. When the key must reference a bean (for instance, when the key is `passwordCallbackRef`), specify the name of the bean as the value-ref. |

5. Repeat the preceding step to add as many WS-security configurations as you wish to your Web service. Refer to sample code below.

   View the Namespace:

   ```xml
   <mule xmlns:cxf="http://www.mulesoft.org/schema/mule/cxf"
   ...
   xsi:schemaLocation="
   http://www.mulesoft.org/schema/mule/cxf http://www.mulesoft.org/schema/mule/cxf/current/mule-cxf.xsd">
   ```

   ```xml
   <http:listener-config name="listener-config" host="localhost" port="8081"/>
   <flow name="Creation1Flow1" doc:name="Creation1Flow1">
       <http:listener config-ref="listener-config" path="/" doc:name="HTTP Connector"/>
       <cxf:jaxws-service doc:name="SOAP">
           <cxf:ws-security>
               <cxf:ws-config>
                   <cxf:property key="action" value="UsernameToken"/>
               </cxf:ws-config>
           </cxf:ws-security>
       </cxf:jaxws-service>
   </flow>
   ```

## Adding a Token Validator

If you have enabled WS-Security on your Web service in Mule, you can further configure the SOAP component to delegate authentication of the message credentials it transmits or receives.

A SOAP component may get bogged down with the tasks of both processing and authenticating messages. To lighten this load, you can instruct WS-security to delegate certain message authentication tasks to a **Token Validator**, including:

- Validating the `UsernameToken` in cases where the `CallbackHandler` implementation does not have access to the password.
- Validating the attributes of a received SAML assertion.
- Dispatching a received security token to a third-party security service for validation.

Complete the following procedure to add token validators to your Web service.

### Adding a Token Validator in Studio Visual Editor

1. In the Security tab of your SOAP component, click one or more of the check boxes to delegate message authentication tasks to token validators. Refer to the table below for the activity of each token validator.

   ![token_validators](https://docs.mulesoft.com/mule-runtime/3.9/_images/token-validators.png)

   | Token Validator       | Purpose                                                      |
   | --------------------- | ------------------------------------------------------------ |
   | User Name             | Authenticates the username and password credentials associated with each message in a manner similar to HTTP Digest authentication. |
   | SAML 1                | Checks messages against SAML 1.1 assertion statements in order to approve or reject access to the Web service. |
   | SAML 2                | Checks messages against SAML 2.0 assertion statements in order to approve or reject access to the Web service. |
   | Timestamp             | Examines the timeliness of messages – when they were created and received, and when they expire – to make decisions about which messages to process. The timestamp is in UTC time and is a combination of date and time of day per Chapter 5.4 of ISO 8601, which is known as the dateTime format. |
   | Signature             | Examines the digital signature attached to messages to make decisions about which messages to process. |
   | Binary Security Token | Examines binary encoded security tokens (such as Kerberos) to make decisions about which messages to process. |

2. In the Bean field associated with the token validator you have selected, use the drop-down menu to select an existing bean that your token validator references to apply, replace, or extend the default behavior associated with a specific security token.

   If you have not yet created any beans, click the plus sign icon to open a new properties panel in which you can create and configure a new bean. The bean imports the Java class you have built to specify the custom validator’s override behavior.

   ![token_validators_selected](https://docs.mulesoft.com/mule-runtime/3.9/_images/token-validators-selected.png)

   Java code for bean creation:

   ```java
   public class UsernameTokenTestValidator implements Validator
   {
   
       @Override
       public Credential validate(Credential credential, RequestData data) throws WSSecurityException
       {
           UsernameToken usernameToken = credential.getUsernametoken();
   
           if(!"secret".equals(usernameToken.getPassword()))
           {
               throw new WSSecurityException(WSSecurityException.FAILED_AUTHENTICATION);
           }
   
           return credential;
       }
   }
   ```

3. Click OK to save changes.

### Adding a Token Validator in Studio XML Editor or Standalone

1. Above all flows in your Mule project, create a global `spring:bean` element to import the Java class you have built to specify the token validator’s behavior. Refer to code sample below.

   Java code for bean creation:

   ```java
   public class UsernameTokenTestValidator implements Validator
   {
   
       @Override
       public Credential validate(Credential credential, RequestData data) throws WSSecurityException
       {
           UsernameToken usernameToken = credential.getUsernametoken();
   
           if(!"secret".equals(usernameToken.getPassword()))
           {
               throw new WSSecurityException(WSSecurityException.FAILED_AUTHENTICATION);
           }
   
           return credential;
       }
   }
   ```

2. To the CXF element in your flow, add a child element (below any `cxf:ws-config` elements you may have added) for `cxf:ws-custom-validator`.

3. To the `cxf:ws-custom-validator` child element, add a child element according to the type of action you want the validator to perform. Refer to the table below.

   | Token Validator               | Purpose                                                      |
   | ----------------------------- | ------------------------------------------------------------ |
   | cxf:username-token-validator  | Authenticates the username and password credentials associated with each message in a manner similar to HTTP Digest authentication. |
   | cxf:saml1-token-validator     | Checks messages against SAML 1.1 assertion statements in order to approve or reject access to the Web service. |
   | cxf:saml2-token-validator     | Checks messages against SAML 2.0 assertion statements in order to approve or reject access to the Web service. |
   | cxf:timestamp-token-validator | Examines the timeliness of messages – when they were created and received, and when they expire – to make decisions about which messages to process. The timestamp is in UTC time and is a combination of date and time of day per Chapter 5.4 of ISO 8601, which is known as the dateTime format. |
   | cxf:signature-token-validator | Examines the digital signature attached to messages to make decisions about which messages to process. |
   | cxf:bst-token-validator       | Examines binary encoded security tokens (such as Kerberos) to make decisions about which messages to process. |

4. Add a `ref` attribute to the validator to reference the global spring:bean element which imports the Java class.

   View the namespace:

   ```xml
   <mule xmlns:cxf="http://www.mulesoft.org/schema/mule/cxf"
   ...
   xsi:schemaLocation="
   http://www.mulesoft.org/schema/mule/cxf http://www.mulesoft.org/schema/mule/cxf/current/mule-cxf.xsd">
   ```

   ```xml
   <spring:beans>
       <spring:bean id="customTokenValidator" name="Bean" class="org.mule.example.myClass"/>
   </spring:beans>
   
   <http:listener-config name="listener-config" host="localhost" port="8081"/>
   <flow name="Creation1Flow1" doc:name="Creation1Flow1">
       <http:listener config-ref="listener-config" path="/" doc:name="HTTP Connector"/>
       <cxf:jaxws-service doc:name="SOAP">
           <cxf:ws-security>
               <cxf:ws-config>
                   <cxf:property key="action" value="UsernameToken"/>
               </cxf:ws-config>
               <cxf:ws-custom-validator>
                   <cxf:username-token-validator ref="Bean"/>
               </cxf:ws-custom-validator>
           </cxf:ws-security>
       </cxf:jaxws-service>
   </flow>
   ```

## Complete Code Example

View the namespace:

```xml
<mule xmlns:cxf="http://www.mulesoft.org/schema/mule/cxf"
...
xsi:schemaLocation="
http://www.mulesoft.org/schema/mule/cxf http://www.mulesoft.org/schema/mule/cxf/current/mule-cxf.xsd">
```

View the example code:

```xml
<spring:beans>
        <spring:bean id="Bean" name="samlCustomValidator" class="com.mulesoft.mule.example.security.SAMLCustomValidator"/>
    </spring:beans>
    <http:listener-config name="listener-config" host="localhost" port="63081"/>

    <flow name="UnsecureServiceFlow" doc:name="UnsecureServiceFlow">
        <http:listener config-ref="listener-config" path="services/unsecure" doc:name="HTTP Connector"/>
 <cxf:jaxws-service serviceClass="com.mulesoft.mule.example.security.Greeter" doc:name="Unsecure service"/>
        <component class="com.mulesoft.mule.example.security.GreeterService" doc:name="Greeter Service" />
    </flow>

    <flow name="UsernameTokenServiceFlow" doc:name="UsernameTokenServiceFlow">
        <http:listener config-ref="listener-config" path="services/username" doc:name="HTTP Connector"/>
 <cxf:jaxws-service serviceClass="com.mulesoft.mule.example.security.Greeter" doc:name="Secure UsernameToken service">
            <cxf:ws-security>
                <cxf:ws-config>
                    <cxf:property key="action" value="UsernameToken Timestamp"/>
                    <cxf:property key="passwordCallbackClass" value="com.mulesoft.mule.example.security.PasswordCallback"/>
                </cxf:ws-config>
            </cxf:ws-security>
        </cxf:jaxws-service>
        <component class="com.mulesoft.mule.example.security.GreeterService" doc:name="Greeter Service"/>
    </flow>

    <flow name="UsernameTokenSignedServiceFlow" doc:name="UsernameTokenSignedServiceFlow">
        <http:listener config-ref="listener-config" path="services/signed" doc:name="HTTP Connector"/>
        <cxf:jaxws-service serviceClass="com.mulesoft.mule.example.security.Greeter" doc:name="Secure UsernameToken Signed service">
            <cxf:ws-security>
                <cxf:ws-config>
                    <cxf:property key="action" value="UsernameToken Signature Timestamp"/>
                    <cxf:property key="signaturePropFile" value="wssecurity.properties"/>
                    <cxf:property key="passwordCallbackClass" value="com.mulesoft.mule.example.security.PasswordCallback"/>
                </cxf:ws-config>
            </cxf:ws-security>
        </cxf:jaxws-service>
        <component class="com.mulesoft.mule.example.security.GreeterService" doc:name="Greeter Service"/>
    </flow>

    <flow name="UsernameTokenEncryptedServiceFlow" doc:name="UsernameTokenEncryptedServiceFlow">
        <http:listener config-ref="listener-config" path="services/encrypted" doc:name="HTTP Connector"/>
        <cxf:jaxws-service serviceClass="com.mulesoft.mule.example.security.Greeter" doc:name="Secure UsernameToken Encrypted service">
            <cxf:ws-security>
                <cxf:ws-config>
                    <cxf:property key="action" value="UsernameToken Timestamp Encrypt"/>
                    <cxf:property key="decryptionPropFile" value="wssecurity.properties"/>
                    <cxf:property key="passwordCallbackClass" value="com.mulesoft.mule.example.security.PasswordCallback"/>
                </cxf:ws-config>
            </cxf:ws-security>
        </cxf:jaxws-service>
        <component class="com.mulesoft.mule.example.security.GreeterService" doc:name="Greeter Service"/>
    </flow>

    <flow name="SamlTokenServiceFlow" doc:name="SamlTokenServiceFlow">
        <http:listener config-ref="listener-config" path="services/saml" doc:name="HTTP Connector"/>
        <cxf:jaxws-service serviceClass="com.mulesoft.mule.example.security.Greeter" doc:name="Secure SAMLToken service">
            <cxf:ws-security>
                <cxf:ws-config>
                    <cxf:property key="action" value="SAMLTokenUnsigned Timestamp"/>
                </cxf:ws-config>
                <cxf:ws-custom-validator>
                    <cxf:saml2-token-validator ref="samlCustomValidator"/>
                </cxf:ws-custom-validator>
            </cxf:ws-security>
        </cxf:jaxws-service>
        <component class="com.mulesoft.mule.example.security.GreeterService" doc:name="Greeter Service"/>
    </flow>

    <flow name="SignedSamlTokenServiceFlow" doc:name="SignedSamlTokenServiceFlow">
        <http:listener config-ref="listener-config" path="services/signedsaml" doc:name="HTTP Connector"/>
        <cxf:jaxws-service serviceClass="com.mulesoft.mule.example.security.Greeter" doc:name="Secure SAMLToken Signed service">
            <cxf:ws-security>
                <cxf:ws-config>
                    <cxf:property key="action" value="SAMLTokenUnsigned Signature"/>
                    <cxf:property key="signaturePropFile" value="wssecurity.properties" />
                </cxf:ws-config>
                <cxf:ws-custom-validator>
                    <cxf:saml2-token-validator ref="samlCustomValidator"/>
                </cxf:ws-custom-validator>
            </cxf:ws-security>
        </cxf:jaxws-service>
        <component class="com.mulesoft.mule.example.security.GreeterService" doc:name="Greeter Service"/>
    </flow>
```

## Signature Key Identifier

Defines which key identifier type to use for signature. This is a String value and is specified with the XML signatureKeyIdentifier element. For more information on each value, see `http://coheigea.blogspot.com/2013/03/signature-and-encryption-key.html`.

**Note:** Prior to Mule 3.8.2, signatureKeyIdentifier could only be set to DirectReference. In Mule 3.8.2, MULE-11301 fixed this issue.

Possible values are:

- DirectReference
- EmbeddedKeyName
- EncryptedKeySHA1
- IssuerSerial
- SKIKeyIdentifier
- Thumbprint
- X509KeyIdentifier

Example:

```xml
<cxf:jaxws-client doc:name="SAMLToken Signed SOAP client" operation="greet" serviceClass="com.mulesoft.mule.example.security.Greeter">
    <cxf:ws-security>
        <cxf:ws-config>
            <cxf:property key="action" value="SAMLTokenSigned"/>
            <cxf:property key="samlPropFile" value="saml.properties"/>
            <cxf:property key="signatureKeyIdentifier" value="DirectReference"/>
            <cxf:property key="user" value="joe"/>
            <cxf:property key="passwordCallbackClass" value="com.mulesoft.mule.example.security.PasswordCallback"/>
            <cxf:property key="samlCallbackClass" value="com.mulesoft.mule.example.security.SAMLCallbackHandler"/>
        </cxf:ws-config>
    </cxf:ws-security>
</cxf:jaxws-client>
```

## See Also

- Learn more about configuring a [CXF component](https://docs.mulesoft.com/mule-runtime/3.9/cxf-component-reference) in your Mule application.