WITH shiptemp AS( 
    SELECT
        orders.*
        ,   ship.shipping_fee
        ,   ship.logcost
        ,   ship.ship_cost
    FROM
        {{ ref("int_orders_margin") }} AS orders
    JOIN
        {{ ref("stg_raw__ship") }} AS ship
    ON
        orders.orders_id = ship.orders_id
    )
SELECT
    *
    ,   (margin + shipping_fee - logcost - ship_cost) AS operational_margin
FROM   
    shiptemp