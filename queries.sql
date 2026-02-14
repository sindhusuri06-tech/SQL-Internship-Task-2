-- 1. Total spending by each customer (Window Function)
SELECT 
    c.name,
    o.amount,
    SUM(o.amount) OVER (PARTITION BY c.customer_id) AS total_spent
FROM customers c
JOIN orders o ON c.customer_id = o.customer_id;


-- 2. Rank customers by total purchase
SELECT 
    name,
    total_amount,
    RANK() OVER (ORDER BY total_amount DESC) AS rank_no
FROM (
    SELECT 
        c.name,
        SUM(o.amount) AS total_amount
    FROM customers c
    JOIN orders o ON c.customer_id = o.customer_id
    GROUP BY c.name
) t;


-- 3. Customers with above average purchase
SELECT name, total_amount
FROM (
    SELECT 
        c.name,
        SUM(o.amount) AS total_amount
    FROM customers c
    JOIN orders o ON c.customer_id = o.customer_id
    GROUP BY c.name
) t
WHERE total_amount > (
    SELECT AVG(total_amount)
    FROM (
        SELECT SUM(amount) AS total_amount
        FROM orders
        GROUP BY customer_id
    ) a
);


-- 4. Monthly sales using CTE
WITH MonthlySales AS (
    SELECT 
        MONTH(order_date) AS month,
        SUM(amount) AS total_sales
    FROM orders
    GROUP BY MONTH(order_date)
)
SELECT * FROM MonthlySales;
