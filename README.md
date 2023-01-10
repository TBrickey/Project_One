# Housing-Analysis

## Project Overview

### Reason
The team plans to examine the california housing data set, conduct exploratory data analysis, and create and train a regression model that can predict the value of a house. As aspiring future homeowners, we are interested in learning what to look for when purchasing a house, and what variables we should consider important. This project hopes to use the housing data to answer the following questions and find insight into home values and their drivers.

### Questions to answer
- What features impact housing prices most?
- How is the house price data distributed?
- Does there appear to be any underlying bias in the data?
- How does RandomForest's performance compare to XGBoost's in this instance?


### Data Source
The dataset contains information collected from the 1990 Census concerning California home values, and was compiled and published by Pace, R. Kelley and Ronald Barry in *Sparse Spatial Autoregressions, Statistics and Probability Letters, 33 (1997) 291-297*. The dataset has been modified slightly for use here. Using the centroids of each block group the distance from the ocean is calculated and added as an additional feature: `ocean proximity`. This feature addition was performed by Aurélien Géron and published along with *Hands-On Machine Learning with Scikit-Learn and TensorFlow, O'Reilly Media, Inc, March 2017*.

The data for the project can be loaded from: https://raw.githubusercontent.com/ageron/handson-ml2/master/datasets/housing/housing.csv

More information about the original dataset can be found at: https://github.com/ageron/handson-ml2/tree/master/datasets/housing

### Communication
Team members will communicate biweekly through slack and will schedule additonal Zoom meetings as necessary.


### Model
Using this the data this project will train two models, RandomForestRegressor and XGBoostRegressor, to predict the value of a home based on the provided features as well as some newly created features. Each model will be tested for accuracy using these metrics:
- RMSE(Root Mean Squared Error)
- Variance Score

From this the project hopes to gain two things:
- A model capable of accurately estimating the value of a house with at least 90% accuracy.
- The feature importances of each model and their potential relationships to home values.  

### Database
A Relational Database from AWS will be established to hold the data for the project. The database instance will use postgres and be connected to pgAdmin4 for management. Data will be inserted and retreived using a SQLAlchemy and psycop2g connection engine along with pandas functions.
A relationship diagram was created for the database.

![ERD](https://github.com/TBrickey/Project_One/blob/main/Database/QuickDBD-Housing_ERD.png)

## Results
## Summary 
