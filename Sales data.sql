	USE car_sales;
    
    SELECT 
    cd.Manufacturer,
    cp.Price AS 'Unit price',
	cp.Sales AS 'Units sold',
    rs.ASIA_Sales,
    rs.EU_Sales,
    rs.US_Sales,
    rs.ME_Sales,
    SUM(cp.Sales * cp.Price) AS Revenue
FROM car_prices cp
JOIN car_details cd
	USING (Model_Number)
JOIN regional_sales rs
	USING (Model_Number)
Group BY Manufacturer