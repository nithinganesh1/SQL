use Assignments


--Q1.
-- Arrange the ‘Orders’ dataset in decreasing order of amount
select * from Orders
order by amount desc

--Q2.
-- Create a table with name ‘Employee_details1’ and comprising of these columns – ‘Emp_id’, 
--‘Emp_name’, ‘Emp_salary’. Create another table with name ‘Employee_details2’, which 
--comprises of same columns as first table.create table Emplayee_details1
(
	Emp_id int,
	Emp_name varchar(20),
	Emp_salary int
)create table Emplayee_details2
(
	Emp_id int,
	Emp_name varchar(50),
	Emp_salary int
);
insert into Emplayee_details1 values
(101,'Shyam',35000),
(103,'Ramesh',55000),
(104,'Kamala',45000),
(106,'Mary',50000),
(107,'Anne',40000),
(108,'Reethu',50000)

go

insert into Emplayee_details2 values
(102,'Sonu',50000),
(105,'Ram',50000),
(108,'Reethu',50000),
(107,'Anne',40000),
(109,'Reshma',50000),
(110,'Manu',50000)

select * from Emplayee_details1
select * from Emplayee_details2


--Q3.
---- Apply the union operator on these two tables
select * from Emplayee_details1
union
select * from Emplayee_details2


--Q4.
----Apply the intersect operator on these two tables
select * from Emplayee_details1
INTERSECT
select * from Emplayee_details2


--Q5.
----Apply the except operator on these two tables
select * from Emplayee_details1
except
select * from Emplayee_details2
