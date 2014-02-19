json.array!(@bikestores) do |bikestore|
  json.extract! bikestore, :checked, :accuracy, :state, :name, :address, :latitude, :longitude, :phone, :zipcode
  json.url bikestore_url(bikestore, format: :json)
end