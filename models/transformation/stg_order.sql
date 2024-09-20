{{ 
    config(
        materialized='view'  
    ) 
}}

WITH customer AS (
    SELECT 
        CUSTOMER_ID,
        CUSTOMER_NAME
       
    FROM {{ source('jaffle_shop', 'CUSTOMER') }}
),

order_data AS (
    SELECT
        --ORDER_ID,
        CUSTOMER_ID,
        SALES_ORDER_NUMBER,
        ORDER_DATE,
        ITEM
    FROM {{ source('jaffle_shop', 'ORDERS') }}
)

-- Create the final result by joining customer and order data
SELECT
    --ord.ORDER_ID,
    ord.SALES_ORDER_NUMBER,
    ord.ORDER_DATE,
    cust.CUSTOMER_NAME,
    ord.ITEM
FROM order_data ord
LEFT JOIN customer cust
    ON ord.CUSTOMER_ID = cust.CUSTOMER_ID
