## Architecture Recommendation: Data Lake vs Data Warehouse vs Lakehouse

# Introduction
In this assignment, we worked with multiple types of data files including CSV, JSON, and Parquet. These file formats represent semi-structured and structured data sources commonly found in modern data systems. Choosing the right architecture for storing and processing this data is important for scalability, flexibility, and analytics.

The three main architectures considered are:
- Data Warehouse
- Data Lake
- Data Lakehouse

# Data Warehouse
A Data Warehouse is designed to store structured data that has been cleaned and transformed before being loaded into the system. It follows a schema-on-write approach, meaning the schema must be defined before storing the data.

Advantages:
- Optimized for SQL queries and analytics
- Strong data consistency
- Good performance for business intelligence workloads

Limitations:
- Not flexible for semi-structured or raw data
- Requires preprocessing before ingestion
- Can be expensive at scale

Since our assignment involves raw CSV and JSON files, a data warehouse alone may not be the best fit.


# Data Lake
A Data Lake stores raw data in its original format, including structured, semi-structured, and unstructured data. It follows a schema-on-read approach, where the schema is applied when the data is queried.

Advantages:
- Highly scalable
- Supports multiple data formats
- Suitable for data science and analytics
- Low storage cost

Limitations:
- Data governance can be challenging
- Query performance may be slower without optimization
- Data quality management is required

In this assignment, we used DuckDB to query CSV, JSON, and Parquet files directly, which is a typical use case of a Data Lake environment.


# Data Lakehouse
A Data Lakehouse combines the advantages of both Data Lakes and Data Warehouses. It allows storing raw data like a data lake while also supporting structured analytics similar to a warehouse.

Advantages:
- Supports multiple data formats
- Improved query performance
- Better data governance
- Unified platform for analytics and machine learning

Many modern systems such as Delta Lake, Apache Iceberg, and Databricks follow the Lakehouse architecture.

---

# Recommended Architecture
For this assignment scenario, the most suitable architecture is a **Data Lake**.

Reasons:
- We are working with multiple file formats (CSV, JSON, Parquet)
- Data is queried directly without strict schema enforcement
- DuckDB allows flexible analytics on raw files
- This setup mimics real-world modern data lake environments

If the system grows and requires advanced analytics, governance, and performance optimization, transitioning to a **Lakehouse architecture** would be the best long-term solution.


# Conclusion
The Data Lake architecture best fits the requirements of this assignment because it supports flexible data ingestion and querying across multiple file formats. With tools like DuckDB, it becomes easy to analyze raw datasets efficiently. In modern data engineering systems, organizations often start with a data lake and later evolve into a lakehouse architecture for better scalability and analytics capabilities.