create database Intel_Assgn_CaseStudy


use Intel_Assgn_CaseStudy
GO

CREATE TABLE studies (PNAME varchar(20), INSTITUTE varchar(20), COURSE varchar(20), COURSE_FEE int )
GO

SELECT * FROM studies

INSERT INTO studies
SELECT 'ANAND','SABHARI','PGDCA',4500 UNION ALL
SELECT 'ALTAF','COIT','DCA',7200 UNION ALL
SELECT 'JULIANA','BDPS','MCA',22000 UNION ALL
SELECT 'KAMALA','PRAGATHI','DCA',5000 UNION ALL
SELECT 'MARY','SABHARI','PGDCA ',4500 UNION ALL
SELECT 'NELSON','PRAGATHI','DAP',6200 UNION ALL
SELECT 'PATTRICK','PRAGATHI','DCAP',5200 UNION ALL
SELECT 'QADIR','APPLE','HDCA',14000 UNION ALL
SELECT 'RAMESH','SABHARI','PGDCA',4500 UNION ALL
SELECT 'REBECCA','BRILLIANT','DCAP',11000 UNION ALL
SELECT 'REMITHA','BDPS','DCS',6000 UNION ALL
SELECT 'REVATHI','SABHARI','DAP',5000 UNION ALL
SELECT 'VIJAYA','BDPS','DCA',48000



CREATE TABLE software (PNAME varchar(20), TITLE varchar(20), DEVELOPIN varchar(20), SCOST decimal(10,2),  DCOST int, SOLD int)


SELECT * FROM software

INSERT INTO software
SELECT 'MARY','README','CPP',300, 1200, 84 UNION ALL
SELECT 'ANAND','PARACHUTES','BASIC',399.95, 6000, 43 UNION ALL
SELECT 'ANAND','VIDEO TITLING','PASCAL',7500, 16000, 9 UNION ALL
SELECT 'JULIANA','INVENTORY','COBOL',3000, 3500, 0 UNION ALL
SELECT 'KAMALA','PAYROLL PKG.','DBASE',9000, 20000, 7 UNION ALL
SELECT 'MARY','FINANCIAL ACCT.','ORACLE',18000, 85000, 4 UNION ALL
SELECT 'MARY','CODE GENERATOR','C',4500, 20000, 23 UNION ALL
SELECT 'PATTRICK','README','CPP',300, 1200, 84 UNION ALL
SELECT 'QADIR','BOMBS AWAY','ASSEMBLY',750, 3000, 11 UNION ALL
SELECT 'QADIR','VACCINES','C',1900, 3100, 21 UNION ALL
SELECT 'RAMESH','HOTEL MGMT.','DBASE',13000, 35000, 4 UNION ALL
SELECT 'RAMESH','DEAD LEE','PASCAL',599.95, 4500, 73 UNION ALL
SELECT 'REMITHA','PC UTILITIES','C',725, 5000, 51 UNION ALL
SELECT 'REMITHA','TSR HELP PKG.','ASSEMBLY',2500, 6000, 7 UNION ALL
SELECT 'REVATHI','HOSPITAL MGMT.','PASCAL',1100, 75000, 2 UNION ALL
SELECT 'VIJAYA','TSR EDITOR','C',900, 700, 6


CREATE TABLE programmer (PNAME varchar(20), DOB date, DOJ date, GENDER varchar(2), PROF1 varchar(20), PROF2 varchar(20), SALARY int)


SELECT * FROM programmer

INSERT INTO programmer
SELECT 'ANAND','12-Apr-66','21-Apr-92','M','PASCAL','BASIC',3200 UNION ALL
SELECT 'ALTAF','02-Jul-64','13-Nov-90','M','CLIPPER','COBOL',2800 UNION ALL
SELECT 'JULIANA','31-Jan-60','21-Apr-90','F','COBOL','DBASE',3000 UNION ALL
SELECT 'KAMALA','30-Oct-68','02-Jan-92','F','C','DBASE',2900 UNION ALL
SELECT 'MARY','24-Jun-70','01-Feb-91','F','CPP','ORACLE',4500 UNION ALL
SELECT 'NELSON','11-Sep-85','11-Oct-89','M','COBOL','DBASE',2500 UNION ALL
SELECT 'PATTRICK','10-Nov-65','21-Apr-90','M','PASCAL','CLIPPER',2800 UNION ALL
SELECT 'QADIR','31-Aug-65','21-Apr-91','M','ASSEMBLY','C',3000 UNION ALL
SELECT 'RAMESH','03-May-67','28-Feb-91','M','PASCAL','DBASE',3200 UNION ALL
SELECT 'REBECCA','01-Jan-67','01-Dec-90','F','BASIC','COBOL',2500 UNION ALL
SELECT 'REMITHA','19-Apr-70','20-Apr-93','F','C','ASSEMBLY',3600 UNION ALL
SELECT 'REVATHI','02-Dec-69','02-Jan-92','F','PASCAL','BASIC',3700 UNION ALL
SELECT 'VIJAYA','14-Dec-65','02-May-92','F','FOXPRO','C',3500

