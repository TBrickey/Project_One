DROP TABLE IF EXISTS locations;
DROP TABLE IF EXISTS original_features;
DROP TABLE IF EXISTS created_features;

CREATE TABLE IF NOT EXISTS locations (
	id BIGINT NOT NULL,
	longitude DOUBLE NOT NULL,
	latitude DOUBLE NOT NULL,
	PRIMARY KEY (ID)
);

CREATE TABLE IF NOT EXISTS original_features (
	id BIGINT NOT NULL,
	housing_median_age DOUBLE NOT NULL,
	total_rooms DOUBLE NOT NULL,
	total_bedrooms DOUBLE NOT NULL,
	population DOUBLE NOT NULL,
	households DOUBLE NOT NULL,
	median_income DOUBLE NOT NULL,
	ocean_proximity VARCHAR NOT NULL,
	PRIMARY KEY (ID)
);

CREATE TABLE IF NOT EXISTS created_features (
	id BIGINT NOT NULL,
	bedrooms_per_rooms DOUBLE NOT NULL,
	rooms_per_house DOUBLE NOT NULL,
	pop_per_house DOUBLE NOT NULL,
	miles_nearest_major_city DOUBLE NOT NULL,
	PRIMARY KEY (ID)
);

SELECT * FROM locations;
SELECT * FROM original_features;
SELECT * FROM created_features;