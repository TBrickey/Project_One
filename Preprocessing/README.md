# Preprocessing the Data and Exporting to Database

## Overview
The california housing dataset is prepared for the analysis in the `proc_cal_housing.ipynb` notebook, and inserted into the project database. The data is loaded into a pandas dataframe from a raw csv url. Exploratory Data Analysis is conducted to select the target and feature variables and gain insight into the dataset. Additional features are also created and placed in the database

### Data Source
The dataset contains information collected from the 1990 Census concerning California home values, and was compiled and published by Pace, R. Kelley and Ronald Barry in *Sparse Spatial Autoregressions, Statistics and Probability Letters, 33 (1997) 291-297*. The dataset has been modified slightly for use here. Using the centroids of each block group the distance from the ocean is calculated and added as an additional feature: `ocean proximity`. This feature addition was performed by Aurélien Géron and published along with *Hands-On Machine Learning with Scikit-Learn and TensorFlow, O'Reilly Media, Inc, March 2017*.
The data for the project can be found at: https://raw.githubusercontent.com/ageron/handson-ml2/master/datasets/housing/housing.csv.

### Tools:
Python, Pandas, Numpy, Pyplot, Plotly, Seaborn, Cartopy, Geopy, SQLAlchemy, psycopg2, Sklearn


## Exploratory Data Analysis

### Shape:
- The original dataset contains 10 feature observations for 20,640 samples.
- Each sample is a california block group, the smallest geographical unit reported by the U.S. Census Bereau.
- The average block group size in this data set is 1425.5 individuals.

### Variables

Features:
- longitude: Centroid coordinate for each block group.
- latitude: Centroid coordinate for each block group.
- housing_median_age: Median age of houses within each block group.
- total_rooms: Total number of rooms within each block group.
- total_bedrooms: Total number of bedrooms within each block group.
- population: Total number of people living within each block group.
- households: Total number of households for each block group.
- median_income: Median income for each block group measure in tens of thousands of US Dollars.
- median_house_value: Median house value for each block group measured in US Dollars.
- ocean_proximity: Categorical location of each block group based on proximity to the ocean.

### Data Wrangling

There are 207 missing values in the total_rooms column. Rather than lose these observations by dropping them, the missing values will be filled with the median value for total_rooms.
To do this Sklearn's `SimpleImputer` is used with a median strategy.

Additionally, an ID column is created to track each block group's features that are stored seperately in the database.

## Analysis

### Target Variable Analysis

For this analysis the target variable is the Median house value for each block group: median_house_value

- The mean house value is $206,855.81
- The median house value is $179,700.00
- The lower quartile valueis $119,600.00
- The upper quartile value is $264,725.00
- The max value is $500,001.00
- The min value is $14,999.00
- There are 965 observations with values of $50,000. This data has been censored, and dropping these potential outliers may improve model performance.

Suggest: Results may be improved with removal of the 965 censored values


### Feature Analysis

The correlation values for the dataset are calculated:
- A heatmap of the values is created visualize correlations.
    - The population statistics(total_rooms, total_bedrooms, population, households) are all strongly correlated.
    - The coordinates do not show significant correlations beyond each other.
- A plot of correlation values for the target feature is created.
    - median_income shows the highest correlation with the target feature.
    - All other features appear to have an insiginificant correlation to the target feature.

Each block group is plotted on a map of California using Cartopy and colored by Median House Value:
- There are clusters of hotspots near the coast, revealing the ocean_proximity features genesis. 
- These clusteres appear to be at the same locations as California's major urban centers.

Distribution of the categorical variable ocean_proximity is shown with a pie chart:
- <1H OCEAN     9136
- INLAND        6551
- NEAR OCEAN    2658
- NEAR BAY      2290
- ISLAND           5

The island category shows the highest average median house value, and the <1H OCEAN show the greatest sum of median house values.

A scatter plot is created to visualize correlation between Median Income and Median House Value:
- mean         3.87
- min          0.50
- median       3.54
- max          15.00

### Feature Creation

Mapping revealed a potential association with the distance of each block group from one of California's major cities and the median house value. The distance to the closest of one of four of California's major cities (Los Angeles, San Francisco, San Diego, San Jose) is calculated for each block group in miles using their centroid coordinates and geopy, and added as the feature `miles_nearest_major_city`

The correlation among the population statistics inspired the addition of 3 more features that are relatively intuitive:
- Population per Household: `pop_per_house`
- Ratio of Bedrooms to Total Rooms: `bedrooms_per_rooms`
- Rooms per Household: `rooms_per_house`

The correlation values are recalculated with the addition of the created features:
- All 4 created features show better correlation values with the target feature than the majority of the original features.
- `miles_nearest_major_city` shows a very strong correlation to the target feature, becoming the second strongest correlation.

Boxplots and Density plots are created for each numerical feature:
- Scaling Features is necessary to accomodate widely varying scales, and to take care of outliers and help normalize distributions. 

 
## Database Export
A connection is made to the database using SQLAlchemy, and data is inserted into each table in the Database:
- A location table for each block group, `locations` containing the `id` `latitude` and `longitude` columns.
- The original features `original_features`, containing the original features in the dataset.
- The created features `created_features`, containing the newly created features.

