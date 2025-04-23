create database Let_Code
use let_code
-- Create the delivery table
CREATE TABLE delivery (
    delivery_id INT PRIMARY KEY,
    customer_id INT,
    order_date DATE,
    customer_pref_delivery_date DATE
);

-- Insert data into the delivery table
INSERT INTO delivery (delivery_id, customer_id, order_date, customer_pref_delivery_date)
VALUES 
    (1, 1, '2019-08-01', '2019-08-02'),
    (2, 2, '2019-08-02', '2019-08-02'),
    (3, 1, '2019-08-11', '2019-08-12'),
    (4, 3, '2019-08-24', '2019-08-24'),
    (5, 3, '2019-08-21', '2019-08-22'),
    (6, 2, '2019-08-11', '2019-08-13'),
    (7, 4, '2019-08-09', '2019-08-09');


	select *  from delivery
	select distinct Customer_id from delivery
	select count(*) from delivery
	select min (order_date) ,  max (order_date) from delivery
	select * from delivery where order_date = '2019-08-1'
	select * from delivery where order_date = customer_pref_delivery_date
	select  COUNT (*) from delivery where order_date = customer_pref_delivery_date
	select  COUNT (*) from delivery where order_date < customer_pref_delivery_date

	SELECT * FROM delivery WHERE order_date  = (select max(order_date) from delivery)
	select * from delivery order by order_date asc