USE HR
SELECT *  FROM EMPLOYEES
SELECT *  FROM JOB_HISTORY 
select *  from JOBS


select * from Employee , JOB_HISTORY ,HR.dbo.JOBS
--Retrieve only the EMPLOYEES records that correspond to jobs in the JOBS table.

SELECT * FROM EMPLOYEES 
WHERE JOB_ID in (select JOB_IDENT  from JOBS)

--Retrieve only the list of employees whose JOB_TITLE is Jr. Designe
SELECT * FROM EMPLOYEES 
WHERE JOB_ID in (select JOB_IDENT +
from JOBS where JOB_TITLE = 'Jr. Designer' )

--Retrieve JOB information and who earn more than $70,000.
SELECT JOB_TITLE , MAX_SALARY , MIN_SALARY  FROM JOBS 
WHERE  JOB_IDENT IN (SELECT JOB_ID FROM EMPLOYEES WHERE SALARY > 70000)

--Retrieve JOB information and list of employees whose birth year is after 1976.
SELECT JOB_TITLE , MAX_SALARY , MIN_SALARY  FROM JOBS 
WHERE  JOB_IDENT IN (SELECT JOB_ID FROM EMPLOYEES WHERE YEAR (B_DATE) > 1976)


--Retrieve JOB information and list of female employees whose birth year is after 1976.
SELECT JOB_TITLE , MAX_SALARY , MIN_SALARY  FROM JOBS 
WHERE  JOB_IDENT IN (SELECT JOB_ID FROM EMPLOYEES WHERE SEX = 'F' and  YEAR (B_DATE) > 1976)

--Perform an implicit cartesian/cross join between EMPLOYEES and JOBS tables.
select *  from EMPLOYEES  as e
cross join JOBS as j 
  
--Retrieve only the EMPLOYEES records that correspond to jobs in the JOBS table.
select *  from EMPLOYEES  as e
 join JOBS as j 
 on j.JOB_IDENT = e.JOB_ID
 -- or by this  way 
 select * from EMPLOYEES, JOBS where EMPLOYEES.JOB_ID = JOBS.JOB_IDENT;
 select E.EMP_ID,E.F_NAME,E.L_NAME, J.JOB_TITLE from EMPLOYEES E, JOBS  J where E.JOB_ID = J.JOB_IDENT;
 select EMP_ID,F_NAME,L_NAME, JOB_TITLE from EMPLOYEES E, JOBS J where E.JOB_ID = J.JOB_IDENT;