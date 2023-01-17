--Q1.
----Create a view named ‘customer_san_jose’ which comprises of only those customers who are from san jose

create view customer_san_jose as
select * from customer
where city='san jose'

select * from customer_san_jose

--Q2.
----2.	Inside a transaction, update the first name of the customer to Francis, where the last name is Jordan
--a.	Rollback the transaction
--b.	Set the first name of customer to Alex, where the last name is Jordan


begin transaction 
update customer
set first_name='Francis'
where last_name='Jordan'

select * from customer

Rollback transaction

select * from customer

--Q3.
BEGIN TRY  
	select 100/0  
END TRY  
BEGIN CATCH    
    select ERROR_MESSAGE() as Zero_Devision_error;
END CATCH;   