CREATE DATABASE restaurant;
USE restaurant;

CREATE TABLE menuitem (
    itemID INT(15) PRIMARY KEY,
    description CHAR(50),
    ItemName CHAR(50),
    Price INT(15),
    OrderKind CHAR(50)
);

CREATE TABLE orderitem (
    orderprice INT(15),
    ItemID INT(15),
    FOREIGN KEY (ItemID) REFERENCES menuitem(itemID)
);

CREATE TABLE customers (
    CustomerID INT(11) PRIMARY KEY,
    CustomerName CHAR(50),
    address CHAR(50),
    email CHAR(50)
);

CREATE TABLE reservation (
    ReservationID INT(11) PRIMARY KEY AUTO_INCREMENT,
    ReservationDate DATE,
    CustomerID INT(11),
    FOREIGN KEY (CustomerID) REFERENCES customers(CustomerID)
);

CREATE TABLE orders (
    OrderID INT(15) PRIMARY KEY,
    OrderDate DATE,
    TotalAmount INT(15)
);

CREATE TABLE restauranttable (
    TableId INT(11) PRIMARY KEY,
    seats INT(11),
    status VARCHAR(50)
);

CREATE TABLE employee (
    ID INT(15) PRIMARY KEY,
    Name CHAR(50),
    salary INT(15),
    address CHAR(50),
    sex CHAR(50),
    role CHAR(50),
    phone INT(15)
);
INSERT INTO orders (OrderID, OrderDate, TotalAmount) VALUES
(1001, '2023-01-15', 120),
(1002, '2023-01-16', 85),
(1003, '2023-01-17', 150),
(1004, '2023-01-18', 65),
(1005, '2023-01-19', 210),
(1006, '2023-01-20', 95),
(1007, '2023-01-21', 180),
(1008, '2023-01-22', 75),
(1009, '2023-01-23', 130),
(1010, '2023-01-24', 45);

INSERT INTO customers (CustomerID, CustomerName, address, email) VALUES
(1, 'Ahmed Hassan', '15 Tahrir St, Cairo', 'ahmed.hassan@email.com'),
(2, 'Mona Ali', '22 Zamalek St, Cairo', 'mona.ali@email.com'),
(3, 'Kareem Youssef', '10 Mansoura Rd, Mansoura', 'kareem.youssef@email.com'),
(4, 'Sara Ibrahim', '33 Maadi St, Cairo', 'sara.ibrahim@email.com'),
(5, 'Mohamed Tarek', '5 October City, Giza', 'mohamed.tarek@email.com'),
(6, 'Nourhan Adel', '12 Nasr City, Cairo', 'nourhan.adel@email.com'),
(7, 'Hossam ElDin', '45 Alexandria St, Alexandria', 'hossam.eldin@email.com'),
(8, 'Laila Samir', '9 Fayoum Rd, Fayoum', 'laila.samir@email.com'),
(9, 'Tamer Magdy', '8 Suez Canal Rd, Ismailia', 'tamer.magdy@email.com'),
(10, 'Rana Khaled', '17 Aswan Corniche, Aswan', 'rana.khaled@email.com');


INSERT INTO employee (ID, Name, salary, address, sex, role, phone) VALUES
(1, 'Ahmed Ali', 5000, 'Cairo', 'Male', 'Manager', 123456789),
(2, 'Sara Youssef', 4500, 'Giza', 'Female', 'Waitress', 123456780),
(3, 'Omar Hassan', 4000, 'Alexandria', 'Male', 'Chef', 123456781),
(4, 'Mona Adel', 3500, 'Tanta', 'Female', 'Cashier', 123456782),
(5, 'Khaled Samir', 4200, 'Cairo', 'Male', 'Waiter', 123456783),
(6, 'Laila Hani', 4700, 'Mansoura', 'Female', 'Supervisor', 123456784),
(7, 'Hussein Fathi', 3900, 'Aswan', 'Male', 'Cleaner', 123456785),
(8, 'Noura Magdy', 4300, 'Zagazig', 'Female', 'Receptionist', 123456786),
(9, 'Tamer Nabil', 4100, 'Cairo', 'Male', 'Chef', 123456787),
(10, 'Yasmin Omar', 3600, 'Giza', 'Female', 'Waitress', 123456788);

