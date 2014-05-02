json.array!(@apps) do |app|
  json.extract! app, :id, :name, :description, :author, :price, :file_name, :file_data, :file_mime_type
  json.url app_url(app, format: :json)
end
