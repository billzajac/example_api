json.array!(@apps) do |app|
  json.extract! app, :id, :name, :description, :author, :price
  # app.binary && json.binary_url app.binary.url # Commenting this will save time where we probably don't want it anyway
  json.url app_url(app, format: :json)
end
