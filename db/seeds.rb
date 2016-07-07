# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
AdminUser.create!(email: 'admin@example.com', password: 'password', password_confirmation: 'password')

Type.create!(name: 'Roman')
Type.create!(name: 'Bande dessinée')
Type.create!(name: 'Film')
Type.create!(name: 'Série')
Type.create!(name: 'Spectacle')
Type.create!(name: 'Album')

Produit.create!(nom: 'Produit 1', type_id: 1, disponibilite: 2)
Produit.create!(nom: 'Produit 2', type_id: 1, disponibilite: 0)
Produit.create!(nom: 'Produit 3', type_id: 2, disponibilite: 10)
Produit.create!(nom: 'Produit 4', type_id: 3, disponibilite: 5)
Produit.create!(nom: 'Produit 5', type_id: 4, disponibilite: 2)
Produit.create!(nom: 'Produit 6', type_id: 5, disponibilite: 1)
Produit.create!(nom: 'Produit 7', type_id: 6, disponibilite: 3)
Produit.create!(nom: 'Produit 8', type_id: 3, disponibilite: 3)
Produit.create!(nom: 'Produit 9', type_id: 4, disponibilite: 1)
Produit.create!(nom: 'Produit 10', type_id: 5, disponibilite: 8)
