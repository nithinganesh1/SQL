Create Database Assignment_2
use Assignment_2

create table Employee
(
	Employee_id int primary key,
	First_name varchar(20),
	Last_name varchar(10),
	Salary int,
	Joining_date datetime,
	Department varchar(10)
)
go

insert into Employee values
(1,'Anika','Arora',100000,'2020-02-14 09:00:00','HR'),
(2,'Veena','Varma',80000,'2011-06-15 09:00:00','Admin'),
(3,'vishal','Singhal',300000,'2020-02-16 09:00:00','HR'),
(4,'Sushanth','Singh',500000,'2020-02-17 09:00:00','Admin'),
(5,'Bhupal','Bhati',500000,'2011-06-18 09:00:00','Admin'),
(6,'Dheeraj','Diwan',200000,'2011-06-19 09:00:00','Account'),
(7,'Karan','Kumar',75000,'2020-01-14 09:00:00','Account'),
(8,'Chandrika','Chauhan',90000,'2011-04-15 09:00:00','Admin')

Create table Employee_Bonus
(
	employee_ref_id int,
	Bonus_Amount int,
	Bonus_Date datetime
	FOREIGN KEY(employee_ref_id) REFERENCES Employee(Employee_id)
);

insert into Employee_Bonus values
(1,5000,'2020-02-16'),
(2,3000,'2020-06-16'),
(3,4000,'2020-02-16'),
(1,4500,'2020-02-16'),
(2,3500,'2020-06-16')

select * from employee
select * from Employee_Bonus

create table Employee_Title
(
	Employee_ref_id int,
	Employee_title varchar(15),
	Affective_date Datetime
	Foreign key(Employee_ref_id) References Employee(Employee_id)
);


insert into Employee_Title values
(1,'Manager','2016-02-20'),
(2,'Executive','2016-02-20'),
(8,'Executive','2016-02-20'),
(5,'Manager','2016-02-20'),
(4,'Asset Manager','2016-02-20'),
(7,'Executive','2016-02-20'),
(6,'Lead','2016-02-20'),
(3,'Lead','2016-02-20')

select * from Employee_Title

--Q1.
---- Display the “FIRST_NAME” from Employee table using the alias name as Employee_name

select First_name as Employee_name from Employee


--Q2.
---- Display “LAST_NAME” from Employee table in upper case.

select UPPER(Last_name) from Employee


--Q3.
----Display unique values of DEPARTMENT from EMPLOYEE table.

select DISTINCT Department from Employee


--Q4.
---- Display the first three characters of LAST_NAME from EMPLOYEE table.

select SUBSTRING(Last_name,1,3) from Employee


--Q5.
---- Display the unique values of DEPARTMENT from EMPLOYEE table and prints its length.

select DISTINCT Department, len(Department) as Length_of_dpt from Employee


--Q6.
---- Display the FIRST_NAME and LAST_NAME from EMPLOYEE table into a single column AS FULL_NAME

select CONCAT(First_name,Last_name) as Full_Name from Employee


--Q7.
----DISPLAY all EMPLOYEE details from the employee table order by FIRST_NAME Ascending

Select * from Employee
order by First_name


--Q8.
----Display all EMPLOYEE details order by FIRST_NAME Ascending and DEPARTMENT Descending.

Select * from Employee
order by  Department desc , First_name asc


--Q9.
---- Display details for EMPLOYEE with the first name as “VEENA” and “KARAN” from EMPLOYEE table.

select * from Employee
where First_name='veena' or First_name='karan'


--Q10.
---- Display details of EMPLOYEE with DEPARTMENT name as “Admin”

select * from Employee 
where Department='Admin'


--Q11.
---- DISPLAY details of the EMPLOYEES whose FIRST_NAME contains ‘V’

select * from Employee
where First_name like 'v%'or First_name like '%v%' or First_name like '%v'


--Q12.
---- DISPLAY details of the EMPLOYEES whose SALARY lies between 100000 and 500000.

select * from Employee
where Salary between 100000 and 500000


--Q13.
---- Display details of the employees who have joined in Feb-2020.

select * from Employee
where year(joining_date)=2020 and MONTH(Joining_date)=2

--Q14.
---- Display employee names with salaries >= 50000 and <= 100000

select First_name,Last_name,Salary from Employee
where Salary >=50000 and Salary<=100000


--Q15.
----There are No Q15

--Q16.
---- DISPLAY details of the EMPLOYEES who are also Managers.

select * from Employee
right join Employee_Title
on Employee.Employee_id=Employee_title.Employee_ref_id
where Employee_title.Employee_title='Manager'


--Q17.
---- DISPLAY duplicate records having matching data in some fields of a table

select count(Employee_ref_id)as Repeting_Times, employee_ref_id from Employee_Bonus
group by employee_ref_id 
having count(employee_ref_id)>1


--Q18.
---- Display only odd rows from a table

select * from Employee
where Employee_id % 2 <>0


--Q19.
---- Clone a new table from EMPLOYEE table

select * into copy_table_emp from Employee

select * from copy_table_emp
select * from Employee


--Q20.
---- DISPLAY the TOP 2 highest salary from a table
 
select * from Employee
where Salary=(select max(salary) from employee) --This will give 2 values becouse max salary same in both emp

--or

select Top 2 * from Employee
order by Salary desc
---Here it will first arange table desc on salary and take first 2 rows Then it will Top 2 Highest salary


--Q21.
---- DISPLAY the list of employees with the same salary.
SELECT * FROM Employee
WHERE Salary IN (
    SELECT Salary FROM Employee
    GROUP BY Salary
    HAVING COUNT(*) > 1
)



--Q22.
---- Display the second highest salary from a table.
select * from Employee
where salary=(select max(Salary) from Employee
where Salary<(select max(Salary) From Employee)) --this line will give all detail lower than max salary and check again max
                                                 --salary , it will give 2nd max salary and select all details from employee 
												 -- using value of 2nd max sal


--Q23.
---- Display the first 50% records from a table.

select top 50 percent * from Employee


--Q24.
---- Display the departments that have less than 4 people in it.


select count(Department),Department from Employee
group by Department
having count(Department)>=4


--Q25.
---- Display all departments along with the number of people in there.select count(Department) as [no of people in there] ,Department from Employee
group by Department--Q26.---- Display the name of employees having the highest salary in each department.select * from Employeewhere Salary in (select max(Salary)as [Highest sal of dept] from employeegroup by Department)--Q27.---- Display the names of employees who earn the highest salary.select first_name, Salary from Employeewhere Salary=(select max(salary) from Employee)--Q28.---- Diplay the average salaries for each departmentselect avg(Salary) as [avg salary],Department from Employeegroup by Department--Q29.---- Display the name of the employee who has got maximum bonusselect First_name,Bonus_Amount From Employeejoin Employee_Bonuson Employee.Employee_id=Employee_Bonus.employee_ref_idwhere Employee_Bonus.Bonus_Amount=(select max(Bonus_Amount) from Employee_Bonus)--Q30.---- Display the first name and title of all the employeesselect First_name , Employee_Title from Employeejoin Employee_Titleon Employee.Employee_id=Employee_Title.Employee_ref_id