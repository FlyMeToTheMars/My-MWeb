## KPI

1. 运单总数

​    按委托方和区域展示运单总数=sum(订单数）

2. 订单总数

​    按应承运商显示订单总数=sum(订单数）

3. 任务到达准时率

​    按实承运商统计任任务达到率=[count(实际达到日期-计划达到日期)>1]/[任务总数]



## BusinessVault

### 键值关联

```sql
CREATE VIEW businessvault.corebiz AS
SELECT org.hoganizationhk,
       org.companyid,
       org.name,
       hw.hwaybillhk,
       hw.transportnr,
       lo.lorderhk,
       lo.hcarhk,
       loao.lordersassignorderhk,
       loao.hassignorderhk,
       hao.ordernr,
       laot.lassignordertaskhk,
       laot.htaskhk,
       t.tasknumber
FROM datavault.hubwaybill hw
LEFT OUTER JOIN datavault.linkorgwaybill low ON low.hwaybillhk = hw.hwaybillhk
LEFT OUTER JOIN datavault.huborganization org ON low.hoganizationhk=org.hoganizationhk
LEFT OUTER JOIN datavault.linkorder lo ON hw.hwaybillhk = lo.hwaybillhk
LEFT OUTER JOIN datavault.linkorderassignorder loao ON lo.lorderhk = loao.lorderhk
LEFT OUTER JOIN datavault.hubassignorder hao ON loao.hassignorderhk = hao.hassignorderhk
LEFT OUTER JOIN datavault.linkassignordertask laot ON hao.hassignorderhk = laot.hassignorderhk
LEFT OUTER JOIN datavault.hubtask t ON laot.htaskhk = t.htaskhk
```





## 运单总数

```SQL
SELECT nvl(concat(name,' . ',region),'Unknow')AS data_code,
       'sumwaybill'AS data_type,
       from_unixtime(cast(createdat/1000 AS bigint),"yyyy-MM-dd") AS data_time,
       count(DISTINCT transportnr) AS data_value
FROM businessvault.fact_orgwaybill
WHERE createdat IS NOT NULL
GROUP BY name,
         region,
         from_unixtime(cast(createdat/1000 AS bigint),"yyyy-MM-dd");
```

