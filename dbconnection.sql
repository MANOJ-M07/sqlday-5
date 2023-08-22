create database OurDb
use OurDb

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