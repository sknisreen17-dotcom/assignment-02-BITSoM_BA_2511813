-- Q3.1

CREATE TABLE dim_date (
    date_id INT PRIMARY KEY,
    full_date DATE,
    year INT,
    month INT,
    day INT
);

CREATE TABLE dim_store (
    store_id INT PRIMARY KEY,
    store_name VARCHAR(100),
    city VARCHAR(100)
);

CREATE TABLE dim_product (
    product_id INT PRIMARY KEY,
    product_name VARCHAR(100),
    category VARCHAR(100)
);

CREATE TABLE fact_sales (
    transaction_id VARCHAR(20) PRIMARY KEY,
    date_id INT FOREIGN KEY REFERENCES dim_date(date_id),
    store_id INT FOREIGN KEY REFERENCES dim_store(store_id),
    product_id INT FOREIGN KEY REFERENCES dim_product(product_id),
    units_sold INT,
    unit_price DECIMAL(10,2),
    total_sales DECIMAL(10,2)
);

INSERT INTO dim_store (store_id, store_name, city) VALUES 
(1, 'Chennai Anna', 'Chennai'),
(2, 'Delhi South', 'Delhi'),
(3, 'Bangalore MG', 'Bangalore'),
(4, 'Pune FC Road', 'Pune'),
(5, 'Mumbai Central', 'Mumbai');

INSERT INTO dim_product (product_id, product_name, category) VALUES 
(1, 'Speaker', 'Electronics'),
(2, 'Tablet', 'Electronics'),
(3, 'Phone', 'Electronics'),
(4, 'Smartwatch', 'Electronics'),
(5, 'Atta 10kg', 'Grocery'),
(6, 'Jeans', 'Clothing'),
(7, 'Biscuits', 'Grocery');

INSERT INTO dim_date VALUES 
(20230829, '2023-08-29', 2023, 8, 29),
(20231212, '2023-12-12', 2023, 12, 12),
(20230205, '2023-02-05', 2023, 2, 5),
(20230220, '2023-02-20', 2023, 2, 20),
(20230115, '2023-01-15', 2023, 1, 15),
(20230809, '2023-08-09', 2023, 8, 9),
(20230331, '2023-03-31', 2023, 3, 31),
(20231026, '2023-10-26', 2023, 10, 26),
(20231208, '2023-12-08', 2023, 12, 8),
(20230815, '2023-08-15', 2023, 8, 15);

INSERT INTO fact_sales (transaction_id, date_id, store_id, product_id, units_sold, unit_price, total_sales) VALUES
('TXN5000', 20230829, 1, 1, 3, 49262.78, 147788.34),
('TXN5001', 20231212, 1, 2, 11, 23226.12, 255487.32),
('TXN5002', 20230205, 1, 3, 20, 48703.39, 974067.80),
('TXN5003', 20230220, 2, 2, 14, 23226.12, 325165.68),
('TXN5004', 20230115, 1, 4, 10, 58851.01, 588510.10),
('TXN5005', 20230809, 3, 5, 12, 524.00, 6288.00),
('TXN5006', 20230331, 4, 4, 6, 58851.01, 353106.06),
('TXN5007', 20231026, 4, 6, 16, 2317.47, 37079.52),
('TXN5008', 20231208, 3, 7, 9, 469.99, 4229.91),
('TXN5009', 20230815, 3, 4, 3, 58851.01, 176553.03);