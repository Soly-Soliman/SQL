Get User 
Select * from  AdventureWorks.Sales.SalesTerritory ;

select * from AdventureWorks.Sales.SalesOrderHeader ; 



 with RNA AS ( 
 select *
,
ROW_NUMBER() OVER (partition by CustomerID order by orderdate ) as RN
from Sales.SalesOrderHeader
)
SELECT * FROM RNA  WHERE RN = 1 


WITH CTE AS (

		SELECT D.ProductID  , H.territoryid ,
		COUNT(D.ProductID) Count_Prouduct,
		RANK() OVER (partition by H.territoryid   order by COUNT(D.ProductID) DESC) RNK_product
		 FROM Sales.SalesOrderHeader H
		 join Sales.SalesOrderDetail D  ON H.SalesOrderID = D.SalesOrderID
		 group by D.ProductID , H.territoryid
)
 SELECT * FROM CTE WHERE RNK_product < 4

 WITH CTE AS (

		SELECT D.ProductID  , H.territoryid ,
		SUM(D.LineTotal) LineTotal,
		RANK() OVER (partition by H.territoryid   order by SUM(D.LineTotal) DESC) RNK_product
		 FROM Sales.SalesOrderHeader H
		 join Sales.SalesOrderDetail D  ON H.SalesOrderID = D.SalesOrderID
		 group by D.ProductID , H.territoryid
)
 SELECT * FROM CTE WHERE RNK_product < 4
 ;
 WITH TerritoryProductSales AS (
    -- 1) Aggregate total sales for each product in each territory
    SELECT
        H.TerritoryID,
        D.ProductID,
        SUM(D.LineTotal) AS TotalSales
    FROM Sales.SalesOrderHeader H
    JOIN Sales.SalesOrderDetail D
      ON H.SalesOrderID = D.SalesOrderID
    GROUP BY
        H.TerritoryID,
        D.ProductID
),
RankedProducts AS (
    -- 2) Rank products within each territory by descending TotalSales
    SELECT
        TerritoryID,
        ProductID,
        TotalSales,
        RANK() OVER (
            PARTITION BY TerritoryID
            ORDER BY TotalSales DESC
        ) AS SalesRank
    FROM TerritoryProductSales
)
-- 3) Pick only the top 3 in each territory
SELECT  
ProductID,
    TerritoryID,
  
    TotalSales
FROM RankedProducts
WHERE SalesRank <= 3
ORDER BY
    TerritoryID,
    SalesRank;


	WITH CTE_RUNNING AS 
		(
			SELECT	
			H.*, 
			sum(D.LineTotal) OVER (PARTITION BY ORDERDATE  ) SUM1,

			sum(D.LineTotal) OVER (PARTITION BY ORDERDATE ORDER BY ORDERDATE  ) SUM2 ,
			sum(D.LineTotal) OVER (PARTITION BY ORDERDATE ORDER BY ORDERDATE ROWS UNBOUNDED PRECEDING ) SUM3

			FROM Sales.SalesOrderHeader H 
			JOIN Sales.SalesOrderDetail D on  h.SalesOrderID =d.SalesOrderID

		)

		SELECT * FROM CTE_RUNNING


		SELECT DATEDIFF (MONTH ,ShipDate,OrderDate  )  FROM Sales.SalesOrderHeader 
		
		-- Returns each customer’s first order date
SELECT 
  C.CustomerID,
 
  F.FirstOrderDate
FROM Sales.Customer C 
CROSS APPLY (
  SELECT TOP 1 OrderDate AS FirstOrderDate
  FROM Sales.SalesOrderHeader H
  WHERE H.CustomerID = C.CustomerID
  ORDER BY OrderDate
) F;


Select  
	Customerid, 
	OrderDate ,
	First_Value(OrderDate) over(pARTITION BY CUSTOMERID order by shipdate) First_v,
	First_Value(OrderDate) over(Partition BY CustomerID order by shipdate desc) Last_vd,
	Last_Value(OrderDate) over(pARTITION BY CUSTOMERID order by shipdate) Lst ,
LAST_VALUE(OrderDate) OVER (
  PARTITION BY CustomerID
  ORDER BY ShipDate
  ROWS BETWEEN UNBOUNDED PRECEDING AND UNBOUNDED FOLLOWING
) AS Lst


From Sales.SalesOrderHeader