select * from programmer
select * from software
select * from studies

--Q1.
---- Find out the selling cost AVG for packages developed in Pascal.
select DEVELOPIN, avg(scost) as AVG_Selling_Cost from software
group by DEVELOPIN
having DEVELOPIN='Pascal'


--Q2.
---- Display Names, Ages of all Programmers.
select Pname, DATEDIFF(YEAR,DOB,GETDATE())as Age from programmer

--Q3.
---- Display the Names of those who have done the DAP Course. 
Select Pname,Course From studies
where COURSE='DAP'

--Q4.
---- Display the Names and Date of Births of all Programmers Born in January. 
Select Pname,DOB from programmer
where MONTH(DOB)=1

--Q5.
----What is the Highest Number of copies sold by a Package? 
select PNAME,DEVELOPIN,SOLD From software
where SOLD=(select max(SOLD) From software)

--Q6.
----Display lowest course Fee. 
select Min(COURSE_FEE)as Lowest_Course_Fee From studies

--Q7.
----How many programmers done the PGDCA Course? 
select count(COURSE) as No_of_Programmers  from studies
where COURSE='PGDCA'

--Q8.
----How much revenue has been earned thru sales of Packages Developed in C.
select sum(SCOST*SOLD) as Revenue from software
where DEVELOPIN='c'


--9.
----Display the Details of the Software Developed by Ramesh.
select DEVELOPIN , SCOST,SOLD From software
where PNAME='Ramesh'


--10.
----How many Programmers Studied at Sabhari?
select count(INSTITUTE)as No_Of_P from studies
where INSTITUTE='Sabhari'


--Q11.
----Display details of Packages whose sales crossed the 2000 Mark. 
select PNAME , SUM(SCOST*SOLD) as Totel_Sales from software
where (SCOST*SOLD)>2000
group by PNAME


--Q12.
----Display the Details of Packages for which Development Cost have been recovered.
select * from software
where (SCOST*SOLD)>=DCOST

--Q13.
----What is the cost of the costliest software development in Basic? 
select DCOST , SCOST , (DCOST*SOLD) as Revenue from software
where DEVELOPIN='basic'

--Q14.
----How many Packages Developed in DBASE? 
select count(DEVELOPIN)as No_of_package From software
where DEVELOPIN='Basic'

--Q15.
----How many programmers studied in Pragathi? 
select count(INSTITUTE) as No_of_P From studies
where INSTITUTE='Pragathi'

--Q16.
----How many Programmers Paid 5000 to 10000 for their course? 
select count(COURSE_FEE) as No_of_P From studies
where COURSE_FEE between 5000 and 10000

--Q17.
----What is AVG Course Fee 
select avg(COURSE_FEE) as Avg_Course_fee From studies

--Q18.
----Display the details of the Programmers Knowing C.
select * from programmer
where PROF1='c' or PROF2='c'

--Q19.
----How many Programmers know either COBOL or PASCAL. 
select count(PNAME) as No_Of_P from programmer
where PROF1='cobol' or PROF1='pascal' or PROF2='cobol' or PROF2='pascal'


--Q20.
----How many Programmers Don’t know PASCAL and C 
select count(PNAME) as No_Of_P_Dont_K from programmer
where PROF1<>'C' and PROF1<>'pascal' and PROF2<>'C' and PROF2<>'pascal'

--21.
----How old is the Oldest Male Programmer. 
select max(DATEDIFF(year,dob,getdate())) as Age from programmer

--22.
---- What is the AVG age of Female Programmers? 
select avg(DATEDIFF(year,dob,getdate())) as avg_age_f_p  From programmer
where GENDER='F'



--23.
---- Calculate the Experience in Years for each Programmer and Display with their names in Descending order. 
select PNAME,DATEDIFF(year,doj,getdate()) as Experience from programmer
order by PNAME desc

