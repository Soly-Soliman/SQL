use AdventureWorks

Select * fROM Person.Person

select count (*)  from Person.Person

select * from Person.Person where FirstName like '%k'
union 
select * from Person.Person where FirstName like 'k%'

select * from Production.Product where Name like  '%c%c%'
union all
select * from Production.Product where Name like  '%k'

select * from Production.Product where Name like  '%c%c%'
union 
select * from Production.Product where Name like  '%k'


select * from Production.Product where Name like  '%c%c%'
union 
select * from Production.Product where Name like  '%k'


select * from Production.Product p
JOIN  
Production.Product p2
on p.ProductID = p2.ProductID 
where p.Name like  '%c%c%'

use AdventureWorks
select * from Production.Product where Name like  '%c%c%'
Except
select * from Production.Product where Name like  '%k'
intersect 
select * from Production.Product where Name like  'c%'


select Case  
			When ProductID =2 then 1 
			When ProductID = 222 THEN 2
			ELSE 0 
			END 
			FROM PRODUCTION.PRODUCT 

With M AS ( 
Select ProductID  ,  Name  ,  
					case   
						when   ListPrice = 0.00   then 0
						else 1 
						end  as number
From Production.product 
) 
--Select	Count (number) from M Where number !=0 
Select	Count (number) from M Where number =0  ;
With CTE as  (

SELECT 
    ProductID, 
    Name,
    ListPrice,
    CASE
        WHEN ListPrice < 50 THEN 'Low Price'
        WHEN ListPrice BETWEEN 50 AND 200 THEN 'Medium Price'
        WHEN ListPrice > 200 THEN 'High Price'
        ELSE 'Unknown'
    END AS PriceCategory
FROM Production.Product )
Select count(*) from CTE Where PriceCategory = 'Unknown'


SELECT 
    ProductID,
    Name,
    FinishedGoodsFlag,
    CASE
        WHEN FinishedGoodsFlag = 1 THEN 'Finished Good'
        ELSE 'Not Finished'
    END AS ProductStatus
FROM Production.Product;



SELECT 
    ProductID,
    Name,
    Weight,
    CASE
        WHEN Weight < 10 THEN 'Lightweight'
        WHEN Weight BETWEEN 10 AND 50 THEN 'Medium Weight'
        WHEN Weight > 50 THEN 'Heavyweight'
        ELSE 'Unknown Weight'
    END AS WeightCategory
FROM Production.Product;


SELECT 
    ProductID,
    Name,
    SellStartDate,
    SellEndDate,
    CASE
        WHEN SellEndDate IS NOT NULL AND SellEndDate < GETdate() THEN 'No Longer Sold'
        WHEN SellStartDate <= getdate() AND (SellEndDate IS NULL OR SellEndDate >= GETDATE()) THEN 'Currently Sold'
        ELSE 'Not Yet Available'
    END AS ProductAvailability
FROM Production.Product;


SELECT 
    ProductID,
    Name,
    Weight,
    CASE 
        WHEN Weight IS NULL THEN 'Not Specified'
        WHEN Weight < 5 THEN 'Light Shipping'
        WHEN Weight BETWEEN 5 AND 20 THEN 'Standard Shipping'
        WHEN Weight > 20 THEN 'Heavy Shipping'
    END AS ShippingClass
FROM Production.Product;


SELECT 
    ProductID,
    Name,
    SafetyStockLevel,
    ReorderPoint,
    CASE 
        WHEN SafetyStockLevel <= ReorderPoint THEN 'Urgent Reorder'
        WHEN SafetyStockLevel - ReorderPoint BETWEEN 1 AND 20 THEN 'Reorder Soon'
        ELSE 'Sufficient Stock'
    END AS ReorderPriority
FROM Production.Product;

SELECT 
    ProductID,
    Name,
    Style,
    CASE 
        WHEN Style = 'U' THEN 'Universal'
        WHEN Style = 'M' THEN 'Men'
        WHEN Style = 'W' THEN 'Women'
        ELSE 'Unspecified'
    END AS ProductStyle
FROM Production.Product;
SELECT 
    ProductID,
    Name,
    Weight,
    CASE 
        WHEN Weight IS NULL THEN 'Not Specified'
        WHEN Weight < 5 THEN 'Light Shipping'
        WHEN Weight BETWEEN 5 AND 20 THEN 'Standard Shipping'
        WHEN Weight > 20 THEN 'Heavy Shipping'
    END AS ShippingClass
FROM Production.Product;