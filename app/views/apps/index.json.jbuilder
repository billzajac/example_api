json.array!(@apps) do |app|
  json.extract! app, :id, :name, :description, :author, :price
  app.binary && json.binary_url app.binary.url
  json.url app_url(app, format: :json)
end
