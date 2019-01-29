# Data Vault Series 1 – Data Vault Overview

Posted on [July 1, 2002](http://tdan.com/data-vault-series-1-data-vault-overview/5054) by [Dan Linstedt](http://tdan.com/author/Dan-Linstedt)

*Published in TDAN.com July 2002*



There is a new home for the Data Vault: [http://www.danlinstedt.com](http://www.danlinstedt.com/)



*Articles from this series – [Series 1](http://www.tdan.com/view-articles/5054/) – [Series 2](http://www.tdan.com/view-articles/5155/) – [Series 3](http://www.tdan.com/view-articles/5067/) – [Series 4](http://www.tdan.com/view-articles/5172/) – [Series 5](http://www.tdan.com/view-articles/5285/)*



## 1.0 Introduction

The purpose of this paper is to present and discuss a patent-pending technique called the Data Vault™ – the next evolution in data modeling for enterprise data warehousing. This is a
highly technical paper and is meant for an audience of data modelers, data architects and database administrators. It is not meant for business analysts, project managers, or mainframe programmers.
It is recommended that there is a base level of knowledge in common data modeling terms such as table, relationship, parent, child, key (primary/foreign), dimension and fact. The topics in this
paper are as follows:

- Defining a Data Vault.
- A brief history of data modeling for data warehousing.
- The problems of existing data warehouse data modeling architectures.
- The importance of architecture and design for enterprise data warehousing.
- The components of a Data Vault.
- Solving the pain of data warehouse architectures.
- The foundations of the Data Vault architecture.
- Possible Applications / Implications of the Data Vault.

Several of the objectives that you may learn from this paper are:

- What a Data Vault is and why it makes sense.
- How to build a small Data Vault of your own.
- What doesn’t work from an enterprise data warehousing perspective.

For too long we have waited for data structures to finally catch up with artificial intelligence and data mining applications. Most of the data mining technology has to import flat file information
in order to join the form with the function. Unfortunately, volumes in data warehouses are growing rapidly and exporting this information for data mining purposes is becoming increasingly
difficult. It simply doesn’t make sense to have this discontinuity between form (structure), function (artificial intelligence), and execution (the act of data mining).

Marrying form, function and execution holds tremendous power for the artificial intelligence (AI) and data mining communities. Having data structures that are mathematically sound increases the
ability to bring these technologies back into the database. The Data Vault is based on mathematical principles that allow it to be extensible and capable of handling massive volumes of information.
The architecture and structure is designed to handle dynamic changes to relationships between information.

A stretch of the imagination might be to one day encapsulate the data with the functions of data mining, hopefully to move towards a “self-aware” independent piece of information
– but that’s just a dream for now. It is possible to form, drop, and evaluate relationships between data sets dynamically. Thus changing the landscape of what is possible with a data
model; essentially bringing the data model into a dynamic state of flux (through the use of data mining/artificial intelligence).

By implementing reference architectures on top of a Data Vault structure – the functions that access the content may begin to execute in parallel and in an automated dynamic fashion. The Data Vault
solves some of the Enterprise Data Warehousing structural and storage problems from a normalized, best of breed perspective. The concepts provide a whole host of opportunities in applying this
unique technology.

“You must strive to do that which you think you cannot do.” Eleanor Roosevelt.



## 2.0 Defining a Data Vault

Definition: The Data Vault is a detail oriented, historical tracking and uniquely linked set of normalized tables that support one or more functional areas of business. It is a hybrid approach
encompassing the best of breed between 3rd normal form (3NF) and star schema. The design is flexible, scalable, consistent and adaptable to the needs of the enterprise. It is a data model that is
architected specifically to meet the needs of enterprise data warehouses.

The Data Vault is architected to meet the needs of the data warehouse, not to be confused with a data mart. It can double as an Operational Data Store (ODS) if the correct hardware and database
engine is in place to support it. The Data Vault can handle massive sets of granular data in a smaller, more normalized physical space in comparison to both 3NF and star schema. The Data Vault is
foundationally strong. It is based on the mathematical principles that support the normalized data models. Inside the Data Vault model are familiar structures that match traditional definitions of
star schema and 3NF that include dimensions, many to many linkages and standard table structures. The differences lie in relationship representations, field structuring and granular time-based data
storage. The modeling techniques built into the Data Vault have undergone years of design and testing across many different scenarios providing them with a solid foundational approach to data
warehousing.



### 2.1 A Brief History of Data Modeling for Data Warehousing

3NF was originally built in the early 1960’s (Codd & Date) for On-Line Transaction Processing (OLTP) systems. In the early 1980’s it was adapted to meet the growing needs of data
warehouses. Essentially a date-time stamp was added to the primary keys in each of the table structures. (See Figure 1 below)

In the mid to late 1980’s star schema data modeling was introduced and perfected. It was architected to solve subject-oriented problems including (but not limited to) aggregations, data model
structural change, query performance, reusable or shared information, ease of use, and the ability to support On-Line Analytical Processing (OLAP). This single subject centric architecture became
known as a data mart. . Soon thereafter it too was adapted to multi-subject data warehousing as an attempt to meet the growing needs of enterprise data warehousing. The term for this is Conformed
Data Marts.

![img](http://tdan.com/wp-content/uploads/2016/07/i021hy0101.gif)

Performance and other weaknesses of 3NF and star schema (when used within an enterprise data warehouse) began to show in the 90’s as the volume of data increased. The Data Vault is
architected to overcome these shortcomings while retaining the strengths of 3NF and star schema architectures. Within the past year (of the date on this article), this technique has been favorably
received by industry experts. The Data Vault is the next evolution in data modeling because it’s architected specifically for data enterprise warehouses.



### 2.2 The Problems of Existing Data Warehouse Data Modeling Architectures

Each modeling technique has limitations when they are applied to enterprise data warehouse architecture. This is because they are an adaptation of a design rather than a design built specifically
for the task. These limitations reduce usability and are constantly contributing to the “holy wars” in the data warehousing world. The following paragraphs are with respect to these
architectures being applied as data warehouses, not as their respective original purposes.

3NF has the following issues to contend with including: time driven primary key issues causing parent-child complexities, cascading change impacts, difficulties in near real time loading,
troublesome query access, problematic drill-down analysis, top down architecture and unavoidable top-down implementation. The following figure is an original 3NF model adapted to data warehousing
architecture. One particularly thorny problem is evident when a date-time stamp is placed into the primary key of a parent table (See Figure 2 below). This is necessary in order to represent
changes to detail data over time.

The problem is scalability and flexibility. If an additional parent table is added, the change is forced to cascade down through all subordinate table structures. Also, when a new row is inserted
with an existing parent key (the only field to change is the date-time stamp) all child rows must be reassigned to the new parent key. This cascading effect has a tremendous impact on the processes
and the data model-the larger the model the greater the impact. This makes it difficult (if not impossible) to extend and maintain an enterprise-wide data model. The architecture and design suffer
as a result.

> Figure 2. Date Time Stamped 3NF
>
> ![img](http://tdan.com/wp-content/uploads/2016/07/i021hy0102.jpg)
>
>

The conformed data mart also has trouble. It is a collection of fact tables that are linked together via primary/foreign keys – in other words, a linked set of related star schemas. The
problems this creates are numerous: isolated subject oriented information, possible data redundancy, inconsistent query structuring, agitated scalability issues, difficulties with fact table
linkages (incompatible grain), synchronization issues in near real time loading, limited enterprise views and troublesome data mining. While the star schema is typically bottom up architecture,
bottom up implementation – the conformed data mart should be top down architecture and bottom up implementation. However, informal polling has shown that bottom up architecture and bottom up
implementation appear to be the standard.

One of the most difficult issues of a conformed data mart (or conformed fact tables) is getting the grain right. That means understanding the data as it is aggregated for each fact table and
assuring that the aggregation will stay consistent for all time (during the life of the relationship) and the structure of each fact table will not change (i.e., no new dimensions will be added to
either fact table). This limits design, scalability and flexibility of the data model. Another issue is the “helper table.” This table is defined to be a dimension-to-dimension
relationship Link. Granularity is very important, as is the stability of the design of the dimension. This too limits design, scalability and flexibility of the data model.

> Figure 3. Conformed Data Mart
>
> ![img](http://tdan.com/wp-content/uploads/2016/07/i021hy0102.gif)



If the granularity of the Revenue Fact is altered, then it is no longer the same (duplicate) fact table. By adding a dimension to one of the fact tables the granularity frequently changes. It has
also been suggested that fact tables can be linked together just because they carry the same dimension keys. This is only true if the facts are aggregated to the same granularity, which is an
extremely difficult task to maintain as the system grows and matures.



### 2.3 The Importance of Architecture and Design for Enterprise Data Warehousing

A data warehouse should be top down architecture and bottom up implementation. This allows the architecture to reach the maximum known knowledge boundaries while the implementation can be scope
controlled which can facilitate fast delivery times. The implementation should therefore be designed as a plug-and-play set of tables without becoming a stovepipe upon delivery. The design and
architecture of a data warehouse must be flexible enough to grow and change with the business needs, because the needs of today are not necessarily the needs of tomorrow.

Our industry has a need for a formalized data modeling architecture and design that is capable of accurately representing data warehouses. The architecture must be a defined normalization for data
warehousing versus a defined normalization for OLTP systems. For example, the defined normalization of OLTP is 1st, 2nd and 3NF; of course this includes 4th, 5th and maybe 6th normal form. Data
Warehousing today does not have such a structured or pre-defined normalization for data modeling. It is also apparent that it is no longer sufficient to have a haphazard normalization effort for an
enterprise data warehousing architecture. Inconsistencies in modeling techniques lead to maintenance intensive implementations.

The Data Vault is a defined normalization of data modeling for data warehouses. Its strength lies in the structure and usage from which the model is built. It utilizes some of the following data
modeling techniques: many to many relationships, referential integrity, minimally redundant data sets and business function keyed information hubs. These techniques make the Data Vault data model
flexible, expandable and consistent. The approach to building a Data Vault data model is iterative, which provides a platform for data architects and business users to construct enterprise data
warehouses in a component-based fashion (see Bill Inmons’ article: Data Mart Does Not Equal Data Warehouse, DMReview.com)



## 3.0 The Data Vault Components

In order to keep the design simple, yet elegant, there are a minimum number of components, specifically the Hub, Link and Satellite Entities. The Data Vault design is focused around the functional
areas of business with the Hub representing the primary key. The Link Entities provide transaction integration between the Hubs. The Satellite Entities provide the context of the Hub primary key.
Each entity is designed to provide maximum flexibility and scalability while retaining most of the traditional skill sets of data modeling expertise.



### 3.1 Hub Entities

Hub Entities, or Hubs, are a single table carrying at a minimum a unique list of business keys. These are the keys that the businesses utilize in every day operations. For example, invoice number,
employee number, customer number, part number and VIN (Vehicle Identification Number). If the business were to lose the key they would lose the reference to the context, or surrounding information.
Other attributes in the Hub include:

- Surrogate Key – Optional component, possibly a smart key or a sequential number.
- Load Date Time Stamp – recording when the key itself first arrived in the warehouse.
- Record Source – A recording of the source system utilized for data traceability.

For example, the requirement is to capture customer number across the company. Accounting may have a customer number (12345) represented in a numeric style and contracts may have the same customer
number prefixed with an alpha (AC12345). In this case, the representation of the customer number in the Hub would be alphanumeric and set to the maximum length to hold all of the customer numbers
from both functional areas of business. The Hub would have two entries: 12345 and AC12345, each would have their own record source – one from accounting and one from contracts. The obvious
preference is to perform cleansing and matching on these numbers to integrate them together. However that topic is out of scope for this paper. The Hubs’ primary key always migrates outward
from the Hub. Once the business is correctly identified through keys (say customer and account) the Link Entities can be constructed.



### 3.2 Link Entities

Link Entities or Links, are a physical representation of a many-to-many 3NF relationship. The Link represents the relationship or transaction between two or more business components (two or more
business keys). It is instantiated (physically) in the logical model in order to add attributes and surround the transaction with context (this is discussed in the Satellite Entity description
next). The Link contains the following attributes:

- Surrogate Key – Optional component, possibly a smart key or a sequential number. Only utilized if there are more than two Hubs through this Link, or the composite primary key might cause
  performance problems.
- Hub 1 Key to Hub N Key – Hub Keys migrated into the Link to represent the composite key or relationship between two Hubs.
- Load Date Time Stamp – recording when the relationship/transaction was first created in the warehouse.
- Record Source – A recording of the source system utilized for data traceability.

This is an adaptation of a many-to-many relationship in 3NF in order to solve the problems related to scalability and flexibility. This modeling technique is designed for data warehouses, not for
OLTP systems. The application loading the warehouse must undertake the responsibility of enforcing one-to-many relationships if that is the desired result. Please note that some of the foundational
rules for data modeling with the Data Vault will be listed at the end of this document. With just a series of Hubs and Links, the data model will begin to describe the business flow. The next
component is to understand the context around when, why, what, where and who constructed both the transaction and the keys themselves. For example, it is not enough to know what a VIN number is for
a vehicle, or that there is a driver number 5 out there somewhere. The customer is looking to know what the VIN represents (i.e. a blue Toyota pickup, 4WD, etc.) and that driver number 5 represents
the name Jane and then they may want to know that Jane is the driver of this particular VIN.



### 3.3 Satellite Entities

Satellite Entities or Satellites, are Hub key context (descriptive) information. All of its information is subject to change over time; therefore the structure must be capable of storing new or
altered data at the granular level. The VIN number should not change, but if a wrecking crew rebuilds the Toyota – chops the top and adds a roll bar, it may not be a pickup anymore. What if
Jane sells the car to someone else, say driver number 6? The Satellite is comprised of the following attributes:

- Satellite Primary Key: Hub or Link Primary Key – migrated into the Satellite from the Hub or Link.
- Satellite Primary Key: Load Date Time Stamp – recording when the context information is available in the warehouse (the new row is always inserted).
- Satellite Optional Primary Key: Sequence Surrogate Number – utilized for Satellites that have multiple values (such as a billing and home address), or line item numbers, used to keep the
  Satellites sub-grouped and in order.
- Record Source – A recording of the source system utilized for data traceability.

The Satellite is most closely related to a Type 2 dimension as defined by Ralph Kimball. It stores deltas at a granular level; its function is to provide context around the Hub key. For example,
the fact that VIN 1234567 represents a blue Toyota truck today and a red Toyota truck tomorrow. Color may be a Satellite for automobile. Its design relies on the mathematical principles surrounding
reduction of data redundancy and rate of change. For instance, if the automobile is a rental, the dates of availability / rented might change daily which is much faster than the rate of change for
color, tires or owner. The issue that the Satellite solves is defined as follows:

An Automobile dimension may contain 160+ attributes; if the color or tires change then all 160+ attributes must be replicated into a new row (if utilizing a Type 2 dimension). Why replicate data
when the rest of the attributes are changing at slower rates of change? If utilizing a Type 1 or Type 3 dimension it is possible to lose partial or complete historical trails. In this case the data
modeler should construct at a minimum two Satellites: dates of availability and maintenance/parts. If the customer who rents the auto the first day is Dan and the second day is Jane, then it is the
Links’ responsibility to represent the relationship. The data modeler might attach one or more Satellites on the Link representing dates rented (from/to), condition of vehicle and comments
made by the renter.



### 3.4 Building a Data Vault

The Data Vault should be built as follows:

1. Model the Hubs. This requires an understanding of business keys and their usage across the designated scope.
2. Model the Links. Forming the relationships between the keys – formulating an understanding of how the business operates today in context to each business key.
3. Model the Satellites. Providing context to each of the business keys as well as the transactions (Links) that connect the Hubs together. This begins to provide the complete picture of the
   business.
4. Model the point-in-time tables. This is a Satellite derivative, of which the structure and definition is outside the scope of this document (due to space constraints).

There are methods for representing external sources such as flat files, excel feeds and user defined tab delimited files – due to time and space constraints, these items will not be discussed
here. No matter what type of source, all the structures and modeling techniques apply.

Reference rules for Data Vaults:

1. Hub keys cannot migrate into other Hubs (no parent/child like Hubs). To model in this manner breaks the flexibility and extensibility of the Data Vault modeling technique.
2. Hubs must be connected through Links.
3. More than two Hubs can be connected through Links.
4. Links can be connected to other Links.
5. Links must have at least two Hubs associated with them in order to be instantiated.
6. Surrogate keys may be utilized for Hubs and Links.
7. Surrogate keys may not be utilized for Satellites.
8. Hub keys always migrate outward.
9. Hub business keys never change, Hubs primary keys never change.
10. Satellites may be connected to Hubs or Links.
11. Satellites always contain either a load date-time stamp, or a numeric reference to a stand-alone load date-time stamp sequence table.
12. Stand-alone tables such as calendars, time, code and description tables may be utilized.
13. Links may have a surrogate key.
14. If a hub has two or more satellites, a point-in-time table may be constructed for ease of joins.
15. Satellites are always delta driven, duplicate rows should not appear.
16. Data is separated into Satellite structures based on: 1) type of information 2) rate of change.

These simple components Hub, Link and Satellite combine to form a Data Vault. A Data Vault can be as small as a single Hub with one Satellite, or as large as the scope permits. The scope can always
be modified at a later date and scalability is not an issue (nor is granularity of the information). A data modeler can convert small components of their existing data warehouse model to a Data
Vault architecture one piece at a time. This is because the changes are isolated to the Hub and Satellites. The business (how functional areas of business interact) is represented by the Links. In
this manner the Links can be end-dated, rebuilt, revised and so on.



## 4.0 Solving the Pain of Data Warehouse Architectures

3NF and star schema when used for enterprise data warehousing may cause pain to the business because they were not built originally for this purpose. There are issues surrounding scalability,
flexibility and granularity of data, integration and volume. The volume of information that warehouses are required to store today is exponentially increasing every year. CRM, SCM, ERP and all the
other large systems are forcing volumes of information to be fed to the warehouses. The current data models based on 3NF or star schema are proving difficult to modify, maintain and query, let
alone backup and restore.

In the example previously provided, if the scope is to warehouse vehicle data and their corresponding attributes over time – that is a single Data Vault comprised of a single Hub with a few
Satellites. A year later if the business wants to warehouse contracts with that vehicle, Hubs and Links can be added easily. No worries about granularity. This type of model extends upward and
outward (bottom-up implementation, top-down architecture). The end result is always foundationally strong and can be delivered with an iterative development approach.

Another example is the power of the Link Entity. Suppose a company sells products today, has a product Hub, an invoice Hub and a Link between the two. Then the company decides to sell services. The
data model can establish a new services Hub, end date the entire set of product Links and start a new Link between services and invoices. No data is lost and all data going back over time is
preserved – matching the business change. This is only one of many different possibilities for handling this situation.

Volume causes query issues, particularly with the structures of star schema but not so much with 3NF. Volume is breaking queries that are after the information in conformed dimensions and conformed
fact tables. Partitioning is often required and the structures are continually reworked to provide additional granularity to the business users. This promotes a management and maintenance
nightmare. Reloading an ever-changing star is difficult – let alone attempting to perform this with volume (upwards of 1 Terabyte for instance). The Data Vault is rooted in the fundamentals
of mathematics that are squarely behind the normalized data model. Reduction of redundancy and accounting for rates of change among data sets contribute to increased performance and easier
maintenance. The Data Vault architecture is not limited to fitting on a single platform. The architecture allows for a distributed yet inter-linked set of information.

Data warehouses must frequently deal with the statement: what I (the user) will give you won’t ever come from the source system. Then they proceed to provide a spreadsheet with their daily
maintained interpretation of the information. In other words: I (the customer) want to see all VIN numbers that start with X rolled up under label BIG TRUCKS. What the Data Vault provides for this
is called a User Grouping Set. It’s another Hub (label Big Trucks) with a Satellite describing which VIN numbers roll under this label and a Link to the VIN numbers themselves. In this
manner, the original data from the source system are preserved while the query tools can view the information in a manner appropriate to the users needs. When all is said and done a data warehouse
is successful if it meets the users’ needs.



## 5.0 The Foundations of the Data Vault Architecture

The architecture is rooted in the mathematics of reduction of redundancy. The Satellites are setup to store only the delta’s or changes to the information within. If a single satellite begins
to grow to quickly, it is very easy to create two new satellites and run a delta splitter process; a process that will split the information into the two new satellites, each process running
another delta process before inserting the new rows. This process can keep the rates of duplication of columnar data down to a minimum. It equates to utilizing less storage. Satellites by nature
can be very long, and in most cases are geared to be narrow (not many columns). In comparison, type 2 dimensions may replicate data across many columns, making copies of information over and over
again as well as generating new keys.

The Hubs store a single instance of the business key. The business keys most often have a very low propensity relative to change. Because of this, surrogate keys mapped to business keys (if
surrogates are utilized) are a 1 to 1 mapping and never change. The primary key of the hub (regardless of the type – business or surrogate) is the only component of information replicated
across the Satellites and links. Because of this the Satellites are always tied directly to the business key. In this manner Satellites are relegated to describing the business key at the most
granular level available. This provides a basis for “context” about a business key to be developed.

Another unique result of the Data Vault is the ability to represent relationships, dynamically. Relationships are founded in a Link structure the first time the business keys are
“associated” in incoming source data. This relationship exists until it’s either end-dated (in a Satellite), or deleted from the data set completely. The fact that this
relationship is represented in this manner opens up new possibilities in the area of dynamic relationship building. If new relationships between two hubs (or their context) are discovered as a
result of data mining, new links can be formed automatically.

Likewise, Link structures and information can be end-dated or deleted at the time when they are no longer relevant. For example: a company is selling products today, and has a link table between
products and invoices. Tomorrow, they begin selling services. It may be as simple as constructing a service hub, and a link between invoices and services – then end-dating all the
relationships between the products and invoices. In this example, the process of changing the data model can begin to be programmatically explored. Which if automated, would dynamically change and
adapt the structure of the data warehouse to meet the needs of the business users.

Rates of change and reduction of redundancy along with the flexibility of potentially unlimited dynamic relationship alteration form a powerful foundation. These items open doors in the application
of the Data Vault structures to many different purposes.



## 6.0 Possible Applications of the Data Vault

As a result of the foundations, many different applications of the Data Vault may be considered. A few of these are already in the throws of development. A small list of these possibilities is
below:

- Dynamic Data Warehousing – based on dynamic automated changes made to both process and structure within the warehouse.
- Exploration Warehousing – allowing users to play with the structures of the data warehouse without losing the content.
- In-Database Data Mining – allowing the data mining tools to make use of the historical data, and to better fit the form (structure) with the function of data mining / artificial
  intelligence.
- Rapid Linking of External Information – An ability to rapidly link and adapt structures to bring in external information and make sense of it within the data warehouse without destroying
  existing content.

*The business of Data warehousing is evolving–it must move in order to survive. The architecture and foundations behind what data warehousing means will continue to change. The Data Vaultovercomes most of the problems and limitations of the past and stands ready to meet the challenges of the future. If you are interested in more information please contact me at: dlinstedt@coreintegration.com, or through regular mail at: Core Integration Partners, 455 Sherman St,Suite 207, Denver, CO USA, 80203. Or you may also check out our web site at: www.coreintegration.com Thank-you.*

*© Copyright 2002-2003, Core Integration Partners, All Rights Reserved. Unless otherwise indicated, all materials are the property of Core Integration Partners, Inc. No part of thisdocument may be reproduced in any form, or by any means, without written permission from Core Integration Partners, Inc.*