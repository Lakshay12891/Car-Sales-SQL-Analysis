create database Carsales;

use carsales;

show tables;

select * from car_sales_data;

create table Manufacturer_country(
	Manufacturer varchar(100),
    Country varchar(100)
    );
    
INSERT INTO manufacturer_country (Manufacturer, Country) VALUES
('Ford', 'USA'),
('Porsche', 'Germany'),
('Toyota', 'Japan'),
('VW', 'Germany'),
('Honda', 'Japan'),
('Hyundai', 'South Korea'),
('Kia', 'South Korea'),
('Mercedes', 'Germany'),
('BMW', 'Germany'),
('Audi', 'Germany'),
('Chevrolet', 'USA'),
('Nissan', 'Japan'),
('Jaguar', 'UK'),
('Land Rover', 'UK'),
('Renault', 'France'),
('Peugeot', 'France'),
('Volvo', 'Sweden'),
('Skoda', 'Czech Republic'),
('Suzuki', 'Japan'),
('Mazda', 'Japan'),
('Tata', 'India'),
('Mahindra', 'India'),
('Fiat', 'Italy'),
('Jeep', 'USA'),
('Subaru', 'Japan'),
('Mitsubishi', 'Japan'),
('Lexus', 'Japan'),
('Mini', 'UK'),
('Infiniti', 'Japan'),
('Tesla', 'USA');

select * from manufacturer_country;

-- 1. Basic SELECT Queries

-- Show all records from the table.

select * from car_sales_data;

-- Display only Manufacturer, Model, and Price.

select Manufacturer,Model,price from car_sales_data;

-- Show all cars manufactured after 2015.

select * from car_sales_data where `Year of manufacture`>2015;

-- List all Distinct fuel types.

select distinct `fuel type` from car_sales_data;

-- Display the top 10 cheapest cars.

select * from car_sales_data order by price limit 10;

-- Show all cars where the manufacturer is “Ford”.

select * from car_sales_data where manufacturer='ford';

-- Show cars having mileage more than 100000.

select * from car_sales_data where mileage>100000;

-- Show models whose price is between 10,000 and 20,000.

select * from car_sales_data where price between 10000 and 20000;

-- List all cars with fuel type “Diesel” or “Hybrid”.

select * from car_sales_data where `fuel type` between 'diesel' and 'hybrid';

-- Display cars ordered by Price descending.

select * from car_sales_data order by price desc;


-- 2. Filtering & Conditions

-- Find all petrol cars made after 2010.

select * from car_sales_data where `fuel type`='petrol' and `year of manufacture`>2010;

-- List all manufacturers with models that have mileage under 50,000.

select manufacturer,model from car_sales_data where mileage<50000;

-- Display all cars priced above the average price.

select * from car_sales_data where price>(select avg(price) from car_sales_data); 

-- Show all cars where Manufacturer starts with ‘T’.

select * from car_sales_data where manufacturer like 'T%';

-- Find cars whose model name ends with ‘a’.

select * from car_sales_data where model like '%a';

-- Display all rows with missing (NULL) engine size (if any).

select * from car_sales_data where `engine size` is null;

-- Find all cars having price between 5000 and 25000 and mileage under 60,000.

select * from car_sales_data where price between 5000 and 25000 and mileage<60000;

-- Show the newest car for each fuel type.

SELECT c.*
FROM car_sales_data c
JOIN (
    SELECT `Fuel type`, MAX(`Year of manufacture`) AS newest_year
    FROM car_sales_data
    GROUP BY `Fuel type`
) t
ON c.`Fuel type` = t.`Fuel type`
AND c.`Year of manufacture` = t.newest_year;

-- 3. Aggregation Functions

-- Find the total number of cars.

select count(*) from car_sales_data;

-- Calculate the average price of all cars.

select avg(price) from car_sales_data;

-- Get the minimum and maximum mileage.

select max(mileage),min(mileage) from car_sales_data;

-- Find the average price for each manufacturer.

select manufacturer,avg(price) from car_sales_data group by manufacturer;

-- Show total number of models per manufacturer.

select manufacturer,count(model) from car_sales_data group by manufacturer;

