# Housing-Analysis

## Project Overview

### Reason
The team plans to examine the boston housing data set, conduct exploratory data analysis, and create and train a regression model that can predict the value of a house. As aspiring future homeowners, we are interested in learning what to look for when purchasing a house, and what variables we should consider important. This project hopes to use the housing data to answer the following questions and find insight into home values and their drivers. 

### Questions to answer
- What features impact home values most?
- How is the house price data distributed?
- Does the Data or Model reveal any bias or ethical concerns?


### Data Source
[The Boston House-Price Data](https://www.kaggle.com/datasets/fedesoriano/the-boston-houseprice-data).

This dataset contains information collected by the U.S Census Service concerning housing in the area of Boston Mass. The dataset is small in size with only 506 cases. The data was originally published by Harrison, D. and Rubinfeld, D.L. `Hedonic prices and the demand for clean air', J. Environ. Economics & Management, vol.5, 81-102, 1978.


### Model
The data will be used to train a sklearn ensemble model: `RandomForestRegressor()`. The team will use the model to attempt to predict the value of a home based on the provided features, and from this gain insights into what influences home values.


### Database
A Relational Database from AWS will be established to hold the data for the project. The database instance will use postgres and be connected to pgAdmin4 for management. Data will be inserted and retreived using a SQLAlchemy and psycop2g connection engine along with pandas functions.
A relationship diagram was created for the database using QuickDBD.

![ERD](https://github.com/TBrickey/Project_One/blob/Jacob/Database/QuickDBD-Housing_ERD.png)

## Results



## Summary 

Through our analysis we were able to identify key features homeowners were intresed in investing. Below is the presentaion sharing our findings:
[Housing Analysis](https://docs.google.com/presentation/d/1al7iQjorKk0rlzWWw_5Z_s1t9EO_QB72bG_a10n2us4/edit?usp=sharing)
