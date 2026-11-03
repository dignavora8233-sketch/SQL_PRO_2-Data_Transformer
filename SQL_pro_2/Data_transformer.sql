/*
====================================================
Project Name : Data Transformer

Purpose      : Data Management

====================================================
*/


-- DATABASE CREATION
CREATE DATABASE data_transformer;

-- USE DATABASE
USE data_transformer;



-- CUSTOMERS TABLE
CREATE TABLE Customers (
    Customer_ID INT PRIMARY KEY,
    First_Name VARCHAR(50),
    Last_Name VARCHAR(50),
    Email VARCHAR(100),
    Registration_Date DATE
);



-- ORDERS TABLE
CREATE TABLE Orders (
    Order_ID INT PRIMARY KEY,
    Customer_ID INT,
    Order_Date DATE,
    Total_Amount DECIMAL(10,2),
    FOREIGN KEY (Customer_ID)
    REFERENCES Customers(Customer_ID)
);



-- EMPLOYEES TABLE
CREATE TABLE Employees (
    Employee_ID INT PRIMARY KEY,
    First_Name VARCHAR(50),
    Last_Name VARCHAR(50),
    Department VARCHAR(50),
    Hire_Date DATE,
    Salary DECIMAL(10,2)
);



-- INSERT CUSTOMERS
INSERT INTO Customers VALUES
(1, 'John', 'Doe', 'john.doe@email.com', '2022-03-15'),
(2, 'Jane', 'Smith', 'jane.smith@email.com', '2021-11-02');



-- INSERT ORDERS
INSERT INTO Orders VALUES
(101, 1, '2023-07-01', 150.50),
(102, 2, '2023-07-03', 200.75);



-- INSERT EMPLOYEES
INSERT INTO Employees VALUES
(1, 'Mark', 'Johnson', 'Sales', '2020-01-15', 50000.00),
(2, 'Susan', 'Lee', 'HR', '2021-03-20', 55000.00);


-- Table Structure

DESC Customers;

DESC Orders;

DESC Employees;

-- DISPLAY TABLE RECORDS

-- Display Customers
SELECT * FROM Customers;

-- Display Orders
SELECT * FROM Orders;

-- Display Employees
SELECT * FROM Employees;


/*
***********
  QUERIES
***********
*/


-- Query 1 : INNER JOIN

-- Retrieve orders and matching customer details
SELECT
    O.Order_ID,
    C.Customer_ID,
    C.First_Name,
    C.Last_Name,
    O.Order_Date,
    O.Total_Amount
FROM Orders AS O
INNER JOIN Customers AS C
ON O.Customer_ID = C.Customer_ID;



-- Query 2 : LEFT JOIN

-- Retrieve all customers and their orders (if any)
SELECT
    C.Customer_ID,
    C.First_Name,
    C.Last_Name,
    O.Order_ID,
    O.Total_Amount
FROM Customers AS C
LEFT JOIN Orders AS O
ON C.Customer_ID = O.Customer_ID;



-- Query 3 : RIGHT JOIN

-- Retrieve all orders and corresponding customers
SELECT
    O.Order_ID,
    O.Total_Amount,
    C.Customer_ID,
    C.First_Name,
    C.Last_Name
FROM Customers AS C
RIGHT JOIN Orders AS O
ON C.Customer_ID = O.Customer_ID;




-- Query 4 : FULL OUTER JOIN

-- Retrieve all customers and all orders

SELECT
    C.Customer_ID,
    C.First_Name,
    O.Order_ID,
    O.Total_Amount
FROM Customers AS C
LEFT JOIN Orders AS O
ON C.Customer_ID = O.Customer_ID

UNION

SELECT
    C.Customer_ID,
    C.First_Name,
    O.Order_ID,
    O.Total_Amount
FROM Customers AS C
RIGHT JOIN Orders AS O
ON C.Customer_ID = O.Customer_ID;



-- Query 5 : Subquery

-- Find customers who placed orders above average amount

SELECT
    C.Customer_ID,
    C.First_Name,
    O.Total_Amount
FROM Customers AS C
JOIN Orders AS O
ON C.Customer_ID = O.Customer_ID
WHERE O.Total_Amount >
(
    SELECT AVG(O2.Total_Amount)
    FROM Orders AS O2
);



-- Query 6: SUBQUERY

-- Find employees having salary above average salary
SELECT
    E.Employee_ID,
    E.First_Name,
    E.Salary
FROM Employees AS E
WHERE E.Salary >
(
    SELECT AVG(E2.Salary)
    FROM Employees AS E2
);


-- Query 7: Extract year and month from OrderDate
SELECT
    O.Order_ID,
    YEAR(O.Order_Date) AS Order_Year,
    MONTH(O.Order_Date) AS Order_Month
FROM Orders AS O;



-- Query 8: Be dates vachche no difference calculate karo

SELECT
    O.Order_ID,
    O.Order_Date,
    CURDATE() AS Today_Date,
    DATEDIFF(CURDATE(), O.Order_Date) AS Difference_Days
FROM Orders AS O;

-- Query 9: Format OrderDate into readable format

SELECT
    O.Order_ID,
    DATE_FORMAT(O.Order_Date, '%d-%b-%Y') AS Formatted_Date
FROM Orders AS O;


-- Query 10: Combine FirstName and LastName

SELECT
    CONCAT(E.First_Name, ' ', E.Last_Name) AS Full_Name
FROM Employees AS E;


-- Query 11: Replace John with Jonathan

SELECT
    REPLACE(C.First_Name, 'John', 'Jonathan') AS New_Name
FROM Customers AS C;


-- Query 12: Convert FirstName to uppercase and LastName to lowercase

SELECT
    UPPER(E.First_Name) AS UpperName,
    LOWER(E.Last_Name) AS LowerName
FROM Employees AS E;


-- Query 13: Remove extra spaces from Email

SELECT
    TRIM(C.Email) AS Clean_Email
FROM Customers AS C;


-- Query 14: Calculate running total of TotalAmount

SELECT
    O.Order_ID,
    O.Order_Date,
    O.Total_Amount,
    SUM(O.Total_Amount) OVER (
        ORDER BY O.Order_Date, O.Order_ID
    ) AS Running_Total
FROM Orders AS O;


-- Query 15: Rank orders based on TotalAmount

SELECT
    O.Order_ID,
    O.Total_Amount,
    RANK() OVER (
        ORDER BY O.Total_Amount DESC
    ) AS Order_Rank
FROM Orders AS O;


-- Query 16: Assign discount based on TotalAmount

SELECT
    O.Order_ID,
    O.Total_Amount,
    CASE
        WHEN O.Total_Amount > 1000 THEN '10% Discount'
        WHEN O.Total_Amount > 500 THEN '5% Discount'
        ELSE 'No Discount'
    END AS Discount
FROM Orders AS O;

-- Query 17: Categorize employee salary

SELECT
    E.Employee_ID,
    E.First_Name,
    E.Salary,
    CASE
        WHEN E.Salary >= 55000 THEN 'High'
        WHEN E.Salary >= 50000 THEN 'Medium'
        ELSE 'Low'
    END AS Salary_Category
FROM Employees AS E;
