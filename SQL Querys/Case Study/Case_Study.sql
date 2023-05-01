Create database Case_study
use Case_study

Create Table LOCATION
(
	Location_ID Int Primary key,
	City Varchar(20),
)

Insert Into LOCATION values
(122,'New York'),
(123,'Dallas'),
(124,'Chicago'),
(167,'Boston')

select * from LOCATION

Create Table DEPARTMENT 
(
	Department_Id int primary key,
	Name Varchar(20),
	Location_Id int foreign key References Location(location_id)
)

Insert into DEPARTMENT Values
(10,'Accounting',122),
(20,'Sales',124),
(30,'Research',123),
(40,'Operations',167)

select * from DEPARTMENT

create table JOB
(
	Job_ID int primary key,
	Designation Varchar(20)
)

insert into JOB values
(667,'Clerk'),
(668,'Staff'),
(669,'Analyst'),
(670,'Sales Person'),
(671,'Manager'),
(672,'President')

select * from job

create table Employee
(
	Employee_id int,
	Last_Name varchar(20),
	First_Name varchar(20),
	Middle_Name Varchar(5),
	Job_ID int foreign key references JOB(Job_ID),
	Manager_ID int ,
	[Hire Date] date,
	Salary money,
	comm int,
	Department_id int foreign key References DEPARTMENT(Department_id)
)
insert into Employee values
(7369 , 'SMITH' , 'JOHN', 'Q' , 667 , 7902 , '1984-12-17' , 800 , NULL , 20),
(7499 ,'ALLEN' , 'KEVIN' , 'J' , 670 , 7698 , '1985-02-20' , 1600 , 300 , 30),
(7505 ,'DOYLE' , 'JEAN' , 'K' , 671 , 7839 , '1985-04-04' , 2850 , NULL , 30),
(7506 ,'DENNIS' , 'LYNN' , 'S' , 671 , 7839 , '1985-05-15' , 2750 , NULL , 30),
(7507, 'BAKER' , 'LESLIE' , 'D' , 671 , 7839 , '1985-06-10' , 2200 , NULL , 40),
(7521 ,'WARK' , 'CYNTHIA' , 'D' , 670  , 7698 , '1985-02-22' , 1250 , 500 , 30)

select * from Employee

--SIMPLE QUERIES:

----1. LIST ALL THE EMPLOYEE DETAILS.
select * from Employee

----2. LIST ALL THE DEPARTMENT DETAILS.
select * from DEPARTMENT

----3. LIST ALL JOB DETAILS.
select * from JOB

----4. LIST ALL THE LOCATIONS.
select * from LOCATION

----5. LIST OUT THE FIRSTNAME, LASTNAME, SALARY, COMMISSION FOR ALL EMPLOYEES.
select First_Name,Last_Name,Salary,comm from Employee

----6. LIST OUT EMPLOYEEID,LAST NAME, DEPARTMENT ID FOR ALL EMPLOYEES AND ALIAS 
     --EMPLOYEEID AS "ID OF THE EMPLOYEE", LAST NAME AS "NAME OF THE EMPLOYEE", DEPARTMENTID AS "DEP_ID".
select Employee_id as [ID OF THE EMPLOYEE] , Last_Name as [NAME OF THE EMPLOYEE] ,
Department_id as DEP_ID from Employee

----7. LIST OUT THE EMPLOYEES ANNUAL SALARY WITH THEIR NAMES ONLY.
select Last_Name as Name ,Salary from Employee

--WHERE CONDITION:

----1. LIST THE DETAILS ABOUT "SMITH"
select * from Employee
where Last_Name='SMITH'

----2. LIST OUT THE EMPLOYEES WHO ARE WORKING IN DEPARTMENT 20.
select * from Employee
where Department_id=20

----3. LIST OUT THE EMPLOYEES WHO ARE EARNING SALARY BETWEEN 3000 AND 4500.
select * from Employee
where Salary between 3000 and 4500 

----4. LIST OUT THE EMPLOYEES WHO ARE WORKING IN DEPARTMENT 10 OR 20.
select * from Employee
where Department_id=10 or Department_id= 20

----5. FIND OUT THE EMPLOYEES WHO ARE NOT WORKING IN DEPARTMENT 10 OR 30.
select * from Employee
where Department_id <>10 and Department_id<> 30

----6. LIST OUT THE EMPLOYEES WHOSE NAME STARTS WITH 'S'.
select * from Employee
where Last_Name like 's%'

----7. LIST OUT THE EMPLOYEES WHOSE NAME STARTS WITH 'S' AND ENDS WITH 'H'.
select * from Employee
where Last_Name like 's%' or Last_Name like 'H%'

