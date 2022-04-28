USE employees;

SELECT 
	ede.Employee_ID, 
    TRIM(ede.Sales_Person_EU) AS 'Sales Person EU',
	ede.Salary,
	SUM(((ec.commission_EU *cp.Price)* rs.EU_sales)+ ede.salary) AS "Total payable EU", 
CASE 
	WHEN rs.EU_Sales < 150 THEN "Bronze"
    WHEN rs.EU_Sales BETWEEN 150 AND 250 THEN "Silver"
    WHEN rs.EU_Sales > 250 THEN "Gold"
END AS "Type of Employee"
FROM employee_details_eu ede
JOIN employee_commission ec
	using (Sales_person_EU)
JOIN car_sales.car_prices cp
	USING (Model_Number)
JOIN car_sales.regional_sales rs
	USING (Model_Number)
GROUP BY Employee_ID