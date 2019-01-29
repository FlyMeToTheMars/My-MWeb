# Data Vault Series 3 – End Dates and Basic Joins

Posted on [April 1, 2003](http://tdan.com/data-vault-series-3-end-dates-and-basic-joins/5067) by [Dan Linstedt](http://tdan.com/author/Dan-Linstedt) with [1 Comment](http://tdan.com/data-vault-series-3-end-dates-and-basic-joins/5067#disqus_thread)

*Published in TDAN.com April 2003*



There is a new home for the Data Vault: [http://www.danlinstedt.com](http://www.danlinstedt.com/)

*Articles from this series – Series 1 – Series 2 – Series 3 – Series 4 – Series 5*




Abstract

*The purpose of this paper is to present and discuss a patent-pending technique called a Data Vault™ – the next evolution in data modeling for enterprise data warehousing. This isthe third paper in a series of papers that will be published on a Data Vault. This paper explores the Data Vault example from Series 2 and extends the concepts of end-dating and some introductionto join techniques. This discussion also wraps in the Data Vault architectures’ ability to handle near real-time (as defined on the 1 to 20 second level). The next series will focus on Linktables with additional join techniques. Upcoming series will discuss topics such as inserting, updating, deleting, handling facts, aggregates, near real-time and batch. We begin to cover some ofthe query aspects of the DV in this paper, along with some of the logic to manage the data within. It is recommended you be familiar with the Data Vault concept, and read the previous two papersright here on http://www.tdan.com*.



## 1.0 Introduction

The purpose of this paper is to present and discuss a patent-pending technique called a Data Vault™ – the next evolution in data modeling for enterprise data warehousing. The audience
of this paper should be the data modelers who wish to construct a Data Vault data model or any data warehousing / BI specialist interested in querying a Data Vault model. Here we focus on two
different, yet related topics: understanding load dates, end-dates, and an introduction join operations. Joining data can be a challenge with the DV technique, and done properly can be done very
efficiently. The next series will cover joins in more detail such as joining with Link tables, Link table Satellites, along with additional query techniques. The topics in this paper are as
follows:

- End-Date Styles.
- Introduction to Join Operations. (embedded through-out the document)
- Summary and Conclusions.

Several of the objectives that you may learn from this paper are:

- How to model different end-date requirements.
- How to model for a near zero latency time requirement.
- Handling different queries against Satellites and Hub Structures.
- How to prepare for querying the DV structure (join capabilities).

Some of the largest tasks in the modeling aspects of a warehouse include: architecting for volume (terabytes), establishing load and recovery standards, establishing synchronicity across content,
querying time-based information, and setting the model up to allow near real-time loading. The data architect or modeler is left to find a way to build this functionality into the model. The Data
Vault architecture provides structural components that meet the above listed aspects. While each of these aspects are covered in a high-level descriptive form – the focus of this document
remains on end-dating and introduction to join techniques.

End dating can be dealt with in two forms (from a DV perspective)

1. Point-In-Time tables (system of record / snapshot / picture tables).
2. End-dates buried in the satellites.
3. Combination approach of the above two methods.

The first method is covered in series 1 of these papers. The second method is introduced in series 2 – and can be very effective in alleviating pressure on queries to do the underlying join
work. The third method will be introduced and discussed in relation to near real-time loading. Each method has its benefits and drawbacks in relation to loading/updating and querying (joining)
data.

Please keep in mind that near real-time loading is a function of the architecture and modeling technique. It is NOT a function of having or not having a PIT (point-in-time) table. In other words a
Data Vault data model is capable of handling near real-time loads with just the Hubs, Links, and Satellites. The PIT table is a specialized Satellite derivative.



## 2.0 End-Date Styles

The first end-date style is to put load dates or observation dates in the satellites, and assume that the information is valid until a new record appears. Thus the time span between the load-dates
is essentially the effective period for the information itself. The second style for end-dates is to put observation start dates (load start dates), and observation end-dates (load end dates) into
each row in the satellite. The third method is to be utilized when the disk space is available – most often used for near real-time feeds, but can be very effective technique for batch feeds
as well. Each method works but has its respective pros and cons discussed below.

Synchronization of the date-time stamps, and having these date-time stamps system driven helps surmount the problems across geographically split Data Vaults. In fact it often makes it easier. The
time stamp also works magic in another way – it provides a starting foundation for what is called dual-entry dating. We took GAAP (generally accepted accounting principles) and it’s
definition of dual-entry items for general ledger, and re-applied it to date logic in the warehouse. This also helps us with an accounting view of the granular information – only from a time
driven perspective. Remember, the Data Vault is geared for mass-insert (based on deltas only). It is not geared for updates or deletes (we’ll discuss these in another series) unless there is
a data problem – or a problem with the source feeds.



### 2.1 Load Dates with Point-In Time Structures.

As discussed in Series 1 of the Data Vault Satellite structures the first elective style is to put load-dates in the primary key of each of the satellites. Since the function of the satellite is to
store delta information only, each row is effective until the next delta row appears. The difference between the start dates of two rows in the satellites can be computed and figured as the
effective life-span of the information.


*Why use “Load Dates”? Can’t I use the data driven dates?*

Load Dates or Observation Start Dates must be put in place to keep all data arriving in the warehouse on a consistent time-line. Without utilizing dates when the information appears in the
warehouse, items like restoring, backing out, deleting or rolling off old data become difficult if not impossible. That’s not the only reason. The end-user queries prefer to setup a time
AS-OF picture on which to pull data. This AS-OF date must be synchronous across all data within the warehouse. Without keeping the data synchronized by a structured or pre-defined date the
information becomes invalid on an AS-OF query.


*What if my source system(s) have date-created / date-updated, can’t I use that?*

It is not recommended however if it must be used, so be it. This is typically not an option because most of the source systems that span the enterprise do not contain create-dates or update-dates,
and even if they do, they typically don’t carry those create dates back into history. A single consistent date/time-stamping method must be developed. It is absolutely imperative that all
rows are stamped by a single standard AS-OF date.


*If I have multiple Data Vaults around the world (different time zones), does this mean I must synchronize the server clocks?*

It is not a requirement because normally conversion across time zones can always be done according to Greenwich Mean Time (GMT) when integrating data across different Data Vaults. However it can be
helpful to synchronize all the server clocks to GMT standard +x to be kept accurate in the load stamping of records. In fact once the clocks are synchronized it becomes much easier to integrate
information across geographically spread Data Vaults without a time-based problem. What happens to pull the data together is the definition of the query or the procedure, which populates the data
marts or serves the BI tools.


*Ok, so now I understand why a load-date is needed, how does it work?*

This method can be easy to load and can cause problems for queries. In order to get the latest row AS OF a particular date, a query without a Point-in-time (PIT) structure must have nested
sub-queries. Note: we utilize the terms PIT (point in time), PIC (picture table), and SOR (system of record) synonymously. Below is a sample Satellite with rows. It is abbreviated for sake of
documentation.

![img](http://tdan.com/wp-content/uploads/2015/07/i024hy0201.jpg)

*Figure 2-1 Customer Name Hub and Satellite*

In order to query this satellite without a PIT table, the query might look as follows: (AS OF: December 1st 2000)

Select * from HUB_CUST, SAT_CUST_NAME scst
Where hub_cust.CSID = scst.CSID
And scst.load_dts <=
(select max(z.LOAD_DTS) from SAT_CUST_NAME z
where scst.CSID = z.CSID
and z.LOAD_DTS <= ’12-1-2000 23:59:59’)

There is still a flaw with this query. If no rows exist for customer name, and a date is given that is EARLIER than the first row made for that customer, an equal-join will return no results. Even
if the join includes other Satellites like address. For instance, if we change the query date to (AS-OF) 10-1-2000, we will get NO ROWS, no matter how many Satellites we join in. This problem and
its solution will be discussed in the join section of this document.

This query will pull ALL current names for ALL Customers as of December 1st, 2000. The problem isn’t with each individual satellite. Each individual satellite (when after the details as of a
point in time) requires the same type of nested sub-query. This is challenging in at least two major areas: 1) the number of tables in this query is two, one for the outer-query, one for the
sub-select. The max number of tables for some query engines is 16 and 2) the join capability within a single table. This kind of select can cause a table scan if not properly indexed.

The loads are very simplistic from this point of view. We run a delta comparison of the “latest picture” of a particular row (given a specific key), and if there are any differences, we
insert the new row. No updates, no deletes necessary. However the querying can be challenging. What we’ve introduced to help with this style of query is called a point-in-time table (or
system of record table). It looks as follows:

![img](http://tdan.com/wp-content/uploads/2015/07/i024hy0202.jpg)

*Figure 2-2 Customer Hub, Name Satellite and Point-In-Time Table*

The point-in-time table allows us to keep an accurate depiction of ALL the changes that went on at the satellite or historical level. The business rules will dictate when the snapshot of currency
is to be made, and a process will be responsible for updating the PIT table. In this case, it tracks both name and address changes. Of course this is all independent of the arrival time of
information within each satellite. This allows the satellites to be loaded in near real-time, and completely within referential integrity constraints, but without impact to a) the query system- the
data marts b) the dependency chain (downstream dependencies, parent-child relationships) or c) the load frequency timing of each satellite. In other words, names can change every 15 minutes, while
the addresses can change once a day.

