use Assignments

select * from Orders

--Q1.
---Use the inbuilt functions and find the minimum, maximum and average amount from the orders table

select min(amount) as minimum from Orders
select max(amount) as maximum from Orders
select avg(amount) as avarage from Orders


--Q2.
--- Create a user-defined function, which will multiply the given number with 10

Create Function multiplyby10 ( @Num int)
Returns int 
as
begin
	return @Num*10
end


select dbo.multiplyby10 (15)
select dbo.multiplyby10 (10)


---Q3. 
---Use the case statement to check if 100 is less than 200, greater than 200 or equal to 200 and print the corresponding value

select
CASE
	When 100<200 Then 'SMALLER'
	When 100>200 Then 'Greater'
	Else 'EQUAL'
END