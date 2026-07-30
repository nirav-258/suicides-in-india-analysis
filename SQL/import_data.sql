--Creating Table
CREATE TABLE suicides_in_india(
    State VARCHAR(50) NOT NULL,
    Year INT NOT NULL,
    Type_code VARCHAR(70),
    Type VARCHAR(150),
    Gender VARCHAR(20),
    Age_group VARCHAR(20),
    Total INT
);

--Importing data 
COPY
suicides_in_india (State, Year, Type_code, Type, Gender, Age_group, Total)
FROM 'D:\Data Analysis\Datasets\other data sets\Suicides_in_India_2001_2012.csv'
DELIMITER ','
CSV HEADER;

-- checking data
SELECT * FROM suicides_in_india

