SHOW DATABASES 
CREATE DATABASE supplychaindata 
use supplychaindata
CREATE TABLE ACCOUNTS (
  USERNAME VARCHAR(255),
  FIRSTNAME CHAR(50),
  POSTS INT,
  COUNTRY CHAR(50)
);

SELECT * FROM ACCOUNTS;

INSERT INTO  ACCOUNTS VALUES 
('NARESH_19','NARESH',10,'INDIA'),
('VIJAY_22','VIJAY',30,'INDIA'),
('SHAKER_11','SHAKER',100,'INDIA');

	SELECT DATABASE();
    
use naresh
show tables from naresh
CREATE TABLE INFORMATION (
  USERNAME VARCHAR(255),
  FIRSTNAME CHAR(50),
  POSTS INT,
  COUNTRY CHAR(50)
);
INSERT INTO INFORMATION VALUES 
('murali_19','murali',12,'INDIA'),
('pradeep_25','pradeep',32,'INDIA'),
('chandan_26','chandan',10,'INDIA');

SELECT * FROM INFORMATION;

DROP TABLE naresh.accounts;

CREATE DATABASE LOGISTICS 
use LOGISTICS
SHOW TABLES FROM logistics;
SELECT * FROM orderstable;
SELECT * FROM logistics.orderitemstable;
select * FROM logistics.productstable;

SELECT * FROM productstable;
select * from logistics.customerstable;

select * from customerstable;
select * from locationstable;
select * from productstable;
select * from orderstable;
select * from orderitemstable;

select order_id count from orderitemstable;

select * from customerstable;


SELECT COUNT(DISTINCT customer_id) AS total_customers FROM customerstable;

ALTER TABLE customerstable
RENAME COLUMN  ï»¿customer_id TO customer_id;

ALTER TABLE locationstable
RENAME COLUMN ï»¿latitude TO latitude;

SELECT count(latitude) AS 'total latitude' FROM locationstable;

SELECT COUNT(DISTINCT latitude) AS `total latitude` FROM locationstable;

ALTER TABLE orderstable
RENAME COLUMN ï»¿order_id TO order_id;

ALTER TABLE productstable
RENAME COLUMN ï»¿product_card_id to product_card_id;

ALTER TABLE orderitemstable
RENAME COLUMN ï»¿order_item_id TO order_item_id;

SELECT * FROM customerstable;

SELECT customer_city, COUNT(*) AS total_orders
FROM orderstable
JOIN customerstable ON orderstable.order_id = customerstable.customer_id
GROUP BY customer_city
ORDER BY total_orders DESC;


SELECT customer_city, COUNT(*) AS total_orders
FROM orderstable
JOIN customerstable ON orderstable.order_id = customerstable.customer_id
GROUP BY customer_city
ORDER BY total_orders DESC
LIMIT 1000;

SELECT
    o.order_id,
    o.order_date,
    c.customer_id,
    c.customer_segment,
    l.customer_city,
    l.customer_state,
    oi.product_id,
    p.product_name,
    p.category_name,
    oi.order_item_product_price,
    oi.order_item_quantity,
    oi.order_item_total_amount
FROM orderstable o
JOIN customerstable c ON o.customer_id = c.customer_id
JOIN locationstable l ON c.customer_city = l.customer_city
JOIN orderitemstable oi ON o.order_id = oi.order_id
JOIN productstable p ON oi.product_id = p.product_id;
use logistics
SELECT customer_id ,order_id,latitude from customerstable,orderstable,locationstable;

ALTER TABLE customerstable ADD order_id VARCHAR(20);

ALTER TABLE orderstable ADD COLUMN customer_id VARCHAR(100);

UPDATE orderstable
SET customer_id = 'C12345'
WHERE order_id = 'O56789';

ALTER TABLE orderstable
MODIFY order_id VARCHAR(20);

ALTER TABLE orderstable
DROP COLUMN customer_id;

ALTER TABLE customerstable
DROP COLUMN order_id;

select * from customerstable;
select * from locationstable;
select * from productstable;
select * from orderstable;
select * from orderitemstable;

select * from customerstable;
select * from locationstable;

ALTER TABLE locationstable ADD COLUMN customer_id varchar(20);

ALTER TABLE locationstable
MODIFY COLUMN customer_id int;
DESCRIBE locationstable;

UPDATE locationstable
SET customer_id = 12345
WHERE order_id = 56789;

