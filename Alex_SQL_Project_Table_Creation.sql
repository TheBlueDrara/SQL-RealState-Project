--****************************************************************************************************************************************************************************************************************
--READ ME: 2
--1)Press Execute To Create All Of The Tables.
--2)Now Go And Insert All Of The Data.

--************************************************************************************************************************************************************************************************


create table Customer (
CustomerID int identity (1,1) primary key,
CustomerFirstName char (15) not null,
CustomerLastName char (20) not null,
City varchar (50) not null,
CustomerPhoneNumber varchar (10) not null,
CustomerHouseSellingPrice decimal (20, 0)
);

create table HouseType (
HouseTypeID int identity (1,1) primary key,
HouseTypeName char (50) not null
);

create table House (
HouseID int identity (1,1) primary key,
HouseTypeID int foreign key references HouseType,
HouseOwner int foreign key references Customer(CustomerID) null,
NumberOfRooms int check (NumberOfRooms > 0) not null,
ForSale bit not null,
City varchar (50)
);

create table Neighborhood (
NeighborhoodID int identity (1,1) primary key,
HouseID int foreign key references House,
AmountOfHouses int not null,
NeighborhoodName char (30) not null
);

create table City (
CityID int identity (1,1) primary key,
NeighborhoodID int foreign key references Neighborhood,
CityName char (40) not null
);

create table SalesMan (
SalesManID int identity (1,1) primary key,
HouseTypeID int foreign key references HouseType,
Employee_FirstName char (20) not null,
Employee_LastName char (30) not null,
BirthDate date not null,
EmployeeAdress varchar (50) not null,
HireDate date not null,
HomePhone varchar (10) not null
);

create table Specialization (
HouseTypeID int,
SalesManID int,
primary key (HouseTypeID,SalesManID),
foreign key (HouseTypeID) references HouseType(HouseTypeID),
foreign key (SalesManID) references SalesMan(SalesManID)
);

create table Sale (
SaleID int identity (1,1) primary key,
SalesManID int foreign key references SalesMan,
DateOfSale Date null,
CompanySellingPrice DECIMAL(20, 0) not null,
);

create table CustomerHouseHistory (
HistoryID int identity (1,1) primary key,
CustomerID int foreign key references Customer null,
HouseID int foreign key references House,
SaleID int foreign key references Sale null,
SellingDate date null,
BuyingDate date null,
CustomerHouseSellingPrice decimal (20, 0) null
);

create table SalesToSalesMan (
SaleID int,
SalesManID int,
primary key (SaleID, SalesManID),
foreign key (SaleID) references Sale(SaleID),
foreign key (SalesManID) references SalesMan(SalesManID)
);

?