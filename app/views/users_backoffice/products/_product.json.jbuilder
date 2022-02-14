json.extract! product, :id, :category_id, :title, :price, :in_stock, :safety_margin, :created_at, :updated_at
json.url product_url(product, format: :json)
