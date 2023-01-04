# Database
## Overview
A Relational Database from AWS will be established to hold the data for the project. The database instance will use postgres and be connected to pgAdmin4 for management. Data will be inserted and retreived using a SQLAlchemy and psycop2g connection engine along with pandas functions.

## Creation

An AWS Relational Database is created named housing-database.
EndPoint: housing-database.c6zoxppofyzr.us-east-1.rds.amazonaws.com

The RDS instance named `housing-database` is created with PostgreSQL and connected to pgAdmin4. The data is held in the postgres database within the housing-database AWS RDS instance.

### Tools
AWS, pgAdmin4, PostgreSQL, Pandas, SQLAlchemy, psycopg2

## Table Creation
The table creating queries are run in pgAdmin4 from `table_creating.sql` to create tables within the database that hold the different versions of the dataset. One for the complete unaltered dataset, and two others for the training and testing datasets.

## Data Insertion
A connection to the database is established using SQLAlchemy and psycopg2 at the end of the `housing_data_processing.ipynb` notebook, and the processed data is inserted into each of the tables using pandas to_sql() function.
Queries are executed in pgAdmin to confirm successful tranfer of data to the database.

## Data Extraction
A connection is made to the database using SQLAlchemy and the data necessary for training and testing the model is loaded into a pandas dataframe.