The point-in-time table (PIT) allows us to join to a single table, picking a point-in-time as a system of record, then direct joining across the satellites. The SQL code changes to this:

Select hub.cust_num, sat_1.name,sat_2.address
from HUB_CUST hub, SAT_CUST_PIT sat_pit, SAT_CUST_NAME sat_1,SAT_CUST_ADDR sat_2
where hub.CSID = sat_pit.CSID and hub.CSID = sat_1.CSID and hub.CSID = sat_2.CSID and
sat_pit.NAME_LOAD_DTS = sat_1.LOAD_DTS
and sat_pit.ADDRESS_LOAD_DTS = sat_2.LOAD_DTS
and sat_pit.load_dts <=
(select max(z.LOAD_DTS) from SAT_CUST_PIT z where sat_pit.CSID = z.CSID and z.LOAD_DTS <= ’12-1-2000 23:59:59’)

Again, we have a fundamental date problem – if the date specified (AS-OF) is too early, we will return no rows for that customer ID. The other problem is: what if the customer has no entries
in the address Satellite at all? Then that customer will also be left out of this join completely. We will discuss this problem and its’ solution in the join section of this document.

Now, we’ve got a count of 5 tables being joined – but only one table draws the line in the sand for the indicated time frame. In other words, go after the PIT table for a particular
point-in-time, then equal-join across all the other satellites surrounding the hub. This works best if there are two or more satellites attached to the hub or the link table structures.
Here’s what the query would look like if we had only two satellites with no PIT table:

