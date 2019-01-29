# Data Vault初探（五） —— 定期装载_SQL

## 定期装载说明

1.定期装载的周期为每天一次。
2.每天装载自上次装载后的变化数据
3.建立源数据库的过渡表用于CDC
4.建立cdc_time表用于基于时间戳的CDC
5.因为源库上只有订单销售表有时间属性，所以除了sales_order和sales_order_item拉取变化数据外，其它表都整体拉取到过渡区。实际环境中建议在源表设计上应该有created和last_updated两个时间戳类型的字段。
6.下表汇总了源库各表的CDC方式

| **源数据库表**   | **过渡表**           | **抽取模式**      |
| ---------------- | -------------------- | ----------------- |
| city             | city_stg             | 整体、拉取        |
| province         | province_stg         | 整体、拉取        |
| customer         | customer_stg         | 整体、拉取        |
| product_catagory | product_catagory_stg | 整体、拉取        |
| product          | product_stg          | 整体、拉取        |
| sales_order      | sales_order_stg      | CDC（每天）、拉取 |
| sales_order_item | sales_order_item_stg | CDC（每天）、拉取 |

## 过渡区表和cdc_time表

使用下面的脚本建立过渡区表和cdc_time表。

```sql
CREATE TABLE province_stg (
  province_id varchar(2),
  province_name varchar(20)
) ;
 
CREATE TABLE product_catagory_stg (
  product_catagory_id varchar(2),
  product_catagory_name varchar(20)
) ;
 
CREATE TABLE city_stg (
  city_id varchar(4),
  city_name varchar(20),
  province_id varchar(2)
) ;
 
CREATE TABLE customer_stg (
  customer_id int(11),
  customer_name varchar(20),
  city_id varchar(4),
  cust_post_code varchar(6),
  cust_address varchar(50),
  ship_post_code varchar(6),
  ship_address varchar(50)
) ;
 
CREATE TABLE product_stg (
  product_id int(11),
  product_name varchar(20),
  unit_price decimal(10,4),
  product_catagory_id varchar(2)
) ;
 
CREATE TABLE sales_order_stg (
  sales_order_id int(11),
  order_time datetime,
  entry_time datetime,
  customer_id int(11),
  amount decimal(12,4),
  allocate_time datetime,
  packing_time datetime,
  ship_time datetime,
  receive_time datetime
) ;
 
CREATE TABLE sales_order_item_stg (
  sales_order_item_id int(11),
  sales_order_id int(11),
  product_id int(11),
  unit_price decimal(10,4),
  quantity int(11)
) ;
 
CREATE TABLE cdc_time
(
 last_load date,
 current_load date
);
 
-- 插入数据仓库开始日期
INSERT INTO cdc_time VALUES ('2015-03-01', '2015-03-01') ;
COMMIT ;

```



## insert触发器

sales_order_item表是基于sales_order.sales_order_id更新的。

为了避免对sales_order表的二次查询，希望在对sales_order做CDC时同时获取到sales_order_id用于后续的sales_order_item表的CDC。MySQL数据库本身没有提供类似于Oracle的returning这样的语法，所以用内存表+触发器的方式实现。

使用下面的脚本建立内存表和sales_order_stg表上的insert触发器。



```sql
USE dv;
 
-- 建立内存表
CREATE TABLE sales_order_stg_insert ENGINE MEMORY 
SELECT sales_order_id, entry_time, allocate_time, packing_time, ship_time, receive_time 
FROM sales_order_stg WHERE FALSE;
 
-- 建立insert触发器
DELIMITER // 
  
DROP TRIGGER tr_sales_order_stg_insert_after //  
CREATE  
    TRIGGER tr_sales_order_stg_insert_after AFTER INSERT ON sales_order_stg   
    FOR EACH ROW BEGIN  
      INSERT INTO sales_order_stg_insert 
	  VALUES (NEW.sales_order_id, 
			  NEW.entry_time, 
			  NEW.allocate_time, 
			  NEW.packing_time, 
			  NEW.ship_time, 
			  NEW.receive_time);  
    END;  
//  
 
DELIMITER ;

```



