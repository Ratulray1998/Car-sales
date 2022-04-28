USE employees;

SELECT 
	edu.Employee_ID,
    edu.Sales_Person_US,
	edu.Salary,
	SUM(((ec.Commission_US *cp.Price)* rs.US_Sales)+ edu.Salary) AS "Total payable US", 
CASE 
	WHEN rs.US_Sales < 150 THEN "Bronze"
    WHEN rs.US_Sales BETWEEN 150 AND 250 THEN "Silver"
    WHEN rs.US_Sales > 250 THEN "Gold"
END AS "Type of Employee"
FROM employee_commission ec
JOIN employee_details_us edu
	USING (Sales_Person_US)
JOIN car_sales.car_prices cp
	USING (Model_Number)
JOIN car_sales.regional_sales rs
	USING(Model_Number)
GROUP BY Employee_ID