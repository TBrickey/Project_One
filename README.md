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





