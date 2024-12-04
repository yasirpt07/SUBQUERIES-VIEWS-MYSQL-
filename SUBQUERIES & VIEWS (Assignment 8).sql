use countries;

-- Number of Persons in Each Country
SELECT Country_name, COUNT(*) AS NumberOfPersons
FROM Persons
GROUP BY Country_name;

-- Number of Persons in Each Country (Sorted High to Low)
SELECT Country_name, COUNT(*) AS NumberOfPersons
FROM Persons
GROUP BY Country_name
ORDER BY NumberOfPersons DESC;

-- Average Rating of Persons per Country (Greater than 3.0)
SELECT Country_name, AVG(Rating) AS AverageRating
FROM Persons
GROUP BY Country_name
HAVING AVG(Rating) > 3.0;

-- Countries with the Same Rating as the USA
SELECT DISTINCT Country_name
FROM Persons
WHERE Rating = (SELECT AVG(Rating) FROM Persons WHERE Country_name = 'USA');

-- Countries with Population Greater than Average Population
SELECT Country_name, Population
FROM Country
WHERE Population > (SELECT AVG(Population) FROM Country);

-- Product Database and Customer Table
CREATE DATABASE Product;
USE Product;

CREATE TABLE Customer (
    Customer_Id INT PRIMARY KEY,
    First_name VARCHAR(50),
    Last_name VARCHAR(50),
    Email VARCHAR(100),
    Phone_no VARCHAR(15),
    Address VARCHAR(255),
    City VARCHAR(50),
    State VARCHAR(50),
    Zip_code VARCHAR(10),
    Country VARCHAR(50)
);

-- Customer data
INSERT INTO Customer (Customer_Id, First_name, Last_name, Email, Phone_no, Address, City, State, Zip_code, Country)
VALUES
(1, 'John', 'Doe', 'john.doe@example.com', '1234567890', '123 Main St', 'New York', 'New York', '10001', 'USA'),
(2, 'Jane', 'Smith', 'jane.smith@example.com', '9876543210', '456 Maple Ave', 'Los Angeles', 'California', '90001', 'USA'),
(3, 'Ali', 'Khan', 'ali.khan@example.com', '5678901234', '789 Oak St', 'Houston', 'Texas', '77001', 'USA'),
(4, 'Maria', 'Gomez', 'maria.gomez@example.com', '2345678901', '321 Pine St', 'Chicago', 'Illinois', '60007', 'USA'),
(5, 'Igor', 'Ivanov', 'igor.ivanov@example.com', '3456789012', '654 Elm St', 'Seattle', 'Washington', '98101', 'USA'),
(6, 'Emma', 'Brown', 'emma.brown@example.com', '4567890123', '987 Cedar St', 'Miami', 'Florida', '33101', 'USA'),
(7, 'Liam', 'Johnson', 'liam.johnson@example.com', '5678901234', '543 Birch St', 'Phoenix', 'Arizona', '85001', 'USA'),
(8, 'Sophia', 'Müller', 'sophia.muller@example.com', '6789012345', '876 Spruce St', 'Denver', 'Colorado', '80012', 'USA'),
(9, 'William', 'Davis', 'william.davis@example.com', '7890123456', '123 Aspen St', 'Boston', 'Massachusetts', '02101', 'USA'),
(10, 'Akira', 'Tanaka', 'akira.tanaka@example.com', '8901234567', '456 Redwood St', 'San Francisco', 'California', '94101', 'USA');
-- Insert 4 New York customers
INSERT INTO Customer (Customer_Id, First_name, Last_name, Email, Phone_no, Address, City, State, Zip_code, Country)
VALUES
(11, 'Ethan', 'Hunt', 'ethan.hunt@example.com', '1112223333', '123 Mission St', 'New York', 'New York', '10001', 'USA'),
(12, 'Olivia', 'Benson', 'olivia.benson@example.com', '2223334444', '456 Justice Ave', 'New York', 'New York', '10002', 'USA'),
(13, 'Jack', 'Ryan', 'jack.ryan@example.com', '3334445555', '789 Intelligence Blvd', 'New York', 'New York', '10003', 'USA'),
(14, 'Rachel', 'Green', 'rachel.green@example.com', '4445556666', '321 Fashion St', 'New York', 'New York', '10004', 'USA');

-- Insert 4 Los Angeles customers
INSERT INTO Customer (Customer_Id, First_name, Last_name, Email, Phone_no, Address, City, State, Zip_code, Country)
VALUES
(15, 'Chandler', 'Bing', 'chandler.bing@example.com', '5556667777', '123 Comedy St', 'Los Angeles', 'California', '90001', 'USA'),
(16, 'Monica', 'Geller', 'monica.geller@example.com', '6667778888', '456 Kitchen Ave', 'Los Angeles', 'California', '90002', 'USA'),
(17, 'Ross', 'Geller', 'ross.geller@example.com', '7778889999', '789 Dinosaur Blvd', 'Los Angeles', 'California', '90003', 'USA'),
(18, 'Phoebe', 'Buffay', 'phoebe.buffay@example.com', '8889990000', '321 Music St', 'Los Angeles', 'California', '90004', 'USA');
-- Insert customers into different states
INSERT INTO Customer (Customer_Id, First_name, Last_name, Email, Phone_no, Address, City, State, Zip_code, Country)
VALUES
(19, 'Tom', 'Holland', 'tom.holland@example.com', '9991112222', '101 Spiderman St', 'Houston', 'Texas', '77001', 'USA'),
(20, 'Bruce', 'Wayne', 'bruce.wayne@example.com', '8882223333', '102 Gotham St', 'Chicago', 'Illinois', '60007', 'USA'),
(21, 'Clark', 'Kent', 'clark.kent@example.com', '7773334444', '103 Daily St', 'Seattle', 'Washington', '98101', 'USA'),
(22, 'Diana', 'Prince', 'diana.prince@example.com', '6664445555', '104 Amazon St', 'Miami', 'Florida', '33101', 'USA'),
(23, 'Barry', 'Allen', 'barry.allen@example.com', '5555556666', '105 Speed Blvd', 'Phoenix', 'Arizona', '85001', 'USA'),
(24, 'Hal', 'Jordan', 'hal.jordan@example.com', '4446667777', '106 Lantern Ave', 'Denver', 'Colorado', '80012', 'USA'),
(25, 'Arthur', 'Curry', 'arthur.curry@example.com', '3337778888', '107 Ocean St', 'Boston', 'Massachusetts', '02101', 'USA');

