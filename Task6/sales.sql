CREATE DATABASE sales_analysis;
USE sales_analysis;

CREATE TABLE online_sales (
    order_id INT,
    order_date DATE,
    amount DECIMAL(10,2),
    product_id INT
);

INSERT INTO online_sales (order_id, order_date, amount, product_id) VALUES
(1001, '2025-01-05', 1500.00, 1),
(1002, '2025-01-10', 2500.50, 2),
(1003, '2025-01-15', 1800.00, 3),
(1004, '2025-02-01', 2200.00, 1),
(1005, '2025-02-05', 3100.75, 2),
(1006, '2025-02-18', 500.00, 4),
(1007, '2025-03-03', 4000.00, 2),
(1008, '2025-03-10', 2600.00, 3),
(1009, '2025-03-23', 1450.25, 1);
SELECT * FROM online_sales;

-- EXTRACT(MONTH FROM order_date) for month.
SELECT 
    order_id,
    order_date,
    EXTRACT(MONTH FROM order_date) AS sale_month
FROM online_sales;

-- Group by Year and Month 
SELECT 
    EXTRACT(YEAR FROM order_date) AS sale_year,
    EXTRACT(MONTH FROM order_date) AS sale_month
FROM online_sales
GROUP BY 
    EXTRACT(YEAR FROM order_date),
    EXTRACT(MONTH FROM order_date);

-- Calculate Monthly Revenue Using SUM()
SELECT 
    EXTRACT(YEAR FROM order_date) AS sale_year,
    EXTRACT(MONTH FROM order_date) AS sale_month,
    SUM(amount) AS total_revenue
FROM online_sales
GROUP BY 
    sale_year, sale_month;

-- COUNT(DISTINCT order_id) for volume
SELECT 
    EXTRACT(YEAR FROM order_date) AS sale_year,
    EXTRACT(MONTH FROM order_date) AS sale_month,
    COUNT(DISTINCT order_id) AS order_volume
FROM online_sales
GROUP BY 
    sale_year, sale_month;

-- Sort Results Using ORDER BY
SELECT 
    EXTRACT(YEAR FROM order_date) AS sale_year,
    EXTRACT(MONTH FROM order_date) AS sale_month,
    SUM(amount) AS total_revenue,
    COUNT(DISTINCT order_id) AS order_volume
FROM online_sales
GROUP BY 
    sale_year, sale_month
ORDER BY 
    sale_year, sale_month;

-- Limit Results to a Time Range
SELECT 
    EXTRACT(YEAR FROM order_date) AS sale_year,
    EXTRACT(MONTH FROM order_date) AS sale_month,
    SUM(amount) AS total_revenue,
    COUNT(DISTINCT order_id) AS order_volume
FROM online_sales
WHERE order_date BETWEEN '2025-01-01' AND '2025-12-31'
GROUP BY 
    sale_year, sale_month
ORDER BY 
    sale_year, sale_month;
