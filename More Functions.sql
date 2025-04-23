select  DISTINCT *  from Data
CREATE table FUNCTIONS (
id int primary Key   , 
FullName varchar (20) , 
city varchar (20), 
grade float not null  , 
Depatment varchar (20) , 

)
insert into  FUNCTIONS values
--(8 , 'Sama' , 'Giza' , 37  , 'PHP' ) , 
--(9 , 'Marwa' ,  'Cairo' , 58 , 'C++') ,  
(23  , 'Mazen' , 'Giza' , 29.9902 , 'C++') ,
(12  , 'noha' , 'Alex' , 20.56 , 'Java') ,
(13  , 'Malak' , 'Alex' , 22 , 'C++') 




select   count (*) as count  ,  Depatment  from FUNCTIONS group by Depatment 
select * from FUNCTIONS order by id


select  * ,
LEAD = lead (FullName) over (partition by city order by grade ) , 
lag  =  lag (fullname) over (partition by city order by grade  ) 
,LAST_VALUE = LAST_VALUE (FullName) over (partition by city order by grade ) , 
FIRST_VALUE = FIRST_VALUE (fullname) over (partition by city order by grade )
from FUNCTIONS
order by Depatment

------------
select  * ,
--LEAD1 = LEAD (FullName) over (partition by city order by grade ) , 
--LEAD2  =  LEAD (fullname) over (partition by city order by id  ) ,
LAST_VALUE = LAST_VALUE (FullName) over (partition by city order by grade Asc) , 
FIRST_VALUE = FIRST_VALUE (fullname) over (partition by city order by grade )
from FUNCTIONS
where Depatment = 'C++'
--------------------------
select  * ,
LEAD1 = LEAD (FullName) over (partition by city order by grade ) , 
LEAD2  =  LEAD (fullname) over (partition by city order by id  ) ,
LAST_VALUE = LAST_VALUE (FullName) over (partition by city order by grade Asc) , 
FIRST_VALUE = FIRST_VALUE (fullname) over (partition by city order by grade desc )
from FUNCTIONS
where Depatment = 'C++' and grade >15.7
---compare 
select  * ,
LEAD1 = LEAD (FullName) over (partition by city order by grade ) , 
LEAD2  =  LEAD (fullname) over (partition by city order by id  ) ,
LAST_VALUE = LAST_VALUE (FullName) over (partition by city order by grade Asc) , 
FIRST_VALUE = FIRST_VALUE (fullname) over (partition by city order by grade asc )
from FUNCTIONS
where Depatment = 'C++' and grade >15.7



use [SQL Tutorial]
update  FUNCTIONS
set Depatment = 'Java' where id = 10  or id = 9 ;
rollback
create table test
(
id int primary key ,
name varchar(20) ,
age int unique ,

)
create unique index man14
on test(age)


ALTER TABLE functions
ADD  F_id INT;

create table #table(
id int ,
name varchar(20) , 

)
create table #table(
id int ,
name varchar(20) , 

)
use [SQL Tutorial]

select  *  from test 
select  id , name , sum(Numbers) as ALLNumbers
from test 
group by id , name

select *  from test 
pivot (sum (Numbers) for name in ([Marwa],[Soliman] , [Ahmed] )) as pvt 

select *  from test 
unpivot (sum (Numbers) for name in '([Soliman] , [Ahmed] )') as unpvt 


