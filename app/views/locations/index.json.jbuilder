json.array!(@locations) do |location|
  json.extract! location, :id, :date_debut, :date_fin
  json.url location_url(location, format: :json)
end
