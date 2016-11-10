json.extract! product, :id, :title, :description, :deadline, :base_price, :created_at, :updated_at
json.url product_url(product, format: :json)