UPDATE locationstable SET customer_id = 'O12345' WHERE customer_id = 'C56789';

ALTER TABLE locationstable
ADD COLUMN order_id VARCHAR(50);


DROP DATABASE logistics;
SHOW DATABASES;

select * from customerstable;



create database logistics;


use logistics;

select * from customerstable;




DROP TABLE customerstable;

ALTER TABLE customerstable
RENAME COLUMN  ï»¿customer_id TO customer_id;

show tables ;

SELECT * FROM logistics.`orders table`;
RENAME TABLE logistics.`orders table` TO orderstable;

select * from orderstable;

ALTER TABLE orderstable
RENAME COLUMN ï»¿order_id TO order_id;


SELECT * FROM productstable;

ALTER TABLE productstable
RENAME COLUMN ï»¿product_card_id TO product_card_id;


select * from orderitemstable;

select * from locationstable;

ALTER TABLE locationstable
RENAME COLUMN ï»¿latitude to latitude;

use logistics;

ALTER TABLE orderitemstable
RENAME COLUMN ï»¿order_id TO order_id;


select * from locationstable;
select * from customerstable;
select * from orderstable;
select * from orderitemstable;
select * from productstable;

SELECT customer_segment, COUNT(*) AS total_orders
FROM orderstable
JOIN customerstable ON orderstable.customer_id = customerstable.customer_id
GROUP BY customer_segment
ORDER BY total_orders desc;

SELECT count(customer_id) FROM orderstable;

SELECT customer_id 
FROM orderstable
WHERE customer_id NOT IN (
  SELECT customer_id FROM customerstable
);

SELECT customer_segment, COUNT(orderstable.order_id) AS total_orders
FROM orderstable
right JOIN customerstable ON orderstable.customer_id = customerstable.customer_id
GROUP BY customer_segment
ORDER BY total_orders DESC;

SELECT customer_segment, COUNT(orderstable.order_id) AS total_orders
FROM orderstable
left JOIN customerstable ON orderstable.customer_id = customerstable.customer_id
GROUP BY customer_segment
ORDER BY total_orders DESC;

select count(order_id) from orderstable;

SELECT COUNT(*) 
FROM orderstable 
WHERE customer_id IS NULL;

SELECT orderstable.customer_id
FROM orderstable
LEFT JOIN customerstable ON orderstable.customer_id = customerstable.customer_id
WHERE customerstable.customer_id IS NULL;

SELECT * 
FROM orderstable
LEFT JOIN customerstable ON orderstable.customer_id = customerstable.customer_id
WHERE customerstable.customer_id IS NULL;

select count(order_id) from customerstable;

SELECT COUNT(*) 
FROM customerstable 
WHERE order_id IS NOT NULL AND customer_id IS NOT NULL;

SELECT 
  ROW_NUMBER() OVER () AS `S.No`,
  order_id,
  customer_id
FROM orderstable;

SELECT 
  IFNULL(customer_segment, 'Unknown') AS customer_segment,
  COUNT(orderstable.order_id) AS total_orders
FROM orderstable
LEFT JOIN customerstable ON orderstable.customer_id = customerstable.customer_id
GROUP BY customer_segment
ORDER BY total_orders DESC;

SELECT customer_segment, COUNT(orderstable.order_id) AS total_orders
FROM orderstable
INNER JOIN customerstable ON orderstable.customer_id = customerstable.customer_id
GROUP BY customer_segment
ORDER BY total_orders DESC;

SELECT customer_id, COUNT(*) AS count
FROM customerstable
GROUP BY customer_id
HAVING count > 1;

SELECT customer_segment, COUNT(DISTINCT orderstable.order_id) AS total_orders
FROM orderstable
JOIN (
    SELECT DISTINCT customer_id, customer_segment
    FROM customerstable
) AS uniq_customers
ON orderstable.customer_id = uniq_customers.customer_id
GROUP BY customer_segment
ORDER BY total_orders DESC;

CREATE TABLE clean_customerstable AS
SELECT DISTINCT * FROM customerstable;
use logistics
select count(order_id) from customerstable;
show databases

--drop table clean_customerstable;
DROP TABLE clean_customerstable;

DELETE customer_id
FROM customerstable 
JOIN customerstable 
  ON customerstable.customer_id = orderstable.customer_id
  AND customerstable.id > orderstable.id;
  
  
  ALTER TABLE customerstable ADD COLUMN temp_id INT NOT NULL AUTO_INCREMENT PRIMARY KEY;
  
  DELETE FROM customerstable
