with  FullNames as 
(
select FirstName + ' ' + LastName as fullnames ,  *     from Northwind2021.dbo.Customer
order by Northwind2021.dbo.Customer.Id
) 
