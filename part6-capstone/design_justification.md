# Storage Systems

The architecture is designed to support four main goals of the hospital network: predicting patient readmission risk, allowing doctors to query patient history in natural language, generating management reports, and handling real-time ICU monitoring data.

Hospital operational systems such as Electronic Health Records (EHR), billing systems, and laboratory systems generate structured transactional data. This data is stored in PostgreSQL, which acts as the OLTP database. PostgreSQL is used because it is reliable for handling day-to-day hospital operations such as patient records, treatments, and billing transactions.

For ICU monitoring, medical devices continuously generate real-time vitals data such as heart rate, oxygen levels, and blood pressure. This streaming data is first processed through a streaming pipeline using Kafka. Kafka is suitable because it can handle high-volume real-time data streams efficiently. The data is then stored in InfluxDB, which is a time-series database optimized for storing timestamp-based medical data and supporting monitoring and alert systems.

Data from the hospital operational database is periodically moved through an ETL pipeline managed by Apache Airflow. This pipeline loads the data into a data lake stored in AWS S3. The data lake is used to store large volumes of raw historical data in a scalable and cost-effective way.

From the data lake, cleaned and structured data is moved into a data warehouse such as Snowflake or BigQuery. The data warehouse supports analytical queries required for generating monthly hospital reports and preparing data for machine learning models that predict patient readmission risk.

Finally, the AI and analytics layer uses the processed data to run machine learning models, support natural language queries from doctors, and generate management dashboards.

# OLTP vs OLAP Boundary

In this architecture, the OLTP system consists of the PostgreSQL database used by hospital operational systems. This system handles real-time transactions such as patient admissions, treatment updates, billing operations, and laboratory data recording.

The OLAP system begins when data is extracted from PostgreSQL through the ETL pipeline using Apache Airflow. Once the data moves into the data lake stored in AWS S3, it becomes part of the analytical system.

From the data lake, data is processed and loaded into the data warehouse, where analytical queries, reporting, and machine learning model training are performed. This separation ensures that the transactional systems remain fast and responsive while analytical workloads run on a separate optimized environment.

# Trade-offs

One significant trade-off in this architecture is the use of multiple systems such as Kafka, PostgreSQL, InfluxDB, a data lake, and a data warehouse. While this design improves scalability and performance, it increases system complexity and requires more effort to manage data movement between systems.

However, this trade-off is necessary because different types of data require different storage solutions. Real-time ICU data is best handled by a time-series database, while transactional hospital records need a relational database, and analytical workloads require a data warehouse.

To reduce this complexity, orchestration tools such as Apache Airflow can be used to manage data pipelines and automate the flow of data between systems. Monitoring tools and proper data governance practices can also help maintain reliability and ensure data consistency across the architecture.