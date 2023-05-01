create database as2
use as2

select * from Continent
select * from Customers
select * from [Transaction]

EXEC sp_rename 'Transaction' , 'Transactions'
select * from Transactions



--1) Display the count of customer in each region who has done the transaction in year 2020
select Region_name,count(*) Customer from customers
join Continent on continent.region_id = customers.region_id
join Transactions on transactions.customer_id = Customers.customer_id
group by Region_name,year(Txn_date)
having year(txn_date)=2020


--2) Display the maximum, minimum of transaction amount of each transaction type.
select txn_type,max(txn_amount) Max_amount,min(txn_amount) min_amount from Transactions
group by txn_type



--3) Display customer id, region name and transaction amount where transaction type is deposit and transaction amount > 2000.
select transactions.customer_id,region_name,txn_amount from Continent
join Customers on Customers.region_id = Continent.region_id 
join Transactions on Customers.customer_id = Transactions.customer_id
where txn_amount> 2000 and txn_type = 'deposit'

--4) Find duplicate records in a customer table.
SELECT  customer_id, COUNT(*) as duplicate_rows FROM customers 
GROUP BY customer_id 
HAVING COUNT(*) > 1


--5) Display the detail of customer id, region name, transaction type and transaction amount for the minimum transaction amount in deposit.
select customers.customer_id,region_name,txn_type,txn_amount from Continent
join Customers on Customers.region_id = Continent.region_id 
join Transactions on Customers.customer_id = Transactions.customer_id
where txn_amount = (select  min(txn_amount) from Transactions)


--6) Create a stored procedure to display details of customer and transaction table where transaction date is greater than Jun 2020.
create procedure details_of_customers
as begin
	select * from Customers
	join Transactions on Customers.customer_id= Transactions.customer_id
	where txn_date > '2020-06-30'
end

exec details_of_customers


--7) Create a stored procedure to insert a record in the continent table.
CREATE PROCEDURE insert_continent @region_name VARCHAR(50)
AS
BEGIN
  INSERT INTO Continent (region_name)
  VALUES (@region_name);
  SELECT SCOPE_IDENTITY() AS new_region_id;
END


--8) Create a stored procedure to display the details of transactions that happened on a specific day.
create Procedure details_of_txn @date date
as
begin
	select * from Transactions
	where txn_date = @date
end

exec details_of_txn @date='2020-01-01'


--9) Create a user defined function to add 10% of the transaction amount in a table.
CREATE FUNCTION increase10p (@transasctionid int)
RETURNS money
AS
BEGIN
  DECLARE @amount int;
  select @amount = txn_amount * 1.1
  from Transactions
  where customer_id = @transasctionid
  RETURN @amount
END

SELECT *,
dbo.increase10p(customer_id) AS new_transaction_amount
FROM  Transactions;

--10) Create a user defined function to find the total transaction amount for a given transaction type.

CREATE FUNCTION sum_amt (@type VARCHAR(10))
RETURNS INT AS 
BEGIN
    DECLARE @total_amount INT
    SET @total_amount = (SELECT SUM(txn_amount) FROM Transactions WHERE txn_type = @type)
    RETURN @total_amount
END

--11) Create a table value function which comprises of the following columns customer_id, region_id ,txn_date , txn_type , txn_amount which will retrieve data from the above table.
CREATE FUNCTION transactionsss()
RETURNS TABLE
AS
RETURN
(
    SELECT customers.customer_id, continent.region_id, txn_date, txn_type, txn_amount from Continent
	join Customers on Customers.region_id = Continent.region_id 
	join Transactions on Customers.customer_id = Transactions.customer_id
)

SELECT * FROM dbo.transactionsss()

--12) Create a try catch block to print a region id and region name in a single column.
BEGIN TRY
    SELECT concat( region_id ,' ', Region_Name ) AS Region FROM Continent
END TRY
BEGIN CATCH
    PRINT 'Error occurred: ' + ERROR_MESSAGE()
END CATCH


--13) Create a try catch block to insert a value in the continent table.
Begin Try
	insert into Continent 
	values(6,'North America'),
		  (7,'South America')
End Try
Begin Catch
	print 'Error occurred:' + Error_Message()
end catch


--14) Create a trigger to prevent deleting a table in a database.
Create Trigger deleting_table_from_db
On Database
	For Drop_Table
as Begin
	SET NOCOUNT ON
    RAISERROR ('Deleting tables is not allowed',16,1)
    ROLLBACK
END

drop table Continent
		

--15) Create a trigger to audit the data in a table.
create Table Aduit_Track 
(Region_id int,Region_name varchar(10))

create Trigger audit_data
on continent
	AFTER INSERT, UPDATE, DELETE
AS
BEGIN
	IF EXISTS (SELECT * FROM inserted)
	Begin
		INSERT INTO Aduit_Track (Region_id, Region_name)
        SELECT Region_id, Region_name FROM inserted
	End
	IF EXISTS (SELECT * FROM deleted)
    BEGIN
        -- Insert deleted rows into the Aduit_Track table
        INSERT INTO Aduit_Track (Region_id, Region_name)
        SELECT Region_id, Region_name FROM deleted
    END
END

INSERT INTO continent (Region_id, Region_name) 
VALUES (6, 'North America')

--16) Create a trigger to prevent login of the same user id in multiple pages.
CREATE TRIGGER Prevent_login
ON ALL SERVER WITH EXECUTE AS 'sa'
FOR LOGON
AS
BEGIN
  DECLARE @LoginName sysname
  DECLARE @LoginType sysname
  
  SET @LoginName = ORIGINAL_LOGIN()
 
  IF(@LoginName NOT IN ('sa', 'LAPTOP-OBB7EFHU\NITHIN')) 
  BEGIN
    ROLLBACK; --Disconnect the session
  END
END


--17) Display top n customers on the basis of transaction type.
SELECT customer_id, txn_type, sum_txn_amt
FROM (
    SELECT c.customer_id, txn_type, SUM(txn_amount) AS sum_txn_amt,
        ROW_NUMBER() OVER (PARTITION BY txn_type ORDER BY SUM(txn_amount) DESC) AS rank
    FROM Customers C
    JOIN Transactions T ON C.customer_id = T.customer_id
    GROUP BY txn_type, c.customer_id
) AS ranked_customers
WHERE rank <= 3
ORDER BY txn_type, sum_txn_amt DESC




--18) Create a pivot table to display the total purchase, withdrawal and deposit for all the customers
SELECT *
FROM 
(
    SELECT customer_id, txn_type, txn_amount
    FROM Transactions
) AS t
PIVOT 
(
    SUM(txn_amount)
    FOR txn_type IN (Purchase, Withdrawal, Deposit)
) as p
