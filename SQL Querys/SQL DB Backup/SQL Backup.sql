use AdventureWorks2012


--1.
----Get all the details from the person table including email ID, phone number, and phone number type 

select person.EmailAddress.BusinessEntityID,EmailAddress,PhoneNumber,Name from person.EmailAddress 
inner join person.PersonPhone on person.EmailAddress.BusinessEntityID=person.PersonPhone.BusinessEntityID 
inner join person.PhoneNumberType on Person.PersonPhone.PhoneNumberTypeID=person.PhoneNumberType.PhoneNumberTypeID


--2.
---- Get the details of the sales header order made in May 2011

select * from Sales.SalesOrderHeader
where year(OrderDate)=2011

--3.
---- Get the details of the sales details order made in the month of May 2011 

select * from Sales.SalesOrderHeader
where month(OrderDate)=5 and year(OrderDate)=2011


--4.
---- Get the total sales made in May 2011 
select count(SalesOrderID)as no_of_sales_may_2011 from sales.SalesOrderHeader
where month(OrderDate)=5 and year(OrderDate)=2011


--5.
---- Get the total sales made in the year 2011 by month order by increasing sales 
select month(OrderDate)as months_in_2011,count(SalesOrderID)no_of_sales from sales.SalesOrderHeader
where year(OrderDate)=2011
group by month(OrderDate)
order by no_of_sales

--6.
---- Get the total sales made to the customer with FirstName='Gustavo' and LastName ='Achong'

select lastname,salesytd,saleslastyear from [HumanResources].[Employee] as e
inner join person.person as p on e.businessEntityID=p.businessentityid
inner join sales.salesperson as s on e.businessentityid=s.businessentityid
where firstname='Gustavo' and lastname='Achong'

