CREATE OR REPLACE FUNCTION salesStatus(sales DOUBLE PRECISION)
RETURNS VARCHAR AS $$
DECLARE
    status VARCHAR;
BEGIN
   
    IF sales > 500 AND sales <= 1000 THEN
        status := 'Good';
    ELSIF sales > 1000 AND sales <= 1500 THEN
        status := 'Better';
    ELSIF sales > 1500 THEN
        status := 'Great';
    
    ELSIF sales <= 500 THEN
        status := 'Needs Improvement';
    ELSIF sales > 2000 THEN
        status := 'Outstanding';
    ELSE
        status := 'Unclassified';
    END IF;
    RETURN status;
END;
$$ LANGUAGE plpgsql;

SELECT order_line, order_date, ship_mode, sales,
       salesStatus(sales)
FROM sales;


SELECT order_line, order_date, ship_mode, sales,
       salesStatus(sales)
FROM sales
ORDER BY sales DESC;


SELECT order_line, order_date, ship_mode, sales,
       salesStatus(sales)
FROM sales
ORDER BY sales ASC;