SELECT 
D.UnitPrice ,
F.SH
FROM Sales.SalesOrderDetail D  
CROSS APPLY (
SELECT H.shipdate AS SH FROM Sales.SalesOrderHeader H 
WHERE  D.SalesOrderID = H.SalesOrderID
) F ;

USE AdventureWorks
select * from Sales.SalesOrderDetail
SELECT * FROM Sales.SalesOrderHeader

SELECT SALESORDERID  , sub FROM Sales.SalesOrderHeader  CROSS APPLY (
Values (1) , (2)  , (3 ) ) columnnames (sub)

where SALESORDERID = 43697
 

 select 
 h.Customerid , D.LineTotal ,
 LAG(LineTotal, 1,000) OVER (PARTITION BY H.CUSTOMERID order by H.SHIPDATE) AS Pervious,
 D.lINEtotal -  LAG(LineTotal, 1,0000) OVER (PARTITION BY H.CUSTOMERID order by H.SHIPDATE) AS DIFF,

 LAG(LineTotal) OVER (PARTITION BY H.CUSTOMERID order by H.SHIPDATE) 

 from sales.SalesOrderDetail D
 join Sales.SalesOrderHeader H
 on H.SalesOrderID = D.SalesOrderID

With Chunks as  ( 
 select CustomerID ,
	 Sum(totaldue) Total_Sales , 
	 Ntile(4) over(  order by Sum(Totaldue) desc ) Chunks
 from Sales.SalesOrderHeader
 	 Group by CustomerID )

	 select Chunks.Chunks ,  s.* from Sales.SalesOrderHeader S
	 Join Chunks on
	 Chunks.CustomerID = S.CustomerID 
	 and Chunks <= 4  order by Chunks ; 


	 select   
	    OrderDate , 
		CustomerID , 
		Count(SalesOrderID) over() AS Toatal_Orders,
		Count(SalesOrderID) over(Partition By CustomerID ) as Sales_Per_Customer 
	 FROM Sales.SalesOrderHeader 
	 order By OrderDate ; 

	 select count(SalesOrderID)  from Sales.SalesOrderHeader ; 

	 select * from Sales.SalesOrderHeader ; 

WITH CustomerTotals AS (
    SELECT
        CustomerID,
        SUM(TotalDue) AS Total_Sales
    FROM Sales.SalesOrderHeader
    GROUP BY CustomerID
),
CustomerQuartiles AS (
    SELECT
        CustomerID,
        Total_Sales,
        NTILE(4) OVER (
            ORDER BY Total_Sales DESC
        ) AS Quartile
    FROM CustomerTotals
)
-- If you only want one row per customer:
SELECT
    CustomerID,
    Total_Sales,
    Quartile
FROM CustomerQuartiles
ORDER BY Quartile, Total_Sales DESC;

/* 
-- If you need the quartile on every order row, join back:
SELECT
    s.*,
    cq.Quartile
FROM Sales.SalesOrderHeader s
JOIN CustomerQuartiles cq
  ON s.CustomerID = cq.CustomerID
ORDER BY cq.Quartile DESC, s.CustomerID;
*/  SELECT
    SalesOrderID,
    CustomerID,
    OrderDate,
    
    -- Total orders placed by this customer
    COUNT(*) OVER (
        PARTITION BY CustomerID
    ) AS Orders_By_Customer,
    -- Total orders in the entire dataset
    COUNT(*) OVER () AS Total_Orders
FROM Sales.SalesOrderHeader
ORDER BY CustomerID, OrderDate;

SELECT  
  SYSTEM_USER   AS LoginName,  
  CURRENT_USER  AS DatabaseUser;



  SELECT
    SalesOrderID,
    CustomerID,
    OrderDate,
 totaldue ,
    RANK() OVER (
        ORDER BY totaldue DESC
    ) AS RevenueRank
FROM Sales.SalesOrderHeader
ORDER BY RevenueRank;


  with  RNN AS  ( 
select row_number() over (partition by CustomerID   ORDER BY orderdate DESC )  RN , *

From Sales.SalesOrderHeader )
 
 Select * FROM RNN WHERE RN   = 1  ; 

 SELECT 
 Territoryid,
 shipdate,
 AVG(totalDue)  OVER()  ,
 AVG(TotalDue) over(order  by shipdate) ,
 Avg (Totaldue) over ( Partition by Territoryid order by Shipdate Rows between 2  PRECEDING  and current row)
 from Sales.SalesOrderHeader
 order by  1 , 2