--24.
---- Who are the Programmers who celebrate their Birthday’s During the Current Month? 
select PNAME From programmer
where MONTH(DOB)=MONTH(Getdate())

--25.
---- How many Female Programmers are there? 
select COUNT(Gender) as No_Of_FEMP From programmer
where GENDER='F'

--26.
---- What are the Languages studied by Male Programmers. 
Select PNAME , PROF1,PROF2 from programmer
where GENDER='m'

--27.
---- What is the AVG Salary? 
select AVG(Salary) as AVG_Salary from programmer

--28.
---- How many people draw salary 2000 to 4000? 
select count(pname) from programmer
where SALARY between 2000 and 4000

--29.
---- Display the details of those who don’t know Clipper, COBOL or PASCAL.
select * from programmer
where PROF1 Not IN(SELECT PROF1 from programmer where PROF1='clipper' or PROF1='COBOL' or PROF1='PASCAL') and
PROF2 Not IN (SELECT PROF2 from programmer where PROF2='clipper' or PROF2='COBOL' or PROF2='PASCAL')

--30.
---- Display the Cost of Package Developed By each Programmer. 
select PNAME,Sum(DCOST)as Cost_of_ALLDVP From software
group by PNAME

--31.
---- Display the sales values of the Packages Developed by the each Programmer. 
select  Pname,sum(SCOST*SOLD)  From software
group by PNAME


--32.
---- Display the Number of Packages sold by Each Programmer. 
select PNAME, sum(sold) as No_of_P_sold From software
group by PNAME

--33.
---- Display the sales cost of the packages Developed by each Programmer Language wise. 
select PNAME, title,DEVELOPIN,SCOST from software
order by DEVELOPIN


--Q34.
---- Display each language name with AVG Development Cost, AVG Selling Cost and AVG Price per Copy. 
select DEVELOPIN, Avg(Dcost) avg_dcost , Avg(Scost) avg_scost, Avg(SOLD) avg_price_per_copy From software
Group by DEVELOPIN

--Q35.
----  Display each programmer’s name, costliest and cheapest Packages Developed by him or her. 
select PNAME , Max(scost) as Costliest, Min(scost) as cheapest From software
group by PNAME



--Q36. 
---- Display each institute name with number of Courses, Average Cost per Course. 
select INSTITUTE, count(COURSE) No_of_courses , avg(COURSE_FEE) avg_course_fee from studies
Group by INSTITUTE

--Q37. 
---- Display each institute Name with Number of Students. 
Select INSTITUTE,count(Pname) no_of_students From studies
Group by INSTITUTE

--Q38.
----  Display Names of Male and Female Programmers. Gender also. 
Select PNAME,GENDER from programmer

--Q39.
----  Display the Name of Programmers and Their Packages. 
select PName,TITLE From software


--Q40.
----  Display the Number of Packages in Each Language Except C and C++. 
select DEVELOPIN , count(TITLE)as NO_of_pakages From software
group by DEVELOPIN 
having not DEVELOPIN='C' and not DEVELOPIN='CPP'

--Q41.
----  Display the Number of Packages in Each Language for which Development Cost isless than 1000.
Select DEVELOPIN ,count(Developin)as NO_of_L From software
where DCOST<1000
group by DEVELOPIN


--Q42.
---- Display AVG Difference between SCOST, DCOST for Each Package. 
select title,avg(DCOST-SCOST)avg_deffernce From software
Group by TITLE

--Q43.
----  Display the total SCOST, DCOST and amount to Be Recovered for each Programmer for Those Whose Cost has not yet been Recovered.
select PNAME, SCOST,DCOST ,(Dcost-(scost*sold)) as Amt_to_be_Recovered From software
where DCOST>(SCOST*SOLD)

--Q44.
----  Display Highest, Lowest and Average Salaries for those earning more than 2000. 
Select Max(salary) as Hig_sal , MIN(salary) as low_sal , avg(salary)as avg_sal from programmer
where SALARY>2000


--Q45.
----  Who is the Highest Paid C Programmers? 
select Pname,SALARY,PROF1,PROF2  from programmer
where SALARY=(select max(salary) from programmer where PROF1='c' or PROF2='c') and (PROF1='c' or PROF2='c')


