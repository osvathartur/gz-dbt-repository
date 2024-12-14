with

    source as (select * from {{ source("raw", "ship") }}),

    renamed as (

        select
            orders_id,
            cast(shipping_fee as int64) AS shipping_fee,
            cast(logcost as int64) AS logcost,
            cast(ship_cost as int64) AS ship_cost

        from source

    )

select *
from renamed
