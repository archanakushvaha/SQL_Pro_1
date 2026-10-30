# 📊 Data Digger – MySQL Project

## 📌 Project Overview
Data Digger is a MySQL database management project designed to store, manage, and analyze customer, order, product, and order details data. This project demonstrates basic to intermediate SQL queries used for data retrieval, modification, and analysis.

## 🎯 Project Objectives
- Create and manage a database using MySQL.
- Store customer, order, product, and order details information.
- Perform CRUD operations (Create, Read, Update, Delete).
- Filter and sort records using SQL queries.
- Perform calculations using aggregate functions.
- Analyze sales and product performance using JOINs and subqueries.

## 🛠️ Technologies Used
- **Database:** MySQL
- **Language:** SQL
- **Tools:** MySQL Command Line (CMD), Visual Studio Code (VS Code)

## 🗂️ Database Structure
This project contains four tables:

### 1. Customers
Stores customer information.

- CustomerID
- Name
- Email
- Address

### 2. Orders
Stores customer order information.

- OrderID
- CustomerID
- OrderDate
- TotalAmount

### 3. Products
Stores product information.

- ProductID
- ProductName
- Price
- Stock

### 4. OrderDetails
Stores individual product details for each order.

- OrderDetailID
- OrderID
- ProductID
- Quantity
- SubTotal

## 🔑 SQL Concepts Covered
- CREATE DATABASE and CREATE TABLE
- INSERT, SELECT, UPDATE, and DELETE
- WHERE conditions
- ORDER BY and LIMIT
- BETWEEN operator
- Date filtering using CURDATE() and INTERVAL
- Aggregate functions: MAX(), MIN(), AVG(), SUM(), COUNT()
- Subqueries
- INNER JOIN
- GROUP BY
- Foreign keys and ON DELETE CASCADE

## 📈 Project Analysis
Using this project, we can:
- Retrieve customer details by name.
- Find orders placed within the last 30 days.
- Calculate the highest, lowest, and average order amounts.
- Identify the highest-priced and lowest-priced products.
- Calculate total revenue from order details.
- Find the top three products by quantity ordered.
- Count how many order-detail records contain a particular product.

## ▶️ How to Run the Project

1. Install MySQL Server on your computer.
2. Open MySQL Command Line Client or connect MySQL through VS Code.
3. Copy the SQL code into your SQL editor.
4. Execute the script in the correct order.
5. Run the SELECT queries to view the results.

**Note:** If the database and tables already exist, handle existing data before running the complete script again to avoid duplicate table or primary key errors.

## 📚 Learning Outcomes
- Understanding relational databases.
- Creating tables and defining primary and foreign keys.
- Writing SQL queries for data manipulation.
- Using JOINs and subqueries to combine and analyze data.
- Applying aggregate functions for sales analysis.
- Understanding basic database relationships.

## 👩‍💻 Author
**Project Name:** Data Digger  
**Domain:** Database Management and Data Analysis  
**Technology:** MySQL

VIDEO LINK : https://drive.google.com/file/d/1m_w4lb1XKeZUSISolnqzR5KTyNifYMCo/view?usp=sharing

## 🏁 Conclusion
Data Digger provides practical experience in MySQL database creation, data manipulation, relational table management, and sales data analysis. It helps build a strong foundation in SQL for database management and data analytics.