Select hub.cust_num, sat_1.name,sat_2.address
from HUB_CUST hub, SAT_CUST_NAME sat_1,SAT_CUST_ADDR sat_2
where hub.CSID = sat_pit.CSID and hub.CSID = sat_1.CSID and hub.CSID = sat_2.CSID and sat_1.LOAD_DTS <=
(select max(z.LOAD_DTS) from SAT_CUST_NAME z where sat_1.CSID = z.CSID and z.LOAD_DTS <= ’12-1-2000 23:59:59’)
AND sat_2.LOAD_DTS <=
(select max(z.LOAD_DTS) from SAT_CUST_ADDR z where sat_2.CSID = z.CSID and z.LOAD_DTS <= ’12-1-2000 23:59:59’)

In this case, we have two nested sub-queries, and five total tables in the query. The problem really shows its head when the model begins to have three or four satellites. Then there are a greater
number of tables referenced with a lot of work in nested sub-queries.

What happens in these nested sub-queries? From an academic standpoint, an index match by key, followed by an index scan to find the maximum load-date. Of course this depends on how the indexes are
setup, and if the satellites have been clustered by key or not. The point is, a single sub-query with equal-joins is usually less costly than multiple nested sub-queries with range joins. This is
just one of two styles that naturally fit the Data Vault architecture. To recap: having a PIT table helps reduce nested sub-query and join work IF there are 2 or more Satellites around a single
hub. Utilizing style 1 means no end dating of rows and no use of between clauses in the SQL selects. It does mean that the rows are active until the next picture (delta) is inserted.


*What else can the PIT table provide?*

The PIT table can provide the following:

- Rate of change history without scanning any of the Satellites.
- Time-span deltas between changes for each specific Satellite
- Control over equal-join to Satellites
- Backup and restore or updated date stamping (if desired, can be extended to contain these items).

There isn’t much else to this particular style except to say that it utilizes a system generated time-stamp. It is not recommended to utilize a created-date coming from the source system. Of
course that leaves the question: how and where should the informational (data) driven dates be stored? Which is addressed later in this article.



### 2.2 Load Start Dates, Load End Dates.

If the above style doesn’t fit the requirements of the warehouse then this style may fit the paradigm a little better. In this case, there is no room for PIT tables, or the extra work in
Queries. Sometimes the implementation team can take the hit to develop slightly more complex load processes. When this is an option, then this second style may be a better fit for the project.
Those interested in Active or Real Time Data Warehousing may have heard the terms: Observation Start Date, Observation End Date. This article considers these two terms to be equivalent with Load
Start Dates and Load End Dates.