## sales_order表时间修改条件

sales_order表的几个时间字段可能修改，所以

新增订单的条件是：

`entry_time >= @last_load and entry_time < @current_load`

修改订单版本的条件是：

```SQL
entry_time < @last_load and (
    allocate_time >= @last_load and allocate_time < @current_load
or packing_time >= @last_load and packing_time < @current_load
or ship_time >= @last_load and ship_time < @current_load
or receive_time >= @last_load and receive_time < @current_load)
```
`sales_order_item`表只基于`sales_order.sales_order_id`的新增订单更新的。

使用下面的脚本进行每天定期装载。



```sql
use dv;
 
-- 设置附属表的截止时间和生效时间
SET @pre_date = SUBDATE(CURRENT_DATE,1) ;
-- 设置CDC的上限时间
update cdc_time set current_load = current_date ;
select @last_load:=last_load,@current_load:=current_load from cdc_time;
 
-- 装载过渡表
truncate table customer_stg;
truncate table city_stg;
truncate table province_stg;
truncate table product_stg;
truncate table product_catagory_stg;
truncate table sales_order_stg;
truncate table sales_order_item_stg;
truncate table sales_order_stg_insert;
 
insert into province_stg select * from province;
insert into city_stg select * from city;
insert into customer_stg select * from customer;
insert into product_catagory_stg select * from product_catagory;
insert into product_stg select * from product;
insert into sales_order_stg
select a.* from sales_order a
where entry_time >= @last_load and entry_time < @current_load
or (entry_time < @last_load and (allocate_time >= @last_load and allocate_time < @current_load
							 or packing_time >= @last_load and packing_time < @current_load
							 or ship_time >= @last_load and ship_time < @current_load
							 or receive_time >= @last_load and receive_time < @current_load));
insert into sales_order_item_stg
select a.* from sales_order_item a, sales_order_stg_insert b
where a.sales_order_id = b.sales_order_id
  and b.entry_time >= @last_load and b.entry_time < @current_load;
 
/*** 装载中心表 ***/
insert into hub_product_catagory (product_catagory_id,record_source)  
select a.product_catagory_id,'source.product_catagory' 
from product_catagory_stg a left join hub_product_catagory b on a.product_catagory_id = b.product_catagory_id
where b.product_catagory_id is null;  
 
insert into hub_customer (customer_id,record_source)  
select a.customer_id,'source.customer' 
from customer_stg a left join hub_customer b on a.customer_id = b.customer_id
where b.customer_id is null;  
 
insert into hub_product (product_id,record_source)  
select a.product_id,'source.product' 
from product_stg a left join hub_product b on a.product_id = b.product_id
where b.product_id is null;  
 
insert into hub_sales_order (sales_order_id,record_source)  
select sales_order_id,'source.sales_order' 
  from sales_order_stg 
 where entry_time >= @last_load and entry_time < @current_load; 
/*** 装载中心表 ***/
 
/*** 装载链接表 ***/
insert into link_order_customer (hub_sales_order_id,hub_customer_id,record_source)  
select hub_sales_order_id,hub_customer_id,'hub_sales_order,source.sales_order,hub_customer,source.customer'  
from hub_sales_order,sales_order_stg,hub_customer,customer_stg 
where hub_sales_order.sales_order_id = sales_order_stg.sales_order_id  
  and hub_customer.customer_id = customer_stg.customer_id  
  and sales_order_stg.customer_id = customer_stg.customer_id
  and sales_order_stg.entry_time >= @last_load and sales_order_stg.entry_time < @current_load;
 
insert into link_order_product (hub_sales_order_id,hub_product_id,record_source)  
select hub_sales_order_id,hub_product_id,'hub_sales_order,hub_product,source.sales_order_item'  
from hub_sales_order,hub_product,sales_order_item_stg
where hub_sales_order.sales_order_id = sales_order_item_stg.sales_order_id  
  and hub_product.product_id = sales_order_item_stg.product_id;  
 
insert into link_product_catagory (hub_product_id,hub_product_catagory_id,record_source)
select t1.hub_product_id hub_product_id, t1.hub_product_catagory_id hub_product_catagory_id,
'hub_product,product,hub_product_catagory' record_source
from 
(
select t2.hub_product_id hub_product_id, t3.hub_product_catagory_id hub_product_catagory_id
from product_stg t1, hub_product t2, hub_product_catagory t3
where t1.product_id = t2.product_id and t1.product_catagory_id = t3.product_catagory_id) t1
left join link_product_catagory t2 on t1.hub_product_id = t2.hub_product_id
where t2.hub_product_id is null;
 
/*** 装载链接表 ***/
 
/*** 装载附属表 ***/
-- 客户附属表
-- 修改老版本的截止日期
update hub_customer t1, sat_customer t2, 
(select customer_id,customer_name,city_name,province_name,cust_post_code,cust_address,ship_post_code,ship_address
from customer_stg t1,city_stg t2,province_stg t3
where t1.city_id = t2.city_id and t2.province_id = t3.province_id) t3
set t2.load_end_dts = @pre_date
where t1.hub_customer_id = t2.hub_customer_id
and t2.load_end_dts = '2200-01-01'
and t1.customer_id = t3.customer_id
and md5(concat(t2.customer_name,t2.city_name,t2.province_name,t2.cust_post_code,t2.cust_address,t2.ship_post_code,t2.ship_address))
<> 
md5(concat(t3.customer_name,t3.city_name,t3.province_name,t3.cust_post_code,t3.cust_address,t3.ship_post_code,t3.ship_address));
 
-- 新增版本
insert into sat_customer   
(hub_customer_id,  
load_end_dts,  
record_source,  
customer_name,  
city_name,  
province_name,  
cust_post_code,  
cust_address,  
ship_post_code,  
ship_address) 
select 
t1.hub_customer_id,  
'2200-01-01',  
'hub_customer,customer,city,province', 
t3.customer_name,  
t3.city_name,  
t3.province_name,  
t3.cust_post_code,  
t3.cust_address,  
t3.ship_post_code,  
t3.ship_address 
from 
hub_customer t1, sat_customer t2, 
(select customer_id,customer_name,city_name,province_name,cust_post_code,cust_address,ship_post_code,ship_address
from customer_stg t1,city_stg t2,province_stg t3
where t1.city_id = t2.city_id and t2.province_id = t3.province_id) t3
where t1.hub_customer_id = t2.hub_customer_id
and t1.customer_id = t3.customer_id
and md5(concat(t2.customer_name,t2.city_name,t2.province_name,t2.cust_post_code,t2.cust_address,t2.ship_post_code,t2.ship_address))
<> 
md5(concat(t3.customer_name,t3.city_name,t3.province_name,t3.cust_post_code,t3.cust_address,t3.ship_post_code,t3.ship_address))
and exists (select 1 from sat_customer where hub_customer_id = t1.hub_customer_id 
and load_end_dts = @pre_date)
and not exists (select 1 from sat_customer where hub_customer_id = t1.hub_customer_id 
and load_end_dts = '2200-01-01');
 
-- 新增记录
insert into sat_customer   
(hub_customer_id,  
load_end_dts,  
record_source,  
customer_name,  
city_name,  
province_name,  
cust_post_code,  
cust_address,  
ship_post_code,  
ship_address)  
select  
t1.hub_customer_id,  
'2200-01-01',  
'hub_customer,customer,city,province',  
t2.customer_name,  
t2.city_name,  
t2.province_name,  
t2.cust_post_code,  
t2.cust_address,  
t2.ship_post_code,  
t2.ship_address 
from 
(select hub_customer.hub_customer_id, hub_customer.customer_id 
from hub_customer left join sat_customer 
on hub_customer.hub_customer_id = sat_customer.hub_customer_id
where sat_customer.hub_customer_id is null) t1,
(select customer_id,customer_name,city_name,province_name,cust_post_code,cust_address,ship_post_code,ship_address
from customer_stg t1,city_stg t2,province_stg t3
where t1.city_id = t2.city_id and t2.province_id = t3.province_id) t2
where t1.customer_id = t2.customer_id ; 
 
-- 订单_产品附属表
-- 新增记录
insert into sat_order_product   
(link_order_product_id,  
load_end_dts,  
record_source,  
unit_price,  
quantity  
)  
select   
t1.link_order_product_id,  
'2200-01-01',  
'link_order_product,hub_sales_order,hub_product,sales_order_item',  
t4.unit_price,  
t4.quantity  
from link_order_product t1,hub_sales_order t2,hub_product t3,sales_order_item_stg t4 
where t1.hub_sales_order_id = t2.hub_sales_order_id  
  and t1.hub_product_id = t3.hub_product_id  
  and t4.sales_order_id = t2.sales_order_id  
  and t4.product_id = t3.product_id;
 
-- 产品附属表
-- 修改老版本的截止日期
update hub_product t1, sat_product t2, product_stg t3
set t2.load_end_dts = @pre_date
where t1.hub_product_id = t2.hub_product_id
and t2.load_end_dts = '2200-01-01'
and t1.product_id = t3.product_id
and md5(concat(t2.product_name,convert(t2.unit_price,char)))
<> 
md5(concat(t3.product_name,convert(t3.unit_price,char)));
 
-- 新增版本
insert into sat_product 
(hub_product_id,  
load_end_dts,  
record_source,  
product_name,  
unit_price  
)  
select 
t1.hub_product_id,  
'2200-01-01',  
'hub_product,product', 
t3.product_name,  
t3.unit_price
from 
hub_product t1, sat_product t2, product_stg t3
where t1.hub_product_id = t2.hub_product_id
and t1.product_id = t3.product_id
and md5(concat(t2.product_name,convert(t2.unit_price,char)))
<> 
md5(concat(t3.product_name,convert(t3.unit_price,char)))
and exists (select 1 from sat_product where hub_product_id = t1.hub_product_id 
and load_end_dts = @pre_date)
and not exists (select 1 from sat_product where hub_product_id = t1.hub_product_id 
and load_end_dts = '2200-01-01');
 
-- 新增记录
insert into sat_product  
(hub_product_id,  
load_end_dts,  
record_source,  
product_name,  
unit_price  
)  
select  
t1.hub_product_id,  
'2200-01-01',  
'hub_product,product',  
t2.product_name,  
t2.unit_price
from 
(select hub_product.hub_product_id, hub_product.product_id 
from hub_product left join sat_product 
on hub_product.hub_product_id = sat_product.hub_product_id
where sat_product.hub_product_id is null) t1,
(
select product_id,product_name,unit_price 
from product_stg) t2
where t1.product_id = t2.product_id ; 
 
-- 产品类型附属表
-- 修改老版本的截止日期
update hub_product_catagory t1, sat_product_catagory t2, product_catagory_stg t3
set t2.load_end_dts = @pre_date
where t1.hub_product_catagory_id = t2.hub_product_catagory_id
and t2.load_end_dts = '2200-01-01'
and t1.product_catagory_id = t3.product_catagory_id
and t2.product_catagory_name <> t3.product_catagory_name;
 
-- 新增版本
insert into sat_product_catagory  
(hub_product_catagory_id,  
load_end_dts,  
record_source,  
product_catagory_name  
)   
select 
t1.hub_product_catagory_id,  
'2200-01-01',  
'hub_product_catagory,product_catagory',  
t3.product_catagory_name 
from 
hub_product_catagory t1, sat_product_catagory t2, product_catagory_stg t3
where t1.hub_product_catagory_id = t2.hub_product_catagory_id
and t1.product_catagory_id = t3.product_catagory_id
and t2.product_catagory_name <> t3.product_catagory_name
and exists (select 1 from sat_product_catagory where hub_product_catagory_id = t1.hub_product_catagory_id 
and load_end_dts = @pre_date)
and not exists (select 1 from sat_product_catagory where hub_product_catagory_id = t1.hub_product_catagory_id 
and load_end_dts = '2200-01-01');
 
-- 新增记录
insert into sat_product_catagory  
(hub_product_catagory_id,  
load_end_dts,  
record_source,  
product_catagory_name  
)  
select  
t1.hub_product_catagory_id,  
'2200-01-01',  
'hub_product_catagory,product_catagory', 
t2.product_catagory_name
from 
(select hub_product_catagory.hub_product_catagory_id, hub_product_catagory.product_catagory_id 
from hub_product_catagory left join sat_product_catagory 
on hub_product_catagory.hub_product_catagory_id = sat_product_catagory.hub_product_catagory_id
where sat_product_catagory.hub_product_catagory_id is null) t1,
(
select product_catagory_id,product_catagory_name
from product_catagory_stg) t2
where t1.product_catagory_id = t2.product_catagory_id ; 
 
-- 销售订单附属表
-- 修改老版本的截止日期
update hub_sales_order t1, sat_sales_order t2, sales_order_stg t3
set t2.load_end_dts = @pre_date
where t1.hub_sales_order_id = t2.hub_sales_order_id
and t2.load_end_dts = '2200-01-01'
and t1.sales_order_id = t3.sales_order_id
and 
(t3.entry_time < @last_load and (t3.allocate_time >= @last_load and t3.allocate_time < @current_load
							 or t3.packing_time >= @last_load and t3.packing_time < @current_load
							 or t3.ship_time >= @last_load and t3.ship_time < @current_load
							 or t3.receive_time >= @last_load and t3.receive_time < @current_load));
 
-- 新增版本
insert into sat_sales_order  
(hub_sales_order_id,  
load_end_dts,  
record_source,  
order_time,  
entry_time,  
amount,  
allocate_time,  
packing_time,  
ship_time,  
receive_time  
) 
select 
t1.hub_sales_order_id,  
'2200-01-01',  
'hub_sales_order,sales_order',  
t3.order_time,  
t3.entry_time,  
t3.amount,  
t3.allocate_time,  
t3.packing_time,  
t3.ship_time,  
t3.receive_time 
from 
hub_sales_order t1, sat_sales_order t2, sales_order_stg t3
where t1.hub_sales_order_id = t2.hub_sales_order_id
and t1.sales_order_id = t3.sales_order_id
and 
(t3.entry_time < @last_load and (t3.allocate_time >= @last_load and t3.allocate_time < @current_load
							 or t3.packing_time >= @last_load and t3.packing_time < @current_load
							 or t3.ship_time >= @last_load and t3.ship_time < @current_load
							 or t3.receive_time >= @last_load and t3.receive_time < @current_load))
and exists (select 1 from sat_sales_order where hub_sales_order_id = t1.hub_sales_order_id 
and load_end_dts = @pre_date)
and not exists (select 1 from sat_sales_order where hub_sales_order_id = t1.hub_sales_order_id 
and load_end_dts = '2200-01-01');
 
-- 新增记录
insert into sat_sales_order  
(hub_sales_order_id,  
load_end_dts,  
record_source,  
order_time,  
entry_time,  
amount,  
allocate_time,  
packing_time,  
ship_time,  
receive_time  
) 
select   
t1.hub_sales_order_id,  
'2200-01-01',  
'hub_sales_order,sales_order',  
t2.order_time,  
t2.entry_time,  
t2.amount,  
t2.allocate_time,  
t2.packing_time,  
t2.ship_time,  
t2.receive_time   
from hub_sales_order t1,sales_order_stg t2 
where t1.sales_order_id = t2.sales_order_id
  and t2.entry_time >= @last_load and t2.entry_time < @current_load;
 
-- 更新时间戳表的last_load字段
update cdc_time set last_load = current_load ;
 
commit ;

```