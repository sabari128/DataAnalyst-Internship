CREATE DATABASE ecommerce_db;

USE ecommerce_db;

CREATE TABLE customers (
    customer_id INT PRIMARY KEY,
    customer_name VARCHAR(50),
    email VARCHAR(100)
);

CREATE TABLE orders (
    order_id INT PRIMARY KEY,
    customer_id INT,
    order_date DATE,
    FOREIGN KEY (customer_id) REFERENCES customers(customer_id)
);

CREATE TABLE payments (
    payment_id INT PRIMARY KEY,
    order_id INT,
    amount DECIMAL(10,2),
    FOREIGN KEY (order_id) REFERENCES orders(order_id)
);

-- Sample Data
INSERT INTO customers VALUES
(1, 'ram', 'ram@example.com'),
(2, 'raj', 'raj@gmail.com'),
(3, 'raju', 'raju@example.com');

INSERT INTO orders VALUES
(101, 1, '2024-01-10'),
(102, 2, '2024-01-11'),
(103, 1, '2024-01-12');

INSERT INTO payments VALUES
(1, 101, 500),
(2, 102, 300),
(3, 103, 700);
