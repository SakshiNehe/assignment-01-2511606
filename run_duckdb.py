import duckdb

con = duckdb.connect()

with open("part5-datalake/duckdb_queries.sql", "r") as file:
    sql_script = file.read()

queries = sql_script.split(";")

for i, query in enumerate(queries):
    query = query.strip()
    if query:
        print("\n==============================")
        print(f"Running Query {i+1}")
        print("==============================")

        result = con.execute(query).fetchdf()
        print(result)