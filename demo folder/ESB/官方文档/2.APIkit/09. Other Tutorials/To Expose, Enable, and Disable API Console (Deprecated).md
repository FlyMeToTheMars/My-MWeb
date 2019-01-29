# To Expose, Enable, and Disable API Console (Deprecated)

This procedure describes how to expose the API Console by configuring the apikit:config element. The console path, when using this configuration, is part of the api namespace, specified in the listener of the main flow. Ff the api is configured in /api, the console is accessed by hitting /api/console. This causes problems when applying policies to the whole api, as the console is affected by the policies. This method of disabling API Console is deprecated.

To expose API Console, configure the apikit:config element:

```
 <apikit:config name="apiConfig" raml="api.raml" consoleEnabled="true" consolePath="console"/>
```

## To Enable or Disable API Console

To enable/disable the console when exposing the API as described above, use the consoleEnabled property.

1. Add a conditional expression in the api-console flow as shown in the following example:

   ```
   <flow name="api-console">
      <http:listener config-ref="api-httpListenerConfig" path="/console/*" doc:name="HTTP"/>
        <choice doc:name="Choice">
           <when expression="${test}">
              <apikit:console config-ref="api-config" doc:name="APIkit Console"/>
           </when>
           <otherwise>
               <set-payload value="Resource not found" doc:name="Set Payload"/>
           </otherwise>
        </choice>
   </flow>
   ```

2. Define the `test` property in mule-app.properties.

3. Set the `test` property to true or false to enable/disable the console.



# 公开，启用和禁用API控制台（已弃用）

此过程描述如何通过配置apikit：config元素来公开API控制台。使用此配置时，控制台路径是api命名空间的一部分，在主流的侦听器中指定。如果api在/ api中配置，则通过按/ api / console访问控制台。这会在将策略应用于整个api时导致问题，因为控制台受策略影响。不推荐使用此禁用API控制台的方法。

要公开API控制台，请配置apikit：config元素：

```
 <apikit：config name =“apiConfig”raml =“api.raml”consoleEnabled =“true”consolePath =“console”/>
```

## 启用或禁用API控制台

要在如上所述公开API时启用/禁用控制台，请使用consoleEnabled属性。

1. 在api-console流程中添加条件表达式，如以下示例所示：

   ```
   <flow name =“api-console”>
      <http：listener config-ref =“api-httpListenerConfig”path =“/ console / *”doc：name =“HTTP”/>
        <choice doc：name =“Choice”>
           <when expression =“$ {test}”>
              <apikit：console config-ref =“api-config”doc：name =“APIkit Console”/>
           </时>
           <否则>
               <set-payload value =“找不到资源”doc：name =“Set Payload”/>
           </否则>
        </选择>
   </流量>
   ```

2. `test`在mule-app.properties中定义属性。

3. 将该`test`属性设置为true或false以启用/禁用控制台。