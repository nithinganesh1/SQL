Create database Project

--Define Realation/attributes.

----     Attribute relationships define how tables and columns are joined and used, and which tables are related to other tables.
---- Without relationships, there is no interaction between data, and therefore no logical structure.
---- The relationships give meaning to the data by providing logical associations - of attributes based on business rules.
---- A relationship between two database tables presupposes that one of them has a foreign key that references the primary key of another table.
---- There are parent attribute and child attributes , Each element of parent attribute,corresponds to-
---- child attribute and each element of child attribute corresponds to parent attribute .



--Primary Key.

----Primary Key is a constraint that cannot use Not null values and each iteams must be Unique.
----Primary Key uniquely identifies each record in a table.
----Each Table Can use only one Primary Key.
----Primary Key will sort data.

--Create foreign keys.

create table role
(
	id int primary key,
	role_name varchar(100) not null
)

go

create table user_account
(
	id int primary key,
	user_name varchar(100) not null,
	email varchar(254) not null,
	password varchar(200) not null,
	password_salt varchar(50),
	password_hash_algorithm varchar(50)
)

go

create table user_has_role
(
	id int primary key,
	role_start_time datetime not null,
	role_end_time datetime,
	user_account_id int foreign key references user_account(id),
	role_id int foreign key references role(id)
)

go

create table status
(
	id int primary key,
	status_name varchar(100) not null,
	is_user_working bit not null
)

go

create table user_has_status
(
	id int primary key,
	status_start_time datetime not null,
	status_end_time datetime,
	user_account_id int foreign key references user_account(id),
	status_id int foreign key references status(id)
)


insert into role values
(1,'Hr Manager'),
(2,'Leader'),
(3,'Accountent'),
(4,'Supervisor')

insert into user_account values
(101,'MARY','mary@gmail.com','12345','12345$23G%','43k33br43lgr'),
(102,'ANAND','anand@gmail.com','an12nd','an12nd#13M%','13la334grls32'),
(103,'JULIANA','juliana@gmail.com','juliana123',null,'54m33la43nd3'),
(104,'PATTRICK','pattirck@gmail.com','pattrick1111','pattrick1111#33#m%','87n56l83he')

insert into user_has_role values
(201,'2019/04/01','2020/03/31',101,1),
(202,'2020/04/01','2021/03/31',102,2),
(203,'2021/04/01','2022/03/31',103,3),
(204,'2022/04/01',Null,103,3)

insert into status values
(301,'Hr Manager',1),
(302,'Leader',0),
(303,'Accountent',1),
(304,'Supervisor',1)

insert into user_has_status values
(401,'2019/04/01','2020/03/31',101,301),
(402,'2020/04/01',Null,102,302),
(403,'2021/04/01','2022/03/31',103,303),
(404,'2022/04/01',Null,104,304)

select * from role
select * from user_account
select * from user_has_role
select * from status
select * from user_has_status

Truncate table user_has_status

alter table user_has_status drop constraint [FK__user_has___statu__46E78A0C]
alter table user_has_status drop constraint [FK__user_has___user___45F365D3]

Truncate table status

truncate table user_has_role

alter table user_has_role drop constraint [FK__user_has___role___412EB0B6]
alter table user_has_role drop constraint [FK__user_has___user___403A8C7D]

truncate table user_account

truncate table role

select * from role
select * from user_account
select * from user_has_role
select * from status
select * from user_has_status