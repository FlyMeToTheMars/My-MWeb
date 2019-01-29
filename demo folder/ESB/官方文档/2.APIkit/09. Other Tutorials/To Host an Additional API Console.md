# To Host an Additional API Console

1. In the **Package Explorer**, select the API name in `src/main/app`.

2. On the Global Elements tab, click **Create** and select **Connector Configuration** > **HTTP Listener Configuration**.

   - Change the **Port** setting from 8081 to another port, for example 8083.
   - Set the **Base Path** to `remote-vending/api/*`, the same base path you used for the first HTTP listener configuration. Click OK.

3. On the **Message Flow** tab, drag an **HTTP Connector** onto the canvas to create a new flow in the project.

4. Give the new flow an arbitrary name. For example, `api-console2`.

5. In the properties editor, in **Connector Configuration**, select the new global HTTP listener configuration you created from the drop-down.

6. In the Properties editor, set **Path** to a different path than you used for the first HTTP listener configuration. For example, set the path to `/console2/*`. Save the changes.

7. Drag an **APIkit Console** standalone endpoint from the Mule Palette to the right of the HTTP listener.

   The following code snippet shows the configurations added to enable a second console.

   ```xml
   <http:listener-config name="HTTP_Listener_Configuration" host="localhost" port="8083" basePath="remote-vending/api/*" doc:name="HTTP Listener Configuration"/>
   ...
   <flow name="api-console2">
      <http:listener config-ref="HTTP_Listener_Configuration" path="/console2/*" doc:name="HTTP"/>
      <apikit:console config-ref="api-config" doc:name="APIkit Console"/>
   </flow>
   ```

8. Save all, right-click the API in Project Explorer, and choose **Run As** > **Mule Application**.

   The additional console tab appears.

9. Click the new tab.

   ![apikit using 0b49a](https://docs.mulesoft.com/apikit/3.x/_images/apikit-using-0b49a.png)





# 托管其他API控制台

1. 在**Package Explorer中**，选择API名称`src/main/app`。

2. 在Global Elements选项卡上，单击**Create**并选择**Connector Configuration** > **HTTP Listener Configuration**。

   - 将**端口**设置从8081 更改为另一个端口，例如8083。
   - 设置**基本路径**来`remote-vending/api/*`，您使用的第一个HTTP监听器配置相同的基本路径。单击确定。

3. 在“ **消息流”**选项卡上，将**HTTP连接器**拖到画布上以在项目中创建新流。

4. 为新流提供任意名称。例如，`api-console2`。

5. 在属性编辑器的“ **连接器配置”中**，从下拉列表中选择您创建的新全局HTTP侦听器配置。

6. 在“属性”编辑器中，将“ **路径”**设置为与用于第一个HTTP侦听器配置的**路径**不同的路径。例如，将路径设置为`/console2/*`。保存更改。

7. 将**APIkit控制台**独立端点从Mule Palette **拖到** HTTP侦听器的右侧。

   以下代码段显示添加的配置以启用第二个控制台。

   ```xml
   <http:listener-config name="HTTP_Listener_Configuration" host="localhost" port="8083" basePath="remote-vending/api/*" doc:name="HTTP Listener Configuration"/>
   ...
   <flow name="api-console2">
      <http:listener config-ref="HTTP_Listener_Configuration" path="/console2/*" doc:name="HTTP"/>
      <apikit:console config-ref="api-config" doc:name="APIkit Console"/>
   </flow>
   ```

8. 全部保存，在Project Explorer中右键单击API，然后选择**Run As** > **Mule Application**。

   出现附加控制台选项卡。

9. 单击新选项卡。

   ![apikit使用0b49a](https://docs.mulesoft.com/apikit/3.x/_images/apikit-using-0b49a.png)


  