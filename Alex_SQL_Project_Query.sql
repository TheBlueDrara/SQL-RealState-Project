--****************************************************************************************************************************************************************************************************************
--READ ME: 2
--1)First Create The Tables And Insert The Data.

--************************************************************************************************************************************************************************************************





--1)

select HouseTypeName, SUM(CompanySellingPrice - CustomerHouseSellingPrice) as 'YearlyProfit'
from HouseType
inner join House on HouseType.HouseTypeID = House.HouseTypeID
inner join CustomerHouseHistory on House.HouseID = CustomerHouseHistory.HouseID
inner join Sale on Sale.SaleID = CustomerHouseHistory.SaleID
where Year(SellingDate) = Year(Getdate())
group by HouseTypeName

--2)

select CustomerFirstName
from Customer C
inner join CustomerHouseHistory CHH on C.CustomerID = CHH.CustomerID
inner join Sale S on S.SaleID = CHH.SaleID
where SellingDate is not null
and CompanySellingPrice > CHH.CustomerHouseSellingPrice


--3)

select top (1) NeighborhoodName, CityName, AVG(CompanySellingPrice) as 'AverageSellingPrice'
from Neighborhood N
inner join City C on N.NeighborhoodID = C.NeighborhoodID
inner join House H on H.HouseID = N.HouseID
inner join CustomerHouseHistory CHH on H.HouseID = CHH.HouseID
inner join Sale S on S.SaleID = CHH.SaleID
where SellingDate is not null
group by NeighborhoodName, CityName
order by 'AverageSellingPrice' Desc

--4) 

with YearlySales as (
select SM.SalesManID , SUM(CompanySellingPrice - CustomerHouseSellingPrice) as 'TotallYearlyProfit', YEAR(SellingDate) as 'YearOfSale'
from SalesMan SM
inner join Sale S on SM.SalesManID = S.SalesManID
inner join CustomerHouseHistory CHH on S.SaleID = CHH.SaleID
where SellingDate is not null
group by YEAR(SellingDate), SM.SalesManID
)

select Employee_FirstName, max(TotallYearlyProfit) as 'HighestProfit', YearOfSale
from YearlySales as YS
inner join SalesMan SM on YS.SalesManID = SM.SalesManID
group by Employee_FirstName, YearOfSale
order by YearOfSale desc


--5)

select h.HouseID
from CustomerHouseHistory ch inner join Customer c
on ch.CustomerID = c.CustomerID
inner join House h
on ch.HouseID = h.HouseID and c.city = h.city
inner join ( select *
      from House
      where forsale = 1 and HouseOwner is null) S
      on h.NumberOfRooms < S.NumberOfRooms
where DATEDIFF(year,buyingdate,GETDATE()) >=2
order by 1









