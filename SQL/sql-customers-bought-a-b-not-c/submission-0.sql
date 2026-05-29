-- Write your query below
WITH cte_group AS (
SELECT c.customer_id, c.customer_name, 
STRING_AGG(o.product_name, ', ') AS products
FROM customers c JOIN orders o
ON c.customer_id = o.customer_id
GROUP BY c.customer_id)
SELECT customer_id, customer_name
FROM cte_group
WHERE products LIKE '%A%' AND products like '%B%'
AND products NOT LIKE '%C%'
ORDER BY customer_name;