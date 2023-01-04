# Housing-Analysis

## Project Overview

### Reason
The team plans to examine the boston housing data set, conduct exploratory data analysis, and create and train a regression model that can predict the value of a house. As aspiring future homeowners, we are interested in learning what to look for when purchasing a house, and what variables we should consider important. This project hopes to use the housing data to answer the following questions and find insight into home values and their drivers. 

### Questions to answer
What features impact housing prices most?

How is the house price data distributed?

Does there appear to be any underlying bias in the data?


### Data Source
[The Boston House-Price Data](https://www.kaggle.com/datasets/fedesoriano/the-boston-houseprice-data).

This dataset contains information collected by the U.S Census Service concerning housing in the area of Boston Mass. The dataset is small in size with only 506 cases. The data was originally published by Harrison, D. and Rubinfeld, D.L. `Hedonic prices and the demand for clean air', J. Environ. Economics & Management, vol.5, 81-102, 1978.


### Communication
Team members will communicate biweekly through slack and will schedule additonal Zoom meetings as necessary.


### Model
The data will be used to train a sklearn ensemble model: `RandomForestRegressor()`. The team will use the model to attempt to predict the value of a home based on the provided features, and to gain insights into what influences home values.


### Database
A Relational Database from AWS will be established to hold the data for the project. The database instance will use postgres and be connected to pgAdmin4 for management. Data will be inserted and retreived using a SQLAlchemy and psycop2g connection engine along with pandas functions.
Team members created an ERD using QuickDB to display the relationships between the tables of our Boston Housing Data.

<img width="312" alt="QuickDBD-Housing_ERD" src="https://user-images.githubusercontent.com/110629852/210471333-7c53f5ba-5fca-476a-a2e5-f1730fabacef.png">



## Results
## Summary 
