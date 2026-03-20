-- Create Date Dimension
CREATE TABLE dim_date (
    date_id INT PRIMARY KEY,
    full_date DATE NOT NULL,
    month INT NOT NULL,
    year INT NOT NULL
);

-- Create Product Dimension
CREATE TABLE dim_product (
    product_id INT PRIMARY KEY,
    product_name VARCHAR(100) NOT NULL,
    category VARCHAR(50) NOT NULL
);

-- Create Store Dimension
CREATE TABLE dim_store (
    store_id INT PRIMARY KEY,
    store_name VARCHAR(100) NOT NULL,
    city VARCHAR(50) NOT NULL
);

-- Create Fact Sales Table
CREATE TABLE fact_sales (
    sale_id INT PRIMARY KEY,
    date_id INT NOT NULL,
    product_id INT NOT NULL,
    store_id INT NOT NULL,
    quantity INT NOT NULL,
    total_amount DECIMAL(10,2) NOT NULL,
    FOREIGN KEY (date_id) REFERENCES dim_date(date_id),
    FOREIGN KEY (product_id) REFERENCES dim_product(product_id),
    FOREIGN KEY (store_id) REFERENCES dim_store(store_id)
);

-- Insert into Date Dimension
INSERT INTO dim_date VALUES
(1, '2024-01-01', 1, 2024),
(2, '2024-01-15', 1, 2024),
(3, '2024-02-10', 2, 2024),
(4, '2024-02-20', 2, 2024);

-- Insert into Product Dimension
INSERT INTO dim_product VALUES
(101, 'Laptop', 'Electronics'),
(102, 'Mobile', 'Electronics'),
(103, 'Shoes', 'Clothing'),
(104, 'Watch', 'Accessories');


-- Insert into Store Dimension
INSERT INTO dim_store VALUES
(201, 'Store A', 'Mumbai'),
(202, 'Store B', 'Pune'),
(203, 'Store C', 'Bangalore');


-- Insert into Fact Table
INSERT INTO fact_sales VALUES
(1, 1, 101, 201, 1, 60000),
(2, 1, 102, 202, 2, 40000),
(3, 2, 103, 203, 1, 3000),
(4, 2, 104, 201, 1, 5000),
(5, 3, 101, 201, 1, 60000),
(6, 3, 102, 202, 1, 20000),
(7, 4, 103, 203, 2, 6000),
(8, 4, 101, 201, 1, 60000),
(9, 1, 104, 202, 1, 5000),
(10, 2, 102, 203, 1, 20000);