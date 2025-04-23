use Northwind2021 
select * from Customer ;


select @@ERROR as Error_Number 
--that is a declared 
declare @x int  
set @x = 1015
select @x

--another way of dealaration 

declare @xx int = 100  
select  @xx = 10 
select @xx
--------------------
--common issue i found when decalring this  
--- first if i want to find the id where First name = Maria i have to send more condtion to get just one value back
declare @x2 int = (select id from Customer where FirstName  like 'M%'  )
select @x2
-- but when using this query it give me back an array of values bet it shown just that last elemnt in the array
declare @x3 int = 100 
select @x3 =  id from Customer where FirstName  like 'M%'
select @x3

-- here is the hole array 
select id from Customer where  FirstName like 'M%'
--------------------------

-- if i want more than value from diffrent column 

declare @id int   , @name varchar (20)
select @id = id , @name  = Firstname + ' ' +lastname  from Customer where phone like '%22%'
select @id as ID  , @name AS Full_Name
---now look to the differance between the two queries
select id   ,  Firstname + ' ' +lastname  from Customer where phone like '%22%'
-- if  you want to update based on spesific id  in declared valruable
declare @Update varchar (20)  
update Customer set FirstName = 'Maram' 
where id = 1
select @update  = firstname from customer where id = 1 
select @update 
-- this is declareing a var with the type table to save on memory (run time ) more one data and as many as columns i want 
declare @table table (Id int ,  First_name  varchar(20))
insert into @table 
select id , firstname from customer 
select * from @table
----declare a top ()  function 
declare @Top int  = 4  
select top (@top)   id  ,  Firstname + ' ' + LastName as full_name
from Customer
 --- another type of selecting and what is the advantage from execute 
select ' select * from customer' -- this will print it as a string and will never now what is mean
-- but this is gonna  recognaize the string and then execute it 
execute ('select * from customer ')

-- we can use execute with declared var 
--example 
declare @Columns varchar (20) = '*' , @tab_name varchar(20) = 'customer'
  select @Columns from @tab_name  

  --didnot work ??? 
select @@SERVERNAME


-----------------------if exists 
if exists (select name from sys.tables where name = 'Student') 
select 'Table Is Existed'
else 
	create table Student (
	id int , 
	name  varchar(10)
	)
	
	
declare @i int = 10 
	while @i <=20
		begin
			set @i+=1
			if @i=14
			continue
			if @i= 16
			break 
			select @i 
	end 

	create table parent (p_id int primary key)
	create table child  (C_id int foreign key references parent (p_id)) 
	insert into  parent values (1)
	insert into  parent values (2)
	insert into  parent values (3)
	insert into  parent values (4)
	 truncate table child 
	 select *  from child

begin try 
	 begin transaction
		insert into child values (1) 
		insert into child values (2) 
		insert into child values (5) 
		insert into child values (4) 
	commit 
end try
begin catch
	rollback
end catch
	 select *  from child

	 select * from Customer
   select top(1) FirstName from Customer
   order by len (FIRSTname) desc
   select DB_NAME() ,  suser_name()

    create function getsname (@id int )
	returns varchar(20)
	as
				declare @name varchar(20)
				select @name = FirstName from Customer
				return @name
			end
  use Northwind2021
  select dbo.getsname(8)

  select   FirstName + ' ' + LastName from Customer where id  = 8
  select *  from Customer



  select *  from  Again.dbo.Emp
  use Again
  create function get_Sallry(@id int  )
  returns table as 
  return (
		select f_name , sallry *6 
		from Emp
		where id =@id
  )
    create function Get_ALL_EMP(@id int  )
  returns table as 
  return (
		select f_name , sallry *12 as salary_per_year 
		from Emp
		where D_number=@id
  )

  select *  from dbo.get_sallry(1)
  select *  from dbo.Get_ALL_EMP(1)

  ----create function to retuen a list by A key word like 'first name'

CREATE FUNCTION Get_All (@format VARCHAR(20))
RETURNS @table TABLE 
(
    id INT, 
    Emp_NAME VARCHAR(20)
)
AS 
BEGIN
    IF @format = 'id'
    BEGIN
        INSERT INTO @table
        SELECT Emp.id, Emp.F_name + ' ' + Emp.L_name 
        FROM Emp;
    END
    ELSE IF @format = 'full'
    BEGIN
        INSERT INTO @table
        SELECT Emp.id, Emp.F_name + ' ' + Emp.L_name 
        FROM Emp;
    END
    RETURN;
END;
select * from Get_ALL('000000')

---------------windoing funcyion 
select TOP (0) * from dbo.customer ;

select * from (
seLect 
FirstName ,
LAG= lag (Firstname) over(order by city ) , 
lead  = lead (Firstname) over(order by city )
from customer

)as l
where firstname  = 'rene' 
select  *  from customer where id   =1 ; 
select * from (
seLect 
FirstName , City , 
LAG= lag (Firstname) over( order by city ) , 
lead  = lead (Firstname) over( order by city ) ,
first = FIRST_VALUE(firstname)over( order by city ),
LAST  = lasr_value(firstname) over (order by city)
from customer

)as l
where firstname  = 'rene' 