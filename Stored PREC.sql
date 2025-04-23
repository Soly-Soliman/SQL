

use HR  ;
--here is the way to write the query 
create procedure GetDATA
AS 
Select * from EMPLOYEES
-- how to use it
execute GetDATA
--or you can just write the name of the precdure to execute it 
GetDATA -- it is the same 

-- other one  
select *  from JOBS
select *  from EMPLOYEES


create proc Get_emp_by_jop @Emp_id varchar(20)
as 
select Emp_id ,  F_name + ' ' + l_name as Full_Name from EMPLOYEES 
where  EMP_ID= @Emp_id

execute Get_emp_by_jop 'E1002' --exmple 

drop  proc Get_emp_by_jop  


select *  from JOBS
insert into  JOBS  (JOB_IDENT , JOB_TITLE)values 
(700 , 'Sr.PHP')
--here we gonaa create a procedure to insert into jops table 


Alter proc Insert_into 
@Emp_id int  ,
@Tiltel varchar(20)  ,
@min_salary float = 0.000  ,
@max_salary float = 0.000 
as
begin try 
  insert into  JOBS values 
   (@Emp_id , @Tiltel , @min_salary ,@max_salary)
end try 
begin catch 
select 'Error'  AS Erorrs
end catch 

 execute Insert_into 199 , 'Sr.C#' , 794.056 , 900452

 select *  from JOBS

NEW VIEW EMP_VIEW (EMP_ID, FIRSTNAME, LASTNAME)

AS SELECT EMP_ID, F_NAME, L_NAME

FROM EMPLOYEES;