json.extract! order, :id, :order_datetime, :shipping_address_id, :user_id, :created_at, :updated_at
json.url order_url(order, format: :json)
