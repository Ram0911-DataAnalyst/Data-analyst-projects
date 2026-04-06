SELECT * FROM orders;

alter table orders
add Email varchar(50)
;

select Email, count(*) as duplicate_count
From orders
group by 
1
having count(*) > 1
;


SELECT 
    order_id,
    #INITCAP(customer_name) AS customer_name, -- Fixes names to 'Ram', 'Raj'
    customer_name ,order_date, amount, 
    UPPER(city) AS city, -- Standardizes city to 'BANGALORE'
    COALESCE(Email, 'Not Provided') AS contact_info -- Handles the NULL emails
FROM Orders;


SELECT 
    city, 
    UPPER(city) AS city,
    SUM(amount) AS total_revenue,
    COUNT(order_id) AS total_orders
FROM Orders
GROUP BY city
ORDER BY total_revenue DESC;

UPDATE Orders SET Email = 'ram_analyst@email.com' WHERE order_id = 1;
UPDATE Orders SET Email = 'raj_data@email.com' WHERE order_id = 2;
UPDATE Orders SET Email = 'waiz_pro@email.com' WHERE order_id = 3;
UPDATE Orders SET Email = 'himakar_dev@email.com' WHERE order_id = 4;
UPDATE Orders SET Email = 'naveen_tech@email.com' WHERE order_id = 5;

ALTER TABLE Orders 
DROP COLUMN contact_info;

alter table orders
add COLUMN contact_info VARCHAR(50);

SELECT * FROM orders;

SET SQL_SAFE_UPDATES = 0;
UPDATE Orders SET contact_info = '9876543210' WHERE order_id = 1; -- Ram
UPDATE Orders SET contact_info = '8876543211' WHERE order_id = 2; -- Raj
UPDATE Orders SET contact_info = '7876543212' WHERE order_id = 3; -- Waiz
UPDATE Orders SET contact_info = '9976543213' WHERE order_id = 4; -- Himakar
UPDATE Orders SET contact_info = '9176543214' WHERE order_id = 5; -- Naveen