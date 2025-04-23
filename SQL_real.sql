create  database Real_Tasks ; 
-- create the table 

create table Employee 
(
ID int primary key,
F_Name varchar (20),
L_Name varchar (20) ,
Birth_Date date  , 
Salary float , 
Department_ID int  , 
)
--to describe the table 

EXEC sp_help 'Employee';


--CREATE TABLE table_name (
--    column1 datatype constraints,
--    column2 datatype constraints,
--    ...
--);

insert into Employee 
 values
 (1 , 'SAMY' , 'Soliman' , '2010-02-25',2500 , 1 ) , 
 (2 , 'Sara' , 'mona' , '2009-02-11' , 2555 , 2)

 use Real_Tasks ;
 select * from Employee

create view v_all as  
 Select *  from Employee
