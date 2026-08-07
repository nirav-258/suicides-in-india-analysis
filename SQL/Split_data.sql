--Creating Table
CREATE TABLE suicides_data(
    State VARCHAR(50) NOT NULL,
    Year INT NOT NULL,
    Type_code VARCHAR(70),
    Type VARCHAR(150),
    Gender VARCHAR(20),
    Age_group VARCHAR(20),
    Total INT
);

CREATE TABLE suicides_in_india_causes(
    State VARCHAR(50) NOT NULL,
    Year INT NOT NULL,
    Type_code VARCHAR(70),
    Type VARCHAR(150),
    Gender VARCHAR(20),
    Age_group VARCHAR(20),
    Total INT
);

CREATE TABLE suicides_in_india_means_adopted(
    State VARCHAR(50) NOT NULL,
    Year INT NOT NULL,
    Type_code VARCHAR(70),
    Type VARCHAR(150),
    Gender VARCHAR(20),
    Age_group VARCHAR(20),
    Total INT
);

CREATE TABLE suicides_in_india_professional_profiles(
    State VARCHAR(50) NOT NULL,
    Year INT NOT NULL,
    Type_code VARCHAR(70),
    Type VARCHAR(150),
    Gender VARCHAR(20),
    Age_group VARCHAR(20),
    Total INT
);

--importing data
COPY
suicides_data (State, Year, Type_code, Type, Gender, Age_group, Total)
FROM 'D:\Projects\Data Analysis\suicides-in-india-analysis\Data\Orignal Data\Suicides_in_India_2001_2012.csv'
-- type file path where you saved csv file (copy file path and paste here)
DELIMITER ',' 
CSV HEADER;

INSERT INTO suicides_in_india_causes (State, Year, Type_code, Type, Gender,Age_group, Total)
SELECT State, Year, Type_code, Type, Gender,Age_group, Total
FROM suicides_data
WHERE Type_code='Causes';

INSERT INTO suicides_in_india_means_adopted (State, Year, Type_code, Type, Gender,Age_group, Total)
SELECT State, Year, Type_code, Type, Gender,Age_group, Total
FROM suicides_data
WHERE Type_code='Means_adopted';

INSERT INTO suicides_in_india_professional_profiles (State, Year, Type_code, Type, Gender,Age_group, Total)
SELECT State, Year, Type_code, Type, Gender,Age_group, Total
FROM suicides_data
WHERE Type_code='Professional_Profile';

DROP TABLE suicides_data

-- save files 
copy (
    SELECT * 
    FROM suicides_in_india_causes
    WHERE suicides_in_india_causes.total<>0 
        AND suicides_in_india_causes.state NOT ILIKE '%total%'
        AND suicides_in_india_causes.age_group NOT ILIKE '0-100+'
)
TO 'D:\Projects\Data Analysis\suicides-in-india-analysis\Data\cleaned data\suicides_in_india_causes_wise_data.csv'
WITH (FORMAT csv, HEADER true);

copy (
    SELECT * 
    FROM suicides_in_india_means_adopted
    WHERE suicides_in_india_means_adopted.total<>0 
        AND suicides_in_india_means_adopted.state NOT ILIKE '%total%'
        AND suicides_in_india_means_adopted.age_group NOT ILIKE '0-100+'
)
TO 'D:\Projects\Data Analysis\suicides-in-india-analysis\Data\cleaned data\suicides_in_india_means_adopted_wise_data.csv'
WITH (FORMAT csv, HEADER true);

copy (
    SELECT * 
    FROM suicides_in_india_professional_profiles
    WHERE suicides_in_india_professional_profiles.total<>0 
        AND suicides_in_india_professional_profiles.state NOT ILIKE '%total%'
        AND suicides_in_india_professional_profiles.age_group NOT ILIKE '0-100+'
)
TO 'D:\Projects\Data Analysis\suicides-in-india-analysis\Data\cleaned data\suicides_in_india_professional_profiles_wise_data.csv'
WITH (FORMAT csv, HEADER true);
