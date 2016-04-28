json.array!(@users) do |user|
  json.extract! user, :id, :nom, :prenom, :mot_de_passe
  json.url user_url(user, format: :json)
end
