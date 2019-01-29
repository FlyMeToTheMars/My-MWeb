

﻿# DataVault 2.0  

## Chapter 1 导论学习

### The information hierarchy 

![FIGURE 1.1 The information hierarchy ](assets/image-15356818921849png) 

### Decision support system

![FIGURE 1.2 Decision support system. ](assets/image-1535681983916.png) 

### Typical Two-Layer Architecture 

![FIGURE 1.3 Typical Two-Layer Architecture ](assets/image-1535681990507.png) 

### Typical Three-Layer Architecture 

![FIGURE 1.4 Typical Three-Layer Architecture ](assets/image-1535681996967.png) 

## Chapter 2 数据仓库架构  

### Data Vault Architecture 

![FIGURE 2.2 Data Vault Architecture](assets/image-1535682028993.png)
• A **staging area** which does not store historical information and does not apply any changes to the data, except ensuring the expected data type. 

• A **data warehouse layer** modeled after the Data Vault modeling technique.  

• One or more **information mart** layers that depend on the data warehouse layer.  

• An optional **Metrics Vault** that is used to capture and record runtime information.  

• An optional **Business Vault** that is used to store information where the business rules have been applied. In many cases, the business rules change or alter the data when transforming it into useful information. This is another type of information mart.  

• An optional **Operational Vault** that stores data fed into the data warehouse from operational systems.  

• Capabilities for managed self-service BI to allow business users to perform their own data analysis tasks without involvement of IT, including write-back of information into the enterprise data warehouse 
layer.  

All optional Vaults – the Metrics Vault, the Business Vault and the Operational Vault – are part of the Data Vault and are integrated into the data warehouse layer. The reference architecture in the Data Vault 2.0 standard is presented in Figure 2.2.  

### Application of hard and soft business rules

![FIGURE 2.3 Application of hard and soft business rules in a Data Vault enterprise data warehouse.](assets/image-1535682076871.png) 

### Business Vault

![FIGURE 2.4 Business Vault is located within the Data Vault enterprise data warehouse. ](assets/image-1535682084657.png) 

### Operational Data Vault

![ FIGURE 2.5 Operational Data Vault](assets/image-1535682091647.png)



## Chapter 3 DV2.0方法论  

![image](assets/image-1535682099063.png)FIGURE 3.1 Components of the Data Vault 2.0 methodology.  

## Chapter 4 DV2.0模型定义  

* ###  Hub Definition  

![image](assets/image-1535682116937.png)

### Hub Entity Structure  

* Hash Key  
* Business Key  
* Load Date  
* Record Source  
* Last Seen Date  

### Hub Examples  

![image](assets/image-1535682130350.png)

## 4.4. Link Definition  

![image](assets/image-1535682150654.png)

![image](assets/image-1535682159344.png)FIGURE 4.13 A link connecting two hubs (logical design).  

### link entity Structure    
    * Link Entity Structure  
        * • Hash key  
        * • Load date  
        * • Record source  
        * • Last seen date  
        * • Dependent child key  

### Link Examples  

![image](assets/image-1535682173948.png)FIGURE 4.23 Data Vault link examples (physical design).  
##  4.5. Satellite Definition  

 ![A Data Vault satellite entity (physical design)](assets/image-1535682193777.png)

> they don’t introduce their own hash keys.  

### Satellite Entity Structure  
 • Load date  
 • Record source  
 • Parent hash key  
 • Load end date  
 • Extract date  
 • Hash diff  

### Satellite Examples 
 ![Satellite Examples](assets/image-1535682206075.png)  



