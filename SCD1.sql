create table SRC_Employee 
(
EPM_ID INT , 
EMP_NAME VARCHAR(20) ,
State_ varchar(20)
)

insert into SRC_Employee values 
(
  1003 , 'George' , 'LAS'
)

SELECT *  FROM SRC_employee

create table DIM_EMP_SCD01
(
EPM_ID INT , 
EMP_NAME VARCHAR(20) ,
State_ varchar(20)
)

SELECT *  FROM DIM_EMP_SCD01
SELECT *  FROM SRC_employee

update SRC_employee 
SET State_ ='CHICAAAGO'
where EPM_ID =1003 


create Table Dim_Emp_SCD02
(
EPM_ID INT , 
EMP_NAME VARCHAR(20) ,
State_ varchar(20) , 
Start_Date_ datetime , 
End_date_   datetime
)


SELECT *  FROM SRC_employee
SELECT *  FROM Dim_Emp_SCD02

IF EXISTS ( SELECT  * FROM    dbo.sysobjects WHERE   id = OBJECT_ID(N'Emp_Source') AND OBJECTPROPERTY(id, N'IsUserTable') = 1 )
DROP TABLE Emp_Source
CREATE TABLE Emp_Source(EmpId int, FirstName varchar(50), LastName varchar(50), Designation varchar(50))

insert into Emp_Source values(100, 'Thomas', 'Sorenson', 'Software Engineer')
insert into Emp_Source values(101, 'Ashish', 'Raghav', 'DBA')
insert into Emp_Source values(102, 'Cody', 'Barbakos', 'Software Engineer')
insert into Emp_Source values(103, 'Rajdev', 'Bhandari', 'Software Engineer')
insert into Emp_Source values(104, 'Jyoti', 'Singh', 'IT Head')

IF EXISTS ( SELECT  * FROM    dbo.sysobjects WHERE   id = OBJECT_ID(N'DimEmployee') AND OBJECTPROPERTY(id, N'IsUserTable') = 1 )
DROP TABLE DimEmployee
CREATE TABLE DimEmployee(Id int identity, EmpId int, FirstName varchar(50), LastName varchar(50), Designation varchar(50), StartDate datetime, 
EndDate datetime)
go

select * from Emp_Source
select * from DimEmployee

--SCD Type 1 (Changing Attribute)
update Emp_Source
set LastName = 'Apple'
where EmpId=102
go

--SCD Type 2 (Historical Attribute)
update Emp_Source
set Designation = 'Cairo 25'
where EmpId=101
go

--SCD Fixed Attribute
update Emp_Source
set FirstName = 'Abhishek'
where EmpId=102