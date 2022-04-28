USE employees;

SELECT 
	eda.Employee_ID,
    eda.Sales_person_ASIA,
	eda.Salary,
	SUM(((ec.Commission_ASIA *cp.Price)* rs.ASIA_Sales)+ eda.Salary) AS "Total payable ASIA", 
CASE 
	WHEN rs.ASIA_Sales < 150 THEN "Bronze"
    WHEN rs.ASIA_Sales BETWEEN 150 AND 250 THEN "Silver"
    WHEN rs.ASIA_Sales > 250 THEN "Gold"
END AS "Type of Employee"
FROM employee_commission ec
JOIN employee_details_asia eda
	USING (Sales_Person_ASIA)
JOIN car_sales.car_prices cp
	USING (Model_Number)
JOIN car_sales.regional_sales rs
	USING(Model_Number)
GROUP BY Employee_ID