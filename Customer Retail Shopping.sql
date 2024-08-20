SELECT*FROM cust_shop.customer_shopping_data;
	-- CUSTOMER PROFILE
-- Customer Profile by Age 
SELECT DISTINCT
	age,
    COUNT(age) AS Number_of_Customer
FROM cust_shop.customer_shopping_data
GROUP BY
	age 
ORDER BY 
	age
;
-- Number of Customer by Gender
SELECT 
	gender,
    COUNT(customer_id) AS num_of_cust
FROM
	cust_shop.customer_shopping_data
GROUP BY 
	gender
;
-- Total Revenue and Number of Customer by Gender
SELECT 
	Gender,
	ROUND(SUM(Price), 2) AS Revenue,
    COUNT(customer_id) AS Number_of_Customer
FROM 
	cust_shop.customer_shopping_data
GROUP BY
	Gender
;
-- Total Revenue and Number of Customer by Generation 
SELECT 
	CASE 
    WHEN age >=18 AND age <=27 THEN 'Gen Z'
    WHEN age >=28 AND age <=43 THEN 'Millenials'
    WHEN age >=44 AND age <=59 THEN 'Gen X'
    WHEN age >=60 THEN 'Baby Boomers'
	END AS Generation,
ROUND(SUM(Price), 2) AS Revenue,
COUNT(customer_id) AS Number_of_Customer
FROM cust_shop.customer_shopping_data
GROUP BY 
	Generation
;
-- Total Revenue and Number of Customer by Generation and Gender
SELECT 
	CASE 
    WHEN age >=18 AND age <=27 AND gender = 'Male' THEN 'Gen Z Male'
    WHEN age >=18 AND age <=27 AND gender = 'Female' THEN 'Gen Z Female'
    WHEN age >=28 AND age <=43 AND gender = 'Male' THEN 'Millenials Male'
    WHEN age >=28 AND age <=43 AND gender = 'Female' THEN 'Millenials Female'
    WHEN age >=44 AND age <=59 AND gender = 'Male' THEN 'Gen X Male'
    WHEN age >=44 AND age <=59 AND gender = 'Female' THEN 'Gen X Female'
    WHEN age >=60 AND gender = 'Male' THEN 'Baby Boomers Male'
    WHEN age >=60 AND gender = 'Female' THEN 'Baby Boomers Female'
    END AS Generation_Gender,
    ROUND(SUM(Price), 2) AS Revenue,
COUNT(customer_id) AS Number_of_Customer
FROM cust_shop.customer_shopping_data
GROUP BY 
	Generation_Gender
ORDER BY
	Generation_Gender
;
	-- Sales
-- Total purchase for each product category
SELECT 
	Category,
    SUM(quantity) AS Sales
FROM cust_shop.customer_shopping_data
GROUP BY 
	Category
;
-- Product Sales by Generation
SELECT 
	CASE 
    WHEN age >=18 AND age <=27 THEN 'Gen Z'
    WHEN age >=28 AND age <=43 THEN 'Millenials'
    WHEN age >=44 AND age <=59 THEN 'Gen X'
    WHEN age >=60 THEN 'Baby Boomers'
    END AS Generation,
    SUM(quantity) AS Sales
FROM cust_shop.customer_shopping_data
GROUP BY Generation
;







	