WHERE temp_id NOT IN (
  SELECT * FROM (
    SELECT MIN(temp_id)
    FROM customerstable
    GROUP BY customer_id
  ) AS keep_ids
);

DELETE FROM customerstable
WHERE id NOT IN (
  SELECT * FROM (
    SELECT MIN(id)
    FROM customerstable
    GROUP BY customer_id
  ) AS keep_ids
);

SELECT * FROM customerstable;

ALTER TABLE customerstable
DROP COLUMN TEMP_ID;

--using cte

WITH deleteduplicates AS
(
  SELECT CUSTOMER_ID,TEMP_ID,
  ROW_NUMBER() OVER(
  PARTITION BY CUSTOMER_ID
  ORDER BY TEMP_ID ASC)
  AS rowNO
  FROM CUSTOMERSTABLE
  )
    DELETE FROM deleteduplicates
    WHERE rowNO > 1;
  
SELECT * FROM (
  SELECT *,
         ROW_NUMBER() OVER (PARTITION BY customer_id ORDER BY temp_id ASC) AS row_no
  FROM customerstable
) AS preview
WHERE row_no > 1;


DELETE FROM customerstable
WHERE temp_id IN (
  SELECT temp_id FROM (
    SELECT temp_id,
           ROW_NUMBER() OVER (PARTITION BY customer_id ORDER BY temp_id ASC) AS row_no
    FROM customerstable
  ) AS duplicates
  WHERE row_no > 1
);

SET SQL_SAFE_UPDATES = 0;

SELECT count(customer_id) FROM customerstable; 

select count(customer_id) from locationstable;
select * from locationstable;
 ALTER TABLE locationstable ADD COLUMN temp_id INT NOT NULL AUTO_INCREMENT PRIMARY KEY;
 
 DELETE FROM locationstable
WHERE temp_id IN (
  SELECT temp_id FROM (
    SELECT temp_id,
           ROW_NUMBER() OVER (PARTITION BY customer_id ORDER BY temp_id ASC) AS row_no
    FROM locationstable
  ) AS duplicates
  WHERE row_no > 1
);

SELECT * FROM (
  SELECT *,
         ROW_NUMBER() OVER (PARTITION BY customer_id ORDER BY temp_id ASC) AS row_no
  FROM locationstable
) AS preview
WHERE row_no > 1;

select * from orderitemstable;
select count(customer_id) from orderitemstable;
ALTER TABLE orderitemstable
ADD COLUMN temp_id INT NOT NULL AUTO_INCREMENT PRIMARY KEY; 

SELECT * FROM (
  SELECT *,
         ROW_NUMBER() OVER (PARTITION BY customer_id ORDER BY temp_id ASC) AS row_no
  FROM orderitemstable
) AS preview
WHERE row_no > 1;

 DELETE FROM orderitemstable
WHERE temp_id IN (
  SELECT temp_id FROM (
    SELECT temp_id,
           ROW_NUMBER() OVER (PARTITION BY customer_id ORDER BY temp_id ASC) AS row_no
    FROM orderitemstable
  ) AS duplicates
  WHERE row_no > 1
);

select * from orderstable;
select count(customer_id) from orderstable;
ALTER TABLE orderstable
ADD COLUMN temp_id INT NOT NULL AUTO_INCREMENT  PRIMARY KEY;

SELECT * FROM (
  SELECT *,
         ROW_NUMBER() OVER (PARTITION BY customer_id ORDER BY temp_id ASC) AS row_no
  FROM orderstable
) AS preview
WHERE row_no > 1;

 DELETE FROM orderstable
WHERE temp_id IN (
  SELECT temp_id FROM (
    SELECT temp_id,
           ROW_NUMBER() OVER (PARTITION BY customer_id ORDER BY temp_id ASC) AS row_no
    FROM orderstable
  ) AS duplicates
  WHERE row_no > 1
);

select * from productstable;
select count(customer_id) from productstable;

ALTER TABLE productstable
ADD COLUMN temp_id INT NOT NULL AUTO_INCREMENT PRIMARY KEY;

SELECT * FROM (
  SELECT *,
         ROW_NUMBER() OVER (PARTITION BY customer_id ORDER BY temp_id ASC) AS row_no
  FROM productstable
) AS preview
WHERE row_no > 1;

 DELETE FROM productstable
