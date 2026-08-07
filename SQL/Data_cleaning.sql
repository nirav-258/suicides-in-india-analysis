/*
Here we are interseted in that case where suicide is comminted,
so we will remove all those rows where total column has value grater than 0,
here total is telling us number of suicides done in specific year, age group, state, type code etc.
so thats why we now deleting all the rows which has 0 value as total, 
because we dont need it

second condition is that in our data we have find some row with total,
so we have to remove those rows also.
*/


/*
DELETE 
FROM suicides_in_india
WHERE suicides_in_india.total=0
-- DELETE command is very sensitive.
*/


-- lets save this cleaned data file into our computer
COPY (
    SELECT * 
    FROM suicides_in_india 
    WHERE suicides_in_india.total<>0 
        AND suicides_in_india.state NOT ILIKE '%total%'
        AND suicides_in_india.age_group NOT ILIKE '0-100+'
) 
To 'D:\Projects\Data Analysis\suicides-in-india-analysis\Data\cleaned data\suicides_in_india_cleaned_data.csv'
WITH (FORMAT csv, HEADER true);

-- check cleaned data file

