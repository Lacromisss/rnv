create database tas
use tas
create table Catagories(
Id int primary key identity,
Name nvarchar(40) not null
)
create Table Sliders(
Id int primary key identity,
Title nvarchar(100) not null,
text nvarchar(500) not null,
Image nvarchar(100) not null,
Orderr int not null
)
create table Tags(
Id int primary key identity,
Name nvarchar(40) not null,

)
create table Products(
Id int primary key identity,
Name nvarchar(40) not null,
Price int not null,
CatagoriesId int foreign key references Catagories(Id) not null,
DisCountAmount decimal(18,2) not null,
isNew bit,
Count int not null,
Description nvarchar(1500) not null,
Code nvarchar(20) not null,
CostPrice decimal(18,2) not null
)
create table ProductTags(
Id int primary key identity,
ProductsId int foreign key references Products(Id) not null,
TagsId int foreign key references Tags(Id) not null,
)
create table Users(
Id int primary key identity,
FullName nvarchar(100) not null,
EMAIL nvarchar(150) not null,
Image nvarchar(100) not null,
PasswordHash nvarchar(100) not null,
Address nvarchar(100) not null,
)
create table Reviews(
Id int primary key identity,
ProductsId int foreign key references Products(Id) not null,
UserId int foreign key references Users(Id) not null,
Name nvarchar(100) not null,
EMAIL nvarchar(150) not null,
Text nvarchar(350) not null,
CreatedAt datetime2 DEFAULT(GETUTCDATE()) not null,

)
create table Orders(
Id int primary key identity,
UserId int foreign key references Users(Id) not null,
CreatedAt datetime2 not null,
DeliveriedAtt datetime2 not null,
Stasus tinyint not null,
PaymentStasus tinyint not null,
TotalAmount decimal(18,2) not null,
)
create table ProductImages(
Id int primary key identity,
ProductsId int foreign key references Products(Id) not null,
Image nvarchar(100) not null,
)

create table AdditionalInfosTypes(
Id int primary key identity,
Name nvarchar(100) not null,

)
create table AdditionalInfos(
Id int primary key identity,
ProductsId int foreign key references Products(Id) not null,
AdditionalTypes int foreign key references AdditionalInfosTypes(Id) not null,
Value nvarchar(50) not null
)
create table OrderItems(
Id int primary key identity,
ProductsId int foreign key references Products(Id) not null,
OrdersId int foreign key references Orders(Id) not null,
Count int ,
Price int 

)
insert into Catagories
values
('Inci Ciceyi'),
('Lale')
insert into Tags
values
('tag1'),
('tag2')
insert into Products
values
('toxum',20,1,15,0,3,'bomba bir seydi','code1',5),
('toxum2',18,2,18,1,3,'toxum 2 bomba bir seydi','code2',10)
insert into ProductTags
values
(1,1),
(2,2)
insert into Users
values
('Mustafa Qasimzade','lacromis@gmail.com','image1','652Musi','Afrikacunqli'),
('Mozart Lacromis','mozart13@gmail.com','image2','lacro123','Azerbaycan')
insert into Reviews
values 
(1,2,'Elmeddin''ajskadk@gmail.com','qaqa bu mallar cox babat bir seydi','2022-10-10')
insert into Orders 
values
(1,'2022-10-10','2022-10-11',2,8,15),
(2,'2022-10-12','2022-10-15',3,10,20)
insert into ProductImages
values
(2,'images1'),
(1,'images2')
insert into AdditionalInfosTypes
values
('ev bitkisidir'),
('endemik bitkidir')
insert into AdditionalInfos
values
(1,2,'value1'),
(2,2,'values2')
insert into OrderItems
values
(1,2,4,25),
(2,2,8,30)
select * from Products
select  count(Id) as 'Order sayi' from Orders

select *from Users
where (select count(Id) from Orders where Users.Id=Users.Id)=0



select Users.Id,Users.FullName,Users.EMAIL,Orders.TotalAmount, from Users 
join Orders  on  Orders.Id=Users.Id



