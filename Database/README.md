# Database
## Overview
A Relational Database from AWS has been established to hold the data for the project. The database instance uses postgres and is connected to pgAdmin4 for management. Data will be inserted and retreived using a SQLAlchemy and psycop2g connection engine along with pandas functions.

## Creation

An AWS Relational Database is created named housing-database.

The RDS instance named `housing-database` is created with PostgreSQL and connected to pgAdmin4. The data is held in the postgres database within the housing-database AWS RDS instance.

![aws_png](https://github.com/TBrickey/Project_One/blob/Jacob/Database/Resources/aws_png.png)

### Tools
AWS, pgAdmin4, PostgreSQL, Pandas, SQLAlchemy, psycopg2


## Table Creation and Schema
The table creating queries are run in pgAdmin4 from `table_creating.sql` to create tables within the database that hold the different versions of the dataset. One for the complete unaltered dataset, and two others for the training and testing datasets.

![pg_insert_png](https://github.com/TBrickey/Project_One/blob/Jacob/Database/Resources/sql_insert_png.png)
![ERD_png](https://github.com/TBrickey/Project_One/blob/Jacob/Database/QuickDBD-Housing_ERD.png)

The ERD was created using QUICKDBD. The schema text for creating the ERD can be found in `SCHEMA_ERD.docx`


## Data Insertion
A connection to the database is established using SQLAlchemy and psycopg2 at the end of the `housing_data_processing.ipynb` notebook, and the processed data is inserted into each of the tables using pandas to_sql() function.
Queries are executed in pgAdmin to confirm successful transfer of data to the database.

![insertion_png](https://github.com/TBrickey/Project_One/blob/Jacob/Database/Resources/insert_alchemy.png)

## Data Extraction
A connection is made to the database using SQLAlchemy and the data necessary for training and testing the model is loaded into a pandas dataframe in the `Random_Forest.ipynb` notebook.

![extraction_png](https://github.com/TBrickey/Project_One/blob/Jacob/Database/Resources/colab_extraction.png)