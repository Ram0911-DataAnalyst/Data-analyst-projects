SHOW DATABASES;

USE mysql;
DROP DATABASE mysql;

CREATE DATABASE restaurent_management;

USE restaurent_management;

CREATE TABLE `restaurent_management`.`restaurent_s`(restaurent_ID INT AUTO_INCREMENT PRIMARY KEY,
restaurent_Name varchar(50),
addess TEXT ,
phone_num varchar(25)
);

INSERT INTO restaurent_s VALUES('01','Ruchi Sagar', 'Electronic_City', '9392477833');
INSERT INTO restaurent_s VALUES('02','Chittinadu', 'White Feild', '9756443254');
INSERT INTO restaurent_s VALUES('03','4am Biryani', 'Bommasandra', '9122838492');
INSERT INTO restaurent_s VALUES('04','Meghana Biryani', 'Bellandhur', '8345732422');
INSERT INTO restaurent_s VALUES('05','Subbaiyya gari bhojanam', 'Marthalli', '8745377284');
INSERT INTO restaurent_s VALUES('06','Andhra mess', 'Domluru', '9000235664');
INSERT INTO restaurent_s VALUES('07','Pattikattan Biryani', 'Electronic_City', '9834573257');
INSERT INTO restaurent_s VALUES('08','Domino\'s', 'White Feild', '8730983756');

truncate TABLE restaurent_s;

SELECT DISTINCT * FROM restaurent_s;

SELECT * FROM restaurent_s r
WHERE r.address = 'Electronic_City';

ALTER TABLE restaurent_s
RENAME COLUMN addess TO address;

SHOW TABLES;

SELECT * FROM restaurent_s;

SELECT * FROM restaurent_s r 
WHERE r.`restaurent_ID`= '3'; 

CREATE TABLE `restaurent_management`.`Menu_Items`(
Item_ID INT auto_increment PRIMARY KEY,
restaurent_ID INT,
Item_Name varchar(50),
Item_Prize DECIMAL(10,2),
FOREIGN KEY (restaurent_ID) REFERENCES restaurent_s(restaurent_ID) ON DELETE CASCADE
);

INSERT INTO Menu_Items (restaurent_ID, Item_Name, Item_Prize) VALUES
(1, 'Paneer Butter Masala', 280.00),
(1, 'Garlic Naan', 60.00),
(2, 'Chicken Dum Biryani', 350.00),
(2, 'Mutton Seekh Kebab', 420.00),
(3, 'Masala Dosa', 120.00),
(3, 'Filter Coffee', 45.00),
(4, 'Veg Hakka Noodles', 210.00),
(4, 'Gobi Manchurian', 180.00),
(5, 'Double Cheese Margherita', 399.00),
(5, 'Stuffed Garlic Bread', 150.00);

select * from Menu_Items;

CREATE TABLE Customer(
Customer_ID INT auto_increment PRIMARY KEY,
restaurent_ID INT,
Item_ID INT,
FirstName varchar(50),
LastName varchar(50),
Email_ID varchar(50),
FOREIGN KEY (restaurent_ID) REFERENCES restaurent_s(restaurent_ID) ON DELETE CASCADE,
FOREIGN KEY (Item_ID) REFERENCES Menu_Items(Item_ID) ON DELETE CASCADE
);

INSERT INTO Customer (restaurent_ID, Item_ID, FirstName, LastName, Email_ID) VALUES
(1, 1, 'Rahul', 'Sharma', 'rahul.sharma@gmail.com'),
(1, 2, 'Sneha', 'Patil', 'sneha.p@outlook.com'),
(2, 3, 'Amit', 'Verma', 'averma_99@yahoo.com'),
(2, 4, 'Priya', 'Iyer', 'priya.iyer@gmail.com'),
(3, 5, 'Vikram', 'Singh', 'vsingh.work@gmail.com'),
(3, 6, 'Ananya', 'Reddy', 'ananya.reddy@icloud.com'),
(4, 7, 'Rohan', 'Das', 'rohan.das@gmail.com'),
(4, 8, 'Meera', 'Nair', 'meera_nair22@hotmail.com'),
(5, 9, 'Karthik', 'Grover', 'k.grover@gmail.com'),
(5, 10, 'Sonia', 'Khan', 'sonia.khan@gmail.com');

CREATE TABLE Orders(
Order_ID INT auto_increment PRIMARY KEY,
Customer_ID INT,
restaurent_ID INT,
Item_ID INT,
Orderdate TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
TotalAmount DECIMAL(10,2),
Status VARCHAR(20),
FOREIGN KEY (restaurent_ID) REFERENCES restaurent_s(restaurent_ID) ON DELETE CASCADE,
FOREIGN KEY (Item_ID) REFERENCES Menu_Items(Item_ID) ON DELETE CASCADE,
FOREIGN KEY (Customer_ID) REFERENCES Customer(Customer_ID) ON DELETE CASCADE
);

INSERT INTO Orders (Customer_ID, restaurent_ID, Item_ID, TotalAmount, Status) VALUES
(1, 1, 1, 280.00, 'Delivered'),
(2, 1, 2, 60.00, 'Cancelled'),
(3, 2, 3, 350.00, 'Delivered'),
(4, 2, 4, 420.00, 'Pending'),
(5, 3, 5, 120.00, 'Delivered'),
(6, 3, 6, 45.00, 'Delivered'),
(7, 4, 7, 210.00, 'Delivered'),
(8, 4, 8, 180.00, 'Pending'),
(9, 5, 9, 399.00, 'Delivered'),
(10, 5, 10, 150.00, 'Delivered');

Show tables;
select * from Orders;
