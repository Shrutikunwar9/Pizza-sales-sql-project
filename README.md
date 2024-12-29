# Pizza Sales Data Analysis using SQL

## Objective 

The objective of this project is to analyze pizza sales data using SQL to uncover key insights about sales performance, customer preferences, and operational trends. This includes metrics such as total revenue, order distribution, popular pizza types, and time-based sales patterns to support data-driven business decisions.

## Dataset Used
- <a href="https://github.com/Shrutikunwar9/Pizza-sales-sql-project/blob/main/pizza_sales%20(1).zip">Pizza Sales Data</a>

## Schema
CREATE DATABASE pizza_sales;
USE pizza_sales;
CREATE TABLE orders (
order_id INT PRIMARY KEY NOT NULL,
order_date DATE NOT NULL,
order_time TIME NOT NULL );

SELECT * FROM pizzas;
CREATE TABLE orders_details (
order_details_id INT PRIMARY KEY NOT NULL,	
order_id INT NOT NULL,	
pizza_id VARCHAR(100),	
quantity INT NOT NULL);

