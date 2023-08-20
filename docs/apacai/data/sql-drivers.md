SQL drivers can be used to make SQL queries and load table schemas. They are used by the `SqlLoader` to process data. All loaders implement the following methods:

* `execute_query()` executes a query and returns `RowResult`s.
* `execute_query_row()` executes a query and returns a raw result from SQL.
* `get_table_schema()` returns a table schema.

!!! info
    More database-specific SQL drivers are coming soon.

## SqlDriver

This is a basic SQL loader based on [SQLAlchemy 1.x](https://docs.sqlalchemy.org/en/14/). Here is an example of how to use it:

```python
from swarms.drivers import SqlDriver

driver = SqlDriver(
    engine_url="sqlite:///:memory:"
)

driver.execute_query("select * from users;")
```

## AmazonRedshiftSqlDriver

This is a SQL driver for interacting with the [Amazon Redshift Data API](https://docs.aws.amazon.com/redshift-data/latest/APIReference/Welcome.html) 
to execute statements. Here is an example of how to use it for Redshift Serverless:

```python
import boto3
from swarms.drivers import AmazonRedshiftSqlDriver

session = boto3.Session(region_name="us-east-1")

driver=AmazonRedshiftSqlDriver(
    database="dev",
    session=session,
    workgroup_name="dev"
)

driver.execute_query("select * from users;")
```

## SnowflakeSqlDriver

This is a SQL driver based on the [Snowflake SQLAlchemy Toolkit](https://docs.snowflake.com/en/developer-guide/python-connector/sqlalchemy) which runs on top of the Snowflake Connector for Python. Here is an example of how to use it:

```python
import snowflake.connector
from snowflake.connector import SnowflakeConnection
from swarms.drivers import SnowflakeSqlDriver

PWD = os.environ.get('PWD')

def get_snowflake_connection() -> SnowflakeConnection:
    return snowflake.connector.connect(
        account = 'account',
        user = 'user',
        password = PWD,
        database = 'database',
        schema = 'schema',
    )

driver=SnowflakeSqlDriver(
    connection_func=get_snowflake_connection
)

driver.execute_query("select * from users;")
```