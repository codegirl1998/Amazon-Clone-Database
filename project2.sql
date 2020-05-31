
use master
go

if db_id('AmazonClone') is not null
	drop database AmazonClone;
go 

create database AmazonClone;
go

use AmazonClone
go

create table Customer(
	CustomerId int primary key identity not null,
	LastName varchar(50),
	FirstName varchar(50) not null,
	Email varchar(50) not null,
	Street varchar(50),
	City varchar(10),
	State varchar(2),
	ZipCode varchar(5)
);

create table Shipping(
	ShippingId int primary key identity not null,
	ShipperName varchar(20),
	ShipperPhone varchar(10),
	ShipperEmail varchar(50)
);


create table Orders(
	OrderId int primary key identity not null,
	OrderDate smalldatetime  not null,
	RequiredDate smalldatetime,
	ShippingDate smalldatetime not null,
	Price money not null check(Price>0),
	CustomerId int not null references  Customer(CustomerId),
	ShippingId int not null references Shipping(ShippingId)
);


create table Supplier(
	SupplierId int not null primary key identity,
	SupplierName varchar(30),
	Email varchar(30),
	Phone varchar(10)
);


create table Products(
	ProductId int primary key identity not null,
	ProductName varchar(30) not null,
	Price money,
	Instock char(1),
	SupplierId int not null references Supplier(SupplierId)
);



create table OrderItems(
	OrderId int  not null references Orders(OrderId),
	ProductId int  not null references Products(ProductId),
	Quantity int
	primary key(OrderId,ProductId)
);



create table Rating(
	ProductId int not null references Products(ProductId),
	CustomerId int not null references Customer(CustomerId),
	score int,
	RatingDate smalldatetime,
	comment varchar(60)
);


create table Warehouse(
	WarehouseId int not null primary key identity,
	ZipCode varchar(5),
	Name varchar(30)
);



create table Stocks(
	WarehouseId int not null references Warehouse(WarehouseId),
	ProductId int not null references Products(ProductId),
	Quantity int not null
);

create table OrdersArchive(
	OrderId int primary key identity not null,
	OrderDate smalldatetime  not null,
	RequiredDate smalldatetime,
	ShippingDate smalldatetime not null,
	Price money not null check(Price>0),
	CustomerId int not null,
	ShippingId int not null 
);

insert into Customer values ('Lee','Christine','lee@gmail.com','Havard Pl','Syracuse','NY','13210');
insert into Customer values ('Lee','Vicki','Vickilee@gmail.com','Havard Pl','New York','NY','13211');
insert into Customer values ('Anna','Grace','annagrace@gmail.com','Columbus av','Auburn','AL','14154');
insert into Customer values ('Carol','Sue','craolsue@gmail.com','Berkley dr','Phoenix','AR','14256');
insert into Customer values ('Lou','Tressa','tressalou@gmail.com','Comstock av','Prescott','AR','13210');
insert into Customer values ('Mark','John','markjohn@gmail.com','Colvin Street','Brooklyn','NY','13212');
insert into Customer values ('Jack','Bobby','bobbyjack@gmail.com','Burnet av','Buffalo','NY','13215');
insert into Customer values ('Allen','Ford','fordallen@gmail.com','Euclid av','Beacon','NY','13216');
insert into Customer values ('Brock','Will','willbrock@gmail.com','James street','Charlotte','NC','67210');

insert into Shipping values ('Brenda Enterprise','4567893456','brendaent@gmail.com');
insert into Shipping values ('Vishal Enterprise','2564789105','vishalent@gmail.com');
insert into Shipping values ('Hut Enterprise','2425347495','hutent@gmail.com');
insert into Shipping values ('Vinayaka Enterprise','1453623789','vinayakaent@gmail.com');
insert into Shipping values ('Ganesh Enterprise','3451789021','ganeshent@gmail.com');
insert into Shipping values ('Vignesh Enterprise','3564729101','vigneshent@gmail.com');
insert into Shipping values ('Srinivas Enterprise','3452617891','srinivasent@gmail.com');
insert into Shipping values ('zeroone','8972615345','zeroone@gmail.com');
insert into Shipping values ('Namana Enterprise','6782435617','namanaent@gmail.com');
insert into Shipping values ('Shiva Enterprise','8930236781','shivaent@gmail.com');

