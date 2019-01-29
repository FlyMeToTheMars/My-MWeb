# NiFi + Impala 集成应用

## 数据来源基础

> 参阅:
>
> [Mysql+NiFi+Kudu Demo](https://community.hortonworks.com/articles/144009/using-the-putkudu-processor-to-ingest-mysql-data-i.html)
>
> [MyPutKuduDemo](https://www.jianshu.com/p/2d7c53d7737a)

```
id,title,first_name,last_name,street,city,state,zip,gender,email,username,password,cell,ssn
1,miss,marlene,shaw,3450 w belt line rd,abilene,florida,31995,F,marlene.shaw75@example.com,goldenpanda70,naughty,(711)-565-2194,800-71-1872
2,ms,letitia,jordan,2974 mockingbird hill,irvine,new jersey,64361,F,letitia.jordan64@example.com,lazytiger614,aaaaa1,(724)-685-3472,548-93-7031
3,mr,todd,graham,5760 spring hill rd,garden grove,north carolina,81790,M,todd.graham39@example.com,purplekoala484,paintball,(186)-529-4912,362-31-5248
4,mr,seth,martinez,4377 fincher rd,chandler,south carolina,73651,M,seth.martinez82@example.com,bigbutterfly149,navy,(720)-778-8541,200-80-9087
5,mr,guy,mckinney,4524 hogan st,iowa park,ohio,24140,M,guy.mckinney53@example.com,blueduck623,office,(856)-764-9146,973-37-9077
6,ms,anna,smith,5047 cackson st,rancho cucamonga,pennsylvania,56486,F,anna.smith74@example.com,goldenfish121,albion,(485)-150-6348,680-20-6440
7,mr,johnny,johnson,7250 bruce st,gresham,new mexico,83973,M,johnny.johnson73@example.com,crazyduck127,toast,(991)-131-1582,683-26-4133
8,mrs,robin,white,7882 northaven rd,orlando,connecticut,40452,F,robin.white46@example.com,whitetiger371,elizabeth,(689)-468-6420,960-70-3399
9,miss,allison,williams,7648 edwards rd,edison,louisiana,52040,F,allison.williams82@example.com,beautifulfish354,sanfran,(550)-172-4018,164-78-8160

```

## DBCP Controller Service

| Property                    | Value                                 |
| --------------------------- | ------------------------------------- |
| Database Connection URL     | jdbc:impala://localhost:21050/default |
| Database Driver Class Name  | com.cloudera.impala.jdbc41.Driver     |
| Database Driver Location(s) | /opt/nifi-1.6.0/ImpalaJDBC41.jar      |
| Database User               |                                       |
| Password                    |                                       |
| Max Wait Time               | 500 millis                            |
| Max Total Connections       | 8                                     |
| Validation query            |                                       |

## ExecuteSQL Processor

| Property                            | Value                  |
| ----------------------------------- | ---------------------- |
| Database Connection Pooling Service | NiFi+ImpalaDemo2       |
| SQL select query                    | select * from metrics; |
| Max Wait Time                       | 0 seconds              |
| Normalize Table/Column Names        | false                  |
| Use Avro Logical Types              | false                  |
| Default Decimal Precision           | 10                     |
| Default Decimal Scale               | 0                      |



## 注意问题：

1 配置DBCP时， Database Connection URL 使用问题： 

```properties
#jdbc:impala://47.96.114.97:21050/default
jdbc:impala://localhost:21050/default
```

应该怎么配，按照第一种方式直接写入地址还是按照第二种方式写入localhost?

2 执行操作时，每个node都会取去Impala Server拉一份数据。。。