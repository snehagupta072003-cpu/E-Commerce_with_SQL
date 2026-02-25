🛒 E-Commerce Sales Database (SQL Project)
📌 Project Overview

This project is a relational SQL database system designed to manage and analyze an E-Commerce sales platform.
It includes database schema creation, sample data insertion, and analytical SQL queries to extract meaningful business insights such as customer behavior, sales performance, payments, and shipping status.

The project demonstrates practical use of SQL for real-world business analysis.

🎯 Objectives

Design a structured E-Commerce database

Maintain relationships between customers, orders, products, and payments

Perform business analysis using SQL queries

Generate insights related to sales, revenue, and customer activity

🗂️ Database Structure

The database E_Commerce_Sales contains the following tables:

Table Name	Description
customer	Stores customer details
product	Contains product information and stock
orders	Records customer orders
order_items	Stores products included in each order
payments	Payment transaction details
shipping	Shipping and delivery information
🔗 Relationships

One customer → Many orders

One order → Multiple products

Orders linked with payments and shipping details using foreign keys

⚙️ Features & Analysis Queries

The project includes 25+ SQL queries covering:

✅ Customer order analysis
✅ Revenue calculation
✅ Top-selling & expensive products
✅ Sales by category
✅ Payment method analysis
✅ Shipping and delivery tracking
✅ Monthly sales trends
✅ Stock availability insights

Example insights:

Total revenue generated

Most popular product

Customers with no orders

Orders delivered within 5 days

Average payment per customer

🛠️ Technologies Used

MySQL / SQL

Relational Database Design

Joins, Aggregations, Subqueries

Group By & Analytical Queries

📁 Project Files
📦 E-Commerce-Sales-SQL
 ┣ 📄 schema.sql     → Database & table creation
 ┣ 📄 data.sql       → Sample data insertion
 ┣ 📄 queries.sql    → Business analysis queries
 ┗ 📄 README.md
🚀 How to Run the Project

Open MySQL Workbench (or any SQL editor).

Run schema.sql to create database and tables.

Execute data.sql to insert sample records.

Run queries.sql to perform analysis.

📊 Skills Demonstrated

Database Design

SQL Query Writing

Data Analysis using SQL

Business Insight Generation

Data Modeling with Foreign Keys

👩‍💻 Use Case

This project is ideal for:

Data Analyst portfolio projects

SQL practice and learning

Interview demonstrations

Academic database assignments

⭐ Future Improvements

Add stored procedures & views

Create dashboards using Power BI/Tableau

Implement indexing for performance optimization

