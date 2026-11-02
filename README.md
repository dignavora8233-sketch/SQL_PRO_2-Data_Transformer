# 🔄 Data Transformer – SQL Project

## 📌 Project Overview

**Data Transformer** is a MySQL-based database management project designed to manage customer information, order details, and employee records.

This project demonstrates practical SQL operations such as database creation, table management, data manipulation, joins, subqueries, date functions, string functions, window functions, and conditional statements.

## 🎯 Project Objectives

- Manage customer, order, and employee information.
- Retrieve related data using SQL JOIN operations.
- Perform calculations using aggregate functions and subqueries.
- Transform and format dates and strings.
- Analyze records using window functions.
- Categorize data using CASE statements.

## 🛠️ Technologies Used

- **Database:** MySQL
- **Language:** SQL
- **Concepts:** DDL, DML, DQL, Joins, Subqueries, Window Functions

## 🗄️ Database Structure

**Database Name:** `data_transformer`

The project contains three main tables:

### 1. Customers

Stores customer information.

| Column Name | Data Type |
|---|---|
| Customer_ID | INT (Primary Key) |
| First_Name | VARCHAR(50) |
| Last_Name | VARCHAR(50) |
| Email | VARCHAR(100) |
| Registration_Date | DATE |

### 2. Orders

Stores customer order information.

| Column Name | Data Type |
|---|---|
| Order_ID | INT (Primary Key) |
| Customer_ID | INT (Foreign Key) |
| Order_Date | DATE |
| Total_Amount | DECIMAL(10,2) |

### 3. Employees

Stores employee information.

| Column Name | Data Type |
|---|---|
| Employee_ID | INT (Primary Key) |
| First_Name | VARCHAR(50) |
| Last_Name | VARCHAR(50) |
| Department | VARCHAR(50) |
| Hire_Date | DATE |
| Salary | DECIMAL(10,2) |

## 🔗 Database Relationships

- Customers and Orders are connected through `Customer_ID`.
- One customer can have multiple orders.
- Orders reference Customers using a Foreign Key.

## ⚡ SQL Queries Implemented

This project includes **17 SQL queries** covering different database operations.

| No. | SQL Concept | Description |
|---|---|---|
| 1 | INNER JOIN | Retrieve matching customer and order records |
| 2 | LEFT JOIN | Display all customers with their orders |
| 3 | RIGHT JOIN | Display all orders with customer details |
| 4 | FULL OUTER JOIN | Retrieve all customers and orders using UNION |
| 5 | Subquery | Find orders above the average order amount |
| 6 | Subquery | Find employees earning above average salary |
| 7 | YEAR() & MONTH() | Extract year and month from order dates |
| 8 | DATEDIFF() | Calculate difference between dates |
| 9 | DATE_FORMAT() | Format dates into readable format |
| 10 | CONCAT() | Combine first and last names |
| 11 | REPLACE() | Replace John with Jonathan |
| 12 | UPPER() & LOWER() | Convert text into uppercase and lowercase |
| 13 | TRIM() | Remove extra spaces from email |
| 14 | SUM() OVER() | Calculate running total of orders |
| 15 | RANK() OVER() | Rank orders based on total amount |
| 16 | CASE | Assign discounts based on order amount |
| 17 | CASE | Categorize employee salaries |

**Note:** MySQL does not directly support FULL OUTER JOIN. This project simulates it using LEFT JOIN, RIGHT JOIN, and UNION.

## 📊 Key Features

- Database and table creation.
- Primary Key and Foreign Key implementation.
- Customer and order management.
- Multiple JOIN operations.
- Subquery-based data analysis.
- Date and string transformations.
- Running total calculations.
- Order ranking.
- Conditional discount assignment.
- Employee salary categorization.

## ▶️ How to Run the Project

1. Install and open MySQL.
2. Open MySQL Workbench or your SQL editor.
3. Copy the SQL project code.
4. Execute the script.
5. View the database and table records.
6. Run the 17 queries individually or together.

**Important:** The script starts with `DROP DATABASE data_transformer;`. This deletes an existing database with that name. Remove or comment out this command if you want to preserve existing data.

## 📚 What I Learned

Through this project, I improved my understanding of:

- Database creation and management.
- SQL JOIN operations and relationships.
- Writing nested SQL queries.
- Data transformation using built-in functions.
- Analytical operations using Window Functions.
- Conditional logic using CASE statements.
- Retrieving meaningful information from relational databases.

## 🚀 Future Improvements

- Add more customers, orders, and employees.
- Implement aggregate functions and GROUP BY analysis.
- Create views for frequently used queries.
- Add stored procedures and triggers.
- Develop a simple reporting dashboard.

## 👩‍💻 Author

**Digna Vora**

B.Sc. IT – Semester 1

**Area of Interest:** Artificial Intelligence, Machine Learning, Data Science & Database Management.

## 📩 Contact Me

I'm always interested in learning new technologies, improving my technical skills, and connecting with people.

- **Name:** Digna Vora
- **Email:** dignavora8233@gmail.com
- **LinkedIn:** www.linkedin.com/in/digna-vora-b135a3416

Feel free to connect with me for collaboration, learning, and knowledge sharing.

⭐ Thank you for visiting my project!

⭐ If you find this project useful, feel free to explore the SQL queries and learn from them!

**Keep Learning | Keep Practicing | Keep Transforming Data** 💻
