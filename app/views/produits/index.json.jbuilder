json.array!(@produits) do |produit|
  json.extract! produit, :id, :nom, :disponibilite, :description, :image, :ean
  json.url produit_url(produit, format: :json)
end
