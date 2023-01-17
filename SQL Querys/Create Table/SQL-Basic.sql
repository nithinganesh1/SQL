
--Q1.
create table customer
(
	customer_id int,
	first_name varchar(50),
	last_name varchar(50),
	email varchar(40),
	address varchar(30),
	city varchar(20),
	state varchar(20),
	zip int
);


--Q2.
insert into customer values
(101,'Rajesh','varma','rajeshvarma@gmail.com','1234NW lane','Mumbai','Mumbai',123456),
(102,'Anika','Arora','anikaarrora@gmail.com','2222NW lane','Tokyo','jappan',111111),
(103,'Vishal','Singhal','vishalsinghal@gmail.com','3333NW lane','Delhi','Delhi',222222),
(104,'Ganesh','Kumar','ganeshkumar@gmail.com','1111NW lane','San Jose','California',333333),
(105,'Chandrika','Chauhan','chandrikachauhan@gmail.com','4444NW lane','Kolkata','Kolkata',444444)

select * from customer


--Q3.
select first_name,last_name from customer


--Q4.
select * from customer
where first_name like 'G%' and city='San jose'

