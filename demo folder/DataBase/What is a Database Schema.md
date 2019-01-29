# [What is a Database Schema?](https://database.guide/what-is-a-database-schema/)



## Database  Terms

In database terms, a schema (pronounced “skee-muh” or “skee-mah”) is the organisation and structure of a [database](https://database.guide/what-is-a-database/). Both *schemas* and *schemata* can be used as plural forms.

A schema contains schema objects, which could be [tables](https://database.guide/what-is-a-table/), [columns](https://database.guide/what-is-a-column/), data types, [views](https://database.guide/what-is-a-view/), [stored procedures](https://database.guide/what-is-a-stored-procedure/), [relationships](https://database.guide/what-is-a-relationship/), [primary keys](https://database.guide/what-is-a-primary-key/), [foreign keys](https://database.guide/what-is-a-foreign-key/), etc.

## Visual Schema Diagram

A database schema can be represented in a visual diagram, which shows the database objects and their relationship with each other.

### Basic schema diagram

![Screenshot of a database schema.](https://database.guide/wp-content/uploads/2016/06/MySQL_Schema_Music_Example.png)

A basic schema diagram representing a small three-table database.

Above is a simple example of a schema diagram. It shows three tables, along with their data types, relationships between the tables, as well as their primary keys and foreign keys.

### Complex Example 

Here is a more complex example of a database schema:

![Screenshot of the Sakila Sample Database schema.](https://database.guide/wp-content/uploads/2016/06/sakila_full_database_schema_diagram.png)

A database schema diagram of the Sakila Sample Database.

In this case, the schema diagram has been separated into four sections:

- **Customer Data**: Data related to the customers, such as their name, address, etc
- **Business**: Data required to run the business, such as staff, store locations, payment details, etc
- **Inventory**: Details on all products. In this case the products are movies, so it contains data such as movie title, its category, the actors, etc.
- **Views**: Special view on data used for appraisals.

So by looking at these schema diagrams, we could go ahead and create a database. In fact, MySQL Workbench allows you to [generate a `CREATE TABLE` script straight from the diagram](https://database.guide/how-to-generate-a-script-from-a-diagram-in-mysql-workbench/). You can then [use the script to create a database](https://database.guide/how-to-create-a-database-from-a-script-in-mysql/). You can even [reverse engineer a database into a diagram](https://database.guide/how-to-reverse-engineer-a-database-in-mysql-workbench/).

## Is a Schema and a Database the Same Thing?

There’s a lot of confusion about schemas when it comes to databases. The question often arises whether there’s a difference between schemas and databases and if so, what is the difference.

### Depends on the Vendor

Part of the reason for the confusion is that database systems tend to approach schemas in their own way.

- The [MySQL documentation](http://dev.mysql.com/doc/refman/5.7/en/glossary.html#glos_schema) states that physically, a schema is synonymous with a database. Therefore, a schema and a database are the **same thing**.
- However, the [Oracle Database documentation](https://docs.oracle.com/database/121/SQLRF/sql_elements007.htm#SQLRF20003) states that certain objects can be stored inside a database but not inside a schema. Therefore, a schema and a database are **two different things**.
- And according to this [SQL Server technical article](https://technet.microsoft.com/en-us/library/dd283095(v=sql.100).aspx), a schema is a separate entity inside the database. So, they are **two different things**.

So, depending on the RDBMS you use, schemas and databases may or may not be the same thing.

### What about the SQL Standard?

The [ISO/IEC 9075-1 SQL standard](http://www.iso.org/iso/iso_catalogue/catalogue_tc/catalogue_detail.htm?csnumber=53681) defines a schema as a persistent, named collection of descriptors.

If you were confused before, hope I haven’t just made it worse…

### Broad Meaning

Another reason for the confusion is probably due to the fact that the term *schema* has such a broad meaning. It has different connotations within different contexts.

The word schema originates from the Greek word *skhēma*, which means *form*, *figure*, *shape*, or *plan*.

Schema is used in psychology to describe an organised pattern of thought or behaviour that organises categories of information and the relationships among them.

Before designing a database, we also need to look at the categories of information and the relationships among them. We need to create a *conceptual* schema before we even start with the *physical* schema within the DBMS.

In software development, when discussing schemas, one could be discussing *conceptual*schemas, *physical* schemas, *internal* schemas, *external* schemas, *logical* schemas, etc . Each of these has its own specific meaning.

## Schema Definitions by DBMS

Here’s a quick definition of schema from the three leading database systems:

### MySQL

> Conceptually, a schema is a set of interrelated database objects, such as tables, table columns, data types of the columns, indexes, foreign keys, and so on.
>
> ….
>
> In MySQL, physically, a **schema** is synonymous with a **database**. You can substitute the keyword `SCHEMA` instead of `DATABASE` in MySQL SQL syntax, for example using `CREATE SCHEMA` instead of `CREATE DATABASE`.

Source: [“MySQL Glossary”](http://dev.mysql.com/doc/refman/5.7/en/glossary.html#glos_schema). MySQL 5.7 Reference Manual. MySQL. Retrieved 6 June 2016.

#### 

### SQL Server

> The names of tables, fields, data types, and primary and foreign keys of a database.

[“Glossary”](https://msdn.microsoft.com/en-us/library/ms165911.aspx). SQL Server 2016 Technical Documentation. Microsoft Developer Network. Retrieved 6 June 2016.

###  Oracle Database

[Oracle Database](https://database.guide/what-is-oracle-database/)‘s schema system is quite different to the other systems. Oracle’s schema is very much tied to the database user.

> A schema is a collection of logical structures of data, or schema objects. A schema is owned by a database user and has the same name as that user. Each user owns a single schema.

Source: [“Database Objects”](https://docs.oracle.com/database/121/SQLRF/sql_elements007.htm#SQLRF20003).  Oracle Database Online Documentation 12c Release 1 (12.1). Oracle Help Center. Retrieved 6 June 2016.

This article on [schema definitions by DBMS](https://database.guide/schema-definitions-by-dbms/) provides more detail.

## Creating Schemas

Despite their differences in defining schemas, each of the three aforementioned DBMSs support the `CREATE SCHEMA` statement.

And that’s where the similarity ends.

### MySQL

In MySQL, [`CREATE SCHEMA`](http://dev.mysql.com/doc/refman/5.7/en/create-database.html) creates a database.

This is because `CREATE SCHEMA` is a synonym for `CREATE DATABASE`.  In other words, you can use `CREATE SCHEMA` or `CREATE DATABASE` to do the same thing.

### Oracle Database

In Oracle Database, the [`CREATE SCHEMA`](https://docs.oracle.com/database/121/SQLRF/statements_6016.htm#SQLRF01313) statement doesn’t actually create a schema. This is because a schema is already created with each database user.

In Oracle, the [`CREATE USER`](https://docs.oracle.com/database/121/SQLRF/statements_8003.htm#SQLRF01503)  statement creates the schema.

In Oracle, `CREATE SCHEMA` statement lets you populate your schema with tables and views and grant privileges on those objects without having to issue multiple SQL statements in multiple transactions.

### SQL Server

In SQL Server, [`CREATE SCHEMA`](https://msdn.microsoft.com/en-us/library/ms189462(v=sql.110).aspx) will create a schema by the name you give it.

Unlike MySQL, the `CREATE SCHEMA` statement creates a schema that is defined separately to the database.

Unlike Oracle, the `CREATE SCHEMA` statement actually creates the schema.

In SQL Server, once you create the schema, you can then add users and objects to it.

## Conclusion

The term *schema* can be used within many different contexts. In the context of creating schemas within a specific database management system, you’ll need to work with however that DBMS defines schemas.

And when you switch to a new DBMS, be sure to look up how that system defines schemas.



[Database Concepts](https://database.guide/category/database-concepts/), [MySQL](https://database.guide/category/dbms/rdbms/mysql/), [SQL](https://database.guide/category/sql/), [SQL Server](https://database.guide/category/dbms/rdbms/sql-server/)

[DATABASE DIAGRAM](https://database.guide/tag/database-diagram/)[DATABASE SCHEMA](https://database.guide/tag/database-schema/)[DATABASE TERMS](https://database.guide/tag/database-terms/)[ORACLE](https://database.guide/tag/oracle/)[WHAT IS](https://database.guide/tag/what-is/)



## 译文

>  [数据库中的Schema是什么?](https://blog.csdn.net/u010429286/article/details/79022484)