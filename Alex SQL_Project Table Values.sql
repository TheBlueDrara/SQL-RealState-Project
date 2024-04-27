--****************************************************************************************************************************************************************************************************************
--READ ME: 2
--1)Create Tables First!
--2)Press Execute To insert All The Data Into The Tables.

--****************************************************************************************************************************************************************************************************************


insert into Customer values
('Shir','Nemo','Haifa', 0535408404, 45000),
('Neo','Adkins','Haifa', 0520460630, 41000),
('Micheal ','Hardy','Haifa', 0538011811, 27000),
('Florence ','Robinson','Haifa', 0502042415, 56000),
('Moshe ','Gregory','TLV', 0523383490, 33000),
('Lula ','Randall','Jerusalm', 0520565935, 34000),
('Richard','Lewis','Jerusalm', 0524343545, 12000),
('Ronan ','Meza','Jerusalm', 0524343455, 14000),
('Maddie ','Peterson','TLV.', 0528343545, 56000),
('Savannah ','Coleman','TLV', 0524993545, 48000),
('Savasdah','Colegman','TLV', 0524933545, 48000),
('Savaaaannah','Colddeman','TLV', 0524993245, 45000);


insert into HouseType values
('Townhome'),
('TreeHouse'),
('Tent'),
('Cottage'),
('FarmHouse'),
('Duplex'),
('Apartment'),
('Mansion'),
('Castle'),
('Hut');


insert into House values 
(1, 1, 3, 1,'TLV'),
(2, 2, 4, 1,'TLV'),
(3, 3, 4, 1,'TLV'),
(4, 4, 3, 1,'TLV'),
(5, 5, 5, 1,'TLV'),
(6, 6, 5, 0,'TLV'),
(7, 7, 2, 0,'TLV'),
(8, 8, 3, 0,'TLV'),
(9, 9, 2, 0,'TLV'),
(10, 10, 4, 0,'TLV'),
(4,null,7,1,'TLV'),
(3,null,8,1,'TLV');


 insert into SalesMan values
(1, 'Bob', 'Hungry', '2000-11-04', '16 Peretz Carlen', '2020-11-21', '0526908882'),
(2, 'Dora', 'Campbell', '1999-01-08', '7 Kehilat Riga', '2018-11-21', '0535508882'),
(3, 'Jodie', 'Gilmore', '1999-02-22', '22 Hatabor', '2021-11-03', '0526945682'),
(4, 'Caroline', 'Duncan', '2000-04-26', '30 Iben Gabirol', '2019-11-20', '0528898882'),
(5, 'Floyd', 'Bryan', '1998-12-03', '10 Aharonson Sara', '2023-11-12', '0526907768'),
(6, 'Alistair', 'Reyes', '1999-10-11', '20 Lillenblum', '2019-11-30', '0526633882'),
(7, 'Nikolas', 'Bond', '1999-12-30', '6 Abarbanel', '2019-11-30', '0526909452'),
(8, 'Allan', 'Beck', '2000-01-25', '10 Hachshar Hayeshuv', '2019-07-21', '0524568882'),
(9, 'Siena', 'Tucker', '2001-03-08', '27 Hamelech George', '2019-01-21', '0526902382'),
(10, 'Tyler', 'Padilla', '2000-11-04', '21 Ozer Haim', '2019-12-18', '0526988882');


insert into Specialization values
(1, 1),
(2, 2),
(3, 3),
(4, 4),
(5, 5),
(6, 6),
(7, 7),
(8, 8),
(9, 9),
(10, 10);


insert into Sale values
(1, '2021-09-29', 80000),
(2, '2022-01-13', 77000),
(3, '2022-01-27', 68000),
(4, '2022-05-25', 90000),
(5, '2022-07-29', 95000),
(6, null, 97000),
(7, null, 45000),
(8, null, 76000),
(9, null, 88000),
(10, null, 76000);


insert into Neighborhood values
 (1,12,'Hatikva'),
 (2,15,'Sapir'),
 (3,30,'Gordon'),
 (4,20,'Naftali'),
 (5,78,'Nitzhan'),
 (6,90,'Koma'),
 (7,30,'Dor'),
 (8,20,'Moshe'),
 (9,5,'BabaSali'),
 (10,12,'Moti');


 insert into City values
(1, 'Haifa'),
(2, 'Ashdod'),
(3, 'Ashkelon'),
(4, 'Keryat-Ata'),
(5, 'Bat-Yam'),
(6, 'Tel-Aviv'),
(7, 'Keryat-Shmona'),
(8, 'Jerusalem'),
(9, 'Bnei-Brak'),
(10, 'Jerusalem');



insert into CustomerHouseHistory values 
(1, 1, 1, '2022-09-28', '2019-09-10', 40000),
(2, 2, 2, '2012-08-10', '2014-06-07', 34000),
(3, 3, 3, '2023-07-15', '2017-02-20', 27000),
(4, 4, 4, '2015-06-28', '2016-08-22', 33000),
(5, 5, 5, '2016-02-21', '2018-01-23', 10000),
(6, 6, 6, null, '2023-09-22', null),
(7, 7, 7, null, '2021-06-12', null),
(8, 8, 8, null, '2022-04-23', null),
(9, 9, 9, null, '2023-02-11', null),
(10, 10, 10, null, '2022-09-21', null),
(11, 11, null, '2017-09-05', null, null),
(12, 12, null, '2023-09-05', null, null);


