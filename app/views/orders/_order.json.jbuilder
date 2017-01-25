json.extract! order, :id, :created_at, :hour, :comments, :user_id, :quantity, :total, :created_at, :updated_at
json.url order_url(order, format: :json)