INSERT INTO resturanttable (TableID, seats, status) VALUES
(1, 4, 'Available'),
(2, 2, 'Occupied'),
(3, 6, 'Reserved'),
(4, 4, 'Available'),
(5, 2, 'Available'),
(6, 8, 'Occupied'),
(7, 4, 'Reserved'),
(8, 6, 'Available'),
(9, 2, 'Occupied'),
(10, 4, 'Available');

INSERT INTO menuitem (itemID, description, ItemName, Price, OrderKind) VALUES
(1, 'Classic beef burger with lettuce and tomato', 'Classic Beef Burger', 120, 'Beef'),
(2, 'Double beef patty with cheese and pickles', 'Double Cheeseburger', 150, 'Beef'),
(3, 'Grilled chicken burger with mayo sauce', 'Chicken Burger', 110, 'Chicken'),
(4, 'Crispy fried chicken burger with coleslaw', 'Crispy Chicken Burger', 115, 'Chicken'),
(5, 'Spicy beef burger with jalapeños and cheese', 'Spicy Beef Burger', 130, 'Beef'),
(6, 'BBQ chicken burger with onions and BBQ sauce', 'BBQ Chicken Burger', 125, 'Chicken'),
(7, 'Beef burger with fried egg and cheese', 'Beef Egg Burger', 140, 'Beef'),
(8, 'Chicken burger with honey mustard sauce', 'Honey Mustard Chicken Burger', 120, 'Chicken'),
(9, 'Mushroom beef burger with Swiss cheese', 'Mushroom Beef Burger', 135, 'Beef'),
(10, 'Buffalo chicken burger with blue cheese', 'Buffalo Chicken Burger', 130, 'Chicken');  
 
INSERT INTO reservation (ReservationDate) VALUES
    -> ('2025-05-15'),
    -> ('2025-05-15'),
    -> ('2025-05-16'),
    -> ('2025-05-16'),
    -> ('2025-05-17'),
    -> ('2025-05-17'),
    -> ('2025-05-18'),
    -> ('2025-05-18'),
    -> ('2025-05-19'),
    -> ('2025-05-20');
 
INSERT INTO orderitem (orderprice, ItemID) VALUES
(120, 1), 
(150, 2),  
(110, 3),  
(115, 4),  
(130, 5),  
(125, 6),  
(140, 7),  
(120, 8),  
(135, 9),  
(130, 10); 
//Queries
select distinct role from employees;
SELECT ItemName, Price, OrderKind FROM menuitem;
select COUNT(*) AS TotalOrders, sum(orderprice) AS TotalRevenueFROM orderitem;
select description from menuitem where ItemID =10;
select Name, role, salaryfrom employee order by salary DESC;
SELECT * FROM employeeWHERE salary LIKE '%2%';
select * from menuitem where price like '%4%';
SELECT * FROM employee ORDER BY salary ASC;
SELECT Name, SUM(salary) FROM employee GROUP BY Name;
SELECT mi.ItemName, oi.orderprice FROM orderitem oi INNER JOIN menuitem mi ON oi.ItemID = mi.itemID;
SELECT *
    -> FROM menuitem
    -> WHERE OrderKind = 'Beef';
SELECT * 
FROM reservation
WHERE ReservationDate = '2025-05-15';
SELECT role, COUNT(*) AS NumberOfEmployees
FROM employee
GROUP BY role;
SELECT * FROM orderitem
ORDER BY orderprice DESC
LIMIT 1;
SELECT * FROM orderitem
ORDER BY orderprice ASC
LIMIT 1;
SELECT mi.ItemName, oi.orderprice
FROM menuitem mi
LEFT JOIN orderitem oi ON mi.itemID = oi.ItemID;
select * from orders where TotalAmount <=85;
SELECT DISTINCT ItemName, Price FROM menuitem;
SELECT AVG(Price) AS AverageMenuItemPrice FROM menuitem;
SELECT OrderDate, COUNT(OrderID) AS NumberOfOrders FROM orders GROUP BY OrderDate;
SELECT MAX(salary) AS MaximumSalary, MIN(salary) AS MinimumSalary FROM employee;
















 


