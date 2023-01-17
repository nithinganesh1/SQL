

--Q1.
Create table Orders
(
	order_id int,
	order_date date,
	amount int,
	customer_id int
);

--customer table created in assignment 2 using same database
select * from customer


--insert some values into orders table
insert into Orders values
(901,'2022-01-15',1200,102),
(902,'2022-02-13',600,106),
(903,'2022-05-03',240,104),
(904,'2022-10-16',500,103),
(905,'2022-12-24',400,108)


select * from customer
select * from Orders


--Q2.
select * from customer inner join Orders     --inner join and join are same 
on customer.customer_id=Orders.customer_id



--Q3.

--Left Join
select * from customer left join Orders
on customer.customer_id=Orders.customer_id

--Right Join
select * from customer Right join Orders
on customer.customer_id=Orders.customer_id


--Q4.
Update Orders
set amount=100
where customer_id=103  --My table customer_id starts with 101 so i use 103 instead of 3

select * from Orders
