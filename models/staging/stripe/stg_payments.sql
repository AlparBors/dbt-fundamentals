with payments as (
    select
         id            as payment_id
        ,orderid       as order_id
        ,paymentmethod as payment_method
        ,status
        ,amount/100    as amount
        ,created       as payment_date
    from raw.stripe.payment
)
select * from payments