CREATE TABLE customers (
    customer_id INT PRIMARY KEY,
    name VARCHAR(50),
    city VARCHAR(50)
);

CREATE TABLE orders (
    order_id INT PRIMARY KEY,
    customer_id INT,
    order_date DATE,
    amount INT,
    FOREIGN KEY (customer_id) REFERENCES customers(customer_id)
);

INSERT INTO customers VALUES
(1,'Ravi','Chennai'),
(2,'Priya','Bangalore'),
(3,'Arun','Mumbai'),
(4,'Neha','Delhi');

INSERT INTO orders VALUES
(101,1,'2025-01-10',500),
(102,2,'2025-01-12',800),
(103,1,'2025-01-15',1200),
(104,3,'2025-01-20',600),
(105,2,'2025-02-01',1500),
(106,4,'2025-02-05',700);