insert into Orders values ('2017-04-8','2017-4-15','2017-4-12',240.0,1,3);
insert into Orders values ('2017-04-9','2017-4-13','2017-4-11',500.0,1,4);
insert into Orders values ('2017-04-15','2017-4-20','2017-4-16',643.0,2,1);
insert into Orders values ('2017-05-12','2017-05-18','2017-05-17',890.0,3,1);
insert into Orders values ('2017-06-08','2017-6-13','2017-4-10',1000.0,4,2);
insert into Orders values ('2017-06-23','2017-06-25','2017-6-23',340.0,5,5);
insert into Orders values ('2017-07-9','2017-7-15','2017-7-11',456.0,6,6);
insert into Orders values ('2017-01-12','2017-1-20','2017-1-15',344.0,7,6);
insert into Orders values ('2017-01-15','2017-1-25','2017-4-18',235.0,8,7);
insert into Orders values ('2017-02-14','2017-2-20','2017-4-15',678.0,9,8);

insert into Supplier values('Namana','namana@gmail.com','3456789865');
insert into Supplier values('Mendoz','mendoz@gmail.com','4561243456');
insert into Supplier values('allen','allen@gmail.com','4561236783');
insert into Supplier values('Brady','brady@gmail.com','6732451678');
insert into Supplier values('Channing','channing@gmail.com','8935671234');
insert into Supplier values('Carson','crason@gmail.com','9075677845');
insert into Supplier values('Cohen','cohen@gmail.com','6782341567');
insert into Supplier values('Axton','axton@gmail.com','9845678934');
insert into Supplier values('Barnes','barnes@gmail.com','7834561789');
insert into Supplier values('Hepburn','hepburn@gmail.com','9034568734');

insert into Products values('Ann Bath Towel',150,1,1);
insert into Products values('Vanilla Bean lotion',240,1,2);
insert into Products values('Champagne toast lotion',567,1,3);
insert into Products values('Winter candy wash',567,1,4);
insert into Products values('gingham body wah',345,1,5);
insert into Products values('Twisted mint wash',567,1,6);
insert into Products values('Cherry blossom lotion',432,1,6);
insert into Products values('Ann mixer',678,1,7);
insert into Products values('black cherry juice',345,1,7);
insert into Products values('Ann Grinder',789,1,8);	

insert into OrderItems values(1,1,2);
insert into OrderItems values(2,2,2);
insert into OrderItems values(3,2,4);
insert into OrderItems values(4,3,3);
insert into OrderItems values(5,3,4);
insert into OrderItems values(6,3,5);
insert into OrderItems values(7,4,2);
insert into OrderItems values(8,4,3);
insert into OrderItems values(9,5,2);
insert into OrderItems values(10,6,5);

insert into Rating values(1,1,4,'2017-11-09','Good');
insert into Rating values(2,1,5,'2017-11-09','Good');
insert into Rating values(2,2,1,'2017-11-09','Bad quailty');
insert into Rating values(3,3,6,'2017-11-09','Good');
insert into Rating values(3,4,7,'2017-11-09','Satisfactory');
insert into Rating values(3,5,10,'2017-11-09','Excellent');
insert into Rating values(4,6,4,'2017-11-09','Good');
insert into Rating values(4,7,5,'2017-11-09','Good');
insert into Rating values(5,8,6,'2017-11-09','Good');
insert into Rating values(6,9,7,'2017-11-09','Good');

insert into Warehouse values('34561','Droom');
insert into Warehouse values('45671','Drexel');
insert into Warehouse values('34567','Aurra');
insert into Warehouse values('45678','Ayala');
insert into Warehouse values('12345','Airen');
insert into Warehouse values('98765','Cade');
insert into Warehouse values('23876','Bardan');
insert into Warehouse values('34903','Dengar');
insert into Warehouse values('23907','Deckard');
insert into Warehouse values('34215','Malcom');

insert into Stocks values(1,1,15);
insert into Stocks values(2,1,23);
insert into Stocks values(3,1,4);
insert into Stocks values(4,1,5);
insert into Stocks values (5,1,5);
insert into Stocks values(6,1,5);
insert into Stocks values(7,1,5);
insert into Stocks values(8,1,5);
insert into Stocks values(1,2,20);
insert into Stocks values(2,3,15);
insert into Stocks values(3,4,30);
insert into Stocks values(4,5,16);
insert into Stocks values (5,6,30);
insert into Stocks values(6,7,20);
insert into Stocks values(7,8,45);
insert into Stocks values(8,9,20);
