select
  id as payment_id,
  (amount / 100)::numeric(16, 2) as amount_usd

from app_data.payments