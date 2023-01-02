# Preprocessing the Data and Exporting to Database

## Overview
The boston housing dataset is prepared for the analysis in the `housing_data_processing.ipynb` notebook, and inserted into the project database. The data is taken from a csv file and loaded into a pandas dataframe. Exploratory Data Analysis is conducted to select the target and feature variables and gain insight into the dataset. 

### Data Source
The original data was downloaded as a csv file titled `boston.csv` located at [The Boston House-Price Data](https://www.kaggle.com/datasets/fedesoriano/the-boston-houseprice-data)

### Tools:
Python, Pandas, Numpy, Pyplot, Seaborn, SQLAlchemy, psycopg2, Sklearn.train_test_split


## Exploratory Data Analysis

### Shape:
- The data set contains 14 feature observations for 506 houses.
- There are no nulls in the dataset

### Variables

The 14 total features are:
1) CRIM: per capita crime rate by town
2) ZN: proportion of residential land zoned for lots over 25,000 sq.ft.
3) INDUS: proportion of non-retail business acres per town
4) CHAS: Charles River dummy variable (1 if tract bounds river; 0 otherwise)
5) NOX: nitric oxides concentration (parts per 10 million) (parts/10M)
6) RM: average number of rooms per dwelling
7) AGE: proportion of owner-occupied units built prior to 1940
8) DIS: weighted distances to five Boston employment centres
9) RAD: index of accessibility to radial highways
10) TAX: full-value property-tax rate per $10,000 ($/10k)
11) PTRATIO: pupil-teacher ratio by town
12) B: The result of the equation B=1000(Bk - 0.63)^2 where Bk is the proportion of blacks by town
13) LSTAT: % lower status of the population
14) MEDV: Median value of owner-occupied homes in $1000's (k$)

## Analysis

### Target Variable Analysis

For this analysis the target variable is the Median value of the home: `MEDV`

- The house values are reported in 1000s
- The mean house value is $22,532.81
- The median house value is $21,200.00
- The lower quartile valueis $17,025.00
- The upper quartile value is $25,000.00
- The max value is $50,000
- The min value is $5,000
- There are 16 houses with values of $50,000. This collection of potential outliers may skew results.

Suggest: Results may be improved with removal of these values


### Feature Analysis

Box plots are created for each feature, features with potential outliers:
- CRIM, CHAS, ZN,  RM, DIS, B, PTRATIO, LSTAT

Distribution plots are created for each feature, features with skewed distributions:
- CRIM, CHAS, ZN, DIS, RAD

A correlation matrix is created, for which a heatmap and plot of absolute values is shown,  the features most correlated with MEDV in descending order:
- RM: average number of rooms per dwelling = .7
- LSTAT: % lower status of the population = -.74 (need more research on what this stat means)
- PTRATIO: pupil-teacher ratio by town = -.51
- INDUS: proportion of non-retail business acres per town = -.48
- TAX: full-value property-tax rate per $10,000 ($/10k) = -.47

Interesting insights:
- INDUS and LSTAT appear to have some positive correlation
- RM and LSTAT appear to have a some negative correlation

Least correlated features in ascending order:
- CHAS: Charles River dummy variable (1 if tract bounds river; 0 otherwise) = .18
- DIS: weighted distances to five Boston employment centres = .25
- B: The result of the equation B=1000(Bk - 0.63)^2 where Bk is the proportion of blacks by town = .33
- ZN: proportion of residential land zoned for lots over 25,000 sq.ft. = .36
- AGE: proportion of owner-occupied units built prior to 1940 = -.38
- RAD: index of accessibility to radial highways = -.38
- CRIM: per capita crime rate by town = -.39
- NOX: nitric oxides concentration (parts per 10 million) (parts/10M) =  -.43


Suggest: Log tranform DIS to normalize distribution (https://www.kaggle.com/code/advikmaniar/xgboost-model-optimization-94-boston-housing)

Suggest: Scaling Features to take care of outliers and help normalize distributions. Use StandardScaler() or MinMaxScaler().

Suggest: Potential for dropping CHAS from final training data due to outliers, heavy skew, and low correlation values.

https://www.kaggle.com/code/kooaslansefat/fairness-evaluation-for-boston-house-price-pred
 
## Data Preperation

- The data is kept in its original form for preliminary setup.
- An ID column is added to the Data using the index
- The data is split into training and testing sets with 80% training data and held in seperate tables.
    - There are 404 training observations
    - There are 102 test observations


## Database Export
A connection is made to the database using SQLAlchemy, and data is inserted into each table in the Database:
- The complete dataset: boston_housing_complete
- The training data: boston_housing_training
- The testing data: boston_housing_testing

Csv files are also created for training and testing datasets.

## Summary
