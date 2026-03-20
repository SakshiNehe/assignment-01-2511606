-- Q1: List all customers along with the total number of orders they have placed
SELECT 
    c.customer_id,
    c.name,
    COUNT(o.order_id) AS total_orders
FROM 'datasets/customers.csv' c
LEFT JOIN read_json_auto('datasets/orders.json') o
ON c.customer_id = o.customer_id
GROUP BY c.customer_id, c.name;



-- Q2: Find the top 3 customers by total order value
SELECT 
    c.name,
    SUM(o.total_amount) AS total_value
FROM 'datasets/customers.csv' c
JOIN read_json_auto('datasets/orders.json') o
ON c.customer_id = o.customer_id
GROUP BY c.name
ORDER BY total_value DESC
LIMIT 3;



-- Q3: List all customers from Bangalore (since product mapping is not in orders.json)
SELECT 
    name,
    city
FROM 'datasets/customers.csv'
WHERE city = 'Bangalore';



-- Q4: Join all three files (simplified join showing customer + order info)
SELECT 
    c.name,
    c.city,
    o.order_date,
    o.total_amount
FROM 'datasets/customers.csv' c
JOIN read_json_auto('datasets/orders.json') o
ON c.customer_id = o.customer_id;