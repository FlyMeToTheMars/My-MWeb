# To Expose API Console (Recommended)

The recommended way to expose API Console is to create a flow dedicated to exposing the console. For example:

```xml
<flow name="api-console">
   <http:listener config-ref="api-httpListenerConfig" path="/console/*" doc:name="HTTP"/>

   <apikit:console config-ref="api-config" doc:name="APIkit Console"/>
</flow>
```

This flow uses its own listener, so the path of the console is not a part of the api namespace. Using this method, you can apply policies to your api without affecting the console.





# 暴露API控制台（推荐）

公开API控制台的推荐方法是创建专用于公开控制台的流程。例如：

```
<flow name =“api-console”>
   <http：listener config-ref =“api-httpListenerConfig”path =“/ console / *”doc：name =“HTTP”/>

   <apikit：console config-ref =“api-config”doc：name =“APIkit Console”/>
</flow>
```

此流使用自己的侦听器，因此控制台的路径不是api命名空间的一部分。使用此方法，您可以在不影响控制台的情况下将策略应用于api。