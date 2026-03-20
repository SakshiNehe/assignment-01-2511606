## Anomaly Analysis

### Insert Anomaly
In the dataset, a new product cannot be inserted independently without creating an order. 
For example, adding a new product with product_id and product_name requires order_id, customer details, and sales representative information, which may not exist at that time.

### Update Anomaly
Customer details such as customer_city are repeated across multiple rows for each order. 
If a customer changes their city, all corresponding rows must be updated, increasing the risk of inconsistent data..

### Delete Anomaly
If a row containing the only order of a product is deleted, all information about that product, including product_name and category, is lost.



## Normalization Justification

Keeping all data in a single table may appear simple initially, but it introduces significant data integrity and maintenance issues. In the given dataset, customer, product, order, and sales representative details are stored together, leading to high redundancy. For example, if a customer places multiple orders, their name and email are repeated in multiple rows. Similarly, product details such as name and price are duplicated for every order containing that product.

This redundancy leads to update anomalies. For instance, if a customer’s email changes, it must be updated in multiple rows. Missing even one row results in inconsistent data. Insert anomalies also occur because new products or customers cannot be added unless an order is created. Delete anomalies are equally problematic; deleting a single order may remove all information about a product or customer if it was their only record.

By normalizing the schema into separate tables — customers, products, sales representatives, orders, and order_items — each entity is stored independently. Relationships are maintained using foreign keys, ensuring data consistency. This design eliminates redundancy, prevents anomalies, and improves scalability. While normalization introduces more tables and joins, it significantly enhances data integrity and makes the database easier to maintain in the long run.

Therefore, normalization is not over-engineering but a necessary step for building reliable and efficient database systems.