USE BikeStores
select *  from sales.customers

Select first_name ,last_name  ,email 
from sales.customers

select count (First_name) from sales.customers

SELECT *  FROM sales.customers where state = 'CA'  ORDER BY first_name

SELECT city  , count (*) as num_of_people  from sales.customers where state = 'CA' group by city order by city

SELECT  distinct city , state    from sales.customers where state = 'CA'  order by city

select product_id ,product_name ,category_id ,model_year 
from production.products where model_year>'2013' and model_year < '2017' 
or list_price between 1000 and 100
order by list_price desc

create table  Sales.address 
(
city varchar(250) , 
address varchar(250) ,
State varchar(250)
)

insert into sales.address 
  select city , street , state from  sales.customers 
select city from sales.address into sales.

select product_id ,product_name ,category_id ,model_year 
from production.products where model_year>'2013' and model_year < '2017' 
or list_price < 1000 and list_price> 100
order by list_price desc

select *  from sales.customers where state NOT in ('CA' ,'NY' )


select a.order_id , a.order_date  , a.customer_id 
from sales.orders  a
inner join sales.customers  b
on (a.customer_id = b.customer_id) 
where b.customer_id in
(select customer_id from sales.customers where city = 'new york')
order by a.order_date desc

select order_id , order_date , customer_id 
from sales.orders where customer_id in (
select customer_id from sales.customers where city = 'new york'
) order by order_date desc

select a.customer_id , a.first_name ,a.last_name,b.order_id ,s.store_name
from sales.customers a
inner join sales.orders b 
on a.customer_id =b.customer_id
join sales.stores s on s.store_id =b.store_id

--another way to make join

select a.customer_id , a.first_name ,a.last_name,b.order_id 
from sales.customers a , sales.orders b 
where a.customer_id =b.customer_id 


create view brand_name as  
select c.customer_id , bb.brand_id , bb.brand_name
from sales.customers c
join sales.orders as o on c.customer_id = o.customer_id
join sales.order_items i on o.order_id = i.order_id
join production.products p on i.product_id =p.product_id
join production.brands bb on p.brand_id =bb.brand_id

drop view name

create database Sales 
use Sales
create schema  sales 
create Schema  Production

create table sales.customer (
customer_id int    ,
Customer_First_Name varchar (50) ,
Customer_Last_Name varchar (50) ,
Phone  Varchar(50) UNIQUE ,
E_mail Varchar(50) ,
Street varchar (50) ,
City   varchar(50) DEFAULT 'Sandnes' ,
State varchar(50) ,
Zip_code  varchar(50),
PRIMARY KEY (customer_id) 
)
alter table sales.customer 
add   Salary int check(Salary >= 3000 and  Salary < =15000)



insert into sales.customer values 
( 1 , 'Mohamed' , 'Soliman' ,'01114720662' ,'Mohamed.izzadin@gmail.com' ,' 10 in Giza' , 'Giza '  ,'' , '' , 8000 ) ,
( 2 , 'Sully' , 'Soliman' ,'01551586013' ,'Mohamed.izzadin@gmail.com' ,' 10 in Giza' , 'Giza '  ,'' , '' , 9000 )

drop table Sales.sales.customer

select top(1) *  from sales.customer


select top 1 *   from[sales].[customers]
use bikestores
select  *  from sales.customers

select count (customer_id)  , city  
from sales.customers
group by city 
select count(*) number , city  from sales.customers  

group by city 


select state from sales.customers 
group by state

having count (customer_id) > 150


select state ,  count (customer_id) from sales.customers  group by state

use HR  

  
SELECT MAX(SALARY ) MAX ,  MIN (SALARY  ) MAX FROM EMPLOYEE

INSERT INTO EMPLOYEES(EMP_ID, F_NAME, L_NAME, B_DATE, SALARY ,DEP_ID)
VALUES ('E1012', 'MOHAMED', 'MOHAMED', '1978-06-02', 5520054 , 6);

SELECT SUSER_NAME()
