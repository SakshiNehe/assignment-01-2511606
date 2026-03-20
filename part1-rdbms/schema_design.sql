
CREATE DATABASE assignment01_db;
USE assignment01_db;

CREATE TABLE customers (
    customer_id INT PRIMARY KEY,
    customer_name VARCHAR(100) NOT NULL,
    customer_email VARCHAR(100) NOT NULL,
    customer_city VARCHAR(50) NOT NULL
);

CREATE TABLE products (
    product_id INT PRIMARY KEY,
    product_name VARCHAR(100) NOT NULL,
    category VARCHAR(50),
    unit_price DECIMAL(10,2) NOT NULL
);

CREATE TABLE sales_reps (
    sales_rep_id INT PRIMARY KEY,
    sales_rep_name VARCHAR(100) NOT NULL,
    sales_rep_email VARCHAR(100),
    office_address VARCHAR(200)
);

CREATE TABLE orders (
    order_id INT PRIMARY KEY,
    customer_id INT,
    sales_rep_id INT,
    order_date DATE,
    FOREIGN KEY (customer_id) REFERENCES customers(customer_id),
    FOREIGN KEY (sales_rep_id) REFERENCES sales_reps(sales_rep_id)
);

CREATE TABLE order_items (     
  order_id INT,     
  product_id INT,     
  quantity INT,     
  PRIMARY KEY (order_id, product_id),     
  FOREIGN KEY (order_id) REFERENCES orders(order_id),     
  FOREIGN KEY (product_id) REFERENCES products(product_id) )

-- Insert Customers
INSERT INTO Customers VALUES
(1, 'Rahul Sharma', 'rahul@gmail.com', 'Mumbai'),
(2, 'Priya Mehta', 'priya@gmail.com', 'Pune'),
(3, 'Amit Shah', 'amit@gmail.com', 'Delhi'),
(4, 'Neha Singh', 'neha@gmail.com', 'Mumbai'),
(5, 'Karan Patel', 'karan@gmail.com', 'Ahmedabad');

INSERT INTO products VALUES
(101, 'Laptop', 'Electronics', 60000),
(102, 'Mobile', 'Electronics', 20000),
(103, 'Shoes', 'Clothing', 3000),
(104, 'Watch', 'Accessories', 5000),
(105, 'Headphones', 'Electronics', 1500);

INSERT INTO sales_reps VALUES
(201, 'Rajesh Kumar', 'rajesh@company.com', 'Mumbai Office'),
(202, 'Priya Nair', 'priya@company.com', 'Pune Office'),
(203, 'Anil Gupta', 'anil@company.com', 'Delhi Office'),
(204, 'Meera Shah', 'meera@company.com', 'Mumbai Office'),
(205, 'Vikas Rao', 'vikas@company.com', 'Bangalore Office');

INSERT INTO orders VALUES
(1001, 1, 201, '2024-01-10'),
(1002, 2, 202, '2024-01-12'),
(1003, 3, 203, '2024-01-15'),
(1004, 4, 204, '2024-01-18'),
(1005, 5, 205, '2024-01-20');


INSERT INTO order_items VALUES
(1001, 101, 1),
(1001, 105, 2),
(1002, 102, 1),
(1003, 103, 2),
(1004, 104, 1),
(1005, 101, 1);