WHERE temp_id IN (
  SELECT temp_id FROM (
    SELECT temp_id,
           ROW_NUMBER() OVER (PARTITION BY customer_id ORDER BY temp_id ASC) AS row_no
    FROM productstable
  ) AS duplicates
  WHERE row_no > 1
);

SELECT COUNT(DISTINCT customer_id) AS total_customers FROM customerstable;

SELECT customer_segment, COUNT(*) AS total_orders
FROM orderstable
JOIN customerstable ON orderstable.customer_id = customerstable.customer_id
GROUP BY customer_segment
ORDER BY total_orders DESC;

select * from orderitemstable;

SELECT customer_id, SUM(order_item_total_amount) AS total_sales
FROM orderitemstable
GROUP BY customer_id
ORDER BY total_sales DESC
LIMIT 5;

SELECT *
FROM orderitemstable
WHERE customer_id = 1;

SELECT customerstable.customer_segment, SUM(order_item_total_amount) AS total_sales
FROM orderitemstable
JOIN customerstable ON orderitemstable.customer_id = customerstable.customer_id
GROUP BY customerstable.customer_segment
ORDER BY total_sales DESC
LIMIT 3;

select * from orderstable;

select * from orderitemstable;

select * from productstable;

SELECT DATE_FORMAT(order_date, '%Y-%m') AS month, COUNT(*) AS order_count
FROM orderstable
GROUP BY month
ORDER BY month;

SELECT AVG(order_item_total_amount) AS avg_sales_per_order
FROM orderitemstable;

SELECT order_id, order_profit_per_order
FROM orderitemstable
ORDER BY order_profit_per_order DESC
LIMIT 1;

SELECT *
FROM orderitemstable
WHERE order_profit_per_order =910.84595;

use logistics;

select * from orderstable;

SELECT shipping_mode, COUNT(*) AS shipment_count
FROM orderstable
GROUP BY shipping_mode;

SELECT order_state, COUNT(*) AS delayed_orders
FROM orderstable
WHERE DATEDIFF(shipping_date, order_date) > 3
GROUP BY order_state
ORDER BY delayed_orders DESC
LIMIT 1;

SELECT order_region, AVG(DATEDIFF(shipping_date, order_date)) AS avg_shipping_days
FROM orderstable
JOIN orderstable ON orderstable.order_id = orderstable.order_id
GROUP BY order_region;


SELECT order_region, 
       AVG(DATEDIFF(shipping_date, order_date)) AS avg_shipping_days
FROM orderstable
GROUP BY order_region
ORDER BY avg_shipping_days DESC;

SELECT 
  order_region,
  FLOOR(AVG(DATEDIFF(shipping_date, order_date))) AS days,
  FLOOR((AVG(DATEDIFF(shipping_date, order_date)) - FLOOR(AVG(DATEDIFF(shipping_date, order_date)))) * 24) AS hours,
  FLOOR(
    (
      ((AVG(DATEDIFF(shipping_date, order_date)) - FLOOR(AVG(DATEDIFF(shipping_date, order_date)))) * 24) 
      - FLOOR((AVG(DATEDIFF(shipping_date, order_date)) - FLOOR(AVG(DATEDIFF(shipping_date, order_date)))) * 24)
    ) * 60
  ) AS minutes
FROM 
  orderstable
GROUP BY 
  order_region
ORDER BY 
  AVG(DATEDIFF(shipping_date, order_date)) DESC;
  
select * from productstable;  
 
 select * from orderitemstable;
 
SELECT product_name, SUM(order_item_quantity) AS total_sold
FROM orderitemstable
JOIN productstable ON orderitemstable.order_item_cardprod_id = productstable.product_card_id
GROUP BY product_name
ORDER BY total_sold DESC
LIMIT 5;

SELECT order_item_cardprod_id, SUM(order_item_quantity)
FROM orderitemstable
GROUP BY order_item_cardprod_id
ORDER BY SUM(order_item_quantity) DESC
LIMIT 5;

SET SESSION net_read_timeout = 600;
SET SESSION wait_timeout = 600;

CREATE INDEX idx_product_card_id ON productstable(product_card_id);

CREATE INDEX idx_order_item_cardprod_id ON orderitemstable(order_item_cardprod_id);

DESCRIBE productstable;

SELECT * FROM orderitemstable LIMIT 1000;

SELECT product_name FROM productstable LIMIT 1000;

