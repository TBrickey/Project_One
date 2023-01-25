# Housing Analysis

## Project Overview
#### Reason
The objective of this project is to assess a California housing data set, conduct exploratory data analysis, and construct and train a regression model that can predict the value of a house based on specific parameters. As aspiring future homeowners, we are interested in learning what factors to consider when browsing potential homes and what variables are considered important. This project will use the housing data to answer the following questions and find insight into home values and their drivers.
##### Questions To Answer

•	What features impact housing prices the most?

•	How is the house price data distributed?

•	Does there appear to be any underlying bias in the data?

•	How does RandomForest's performance compare to XGBoost's in this instance?
## Data Source
The dataset contains information collected from the 1990 Census concerning California home values, and was compiled and published by Pace, R. Kelley and Ronald Barry in Sparse Spatial Autoregressions, Statistics and Probability Letters, 33 (1997) 291-297. The dataset has been modified slightly for use here. Using the centroids of each block group the distance from the ocean is calculated and added as an additional feature: ocean proximity. This feature addition was performed by Aurélien Géron and published along with Hands-On Machine Learning with Scikit-Learn and TensorFlow, O'Reilly Media, Inc, March 2017.

The data for the project can be loaded from: [Final Dataset](https://raw.githubusercontent.com/ageron/handson-ml2/master/datasets/housing/housing.csv)

More information about the original dataset can be found at: [Original Dataset](https://github.com/ageron/handson-ml2/tree/master/datasets/housing)

## Exploratory Data Analysis
The original dataset contains 10 feature observations for 20,640 samples. Each sample is a California block group. A block group is the smallest geographical unit reported by the U.S. Census Bureau, and the average block group size in this data set is 1425.5 individuals. The features we included during this analysis were longitude, latitude, median housing age, total rooms, total bedrooms, population, households, median income, median house value, and ocean proximity. One of the features, total rooms, had 207 missing values. Sklearn's SimpleImputer is used with a median strategy to fill the missing values with the median value for total rooms so these values could still be included in our observations. Additionally, an ID column is created to track each block group's features that are stored separately in the database. For this analysis the target variable is the Median house value for each block group.

More information on our Preprocessing found here: [Preprocessing/README.md](https://github.com/TBrickey/Project_One/blob/main/Preprocessing/README.md) 
#### Database
A Relational Database from AWS will be established to hold the data for the project. The database instance will use postgres and be connected to pgAdmin4 for management. Data will be inserted and retreived using a SQLAlchemy and psycop2g connection engine along with pandas functions. A relationship diagram was created for the database.
 
 <img width="384" alt="QuickDBD-Housing_ERD" src="https://user-images.githubusercontent.com/110629852/214705405-50e39581-3c12-45e4-a9b2-1c2829e0cf7f.png">



#### Feature Analysis
A heatmap is created to visualize the correlation values calculated for the dataset. The heatmap displayed a strong correlation between population statistics: total rooms, total bedrooms, population, and households, but no significant correlation beyond each other. A plot of correlation values for the target feature is created. This determined that median income displayed the highest correlation with the target feature while all other features were insignificant to the target feature.
Feature Creation
The heatmap revealed a potential association with the distance of each block group from one of California's major cities and the median house value. The distance to the closest of one of four of California's major cities (Los Angeles, San Francisco, San Diego, San Jose) is calculated for each block group in miles using their centroid coordinates and Geopy and added as the feature.

#### Data Export
Data is inserted into three tables using SQLAlchemy. A location table is created for each block group, which contains the ID, latitude, and longitude columns.  
More information on our Database found here: [Database/README.md](https://github.com/TBrickey/Project_One/blob/main/Database/README.md)

## Model
Using the data this project will train two models, RandomForestRegressor and XGBoostRegressor, to predict the value of a home based on the provided features as well as some newly created features. Each model will be tested for accuracy using these metrics:

•	RMSE(Root Mean Squared Error)

•	R²

From this the project hopes to gain two things:

•	A model capable of accurately estimating the value of a house.

•	The feature importance of each model and their potential relationships to home values.

<img width="200" alt="jo_xg_importances" src="https://user-images.githubusercontent.com/110629852/214704920-c1f79dbc-3dc5-43b7-b365-84792cb1be65.png">

More information on our Machine Learning model found here: [MachineLearning/README.md](https://github.com/TBrickey/Project_One/blob/main/MachineLearning/README.md)

## Results

XGBoost’s performance was more accurate than RandomForests.
Random Forest feature importances are provided by the fitted attribute feature_importances_ and they are computed as the mean and standard deviation of accumulation of the impurity decrease within each tree.
XGBoost feature importances are provided by the fitted attribute plot_importances, ‘Gain’ is the improvement in accuracy brought by a feature to the branches it is on
Random Forest importances  aligns with correlation values seen during the preliminary analysis.
Here our created feature stand out as aids to the model.
XG notes only the ocean proximity categorical variables Inland value. 
This is a dense area of low home values found away from the coast. The blue area on the map
Both Models highlight a notable feature, just the inverse. 
The ocean proximity variable. 
The proximity of a house to certain desirable locations is noted as a highly important feature when estimating the value of a house.

Using Cartopy, each block group is plotted on a map of California color coded by median house value. There are clusters of hotspots near the coast, which also appear to be at the same locations of California’s major urban centers. 
The island category showed the highest average median house value. 

<img width="224" alt="Screenshot (61)" src="https://user-images.githubusercontent.com/110629852/214706428-85540526-8b14-4557-85e9-cd01ddf8fc51.png">


## Summary
Through our analysis we were able to identify key features homeowners were interested in investing in. 
Those features were ocean proximity and major city proximity.

Below is the presentation sharing our findings: [Housing Analysis](https://docs.google.com/presentation/d/1al7iQjorKk0rlzWWw_5Z_s1t9EO_QB72bG_a10n2us4/edit?usp=sharing)

