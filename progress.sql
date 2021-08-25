USE CarRental
GO
--Making the Transaction Table with Primary key using TransactionID
Create Table Transactions
(
	TransactionID int Identity(1,1) NOT NULL,
	TransactionDate datetime NOT NULL,
	Constraint PK_TransactionID Primary Key (TransactionID)  --Primary Key
);

Alter table Transactions
ADD custID int,
constraint FK_custID_trans
	foreign key (custID) references Customers(custID);

Alter table Transactions
ADD carID int,
constraint FK_carID_trans
	foreign key (carID) references Cars(carID);

Update Transactions
	SET carID = 1, custID = 4
	Where transactionID = 1;

Update Transactions
	SET carID = 2, custID = 4
	Where transactionID = 2;

Update Transactions
	SET carID = 2, custID = 3
	Where transactionID = 3;

Update Transactions
	SET carID = 3, custID = 1
	Where transactionID = 4;
	
Update Transactions
	SET carID = 4, custID = 2
	Where transactionID = 5;

Update Transactions
	SET carID = 2, custID = 2
	Where transactionID = 6;


--Inserting 6 rows to Transactions table
SET IDENTITY_INSERT Transactions ON
Insert Into Transactions(TransactionID, TransactionDate)
Values
	('1','2020-10-1 10:17:27:440'),
	('2','2020-10-2 9:17:27:440'),
	('3','2020-10-3 12:17:27:440'),
	('4','2020-10-6 8:17:27:440'),
	('5','2020-10-16 10:30:27:440'),
	('6','2020-10-26 10:50:27:440')
SET IDENTITY_INSERT Transactions OFF

--Create Cars table
Create Table Cars
(
	carID int NOT NULL,
	Make nvarchar(30) NOT NULL,
	Model nvarchar(30) default null,
	"Year" int default 0,
	Color nvarchar(20) default null,
	Constraint PK_carID Primary Key (carID)
)

--Insert value to Cars
Insert into Cars(carID, Make, Model, "Year", Color)
Values 
	(1, 'Tesla', 'Model S', 2019, 'Red'),
	(2, 'Toyota', 'Tacoma', 2018, 'Tan'),
	(3, 'BMW', 'i8', 2019, 'White'),
	(4, 'Honda', 'Civic', 2017, 'Black')

Create Table Customers
(
	custID int NOT Null,
	"Name" nvarchar(80) NOT Null,
	"Email" nvarchar(200) Default Null,
	Constraint PK_custID Primary Key (custID)
)

SET IDENTITY_INSERT Transactions ON
Insert into Customers(custID, "Name", "Email")
Values
	(1, 'John Doe', 'johndoe@jd.com'),
	(2, 'Jane Doe', 'janedoe@jd.com'),
	(3, 'Jet Li', 'jli@jd.com'),
	(4, 'Jackie Chan', 'jchan@jd.com')
SET IDENTITY_INSERT Transactions OFF

--create Employees table
Create table Employees
(
	TransactionID int NOT Null,
	empID int NOT Null,
	"Name" nvarchar(80) NOT Null,
	"Email" nvarchar(200) Default Null,
	constraint FK_TransactionID_emp
	foreign key (TransactionID) references Transactions(TransactionID),
)

Insert into Employees(TransactionID, empID, "Name", "Email")
Values
	(1, 1, 'Iron Man', 'iman@jd.com'),
	(6, 1, 'Iron Man', 'iman@jd.com'),
	(5, 2, 'Steve Rogers', 'srogers@jd.com'),
	(4, 2, 'Steve Rogers', 'srogers@jd.com'),
	(2, 2, 'Steve Rogers', 'srogers@jd.com'),
	(3, 2, 'Steve Rogers', 'srogers@jd.com')

--Create destination table
Create table Destination
(
	TransactionID int Not Null,
	custID int Not Null,
	toCity nvarchar(20),
	toState nvarchar(20),
	toZip int,
	fromcity nvarchar(20),
	fromState nvarchar(20),
	fromZip int,
	constraint fk_custID_des foreign key (custID) references Customers(custID),
	constraint fk_transactionID_des foreign key (transactionID) references Transactions(transactionID),
)

Insert into Destination
(
	TransactionID,
	custID,
	toCity,
	toState,
	toZip,
	fromcity,
	fromState,
	fromZip
)
values
	(1, 4, 'Seattle', 'WA',98101 , 'Renton', 'WA', 98055),
	(2, 4, 'Seattle', 'WA', 98101, 'Redmond', 'WA',98052 ),
	(3, 3, 'Los Angeles', 'CA',90002 , 'Seattle', 'WA',98101 ),
	(4, 1, 'NYC', 'NY',10001 , 'Fayettvile', 'NC', 28311),
	(5, 2, 'Seattle', 'WA',98101 , 'NYC', 'NY',10001 ),
	(6, 2, 'Redmond', 'WA',98052 , 'Los Angeles', 'CA',90002 )