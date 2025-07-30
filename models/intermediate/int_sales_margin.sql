WITH salesproduct AS(
SELECT date_date ,
orders_id,
revenue,
quantity,
quantity * purchase_price AS purchase_cost
FROM {{ref("stg_raw__sales")}}
LEFT JOIN {{ref("stg_raw__product")}}
 ON stg_raw__sales.products_id = stg_raw__product.products_id )
SELECT *,
revenue - purchase_cost AS margin
FROM salesproduct