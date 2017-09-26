json.extract! manager_product, :id, :name, :price, :description, :quantity, :status, :tag, :category_id, :created_at, :updated_at
json.url manager_product_url(manager_product, format: :json)
