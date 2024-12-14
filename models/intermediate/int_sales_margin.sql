 
SELECT
    sales.*
    , product.purchase_price
    , ROUND((product.purchase_price * sales.quantity),2) AS purchase_cost
    , ROUND((sales.revenue - product.purchase_price),2) AS margin
FROM {{ ref('stg_raw__sales') }} AS sales
JOIN
{{ ref('stg_raw__product') }} AS product
ON
sales.products_id = product.products_id
