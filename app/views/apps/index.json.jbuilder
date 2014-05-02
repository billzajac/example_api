json.array!(@apps) do |app|
  json.extract! app, :id, :name, :description, :author, :price, :file_id
  json.url app_url(app, format: :json)
end