*So what does this type of architecture look like?*

![img](http://tdan.com/wp-content/uploads/2015/07/i024hy0203.jpg)

*Figure 2-3 Customer Hub, Name and Address Satellite – End-Dates*

 

** NOTE: The record source has been left off the Satellites for screen real estate.
Proceed as if they have been provided.

In this particular context, the Load Start Date (LOAD_DTS) and the Load End Date (LOAD_END_DTS) is provided. With this style, the end-date is not populated until the next new delta arrives. This
allows the queries to pull information that’s relevant to an AS-OF date. The loading becomes slightly more complex, as the most recent record must be updated in place (from a systematic point
of view) to end-date it. The record may also be future-dated if this is the desired practice, although this author does not recommend it.


*What does the query look like?*

Select hub.cust_num, sat_1.name,sat_2.address
from HUB_CUST hub, SAT_CUST_NAME sat_1,SAT_CUST_ADDR sat_2
where hub.CSID = sat_1.CSID and hub.CSID = sat_2.CSID
and ‘12-1-2000 23:59:59’ between sat_1.LOAD_DTS and sat_1.LOAD_END_DTS
and ‘12-1-2000 23:59:59’ between sat_2.LOAD_DTS and sat_2.LOAD_END_DTS

A much simplified query. Of course there are still two problems with this query:

1. It doesn’t deal with NULL LOAD_END_DATES
2. It doesn’t deal with a non-existent satellite record PRIOR to the date given.

These problems and their potential solutions are also discussed in the join section of this document.

Notice that the query is fast, efficient and based on primary key – always index on primary key. This is because each Satellite’s PK is based on the CSID and the load_date fields. These
are both utilized effectively in exact matches within the where clause. Because the date is a constant – it can be matched directly to key entries.


*What does this mean for indexing strategies?*

Indexing strategies will be discussed in a future document. However a basic idea is to index both the primary key and the load_end_date as a secondary index, in the same order as the PK index of
course. Again, indexing strategies will be covered in the near future.

In summary, this approach gains easier queries and potentially faster queries. However it may complicate the load cycle. The author is biased towards the next and final approach (style) given
volume situations that can be coupled with near real-time requirements. That is to say the definition of near real-time within this document is meant to be latency of data arrival between 1 and 20
seconds.



### 2.3 Combined approach, end-dating with a PIT table.

This is a hybrid approach. It is both styles applied to the data model architecture at the same time. There is a twist: the PIT table is no longer time-resident. In other words, it becomes a
full-refresh satellite that is rebuilt with every load. Of course, this is one option. Should there be a desire (due to volume concerns) to simply update the existing PIT row – that would be
an acceptable alternative to rebuilding the entire table.

The PIT table in essence is utilized to track only the current or most recent (not yet end-dated) row in each of the satellites. Under this guise, the inserts of the new row can take place with a
NULL LOAD_END_DATE, and the update of the most recent row can be quite fast and easy. It’s a query or run-through of all the rows in the PIT table, updating the LOAD_END_DATE with the most
recent LOAD_DATE, then a refresh of the PIT table following the load.

The function of the PIT table has not yet been discussed from the query angle. It brings to the table several benefits: 1) synchronicity of the data 2) end-user visibility to the particular
“fresh data” can be timed and released on a specific time-basis 3) it isolates end-user queries from the underlying near real-time or batch data changes. When utilized in a historical
fashion it is much more beneficial to achieving these goals. When used in a complete refresh fashion (as indicated in this hybrid approach), then a new PIT table should be built, the view changed,
and then the old PIT table is dropped from site. This keeps consistency of data across the warehouse.


*Why offer a combined approach?*

A single approach is often not the best or only method to make the model work for the project and not against it. In this case the architecture shows its flexibility. Also for those with enough
disk space or horsepower this may actually be a beneficial component. What does this look like?

