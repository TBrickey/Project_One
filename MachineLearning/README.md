# Machine Learning Model

## Overview
In order to learn more about the california housing price data, as well as evaluate their performance in predicting the value of a home, two supervised learning models RandomForestRegressor and XGBoostRegressor will be trained and tested using two seperate versions of the dataset. These tests are conducted in `Machine_Learning_Full.ipynb`.

The goal of this is to produce a regression model that is capable of accurately predicting the value or price of a home based on these features. Additionally, the project hopes to use the data and the results of the models trained on it to uncover relationships in the value of a home and the present features. 

### Tools
Python, SqlAlchemy, Pandas, Pyplot, Numpy, Sklearn, XGBoost, IPython

## Models

- Scikit-learn: RandomForestRegressor
    - Decision Tree: Fits a number of classifying decision trees and uses averaging to improve predictive accuracy and control over-fitting.
    - Resistant to outliers, which the data contains.
    - Trees are built independently at the same time
    - It provides indicators of important features.
- XGBoost: XGBoostRegressor
    - Decision Tree: Fits gradient boosted trees. Where the gradient for each tree is calculated and used to improve the next tree.
    - Trees are built sequentially, using the weights and gradients to improve the next tree.
    - Resistant to outliers, which the data contains.
    - It provides indicators of important features.
    

### Evaluation Metrics:

- RMSE(Root Mean Square Error): It is a measure of the squared difference between the prediction from our model and the actual value. Shown in the same scale as the dependent variable. This is the average error in US Dollars.

- R²: It is the measure of variance found in the dependent variable that can be explained by the independent variables, with perfect predictions returning a value of 1.0. (goodness of fit) 

## Training Data

- Original Data: The features as taken from the source and housed in the database. This dataset is loaded with a database query to the table `original_features`connected through SQLAlchemy. All references to `original` pertain to this dataset in the `Machine_Learning_Full`.ipynb' notebook.

- Created Features: In processing 4 new features are created and stored in the database in the table named `created_features`. To create this dataset a query is written to join these features with the original features in  PostgreSQL and executed with SQLAlchemy. All references to `joined` pertain to this dataset in the `Machine_Learning_Full`.ipynb' notebook.

## Final Processing
In the `Machine_Learning_Full.ipynb` notebook each dataset is loaded into a pandas dataframe and the features are passed through three stages of processing in order to prepare them for the models. The dependent variable is excluded from processing until Splitting.

- Categorical Feature Encoding: There is one categorical feature `ocean_proximity` that needs to be encoded. One hot encoding is performed on this feature using Sklearn OneHotEncoder.

- Numerical Feature Scaling: Their is a wide range of scales in the data, as well as some skewness. Decision Trees are resistant to differing scales to a point, but given the extreme ranges the numerical features will be scaled using Sklearn StandardScaler to correct the scale imbalances and normalize the data.

- Splitting: The data is split into training and testing sets using Sklearn train_test_split. 20% of the data is held as a testing set. The final prepared training sets contain 16,512 observations. The dependent variable is passed to the splitting function in its raw format. 

- Last minute cleaning: XGBoost has problems with specific characters in feature titles, [] <>. Prior to feeding data into the XGBoost models these columns are renamed using pandas.replace()



## Model Training
For each Model and each Dataset:
- A base model is created, trained, and evaluated for each dataset and model.
- Hyperparameter tuning using RandomSearchCV is performed on each model with each dataset.
    - A grid of parameters for each model is created.
    - K-fold cross-validation is performed on 3 subsets of the data for 100 and 200 samples from the parameters grid.
    - The best parameters found are collected
- A final model is trained and used to make predictions and get final testing results.
- Distribution and Value Plots are created for each tuned model to visualize the best performances.


## Results

![metrics_table](https://github.com/TBrickey/Project_One/blob/Jacob/MachineLearning/Resources/metrics_table.png)

### Tuned Model Results
The best results seen come from the tuned models, there results are:

- Random Forest:
    - Original Data:
        - RMSE: 60369.881627
        - R²: 0.735671
    - Combined Data:
        - RMSE: 53425.760765
        - R²: 0.792983

- XGBoost:
    - Original Data:
        - RMSE: 59353.576764
        - R²: 0.744496
    - Combined Data:
        - RMSE: 51731.056427
        - R²: 0.805908

![R2_bar](https://github.com/TBrickey/Project_One/blob/Jacob/MachineLearning/Resources/R2_bar.png)

### Feature Importances
For each of the models the importances are visualized to gather information about how the model made its predictions:

- Random Forest:
    - Original:
    
    ![og_rf_importances](https://github.com/TBrickey/Project_One/blob/Jacob/MachineLearning/Resources/og_rf_importances.png)

    - Joined:
    
    ![jo_rf_importances](https://github.com/TBrickey/Project_One/blob/Jacob/MachineLearning/Resources/jo_rf_importances.png)


- XGBoost:
    - Original:
    
    ![og_xg_importances](https://github.com/TBrickey/Project_One/blob/Jacob/MachineLearning/Resources/og_xg_importances.png)

    - Joined:
    
    ![jo_xg_importances](https://github.com/TBrickey/Project_One/blob/Jacob/MachineLearning/Resources/jo_xg_importances.png)


## Further Feature Engineering

The previous testing is conducted again, this time with the ommission of 965 censored values from the dependent variable. The ommission of these potential outliers had some negative and some positive effects on the models. Overall, the change resulted in lower R^2 scores and lower RMSEs. These tests can be found in `Machine_Learning_Outliers.ipynb`.

Additionally the data was tested again with a stratified split, this change had no discernable effects.



