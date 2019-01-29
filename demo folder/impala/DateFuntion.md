Purpose:

 

Returns the specified date and time plus some number of months.

**Return type:** timestamp

**Usage notes:**

Same as [months_add()](https://www.cloudera.com/documentation/enterprise/5-8-x/topics/impala_datetime_functions.html#datetime_functions__months_add). Available in Impala 1.4 and higher. For compatibility when porting code with vendor extensions.

**Examples:**

The following examples demonstrate adding months to construct the same day of the month in a different month; how if the current day of the month does not exist in the target month, the last day of that month is substituted; and how a negative argument produces a return value from a previous month.

```
select now(), add_months(now(), 2);
+-------------------------------+-------------------------------+
| now()                         | add_months(now(), 2)          |
+-------------------------------+-------------------------------+
| 2016-05-31 10:47:00.429109000 | 2016-07-31 10:47:00.429109000 |
+-------------------------------+-------------------------------+

select now(), add_months(now(), 1);
+-------------------------------+-------------------------------+
| now()                         | add_months(now(), 1)          |
+-------------------------------+-------------------------------+
| 2016-05-31 10:47:14.540226000 | 2016-06-30 10:47:14.540226000 |
+-------------------------------+-------------------------------+

select now(), add_months(now(), -1);
+-------------------------------+-------------------------------+
| now()                         | add_months(now(), -1)         |
+-------------------------------+-------------------------------+
| 2016-05-31 10:47:31.732298000 | 2016-04-30 10:47:31.732298000 |
+-------------------------------+-------------------------------+
```

adddate(timestamp startdate, int days), adddate(timestamp startdate, bigint days),

Purpose:

 

Adds a specified number of days to a

 

TIMESTAMP

 

value. Similar to

 

date_add()

, but starts with an actual

 

TIMESTAMP

 

value instead of a string that is converted to a

 

TIMESTAMP

.

**Return type:** timestamp

**Examples:**

The following examples show how to add a number of days to a TIMESTAMP. The number of days can also be negative, which gives the same effect as the subdate() function.

```
select now() as right_now, adddate(now(), 30) as now_plus_30;
+-------------------------------+-------------------------------+
| right_now                     | now_plus_30                   |
+-------------------------------+-------------------------------+
| 2016-05-20 10:23:08.640111000 | 2016-06-19 10:23:08.640111000 |
+-------------------------------+-------------------------------+

select now() as right_now, adddate(now(), -15) as now_minus_15;
+-------------------------------+-------------------------------+
| right_now                     | now_minus_15                  |
+-------------------------------+-------------------------------+
| 2016-05-20 10:23:38.214064000 | 2016-05-05 10:23:38.214064000 |
+-------------------------------+-------------------------------+
```

current_timestamp()

Purpose:

 

Alias for the

 

now()

 

function.

**Return type:** timestamp

**Examples:**

```
select now(), current_timestamp();
+-------------------------------+-------------------------------+
| now()                         | current_timestamp()           |
+-------------------------------+-------------------------------+
| 2016-05-19 16:10:14.237849000 | 2016-05-19 16:10:14.237849000 |
+-------------------------------+-------------------------------+

select current_timestamp() as right_now,
  current_timestamp() + interval 3 hours as in_three_hours;
+-------------------------------+-------------------------------+
| right_now                     | in_three_hours                |
+-------------------------------+-------------------------------+
| 2016-05-19 16:13:20.017117000 | 2016-05-19 19:13:20.017117000 |
+-------------------------------+-------------------------------+
```

date_add(timestamp startdate, int days), date_add(timestamp startdate, interval_expression)

Purpose:

 

Adds a specified number of days to a

 

TIMESTAMP

 

value. With an

 

INTERVAL

 

expression as the second argument, you can calculate a delta value using other units such as weeks, years, hours, seconds, and so on; see

 

TIMESTAMP Data Type

 

for details.

**Return type:** timestamp

**Examples:**

The following example shows the simplest usage, of adding a specified number of days to a TIMESTAMPvalue: