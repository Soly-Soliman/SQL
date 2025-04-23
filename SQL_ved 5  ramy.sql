use BikeStores ;
select 
*  
from BikeStores.sales.customers
order by 1  , 2 

select top(30) * into ITI_SQL.dbo.Customers
from 
BikeStores.sales.customers


select *  from ITI_SQL.dbo.Customers 
where Customers.city like '_n%'

select first_name + ' ' +  last_name  as full_name   from ITI_SQL.dbo.Customers;
select first_name + ' ' + last_name as full_name from ITI_SQL.dbo.Customers
where full_name = 'Debra Burks' ; 

	select   *  from  
		 ( 
		    select first_name + ' ' + last_name as full_name 
		    from ITI_SQL.dbo.Customers  
		 ) as full_name_VIR_TABLE
	where full_name = 'Debra Burks'

select   *
from BikeStores.sales.stores ;

select store_id , store_name ,city into ITI_SQL.dbo.Store 
from BikeStores.sales.stores 
where store_id = zip_code

select *  from ITI_SQL.dbo.Store

insert into ITI_SQL.dbo.Store  (store_id , store_name , city)
 select store_id , store_name , city 
 from BikeStores.sales.stores
 --where ITI_SQL.dbo.Store.store_id = BikeStores.sales.stores.store_id

  select  count(customer_id) , City , state
 from BikeStores.sales.customers
 group by city , state

 select count (order_id)  , store_id , *
 from BikeStores.sales.orders 
 group by store_id


 select sum(customer_id)  from BikeStores.sales.customers 
having  count (customer_id)>10

select *  FROM 
(SELECT *  , 
--ROW_NUMBER() over (partition by quantity order by discount )  as Row_Number,
--DENSE_RANK()  over (partition by list_price order by discount) as D_N ,
RANK() over (order by item_id) as item_Rank
 from BikeStores.sales.order_items
) AS New_Tabel
--where D_N=2  
 