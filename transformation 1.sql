SELECT *  FROM   [dbo].[DimCustomer]
use [AdventureWorksDW2019]


select BirthDate from  [dbo].[DimCustomer]



SELECT 
    CAST(GETDATE() AS DATE) AS CurrentDate, 
    BirthDate, 
  floor (  DATEDIFF(DAY, BirthDate, CAST(GETDATE() AS DATE)) / 365.25  ) AS Age_in_years
FROM 
    [dbo].[DimCustomer];
SELECT 
    CAST(GETDATE() AS DATE) AS CurrentDate, 
    BirthDate, 
    DATEDIFF(DAY, BirthDate, CAST(GETDATE() AS DATE)) / 365.25   AS Age_in_years
FROM 
    [dbo].[DimCustomer];
	SELECT 
    CAST(GETDATE() AS DATE) AS CurrentDate, 
    BirthDate, 
   floor ( ROUND(DATEDIFF(DAY, BirthDate, CAST(GETDATE() AS DATE)) / 365.25, 0) )AS Age_in_years
FROM 
    [dbo].[DimCustomer];

	USE Inforatica



	select *  from  [dbo].[DimCustomer_TARGET]  where customerKey  = 11000 
	; 
		select *  from  [dbo].[DimCustomer]where customerKey  = 11000 