-- Insert customers for Texas
INSERT INTO Customer (Customer_Id, First_name, Last_name, Email, Phone_no, Address, City, State, Zip_code, Country)
VALUES
(26, 'Emily', 'Clark', 'emily.clark@example.com', '1231112222', '110 Park St', 'Houston', 'Texas', '77002', 'USA'),
(27, 'Michael', 'Reed', 'michael.reed@example.com', '2342223333', '111 Hill St', 'Dallas', 'Texas', '75001', 'USA');

-- Insert customers for Illinois
INSERT INTO Customer (Customer_Id, First_name, Last_name, Email, Phone_no, Address, City, State, Zip_code, Country)
VALUES
(28, 'Sarah', 'Jones', 'sarah.jones@example.com', '3453334444', '210 Lakeshore Dr', 'Chicago', 'Illinois', '60008', 'USA'),
(29, 'James', 'Taylor', 'james.taylor@example.com', '4564445555', '211 Michigan Ave', 'Springfield', 'Illinois', '62701', 'USA'),
(30, 'Sophia', 'Wilson', 'sophia.wilson@example.com', '5675556666', '212 Monroe St', 'Peoria', 'Illinois', '61601', 'USA');

-- Insert customers for Washington
INSERT INTO Customer (Customer_Id, First_name, Last_name, Email, Phone_no, Address, City, State, Zip_code, Country)
VALUES
(31, 'Ryan', 'Brown', 'ryan.brown@example.com', '6786667777', '310 Rainy Ave', 'Seattle', 'Washington', '98102', 'USA'),
(32, 'Mia', 'Lee', 'mia.lee@example.com', '7897778888', '311 Cloudy Blvd', 'Spokane', 'Washington', '99201', 'USA');

-- Insert customers for Florida
INSERT INTO Customer (Customer_Id, First_name, Last_name, Email, Phone_no, Address, City, State, Zip_code, Country)
VALUES
(33, 'Olivia', 'Martinez', 'olivia.martinez@example.com', '8908889999', '410 Ocean Dr', 'Miami', 'Florida', '33102', 'USA'),
(34, 'David', 'Garcia', 'david.garcia@example.com', '9019990000', '411 Beach Ave', 'Orlando', 'Florida', '32801', 'USA'),
(35, 'Emma', 'Lopez', 'emma.lopez@example.com', '1121112222', '412 Sunset Blvd', 'Tampa', 'Florida', '33601', 'USA'),
(36, 'Noah', 'Davis', 'noah.davis@example.com', '2232223333', '413 Sunrise Ln', 'Jacksonville', 'Florida', '32201', 'USA');

-- Insert customers for Arizona
INSERT INTO Customer (Customer_Id, First_name, Last_name, Email, Phone_no, Address, City, State, Zip_code, Country)
VALUES
(37, 'Liam', 'Robinson', 'liam.robinson@example.com', '3343334444', '510 Desert Rd', 'Phoenix', 'Arizona', '85002', 'USA'),
(38, 'Charlotte', 'Harris', 'charlotte.harris@example.com', '4454445555', '511 Cactus Blvd', 'Tucson', 'Arizona', '85701', 'USA');


-- 1.Create customer_info View (Full Name and Email):
CREATE VIEW customer_info AS
SELECT CONCAT(First_name, ' ', Last_name) AS FullName, Email
FROM Customer;

-- Select from the customer_info view
SELECT * FROM customer_info;

-- 2.Create US_Customers View
CREATE VIEW US_Customers AS
SELECT * FROM Customer
WHERE Country = 'USA';

-- Select from the `US_Customers` view
SELECT * FROM US_Customers;

-- 3.Create Customer_details View
CREATE VIEW Customer_details AS
SELECT CONCAT(First_name, ' ', Last_name) AS FullName, Email, Phone_no, State
FROM Customer;

-- Select from the Customer_details view
SELECT * FROM Customer_details;

SET SQL_SAFE_UPDATES = 0;


-- 4.Update Phone Numbers for California in Customer_details
UPDATE Customer
SET Phone_no = '5551234567'
WHERE State = 'California';

SET SQL_SAFE_UPDATES = 1;

-- Verify the update via the `Customer_details` view
SELECT * FROM Customer_details WHERE State = 'California';

-- 5.Count Customers per State States with More Than 5 Customers
SELECT State, COUNT(*) AS NumberOfCustomers
FROM Customer
GROUP BY State
HAVING COUNT(*) > 5;

-- 6.Count Customers per State (All States)
SELECT State, COUNT(*) AS NumberOfCustomers
FROM Customer
GROUP BY State;

-- 7.Select All Columns from Customer_details View Sorted by State
SELECT * FROM Customer_details
ORDER BY State ASC;
