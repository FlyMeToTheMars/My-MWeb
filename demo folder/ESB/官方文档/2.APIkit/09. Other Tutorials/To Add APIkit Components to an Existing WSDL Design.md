# To Add APIkit Components to an Existing WSDL Design

You can add APIkit components to an existing design, for example a legacy SOAP project that you want to update using WSDL and APIkit. This procedure generates backend flows that contain the core logic of the API and SOAP message templates for handling faults.

1. Define the WSDL using the editor in Studio.

2. Drag the following components from the Mule palette:

   - An HTTP (or Jetty) Listener
   - An APIkit Router or a SOAP Router

3. Generate SOAP Backend Flows: Click the project name, and select **Mule** > **Generate Flows from WSDL**

4. Using DataWeave, provide XML responses to the SOAP faults.

   ![apikit using ea7ad](https://docs.mulesoft.com/apikit/3.x/_images/apikit-using-ea7ad.png)