----8. LIST OUT THE EMPLOYEES WHOSE NAME LENGTH IS 4 AND START WITH 'S'.
select * from Employee
where len(Last_Name)=4 and Last_Name like 's%'

----9. LIST OUT EMPLOYEES WHO ARE WORKING IN DEPARRTMENT 10 AND DRAW THE SALARIES MORE THAN 3500.
select * from Employee
where Department_id=10 and Salary>3500

----10. LIST OUT THE EMPLOYEES WHO ARE NOT RECEVING COMMISSION.
select * from Employee
where comm is not null

--ORDER BY CLAUSE:
----1. LIST OUT THE EMPLOYEE ID, LAST NAME IN ASCENDING ORDER BASED ON THE EMPLOYEE ID.
select Employee_id,Last_Name from Employee
order by Employee_id

----2. LIST OUT THE EMPLOYEE ID, NAME IN DESCENDING ORDER BASED ON SALARY.
select Employee_id,Last_Name from Employee
order by Salary desc

----3. LIST OUT THE EMPLOYEE DETAILS ACCORDING TO THEIR LAST-NAME IN ASCENDING ORDER AND
select * from Employee
order by Last_Name

----4. LIST OUT THE EMPLOYEE DETAILS ACCORDING TO THEIR LAST-NAME IN ASCENDING ORDER
----AND THEN ON DEPARTMENT_ID IN DESCENDING ORDER.
select * from Employee
order by Department_id desc, Last_Name

--GROUP BY & HAVING CLAUSE

----1. HOW MANY EMPLOYEES WHO ARE IN DIFFERENT DEPARTMENTS WISE IN THE ORGANIZATION.
select Department_id,count(last_name)as no_of_e from Employee
group by Department_id

----2. LIST OUT THE DEPARTMENT WISE MAXIMUM SALARY, MINIMUM SALARY, AVERAGE SALARY OF THE EMPLOYEES.
select Department_id,MAX(Salary) as MAX_S , MIN(Salary) as MIN_S , AVG(Salary) as AVG_S from Employee
Group by Department_id

----3. LIST OUT JOB WISE MAXIMUM SALARY, MINIMUM SALARY, AVERAGE SALARIES OF THE EMPLOYEES.
select Job_ID, MAX(Salary) as MAX_S , MIN(Salary) as MIN_S , AVG(Salary) as AVG_S from Employee
Group by Job_ID

----4. LIST OUT THE NUMBER OF EMPLOYEES JOINED IN EVERY MONTH IN ASCENDING ORDER.
Select Month([Hire Date]) as Month_Of_Joined , count(Employee_id) as No_Of_E from Employee
Group by MONTH([Hire Date])

----5. LIST OUT THE NUMBER OF EMPLOYEES FOR EACH MONTH AND YEAR, IN THE ASCENDING ORDER BASED ON THE YEAR, MONTH.
select MONTH([Hire Date])as Month,YEAR([Hire Date]) as Year,count(Employee_id)as No_Of_E from Employee
group by MONTH([Hire Date]),YEAR([Hire Date])
order by Year([Hire Date])

----6. LIST OUT THE DEPARTMENT ID HAVING ATLEAST FOUR EMPLOYEES.
select Department_id from Employee
group by Department_id
having count(Employee_id)>=4

----7. HOW MANY EMPLOYEES JOINED IN JANUARY MONTH.
select count(Employee_id) as No_of_Emp from Employee
where MONTH([Hire Date])=1

----8. HOW MANY EMPLOYEES JOINED IN JANUARY OR SEPTEMBER MONTH.
select count(Employee_id) as No_of_Emp from Employee
where MONTH([Hire Date])=9 or MONTH([Hire Date])=1


----9. HOW MANY EMPLOYEES WERE JOINED IN 1985?
select count(Employee_id)as No_Of_E_in_1985 from Employee
where year([Hire Date])=1985

----10. HOW MANY EMPLOYEES WERE JOINED EACH MONTH IN 1985.
select MONTH([Hire Date]) as Month_Of_J , count(Employee_id) as No_of_Emp from Employee
where year([Hire Date])=1985
group by MONTH([Hire Date])


----11. HOW MANY EMPLOYEES WERE JOINED IN MARCH 1985?
select count(Employee_id) from Employee
where year([Hire Date])=1985 and MONTH([Hire Date])=3

----12. WHICH IS THE DEPARTMENT ID, HAVING GREATER THAN OR EQUAL TO 3 EMPLOYEES JOINED IN APRIL 1985?
select Department_id,count(Employee_id)as no_of_emp from Employee
where MONTH([Hire Date])=4 and year([Hire Date])=1985
group by Department_id
having count(Employee_id)>=3



