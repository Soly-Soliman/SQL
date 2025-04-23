
declare @updated int 
UPDATE a
   SET a.[First_name] = b.First_name
      ,a.[Last_name] = b.Last_name
      ,a.[Email] = b.Email
      ,a.[Gender] = b.Gender
 from [dbo] . [Emails] a inner join  [dbo].[ZZ_Email_Updated] as b
 on a.id = b.id
 set @updated =@@ROWCOUNT
 insert into [dbo].audit_log
 select 'Package.dtsx' , 'Email' , 0 , @updated , GETDATE()


 SELECT *  from [dbo].[Emails]
 SELECT *  from[dbo].[audit_log]
 USE SSIS 
 CREATE Table   dbo.Cusromers(
	[CustId] [int],
	[Customer_name] [varchar](50) ,
	Customer_City [varchar](50) ,
	Customer_Phone [varchar](50) ,
	Subscription [char](1) 
)

select * from Data