--Q46.
----  Who is the Highest Paid Female COBOL Programmer?  
select Pname,SALARY,PROF1,PROF2 , GENDER from programmer
where SALARY=(select max(salary) from programmer where (PROF1='cobol' or PROF2='cobol') and GENDER='f') and
(PROF1='cobol' or PROF2='cabol') and GENDER='f'

--Q47.
----  Display the names of the highest paid programmers for each Language.

select prof1 , max(salary)as max_s into #temtb from programmer
group by PROF1
insert into #temtb select prof2,max(salary) as max_s from programmer group by PROF2

select prof1,max(max_s)as max_s into #temtb2 from #temtb
group by PROF1

select pname,#temtb2.PROF1,max_s from programmer
inner join 
#temtb2
on programmer.PROF1=#temtb2.PROF1 or programmer.PROF2=#temtb2.PROF1
order by PROF1

drop table #temtb
drop table #temtb2


--Q48.
----  Who is the least experienced Programmer.
select Pname,DOJ From programmer
where DOJ=(select max(DOJ) from programmer)

--Q49.
----  Who is the most experienced male programmer knowing PASCAL. 
select Pname,Doj,PROF1,PROF2 from programmer
where doj=(select min(doj) from programmer where (PROF1='Pascal' or PROF2='Pascal') and GENDER='M') and GENDER='m'

--Q50.
----  Which Language is known by only one Programmer?
SELECT PROF1 as Only_k_One FROM PROGRAMMER GROUP BY PROF1
HAVING PROF1 NOT IN (SELECT PROF2 FROM PROGRAMMER) AND COUNT(PROF1)=1 
UNION 
SELECT PROF2 FROM PROGRAMMER GROUP BY PROF2
HAVING PROF2 NOT IN (SELECT PROF1 FROM PROGRAMMER) AND COUNT(PROF2)=1;

--Q51.
----  Who is the Above Programmer Referred in 50? 
select Pname from programmer where PROF1 in
(SELECT PROF1 as Only_k_One FROM PROGRAMMER GROUP BY PROF1
HAVING PROF1 NOT IN (SELECT PROF2 FROM PROGRAMMER) AND COUNT(PROF1)=1 
UNION 
SELECT PROF2 FROM PROGRAMMER GROUP BY PROF2
HAVING PROF2 NOT IN (SELECT PROF1 FROM PROGRAMMER) AND COUNT(PROF2)=1)
or PROF2 in
(SELECT PROF1 as Only_k_One FROM PROGRAMMER GROUP BY PROF1
HAVING PROF1 NOT IN (SELECT PROF2 FROM PROGRAMMER) AND COUNT(PROF1)=1 
UNION 
SELECT PROF2 FROM PROGRAMMER GROUP BY PROF2
HAVING PROF2 NOT IN (SELECT PROF1 FROM PROGRAMMER) AND COUNT(PROF2)=1)

--Q52.
----  Who is the Youngest Programmer knowing DBASE? 
select Pname,PROF1,PROF2,DOB From programmer
where (PROF1='Dbase' or PROF2='dbase') and DOB=(select Max(dob) from programmer where (PROF1='Dbase' or PROF2='dbase'))

--Q53.
----  Which Female Programmer earning more than 3000 does not know C, C++, ORACLE or DBASE? 
select Pname,gender,PROF1,PROF2,SALARY from programmer
where GENDER='f' and SALARY>3000 and PROF1 not in(select prof1 from programmer where PROF1='c' or PROF1='cpp' or PROF1='oracle' or PROF1='dbase')
and PROF2 not in (select prof2 from programmer where PROF2='c' or PROF2='cpp' or PROF2='oracle' or PROF2='dbase')

--Q54.
----  Which Institute has most number of Students?

