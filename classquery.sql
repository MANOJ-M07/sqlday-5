create database Day5Db
use Day5Db
create table Emp
(Id int,
Name nvarchar(50),
Salary float)

insert into Emp values (2,'Sam',98000.50)
insert into Emp values (12,'Ravi',98000.50)
insert into Emp values (5,'Raj',98000.50)
insert into Emp values (6,'Deep',98000.50)
select * from Emp
select * from Emp where Id=5

---create clustered index indexname
--on<tablename>(column);

create clustered index Emp_Id_Index on Emp(Id)
select * from Emp where Name='Deep'

drop table Emp

create table Emp
(Id int primary key,
Name nvarchar(50),
salary float)
Create clustered index Emp_Id_Index on Emp(Id)
insert into Emp values (2,'Sam',98000.50)
insert into Emp values (12,'Ravi',98000.50)
insert into Emp values (5,'Raj',98000.50)
insert into Emp values (6,'Deep',98000.50)
select * from Emp
-----------------------------------
create index emp_Salar_Index on Emp(Salary)
-------
---create nonclustered index Ix_purchaseorderdetail_RejectedQty
--ON purchasing.purchaseorderdetail
--- (RejectedQty desc, productid ASC, duedate, orderQty);
-------Go
----------------------------------------
create table Customers
(CId int primary key,
CName nvarchar(50) not null,
CODLimit float)

insert into Customers values (1,'Sam',98000.50)
insert into Customers values (2,'Ravi',98000.50)
insert into Customers values (3,'Raj',98000.50)
insert into Customers values (4,'Deep',98000.50)
insert into Customers values (5,'ritesh',98000.50)
insert into Customers values (7,'amit',98000.50)

select * from Customers

create view cust_view
as
select CName,CODlimit from Customers

select * from cust_view
insert into Customers values (8,'Deep',75000.50)
select * from cust_view
delete from cust_view where CName = 'Deep'
select * from cust_view

alter view cust_view
as
select CODlimit from Customers

create view cust_view2
as
select CName,CId from Customers


insert into cust_view2 values ('Nitesh',15)
select * from cust_view2

alter table customers drop column CName

select * from cust_view
select * from cust_view2

create schema bank

create table bank.Customers
(CId int primary key,
CName nvarchar(50) not null,
CODLimit float)

insert into bank.Customers values (1,'sam',89000.50)
insert into bank.Customers values (2,'deep',89000.50)
insert into bank.Customers values (3,'amit',89000.50)
insert into bank.Customers values (4,'vinay',89000.50)
insert into bank.Customers values (5,'ritesh',89000.50)
insert into bank.Customers values (7,'deep',89000.50)

create view bank.cust_view2
with schemabinding
as
select CName,CId from bank.Customers

select * from bank.cust_view2

alter table bank.Customers drop column CName

use joinExDb
create view viewEmpDept
as
select e.Id,e.Fname+' '+e.Lname'full name',d.DName 'Department',d.DId,e.Salary,e.Designation
from Emps e join Depts d on e.DId=d.DId

select * from viewEmpDept where Department='web-developement'
select * from viewEmpDept where Salary>=860000
select * from viewEmpDept where Salary<=860000
----------------------------------------------------------------

create schema sales

create table Sales.Employees
(ID int primary key,
FirstName nvarchar(50),
LastName nvarchar(50),
Department nvarchar(50) not null check (Department in ('sales','HR','IT','Other')))

insert into sales.Employees values (1,'sam','dicosta','sales')
insert into sales.Employees values (2,'aman','singh','hr')
insert into sales.Employees values (3,'rishi','keash','it')
insert into sales.Employees values (4,'aishu','warya','sales')
insert into sales.Employees values (9,'romika','sri','sales')
insert into sales.Employees values (10,'sree','haran','hr')
insert into sales.Employees values (11,'cathy','david','it')
insert into sales.Employees values (13,'kirthi','raja','sales')
select * from sales.Employees
--CTE Example
with sales_emp
as
(
select * from sales.Employees where Department='sales'
)
select count(*) as 'number of employee in sales' from sales_emp
-------------------------------------------------
----select
with myemp(Emp_Id,Emp_Name,Emp_Dept)
as
(
select Id,FirstName,Department from sales.Employees
)
select Emp_Id,Emp_Name from myemp
---insert
with myemp(Emp_Id,Emp_Name,Emp_Dept)
as
(
select Id,FirstName,Department from sales.Employees
)
insert myemp(Emp_id,Emp_Name,Emp_Dept) values(18,'deepak','sales')

--delete
with myemp(Emp_Id,Emp_Name,Emp_Dept)
as
(
select Id,FirstName,Department from sales.Employees
)
delete myemp where Emp_Id=16
---update
with myemp(Emp_Id,Emp_Name,Emp_Dept)
as
(
select Id,FirstName,Department from sales.Employees
)
update myemp set Emp_Name = 'raj' where Emp_Id=4

select *from sales.Employees

--------------------------
create table Employees
(ID int primary key,
FirstName nvarchar(50),
LastName nvarchar(50),
ManagerID int)
insert into Employees values (1,'sam','dicosta',null)
insert into Employees values (2,'sam','dicosta',1)
insert into Employees values (9,'sam','dicosta',null)
insert into Employees values (4,'sam','dicosta',1)
insert into Employees values (6,'sam','dicosta',3)
insert into Employees values (7,'sam','dicosta',1)
insert into Employees values (9,'sam','dicosta',3)
select * from Employees
------CTE recursive
with DirectReports
as
(
select ID,FirstName,LastName
from Employees
where ManagerID=1
union all
select e.ID, e.FirstName, e.LastName
from Employees e
join DirectReports d on e.ManagerID = d.ID
)

select * from DirectReports
------------------------------------------
