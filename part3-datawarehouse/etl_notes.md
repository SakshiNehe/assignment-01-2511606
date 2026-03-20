## ETL Decisions

### Decision 1 — Date Standardization
Problem: The raw dataset had inconsistent date formats (e.g., DD-MM-YYYY and MM/DD/YYYY).
Resolution: All dates were converted into a standard YYYY-MM-DD format before loading into the dim_date table.

### Decision 2 — Handling NULL Values
Problem: Some records had missing product categories or store information.
Resolution: Missing values were either filled using default categories like 'Unknown' or removed if critical fields were missing.

### Decision 3 — Category Normalization
Problem: Product categories had inconsistent casing (e.g., 'electronics', 'Electronics', 'ELECTRONICS').
Resolution: All category values were standardized to proper case (e.g., 'Electronics') to ensure accurate grouping in analysis.