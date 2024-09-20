select 
ORDER_DATE,
CUSTOMER_NAME,
ITEM
 from  {{ ref("stg_order") }}
