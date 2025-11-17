-- Query1
-- WHERE: filter rows before grouping
USE ecommerce_db;
SELECT * FROM customers
WHERE customer_name = 'ram';

-- HAVING: used after GROUP BY
SELECT customer_id, COUNT(order_id) AS total_orders
FROM orders
GROUP BY customer_id
HAVING COUNT(order_id) > 1;

-- Query2
-- Simple JOIN
SELECT customers.customer_name, orders.order_id
FROM customers
JOIN orders ON customers.customer_id = orders.customer_id;

-- LEFT JOIN
SELECT customers.customer_name, orders.order_id
FROM customers
LEFT JOIN orders
ON customers.customer_id = orders.customer_id;

-- Query3
-- Average Revenue Per User (Simple ARPU)
SELECT 
    SUM(payments.amount) / COUNT(DISTINCT orders.customer_id) AS avg_revenue
FROM payments
JOIN orders ON payments.order_id = orders.order_id;

-- Query4
-- Simple Subquery
SELECT customer_name
FROM customers
WHERE customer_id IN (SELECT customer_id FROM orders);

-- Query5
-- Simple Optimization
CREATE INDEX idx_customer ON orders(customer_id);
SELECT * from customers;

-- Query6
-- Simple View
CREATE VIEW customer_order_details AS
SELECT customers.customer_name, orders.order_id
FROM customers
JOIN orders ON customers.customer_id = orders.customer_id;
SELECT * from customer_order_details