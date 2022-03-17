with orders as (
    select * from {{ ref('stg_orders') }}
),
payments as (
    select * from {{ ref('stg_payments') }}
),
final as (
    select
         orders.order_id
        ,orders.customer_id
        ,coalesce(sum(case when payments.status='success' then amount end),0) as amount
    from orders
    left join payments using (order_id)
    group by 1, 2
)
select * from final