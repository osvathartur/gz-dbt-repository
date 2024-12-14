SELECT
    orders_id
    ,   date_date
    ,   SUM(revenue) AS revenue
    ,   SUM(quantity) AS quantity
    ,   SUM(purchase_cost) AS purchase_cost
    ,   SUM(margin) AS margin
FROM
    {{ ref("int_sales_margin") }} AS sales
GROUP BY
    orders_id
    , date_date