--JOINS
----1. LIST OUT EMPLOYEES WITH THEIR DEPARTMENT NAMES.
Select Last_Name,Name from Employee
join DEPARTMENT
On Employee.Department_id=DEPARTMENT.Department_Id

----2. DISPLAY EMPLOYEES WITH THEIR DESIGNATIONS.
select Last_name, Designation from Employee
join JOB
On Employee.Job_ID=JOB.Job_ID

----3. DISPLAY THE EMPLOYEES WITH THEIR DEPARTMENT NAMES AND REGIONAL GROUPS.
select Last_name,City from Employee
join DEPARTMENT
On Employee.Department_id=DEPARTMENT.Department_Id
join LOCATION
On LOCATION.Location_ID=DEPARTMENT.Location_Id

----4. HOW MANY EMPLOYEES WHO ARE WORKING IN DIFFERENT DEPARTMENTS AND DISPLAY WITH DEPARTMENT NAMES.
select Name, count(Employee_id) as No_Of_Emp from Employee
join DEPARTMENT
On Employee.Department_id=DEPARTMENT.Department_Id
Group by DEPARTMENT.Name

----5. HOW MANY EMPLOYEES WHO ARE WORKING IN SALES DEPARTMENT.
select count(Employee_id) from Employee
join DEPARTMENT
On Employee.Department_id=DEPARTMENT.Department_Id
where Name='sales'

----6. WHICH IS THE DEPARTMENT HAVING GREATER THAN OR EQUAL TO 5
   -- EMPLOYEES AND DISPLAY THE DEPARTMENT NAMES IN ASCENDING ORDER.
select Name,count(Employee_id) from Employee
join DEPARTMENT
On Employee.Department_id=DEPARTMENT.Department_Id
group by Name
having count(Employee_id)>=5

----7. HOW MANY JOBS IN THE ORGANIZATION WITH DESIGNATIONS.
select Designation, count(Employee.Job_ID)no_of_J from Employee
join JOB
on JOB.Job_ID=Employee.Job_ID
group by Designation

----8. HOW MANY EMPLOYEES ARE WORKING IN "NEW YORK".
select count(Employee_id) from Employee
join DEPARTMENT
On Employee.Department_id=DEPARTMENT.Department_Id
join LOCATION
On DEPARTMENT.Location_Id=LOCATION.Location_ID
where City='NEW YORK'

----9. DISPLAY THE EMPLOYEE DETAILS WITH SALARY GRADES.
create table Salary_Grades
(
	Grade int,
	Min_Salary int,
	Max_Salary int
)

Insert into Salary_Grades Values
(1,0,1000),
(2,1001,2000),
(3,2001,3000),
(4,3001,4000),
(5,4001,5000)

select * from Employee
join Salary_Grades
On Employee.Salary  between Salary_Grades.Min_Salary and Salary_Grades.Max_Salary

----10. LIST OUT THE NO. OF EMPLOYEES ON GRADE WISE.
select Grade,count(Employee_id)as No_of_E from Employee
join Salary_Grades
On Employee.Salary  between Salary_Grades.Min_Salary and Salary_Grades.Max_Salary
group by Grade

----11. DISPLAY THE EMPLOYEE SALARY GRADES AND NO. OF EMPLOYEES BETWEEN 2000 TO 5000 RANGE OF SALARY.
select Min_Salary,Max_Salary, Grade,count(Employee_id)as No_of_E from Employee
join Salary_Grades
On Employee.Salary  between Salary_Grades.Min_Salary and Salary_Grades.Max_Salary
where Grade between 3 and 5         --Grade 3 and 5 = salary between 2000 and 5000
Group by Grade,Max_Salary,Min_Salary

---Q12 to Q15 need a manager table, in this question, there is no manager table
---Support told me that 'ignore all the questions where Manager is present'

----16. DISPLAY ALL EMPLOYEES IN SALES OR OPERATION DEPARTMENTS.
select Employee_id,Last_Name,First_Name,Name as Departments from Employee
join DEPARTMENT
On DEPARTMENT.Department_Id=Employee.Department_id
where Name='Sales' or Name='Operations'




--SET OPERATORS
--1. LIST OUT THE DISTINCT JOBS IN SALES AND ACCOUNTING DEPARTMENTS.
select Designation from JOB where Job_ID in 
(select Job_ID from Employee where Department_id= (select Department_id from DEPARTMENT where Name='Sales'))
union
select Designation from JOB where Job_ID in
(select Job_id from Employee where Department_id=(select Department_id from DEPARTMENT where Name='Accounting'))