SELECT product_name, SUM(order_item_quantity) AS total_sold
FROM (
  SELECT * FROM orderitemstable LIMIT 1000
) AS temp
JOIN productstable ON temp.order_item_cardprod_id = productstable.product_card_id
GROUP BY product_name
ORDER BY total_sold DESC
LIMIT 5;

SELECT category_name, SUM(order_item_total_amount) AS total_sales
FROM orderitemstable
JOIN productstable ON orderitemstable.order_item_cardprod_id = productstable.product_card_id
GROUP BY category_name
ORDER BY total_sales DESC;

SELECT category_name,sum(order_item_cardprod_id) AS total_sales
FROM(
  SELECT * FROM orderitemstable LIMIT 1000
) AS temp
JOIN productstable ON temp.order_item_cardprod_id = productstable.product_card_id
GROUP BY category_name
ORDER BY total_sales DESC
LIMIT 5;

select * from orderitemstable;

select * from productstable;

SELECT 
  category_name,
  ROUND(SUM(order_item_total_amount) / 100000, 2) AS total_sales_in_lakhs
FROM (
  SELECT * FROM orderitemstable LIMIT 1000
) AS temp
JOIN productstable 
  ON orderitemstable.order_item_cardprod_id = productstable.product_card_id
GROUP BY category_name
ORDER BY total_sales_in_lakhs DESC
LIMIT 5;

SELECT 
  category_name,
  ROUND(SUM(order_item_total_amount) / 1000000, 2) AS total_sales_in_lakhs
FROM (
  SELECT * FROM orderitemstable LIMIT 1000
) AS temp
JOIN productstable 
  ON temp.order_item_cardprod_id = productstable.product_card_id
GROUP BY category_name
ORDER BY total_sales_in_lakhs DESC
LIMIT 5;

use logistics;

select * from orderitemstable;
select * from orderstable;

SELECT order_region, SUM(order_item_total_amount) AS total_revenue
FROM orderstable
JOIN orderitemstable ON orderstable.order_id = orderitemstable.order_id
GROUP BY order_region
ORDER BY total_revenue DESC;

SELECT 
  order_region, 
  ROUND(SUM(order_item_total_amount) / 100000, 2) AS total_revenue_in_lakhs
FROM orderstable
JOIN orderitemstable ON orderstable.order_id = orderitemstable.order_id
GROUP BY order_region
ORDER BY total_revenue_in_lakhs DESC;

SELECT order_country, COUNT(*) AS order_count
FROM orderstable;
GROUP BY order_country;

SELECT order_country, COUNT(*) AS order_count
FROM orderstable
GROUP BY order_country
ORDER BY order_count DESC
LIMIT 1000;

DESCRIBE ORDERSTABLE;

SELECT product_name, 
       SUM(order_item_product_price - order_item_discount) AS revenue,
       SUM(order_item_total_amount) AS profit,
       SUM(order_item_total_amount)/SUM(order_item_product_price) AS profit_margin
FROM orderitemstable
JOIN productstable ON orderitemstable.order_item_cardprod_id = productstable.product_card_id
GROUP BY product_name
ORDER BY profit_margin DESC;


SELECT 
    product_name, 
    SUM(order_item_product_price - order_item_discount) AS cost,
    SUM(order_item_total_amount) AS profit,
    SUM(order_item_total_amount) / SUM(order_item_product_price) AS profit_margin
FROM (
    SELECT * FROM orderitemstable
    LIMIT 1000
) AS limited_items
JOIN productstable 
    ON limited_items.order_item_cardprod_id = productstable.product_card_id
GROUP BY product_name
ORDER BY profit_margin DESC;

select order_item_product_price , order_item_discount from orderitemstable;

select * from orderitemstable;

describe orderitemstable;

SELECT order_customer_id, COUNT(order_id) AS total_orders
FROM orders
GROUP BY order_customer_id
HAVING total_orders > 1;

SELECT 
    order_item_cardprod_id AS product_id,
    SUM(order_item_total_amount) AS revenue,
    SUM(order_profit_per_order) AS profit,
    (SUM(order_item_total_amount) - SUM(order_profit_per_order)) AS cost,
    (SUM(order_profit_per_order) / SUM(order_item_total_amount)) AS profit_margin
FROM orderitemstable
GROUP BY order_item_cardprod_id
ORDER BY profit_margin DESC
LIMIT 1000;


select * from customerstable;

select * from locationstable;

select * from orderitemstable;

select * from orderstable;

select * from productstable;

