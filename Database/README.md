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
The table creating queries are run in pgAdmin4 from `schema.sql` to create tables within the database that hold the different parts of the original dataset, as well as newly created features. The tables are linked through their primary keys: id. The tables are:
- original_features: The original features including the target variable, minus the coordinates.
- created_features: The features created in `proc_cal_housing.ipynb`.
- locations: The lat and lon coordinates of each block group.

![pg_insert_png](https://github.com/TBrickey/Project_One/blob/Jacob/Database/Resources/sql_insert_png.png)
![ERD_png](https://github.com/TBrickey/Project_One/blob/Jacob/Database/QuickDBD-Housing_ERD.png)

The ERD was created using QUICKDBD. The schema text for creating the ERD can be found in `SCHEMA_ERD.docx`


## Data Insertion
A connection to the database is established using SQLAlchemy and psycopg2 in `proc_cal_housing.ipynb`, and the processed data is inserted into each of the tables using pandas to_sql() function.
Queries are executed in pgAdmin to confirm successful transfer of data to the database. These queries can also be found in `schema.sql`

![insertion_png](https://github.com/TBrickey/Project_One/blob/Jacob/Database/Resources/insert_alchemy.png)

## Data Extraction
A connection is made to the database using SQLAlchemy and the data necessary for training and testing the models is loaded into a pandas dataframe in the `Machine_Learning.ipynb` notebook. Each model is tested using two different versions of the dataset. The original features alone, and the original features joined with the created features. The join is executed using SQL queries.

*need join image*


![extraction_png](https://github.com/TBrickey/Project_One/blob/Jacob/Database/Resources/colab_extraction.png)
