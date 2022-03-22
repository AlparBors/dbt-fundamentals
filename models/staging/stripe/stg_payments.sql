with payments as (
    select
         id                                 {#           #} as payment_id
        ,orderid                            {#           #} as order_id
        ,paymentmethod                      {#           #} as payment_method
        ,status                             {#           #} as status
        ,{{ cents_to_dollars('amount',4) }}                 as amount
        ,created                            {#           #} as payment_date
    from {{ source('stripe','payment') }}
)
select * from payments
{{ limit_data_in_dev('payment_date',1500) }}