-- Display average engine size by fuel type.

select `fuel type`,avg(`engine size`) from car_sales_data group by `fuel type`;

-- Find the count of cars made each year.

select `year of manufacture`,count(model) from car_sales_data group by `year of manufacture`;

-- Find which year had the highest average car price.

select `year of manufacture`,avg(price) from car_sales_data group by `year of manufacture` order by avg(price) desc limit 1;

-- 4. GROUP BY and HAVING

-- Group cars by Manufacturer and show their average mileage.

select manufacturer,avg(mileage) from car_sales_data group by manufacturer;

-- Find manufacturers having more than 1000 cars in the dataset.

select manufacturer,count(model) from car_sales_data group by manufacturer having count(model)>1000;

-- List fuel types with an average price above 20,000.

select `fuel type`,avg(price) from car_sales_data group by `fuel type` having avg(price)>2000;

-- Show each fuel type’s count, ordered by descending average price.

select count(`fuel type`) from car_sales_data order by avg(price) desc;

-- Find manufacturers with average engine size greater than 2.0.

select manufacturer from car_Sales_data group by manufacturer having avg(`engine size`)>2.0;

-- 5. Subqueries

-- Find all cars whose price is higher than the overall average price.

select * from car_sales_data where price>(select avg(price) from car_sales_data);

-- Find manufacturers having at least one car priced above 40,000.

select distinct manufacturer from car_sales_data where manufacturer in (select manufacturer from car_sales_data where price>40000); 

-- Display cars that have the same price as the most expensive Ford car.

select * from car_sales_data where price=(select max(price) from car_sales_data where manufacturer='Ford');

-- List models whose mileage is below the manufacturer’s average mileage.

select * from car_sales_data where mileage<(select avg(mileage) from car_sales_data);

-- Show the oldest car(s) in the dataset.

select * from car_sales_data where `year of manufacture`=(select min(`year of manufacture`) from car_sales_data);

-- Get cars made in the same year as the most expensive car.

select * from car_sales_data where `year of manufacture`=(select `year of manufacture` from car_sales_data order by price desc limit 1);

-- 6. Advanced Joins

-- 38. Join car_sales_data with manufacturer_country to show manufacturer and country.

select c.manufacturer,m.country from car_sales_data c inner join manufacturer_country m on c.manufacturer=m.manufacturer;

-- 39. List average price per country.

select avg(c.price),m.country from car_sales_data c inner join manufacturer_country m on c.manufacturer=m.manufacturer group by m.country;

-- 40. Find top 3 most expensive manufacturers per country.

SELECT country, manufacturer, price
FROM (
    SELECT mc.country, csd.manufacturer, csd.price,
           ROW_NUMBER() OVER (PARTITION BY mc.country ORDER BY csd.price DESC) AS ranking
    FROM car_sales_data csd
    JOIN manufacturer_country mc ON csd.manufacturer = mc.manufacturer
) ranked
WHERE ranking <= 3;

-- 7. Window Functions (if using MySQL 8+)

-- Rank cars by price within each manufacturer.

select *,rank() over(partition by manufacturer order by price desc) from car_sales_data;

-- Find the most expensive car per manufacturer using RANK().

SELECT *
FROM (
    SELECT 
        manufacturer,
        model,
        price,
        RANK() OVER (PARTITION BY manufacturer ORDER BY price DESC) AS ranked
    FROM car_sales_data
) ranked_cars
WHERE ranked = 1;

-- Calculate the running total of prices ordered by year.

select *,sum(price) over(partition by `Year of manufacture`) from car_sales_data;

-- Show the difference between each car’s price and its manufacturer’s average price.

select *,avg(price) over(partition by manufacturer) as `manufacturer's avg price` from car_sales_data;

-- Get top 5 newest cars overall using ROW_NUMBER().

SELECT *
FROM (
    SELECT 
        manufacturer,
        model,
        `Year of manufacture`,
        ROW_NUMBER() OVER (ORDER BY `Year of manufacture` DESC) AS row_num
    FROM car_sales_data
) numbered_cars
WHERE row_num <= 5;




