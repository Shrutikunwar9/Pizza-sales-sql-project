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