--2. LIST OUT ALL THE JOBS IN SALES AND ACCOUNTING DEPARTMENTS.
select Designation from JOB where Job_ID in 
(select Job_ID from Employee where Department_id in (select Department_id from DEPARTMENT where Name='Sales'))
union all
select Designation from JOB where Job_ID in
(select Job_id from Employee where Department_id=(select Department_id from DEPARTMENT where Name='Accounting'))

--3. LIST OUT THE COMMON JOBS IN RESEARCH AND ACCOUNTING DEPARTMENTS IN ASCENDING ORDER
select Designation from JOB where Job_ID in 
(select Job_ID from Employee where Department_id in (select Department_id from DEPARTMENT where Name='Sales'))
intersect
select Designation from JOB where Job_ID in
(select Job_id from Employee where Department_id=(select Department_id from DEPARTMENT where Name='Accounting'))

--SUB QUERIES
----1. DISPLAY THE EMPLOYEES LIST WHO GOT THE MAXIMUM SALARY.
Select Employee_id,Last_Name,Salary from Employee where Salary=(select max(salary) from Employee)

----2. DISPLAY THE EMPLOYEES WHO ARE WORKING IN SALES DEPARTMENT.
Select Employee_id,Last_Name,Department_id from Employee
where Department_id=(select Department_id from DEPARTMENT where Name='Sales')

----3. DISPLAY THE EMPLOYEES WHO ARE WORKING AS 'CLERCK'.
Select Employee_id,Last_Name,Job_ID from Employee
where Job_ID=(select Job_ID from JOB where Designation='Clerk')

----4. DISPLAY THE LIST OF EMPLOYEES WHO ARE LIVING IN "NEW YORK".
Select Employee_id,Last_Name from Employee
where Department_id in (select Department_id from DEPARTMENT
where Location_Id=(select Location_Id from LOCATION where City='NEW YORK'))

----5. FIND OUT NO. OF EMPLOYEES WORKING IN "SALES" DEPARTMENT.
Select count(Employee_id)as No_Of_E from Employee
where Department_id=(select Department_id from DEPARTMENT where Name='Sales')

----6. UPDATE THE EMPLOYEES SALARIES, WHO ARE WORKING AS CLERK ON THE BASIS OF 10%.

--Before Updating
select salary from Employee
where job_id=(select Job_ID from JOB where Designation='Clerk')

update Employee
set Salary=Salary+(Salary*0.1)
where Job_ID=(select Job_ID from JOB where Designation='Clerk')

--After Updating
select salary from Employee
where job_id=(select Job_ID from JOB where Designation='Clerk')

----7. DELETE THE EMPLOYEES WHO ARE WORKING IN ACCOUNTING DEPARTMENT.
Delete from Employee
where Department_id=(select Department_id from DEPARTMENT where Name='Accounting')

----8. DISPLAY THE SECOND HIGHEST SALARY DRAWING EMPLOYEE DETAILS.
Select Employee_id,Last_Name,Salary from Employee
where Salary=(select max(salary) from Employee where Salary<(select max(Salary) from Employee))

----9. DISPLAY THE N'TH HIGHEST SALARY DRAWING EMPLOYEE DETAILS.
Select Employee_id,Last_Name,Salary,Dense_rank() over(Order by salary) RE into #temtb from Employee
select * from #temtb
--Here 2 is the nth position we can change it and find any other position
where RE=2
drop table #temtb

----10. LIST OUT THE EMPLOYEES WHO EARN MORE THAN EVERY EMPLOYEE IN DEPARTMENT 30.
select Employee_id,Last_Name,Department_id,Salary from Employee
where Department_id=30 and Salary=(select max(salary) from Employee where Department_id=30)

----11. LIST OUT THE EMPLOYEES WHO EARN MORE THAN THE LOWEST SALARY IN DEPARTMENT 30.
select Employee_id,Last_Name,Department_id,Salary from Employee
where Department_id=30 and Salary>(select min(salary) from Employee where Department_id=30)

----12. FIND OUT WHOSE DEPARTMENT HAS NOT EMPLOYEES.
select Name from DEPARTMENT
left join Employee 
on DEPARTMENT.Department_Id=Employee.Department_id
where Employee.Department_id is null

----13. FIND OUT WHICH DEPARTMENT DOES NOT HAVE ANY EMPLOYEES.
select Name from DEPARTMENT
left join Employee 
on DEPARTMENT.Department_Id=Employee.Department_id
where Employee.Department_id is null

----14. FIND OUT THE EMPLOYEES WHO EARN GREATER THAN THE AVERAGE SALARY FOR THEIR DEPARTMENT
select Employee_id,Last_Name,Salary,DEPARTMENT_id, avg(salary)
over(partition by department_id)as avg_s into #temtb from Employee

select * from #temtb
where Salary>avg_s
drop table #temtb

