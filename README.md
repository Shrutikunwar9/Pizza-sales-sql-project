# Pizza Sales Data Analysis using SQL

## Objective 

The objective of this project is to analyze pizza sales data using SQL to uncover key insights about sales performance, customer preferences, and operational trends. This includes metrics such as total revenue, order distribution, popular pizza types, and time-based sales patterns to support data-driven business decisions.

## Dataset Used
- <a href="https://github.com/Shrutikunwar9/Pizza-sales-sql-project/blob/main/pizza_sales%20(1).zip">Pizza Sales Data</a>

## Schema
```sql
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
quantity INT NOT NULL
);
```
## Business Problems and Solutions
## SQL Insights

**1 Retrieve the total number of orders placed:**
```sql
USE pizza_sales;

SELECT 
    COUNT(order_id) AS total_order
FROM
    orders;
```

**2 Calculate the total revenue generated from pizza sales:**
```sql
SELECT 
    ROUND(SUM(orders_details.quantity * pizzas.price), 2) AS Total_sales
FROM
    orders_details
    JOIN pizzas ON pizzas.pizza_id = orders_details.pizza_id;
```

**3 Identify the highest-priced pizza:**
```sql
SELECT 
    pizza_id, price
FROM
    pizzas
ORDER BY PRICE DESC
LIMIT 1;
```

**4 Identify the most common pizza size ordered:**
```sql
SELECT 
    pizzas.size, COUNT(orders_details.quantity)
FROM
    pizzas
    JOIN orders_details ON pizzas.pizza_id = orders_details.pizza_id
GROUP BY pizzas.size
ORDER BY COUNT(orders_details.quantity) DESC
LIMIT 1;
```

**5 List the top 5 most ordered pizza types along with their quantities:**
```sql
SELECT 
    pizza_types.name AS pizza_name,
    COUNT(orders_details.quantity) AS quantities
FROM
    pizza_types
    JOIN pizzas ON pizza_types.pizza_type_id = pizzas.pizza_type_id
    JOIN orders_details ON orders_details.pizza_id = pizzas.pizza_id
GROUP BY pizza_name
ORDER BY quantities DESC
LIMIT 5;
```

**6 Find the total quantity of each pizza category ordered:**
```sql
USE pizza_sales;

SELECT 
    pizza_types.category,
    SUM(orders_details.quantity) AS quantity
FROM
    pizza_types
    JOIN pizzas ON pizza_types.pizza_type_id = pizzas.pizza_type_id
    JOIN orders_details ON orders_details.pizza_id = pizzas.pizza_id
GROUP BY pizza_types.category
ORDER BY quantity DESC;
```

**7 Determine the distribution of orders by hour of the day:**
```sql
SELECT 
    HOUR(order_time), COUNT(order_id)
FROM
    orders
GROUP BY HOUR(order_time);
```

**8 Find the category-wise distribution of pizzas:**
```sql
SELECT 
    category AS pizza_category, COUNT(pizza_type_id) AS total
FROM
    pizza_types
GROUP BY pizza_category;
```

**9 Calculate the average number of pizzas ordered per day:**
```sql
SELECT 
    ROUND(AVG(quantity), 0)
FROM
    (SELECT 
        orders.order_date, SUM(orders_details.quantity) AS quantity
    FROM
        orders
    JOIN orders_details ON orders.order_id = orders_details.order_id
    GROUP BY orders.order_date) AS order_quantity;
```

**10 Determine the top 3 most ordered pizza types based on revenue:**
```sql
SELECT 
    pizza_types.name,
    SUM(orders_details.quantity * pizzas.price) AS revenue
FROM
    orders_details
    JOIN pizzas ON orders_details.pizza_id = pizzas.pizza_id
    JOIN pizza_types ON pizza_types.pizza_type_id = pizzas.pizza_type_id
GROUP BY pizza_types.name
ORDER BY revenue DESC
LIMIT 3;
```
# Conclusion

The pizza sales data analysis provides valuable insights into the sales performance, customer preferences, and operational trends. The analysis reveals that a significant number of orders are placed, generating substantial revenue. The highest-priced pizza and the most common pizza size ordered highlight customer preferences. The top 5 most ordered pizza types and the total quantity of each pizza category ordered provide insights into popular choices. The distribution of orders by hour of the day and the category-wise distribution of pizzas help understand peak hours and popular categories. The average number of pizzas ordered per day and the top 3 most ordered pizza types based on revenue further emphasize customer behavior and preferences. These insights can be utilized to make informed business decisions, optimize operations, and enhance customer satisfaction.

## THANK YOU FOR YOUR TIME
