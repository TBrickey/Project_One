<<<<<<< HEAD
# Machine Learning Model

## Overview
This project will use the Random Forest Regression Model from scikit-learn. The model was chosen because:
- The model is resistant to outliers, which our data contains.
- It provides indicators of important features.

The model will be used to predict home values based on the features provided. The team hopes to obtain a model that is capable of accurately estimated home values as well as insight into the importance of each feature in the value of a home. 

### Tools
Python, SqlAlchemy, Pandas, Pyplot, Sklearn, Numpy

## Model Training
The training and testing data is loaded from the database using SqlAlchemy in the `Random_Forest.ipynb` notebook, and used to train a `RandomForestRegressor()` model.

## Model Tuning and Evaluation

### Evaluation Metrics:

-RMSE(Root Mean Square Error): It is a measure of the squared difference between the prediction from our model and the actual value.
-Feature importance based on mean decrease in impurity: feature importances are provided by the fitted attribute feature_importances_ and they are computed as the mean and standard deviation of accumulation of the impurity decrease within each tree.

### Original Model Evaluation:
    - RMSE: 2.9213341600217184
    - Feature Importances: 
        - LSTAT      0.409262
        - RM         0.398412
        - DIS        0.048672
        - CRIM       0.039876
        - NOX        0.023577
        - TAX        0.020019
        - AGE        0.018786
        - PTRATIO    0.012514
        - INDUS      0.011419
        - B          0.011349
        - RAD        0.002834
        - ZN         0.002207
        - CHAS       0.001073

### Tuning
k-fold CV (cross validation)https://towardsdatascience.com/hyperparameter-tuning-the-random-forest-in-python-using-scikit-learn-28d2aa77dd74

### Final Model Evaluation
    - RMSE: 

### Suggestions:

- Model Change: The project may benefit from an XGBoostRegressor model. XGBoost is an implementation of the gradient tree boosting algorithm that is widely recognized for its efficiency and predictive accuracy.





=======
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
>>>>>>> origin
