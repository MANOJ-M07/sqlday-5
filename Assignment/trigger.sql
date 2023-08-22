create database Assessment05Db
use Assessment05Db

create schema bank

create table bank.customer
(CId int primary key,
CName varchar(50),
CEmail varchar(50),
CContact float,
CPwd varchar(50))

create table bank.MailInfo
(MailTo varchar(50),
MailDate date,
MailMessage text)

create trigger trgMailToCust
on bank.customer
after insert
as
begin
declare @MailTo varchar(50)
declare @MailDate date
declare @MailMessage nvarchar(max)

select @MailTo = CEmail, @MailDate = getdate(), @MailMessage = 'your net banking password is:oj1020. It is valid up to 2 days only. please update it.'
from inserted 
insert into bank.MailInfo (MailTo, MailDate,MailMessage)
values(@MailTo,@MailDate, @MailMessage)
end

insert into bank.customer (CId, CName, CEmail, CContact, CPwd)
values(1000,'manoj','manoj@gamil.com','8953264120','oj1020')

update bank.customer
set CPwd = 'new_password'
where CId = 1000;

select * from bank.customer
select * from bank.MailInfo
