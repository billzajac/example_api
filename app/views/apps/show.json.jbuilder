json.extract! @app, :id, :name, :description, :author, :price, :created_at, :updated_at
json.binary_url @app.binary.url
