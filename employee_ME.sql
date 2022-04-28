USE employees; 

SELECT 
	edm.Employee_ID,
    edm.Sales_Person_ME,
	edm.Salary,
	SUM(((ec.Commission_ME *cp.Price)* rs.ME_Sales)+ edm.Salary) AS "Total payable ME", 
CASE 
	WHEN rs.ME_Sales < 150 THEN "Bronze"
    WHEN rs.ME_Sales BETWEEN 150 AND 250 THEN "Silver"
    WHEN rs.ME_Sales > 250 THEN "Gold"
END AS "Type of Employee"
FROM employee_commission ec
JOIN employee_details_me edm
	USING (Sales_Person_ME)
JOIN car_sales.car_prices cp
	USING (Model_Number)
JOIN car_sales.regional_sales rs
	USING(Model_Number)
GROUP BY Employee_ID