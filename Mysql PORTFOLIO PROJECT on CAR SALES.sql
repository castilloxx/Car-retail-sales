SELECT *
FROM car_sales_data;

SELECT COUNT(*) AS total_cars_sold 
FROM car_sales_data;

-- creating a staging table

CREATE TABLE car_sales_staging
LIKE car_sales_data;

SELECT *
FROM car_sales_staging;

INSERT car_sales_staging
SELECT *
FROM car_sales_data;

SELECT *
FROM car_sales_staging;

-- data cleaning

-- checking for duplicates

SELECT *,
ROW_NUMBER() OVER(
PARTITION BY car_id, sales_date, Customer_Name, gender, Annual_Income, Dealer_Name, company, model, Engine, Transmission, color, 
price_USD, Dealer_no, Body_style, phone, Dealer_Region) AS row_num
FROM car_sales_staging ;

with duplicate_cte AS
(
SELECT *,
ROW_NUMBER() OVER(
PARTITION BY car_id, sales_date, Customer_Name, gender, Annual_Income, Dealer_Name, company, model, Engine, Transmission, color, 
price_USD, Dealer_no, Body_style, phone, Dealer_Region) AS row_num
FROM car_sales_staging
)
SELECT *
FROM duplicate_cte
WHERE row_num > 1;

-- no duplicates

-- checking for nulls

SELECT 
    COUNT(*) AS total_rows,
    SUM(car_id IS NULL) AS null_car_id,
    SUM(sales_date IS NULL) AS null_sales_date,
    SUM(customer_name IS NULL) AS null_customer_name,
    SUM(gender IS NULL) AS null_gender,
    SUM(annual_income IS NULL) AS null_annual_income,
    SUM(dealer_name IS NULL) AS null_dealer_name,
    SUM(company IS NULL) AS null_company,
    SUM(model IS NULL) AS null_model,
    SUM(engine IS NULL) AS null_engine,
    SUM(transmission IS NULL) AS null_transmission,
    SUM(color IS NULL) AS null_color,
    SUM(price_usd IS NULL) AS null_price_usd
FROM car_sales_staging;

-- standardizing data

SELECT DISTINCT Engine 
FROM car_sales_staging 
ORDER BY Engine;

UPDATE car_sales_staging
SET Engine = REPLACE(Engine, 'Ã‚', '');

SELECT *
FROM car_sales_staging;

UPDATE car_sales_staging
SET Engine = REPLACE(Engine, 'Â ', '');

SELECT Sales_Date 
FROM car_sales_staging;

UPDATE car_sales_staging
SET Sales_Date = STR_TO_DATE(Sales_Date, '%m/%d/%Y');

ALTER TABLE car_sales_staging
MODIFY COLUMN Sales_Date DATE;

SELECT DISTINCT Gender 
FROM car_sales_staging;

ALTER TABLE car_sales_staging
MODIFY COLUMN Phone VARCHAR(20);

-- data exploration

SELECT DISTINCT COUNT(CAR_ID)
FROM car_sales_staging;

SELECT COUNT(*) AS total_cars_sold 
FROM car_sales_staging;

SELECT SUM(Price_USD) AS total_revenue 
FROM car_sales_staging;

SELECT ROUND(AVG(Price_USD), 2)
AS avg_price FROM car_sales_staging;

SELECT DATE_FORMAT(Sales_Date, '%Y-%m') AS sale_month,
COUNT(*) AS cars_sold,
SUM(Price_USD) AS revenue
FROM car_sales_staging
GROUP BY sale_month
ORDER BY sale_month;

SELECT DATE_FORMAT(Sales_Date, '%Y-%m') AS best_month,
SUM(Price_USD) AS total_revenue
FROM car_sales_staging
GROUP BY best_month
ORDER BY total_revenue DESC
LIMIT 1;

SELECT Dealer_Name, COUNT(*) AS cars_sold
FROM car_sales_staging
GROUP BY Dealer_Name
ORDER BY cars_sold DESC
LIMIT 10;

SELECT Dealer_Region, SUM(Price_USD) AS total_revenue
FROM car_sales_staging
GROUP BY Dealer_Region
ORDER BY total_revenue DESC;

SELECT Company, COUNT(*) AS units_sold
FROM car_sales_staging
GROUP BY Company
ORDER BY units_sold DESC
LIMIT 10;

SELECT Model, SUM(Price_USD) AS total_revenue
FROM car_sales_staging
GROUP BY Model
ORDER BY total_revenue DESC
LIMIT 10;

SELECT Gender, COUNT(*) AS total_customers
FROM car_sales_staging
GROUP BY Gender;

SELECT 
  CASE
    WHEN Annual_Income < 20000 THEN 'Low Income (<20k)'
    WHEN Annual_Income BETWEEN 20000 AND 100000 THEN 'Middle Income (20k-100k)'
    WHEN Annual_Income BETWEEN 100001 AND 500000 THEN 'Upper middle (100k-500k)'
    ELSE 'High Income (>500k)'
  END AS income_bracket,
  COUNT(*) AS total_customers
FROM car_sales_staging
GROUP BY income_bracket;

SELECT Gender, ROUND(AVG(Price_USD), 2) AS avg_price_paid
FROM car_sales_staging
GROUP BY Gender;

SELECT Transmission, COUNT(*) AS count
FROM car_sales_staging
GROUP BY Transmission
ORDER BY count DESC;

SELECT Body_Style, COUNT(*) AS count
FROM car_sales_staging
GROUP BY Body_Style
ORDER BY count DESC;

SELECT Color, COUNT(*) AS count
FROM car_sales_staging
GROUP BY Color
ORDER BY count DESC;





