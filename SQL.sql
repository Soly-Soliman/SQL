Create Table Employee  
(
Emb_ID int  primary key 
)

alter table Employee
add 
Name nvarchar(50) , 
Dep_Name nvarchar(50),
salary float , 
ponus float  
use PracticeAnyFun

select *  from Employee
insert into Employee 
values (
 16, 'Walaa' , 'python' , 5885 , 700 
)

select  Employee.dep , Max(Employee.salary) as Max_Salary     from Employee
group by dep

select E.* ,Max(E.salary) OVER(partition by dep) AS Max_SALARY

from Employee as E

Select e.*   ,  ROW_NUMBER() over( partition by dep order by e.Emb_id) as R 
from 
Employee as E 

 select * from 
 (
 Select e.*   ,  ROW_NUMBER() over( partition by dep order by e.Emb_id) as R 
from 
Employee as E 
) as theFirst2
where theFirst2.R <3 

Select e.*   ,  RANK() over( partition by dep order by e.salary desc) as RANK 
from 
Employee as E 

Create Table Emp (
E_ID  int   identity (1,1) , 
E_Name  varchar(20) , 
E_ADDRESS varchar(20) default 'Alex', 
Hire_date Date  default getdate() , 
Sallry int  , 
over_Time    int  ,
net_sallary as (isnull(Sallry , 0 ) + isnull (over_Time , 0 ))   , 
B_DATE  DATE , 
Age  as (year (getdate()) - year(B_Date)) ,
gender varchar(1)  , 
hour_rate int not null , 
Dep_ID int  , 
constraint C8 primary key (E_ID ,E_Name) ,
constraint C2 unique (Sallry) ,
constraint c3 unique (over_Time) ,
constraint c4 check (sallry >1500) , 
constraint c5 check (E_ADDRESS IN ('Cairo' , 'Alex' , 'Giza')) , 
constraint C6 check (Gender ='F'  or gender = 'M'  ) , 
Constraint c7 foreign key (Dep_ID) references Department (Dep_id)
on delete set null on update cascade 
)

create Table Department (
Dep_id int identity (1 , 1 ) , 
Dep_Name Varchar(50) default 'SoftWare' , 
constraint C1 primary key (dep_id) ,
)