![img](http://tdan.com/wp-content/uploads/2015/07/i024hy0204.jpg)

 *Figure 2-4 End-Dates and Point-In-Time Table Combined Approach*

Note that the PIT tables’ LOAD_DTS is gone. This is for keeping only the most current record of the information in the satellites. If there is a desire to keep history in the PIT table using
this hybrid approach, then add the LOAD_DTS (load date) back into the primary key. The query itself to draw data out may change here in order to accommodate some of the problems mentioned earlier
(like early time-stamp requests or NULL end-dates, particularly if all that is wanted is the most recent record). Also note, there should always be an entry in the PIT table for every primary key
in the HUB, regardless of the decision to keep history in the PIT. The query may look as follows:

*** GET MOST RECENT / CURRENT DATA ONLY

Select hub.cust_num, sat_1.name,sat_2.address
from HUB_CUST hub, SAT_CUST_PIT pit,SAT_CUST_NAME sat_1,SAT_CUST_ADDR sat_2
where hub.CSID = sat_1.CSID
and hub.CSID = sat_2.CSID
and pit.NAME_LOAD_DTS = sat_1.LOAD_DTS
and pit.ADDRESS_LOAD_DTS = sat_2.LOAD_DTS

This query is a straight join with no sub-queries, and always pulls the most current information (current according to when the PIT table is updated). The point-in-time query (other than current)
would still require either sub-selects, between clauses, or a historical PIT table.



### 2.4 Query to a Satellite with no matching data.

As previously mentioned, there may be a need to look for the “earliest” data that exists. And in some cases, there may be no data in a Satellite for matching. In this case the queries
offered here do not return data. One of the fastest methods to correct this problem is by changing the query to incorporate an outside join. This isn’t always the best alternative; variations
on data placement will be introduced here, and discussed in detail in a later document.

Suppose we have Figure 2-1, and the date we want data for is: 10-05-2000. The original query appeared as follows:

Select * from HUB_CUST, SAT_CUST_NAME scst
Where hub_cust.CSID = scst.CSID
And scst.load_dts <=
(select max(z.LOAD_DTS) from SAT_CUST_NAME z
where scst.CSID = z.CSID
and z.LOAD_DTS <= ’12-1-2000 23:59:59’)

***\*** NEW QUERY**

Select * from HUB_CUST, SAT_CUST_NAME scst
Where hub_cust.CSID *= scst.CSID
And scst.load_dts =*
(select max(z.LOAD_DTS) from SAT_CUST_NAME z
where **z.CSID = hub_cust.CSID**
and z.LOAD_DTS <= ’10-05-2000 23:59:59’)

This will bring in all HUB rows that don’t have Satellite rows regardless of which satellites they match. If no satellite rows match the date constriction, the query will return NULL’s
for those hub keys. One of the issues here is the cost overhead of the sub-select max. Using a PIT table with history, the query would change as follows:

select * from
hub_cust a,
sat_cust_pit b,
sat_cust_name c,
sat_cust_addr d
where
a.csid = b.csid
and a.csid *= c.csid
and a.csid *= d.csid
and b.load_dts =
(select max(z.load_dts) from sat_cust_pit z
where a.csid = z.csid and z.load_dts <= ’10-11-2000′)
and c.load_dts =* b.name_load_dts
and d.load_dts =* b.addr_load_dts

If you want ALL the rows of history over ALL time, then the sub-select for b.LOAD_DTS is eliminated from the query. The one condition is that the PIT table must contain all customer ID’s that
exist in the hub. The outside join condition allows us to execute the query without forcing the existence of a row in the Satellite for every key. It’s a fast solution, and works very
well, even in load conditions.

Please note that in all situations, this is not necessarily “easy” logic for end-users. Hence we recommend that the intended use of a Data Vault be for data warehouses only –
non-accessible except to the technical business liaison (end-user) who has been trained on how to retrieve the data. Even then, the complexities of outside joins should be built into views by which
the end-user (even technical liaison) has access to.



## 3.0 Summary

The different types of end-dating styles allow for flexibility in the architecture under load and query paradigms. The hybrid approach captures the best of both worlds while allowing both
historical and non-historical capture to the PIT table. The join work is important to watch given the conditions and existence or non-existence of data across the Satellites. It is important to
chose the style and stick with it as a standard across all implementations of the Data Vault in the organization. Once the standard is established, then the architecture becomes universal –
as does the query access, loading, deleting, and updating.

As indicated above, build the complex queries into views. Nest the views if necessary. Build the views around hubs and their localized Satellites, Links and their localized Satellites. This will
keep the access to a minimum and tuned standard. Delineate between access to current data and access to historical – to keep the queries as fast as possible. When possible use NULLS in your
date fields, this will help capture the true nature of the data. The next series article will delve deep into Link tables, their joins, and their Satellites.

*© Copyright 2002-2003, Core Integration Partners, All Rights Reserved. Unless otherwise indicated, all materials are the property of Core Integration Partners, Inc. No part of thisdocument may be reproduced in any form, or by any means, without written permission from Core Integration Partners, Inc.*