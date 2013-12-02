json.array!(@libraries) do |library|
  json.extract! library, :name, :address, :address_cont, :city, :state, :zip
  json.url library_url(library, format: :json)
end
