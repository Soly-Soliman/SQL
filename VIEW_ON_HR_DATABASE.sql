Use HR  ; 

create view Employee as 
SELECT EMP_ID, F_NAME, L_NAME, B_DATE, SEX, SALARY
 from EMPLOYEES 

 select *  from Employee

 select *  from Employees

--before you create the next VIEW you have to make shure it is not EXISTS 

    drop view  if EXISTS Emp_salay
-- Then you can cfreate the next view 
CREATE VIEW EMP_SALARY 
AS
SELECT EMP_ID, F_NAME, L_NAME, B_DATE, SEX, JOB_TITLE,
MIN_SALARY, MAX_SALARY
FROM EMPLOYEES join  JOBS
on EMPLOYEES.JOB_ID = JOBS.JOB_IDENT;

SELECT * FROM EMP_SALARY;
-- you can drop it if you don't need it any more 
drop view  if EXISTS Emp_salay
-- to insert inside a view you must now how to insert and when you can or can't insert the data  ; 
select * from Employee 
insert into Employee  (EMP_ID, F_NAME, L_NAME, B_DATE, SEX, SALARY )values 
( '525', 'Sol' , 'Mo' , '1984-01-01'  ,  'M' , 5555555 )
--first the columns does not allow null  

-- also if i want to insert into a view that inhert from two tables you have to seperate the insert statment to each table