select INSTITUTE,count(Pname)as max_S into #temtb from studies group by INSTITUTE
select INSTITUTE from studies
group by institute 
having count(pname)=(select max(max_s) from #temtb)
drop table #temtb


--Q55.
----  What is the Costliest course? 
select Course,COURSE_FEE from studies
where COURSE_FEE=(select Max(COURSE_FEE) from studies)


--Q56.
----  Which course has been done by the most of the Students? 
select count(pname) as no_of_s into #temtb1 from studies group by COURSE 

select Course , count(pname) from studies group by COURSE
having count(pname)=(select max(no_of_s) from #temtb1)
drop table #temtb1


--Q57.
----  Which Institute conducts costliest course.
select institute,COURSE,COURSE_FEE from studies
where COURSE_FEE=(select Max(COURSE_FEE) from studies)


--Q58.
----  Display the name of the Institute and Course, which has below AVG course fee. 
select INSTITUTE,course,COURSE_FEE from studies
where course_fee<(select avg(course_fee) from studies)

--Q59.
----  Display the names of the courses whose fees are within 1000 (+ or -) of the Average Fee, 
select course,COURSE_FEE from studies
where COURSE_FEE<(select avg(COURSE_FEE)+1000 from studies) and
COURSE_FEE> (select avg(COURSE_FEE)-1000 from studies)


--Q60.
----  Which package has the Highest Development cost? 
select Title from software 
where DCOST=(select max(dcost) from software)

--Q61.
----  Which course has below AVG number of Students? 
select course , count(pname)as no_of_s into #temtb from studies group by course

select COURSE from #temtb
where no_of_s<(select avg(no_of_s) from #temtb)
drop table #temtb            --Avg No of student is 1 , There are no course has zero student


--Q62.
----  Which Package has the lowest selling cost? 
select distinct TITLE from software 
where SCOST=(select min(scost) from software)

--Q63.
----  Who Developed the Package that has sold the least number of copies? 
select pname,SOLD from software
where SOLD=(select min(sold) from software)


--Q64.
----  Which language has used to develop the package, which has the highest sales amount? 
select DEVELOPIN from software
where scost=(select max(scost) from software)

--Q65.
----  How many copies of package that has the least difference between development and selling cost where sold.
select title,sold from software
where abs(DCOST-SCOST)=(select min(abs(dcost-scost)) from software)


--Q66.
----  Which is the costliest package developed in PASCAL. 
select title,DEVELOPIN from software
where scost=(select max(scost) from software where DEVELOPIN='PASCAL') and DEVELOPIN='PASCAL'

--Q67.
----  Which language was used to develop the most number of Packages. 
select count(title)as No_of_packages ,DEVELOPIN into #temtb from software group by DEVELOPIN
select DEVELOPIN,No_of_packages from #temtb
where No_of_packages=(select max(no_of_packages) from #temtb)
drop table #temtb

--Q68.
----  Which programmer has developed the highest number of Packages?
select count(title) as No_of_packages ,Pname into #temtb from software group by PNAME
select Pname,no_of_packages from #temtb
where No_of_packages=(select max(No_of_packages) from #temtb)
drop table #temtb


--Q69. 
----Who is the Author of the Costliest Package? 
select pname from software
where scost=(select max(scost) from software)

--Q70.
----Display the names of the packages, which have sold less than the AVG number of copies. 
select title from software
where SOLD<(select avg(sold) from software)


--Q71.
----Who are the authors of the Packages, which have recovered more than double the Development cost? 
select distinct pname from software
where (DCOST*2)<(SCOST*SOLD)


--Q72.
----Display the programmer Name and the cheapest packages developed by them in each language. 
select PNAME,TITLE from software
where DCOST in (select min(DCOST) from software group by DEVELOPIN)


--Q73.
----Display the language used by each programmer to develop the Highest Selling and Lowest-selling package.
select DEVELOPIN from software
where SOLD in (select max(SOLD) from software) or
SOLD in (select min(SOLD) from software)

--Q74.
----Who is the youngest male Programmer born in 1965? 
select pname from programmer
where year(DOB)=1965 and GENDER='M' and
DOB=(select max(dob) from programmer where year(DOB)=1965 and GENDER='M')

--Q75.
---Who is the oldest Female Programmer who joined in 1992?
select pname from programmer
where year(DOJ)=1992 and GENDER='f' and
DOB=(select min(dob) from programmer where year(doj)=1992 and GENDER='F')


--Q76.
----In which year was the most number of Programmers born. 
select year(dob)as dob_year,count(pname) as No_Of_P into #temtb from programmer 
group by year(DOB)
select dob_year,No_Of_P from #temtb
where No_Of_P=(select max(no_of_P) from #temtb)
drop table #temtb


--Q77.
----In which month did most number of programmers join? 
select MONTH(doj)as doj_M, count(pname)as No_Of_P into #temtb from programmer
group by MONTH(doj)
select doj_M , No_Of_P from #temtb
where No_Of_P=(select max(no_of_p) from #temtb)
drop table #temtb


--Q78.
----In which language are most of the programmer’s proficient. 
create table #temtb (Prof varchar(20), pcount int)

insert into #temtb
select prof1,count(PNAME) from programmer
group by PROF1
union all
select PROF2,count(PNAME) from programmer
group by PROF2

select prof,sum(pcount)as n_of_p into #temtb2 from #temtb group by Prof
select prof ,n_of_p from #temtb2
where n_of_p=(select max(n_of_p) from #temtb2)

drop table #temtb
drop table #temtb2


--Q79.
----Who are the male programmers earning below the AVG salary of Female Programmers? 
select pname from programmer
where GENDER='M' and SALARY<(select AVG(salary) from programmer)


--Q80.
----Who are the Female Programmers earning more than the Highest Paid? 
select * from programmer
where GENDER='f' and SALARY>(select max(salary) from programmer where GENDER='m')


--Q81.
----Which language has been stated as the proficiency by most of the Programmers? 
select prof1,count(pname) as pcnt into #temtb from programmer
group by PROF1

select prof1 from #temtb
where pcnt=(select max(pcnt) from #temtb)
drop table #temtb
----here only taken prof1 becouse it is programers first favourite language  other wise it will same as qustion 78


--Q82.
----Display the details of those who are drawing the same salary. 
select * from programmer
where SALARY in (select salary from programmer group by SALARY having count(pname)>1)
order by SALARY

--Q83.
----Display the details of the Software Developed by the Male Programmers Earning More than 3000/-. 
select software.PNAME,TITLE,DEVELOPIN,SCOST,DCOST,SOLD,SALARY,GENDER from programmer
full join software
on programmer.PNAME=software.PNAME
where SALARY>3000 and GENDER='m'
 

--Q84.
----Display the details of the packages developed in Pascal by the Female Programmers. 
select software.PNAME,TITLE,DEVELOPIN,SCOST,DCOST,SOLD,Gender from software
join  programmer
on software.PNAME=programmer.PNAME
where DEVELOPIN='Pascal' and GENDER='f'

--Q85.
----Display the details of the Programmers who joined before 1990. 
Select * from programmer
where year(DOJ)<1990

--Q86.
----Display the details of the Software Developed in C By female programmers of Pragathi. 
select software.PNAME,TITLE,DEVELOPIN,SCOST,DCOST,SOLD from software
full join studies
on software.PNAME=studies.PNAME
where DEVELOPIN='c' and INSTITUTE='PRAGATHI'

--Q87.
----Display the number of packages, No. of Copies Sold and sales value of each programmer institute wise. 
select software.PNAME,TITLE,SOLD,SCOST,INSTITUTE from software
join studies
on software.PNAME=studies.PNAME
order by INSTITUTE

--Q88.
----Display the details of the software developed in DBASE by Male Programmers,
----who belong to the institute in which most number of Programmers studied. 
select INSTITUTE,count(Pname)as max_S into #temtb from studies group by INSTITUTE
select software.PNAME,TITLE,DEVELOPIN,SCOST,DCOST,SOLD,GENDER,INSTITUTE from software
join studies
on software.PNAME=studies.PNAME
join programmer
on software.PNAME=programmer.PNAME
where GENDER='M' and DEVELOPIN='dbase' and 
INSTITUTE=(select INSTITUTE from studies group by institute having count(pname)=(select max(max_s) from #temtb))
 drop table #temtb

--Q89.
----Display the details of the software Developed by the male programmers Born before 1965 and
----female programmers born after 1975. 
select software.PNAME,TITLE,DEVELOPIN,SCOST,DCOST,SOLD,dob,gender from software
join programmer
on software.PNAME=programmer.PNAME
where GENDER='f' and year(DOB)>1975 --no female programmer born after 1975
union
select software.PNAME,TITLE,DEVELOPIN,SCOST,DCOST,SOLD,dob,gender from software
join programmer
on software.PNAME=programmer.PNAME
where GENDER='m' and year(DOB)<1965 --no male programmer born before 1965

--Q90.
----Display the details of the software that has developed in the language
----which is neither the first nor the second proficiency of the programmers. 
select * from software
where DEVELOPIN in (select prof1 from programmer) or DEVELOPIN in (select prof2 from programmer)


--Q91.
----Display the details of the software developed by the male students of Sabhari. 
select software.PNAME,TITLE,DEVELOPIN,SCOST,DCOST,SOLD,INSTITUTE,GENDER from software
join programmer
on software.PNAME=programmer.PNAME
join studies
on software.PNAME=studies.PNAME
where INSTITUTE='sabhari' and GENDER='m'

--Q92.
----Display the names of the programmers who have not developed any packages. 
select programmer.PNAME,TITLE from programmer
left join software
on software.PNAME=programmer.PNAME
where TITLE is null

--Q93.
----What is the total cost of the Software developed by the programmers of Apple? 
select sum(dcost) as totel_dcost_of_apple_student from software
join studies
on software.PNAME=studies.PNAME
where INSTITUTE='Apple' 

--Q94.
----Who are the programmers who joined on the same day? 
select PNAME,DOJ from programmer
where DOJ in (select DOJ from programmer group by DOJ having count(pname)>1)
order by DOJ

--Q95.
----Who are the programmers who have the same Prof2? 
select pname,PROF2 from programmer
where PROF2 in (select PROF2 from programmer group by PROF2 having count(pname)>1)
order by PROF2

--Q96.
----Display the total sales value of the software, institute wise. 
select INSTITUTE, sum(scost*SOLD) sum_of_earn from software
join studies
on software.PNAME=studies.PNAME
group by INSTITUTE

--Q97.
----In which institute does the person who developed the costliest package studied. 
select software.pname,INSTITUTE from software
join studies
on software.PNAME=studies.PNAME
where scost=(select max(scost) from software)

--Q98.
----Which language listed in prof1, prof2 has not been used to develop any package. 
select PROF1 as Lng into #temtb from programmer
union
select PROF2 from programmer
select * from #temtb
where lng not in (select DEVELOPIN from software)
drop table #temtb

--Q99.
----How much does the person who developed the highest selling package earn and what course did HE/SHE undergo.
select software.pname,(scost*sold)as earn,COURSE from software
join studies
on software.PNAME=studies.PNAME
where SOLD=(select max(sold) from software)


--Q100.
---- What is the AVG salary for those whose software sales is more than 50,000/-. 
select avg(salary) from programmer
join software
on software.PNAME=programmer.PNAME
where (SCOST*SOLD)>50000

--Q101.
---- How many packages were developed by students, who studied in institute that charge the lowest course fee?
select count(Title) from software
join studies
on software.PNAME=studies.PNAME
where COURSE_FEE=( select Min(COURSE_FEE) From studies)

--Q102.
----How many packages were developed by the person who developed the cheapest package, where did HE/SHE study? 
select software.PNAME,count(title),INSTITUTE from software
join studies
on software.PNAME=studies.PNAME
where software.PNAME in (select PNAME from software where SCOST =(select min(scost) from software))
group by software.PNAME,INSTITUTE


--Q103.
----How many packages were developed by the female programmers earning more than the highest paid male programmer?
select count(title) from software
join programmer
on software.PNAME=programmer.PNAME
where GENDER='f' and SALARY>(select max(salary) from programmer where GENDER='m')


--Q104.
---- How many packages are developed by the most experienced programmer form BDPS. 
select count(title) from software
join programmer
on software.PNAME=programmer.PNAME
join studies
on programmer.PNAME=studies.PNAME
where INSTITUTE='BDPS' and DATEDIFF(YEAR,DOJ,getdate())=
(select max(DATEDIFF(YEAR,DOJ,getdate())) from programmer
join studies on programmer.PNAME=studies.PNAME where INSTITUTE='BDPS')

--Q105.
----List the programmers (form the software table) and the institutes they studied. 
select distinct software.PNAME,INSTITUTE from software
join studies
on software.PNAME=studies.PNAME

--Q106.
----List each PROF with the number of Programmers having that PROF and the number of the packages in that PROF. 
create table #temtb (Prof varchar(20), pcount int)

insert into #temtb
select prof1,count(PNAME) from programmer
group by PROF1
union all
select PROF2,count(PNAME) from programmer
group by PROF2

select prof , sum(pcount) as no_of_p into #temtb2 from #temtb
group by prof
select DEVELOPIN,count(title)as no_of_pakage into #temtb3 from software
group by DEVELOPIN

select Prof,no_of_p,no_of_pakage from #temtb2 full outer join 
#temtb3
on #temtb2.Prof=#temtb3.DEVELOPIN

drop table #temtb
drop table #temtb2
drop table #temtb3

--Q107.
----List the programmer names (from the programmer table) and No. Of Packages each has developed.
select programmer.PNAME, count(title) as No_of_packages from programmer
join software
on software.PNAME=programmer.PNAME
group by programmer.PNAME