ActiveAdmin.register Location do

# See permitted parameters documentation:
# https://github.com/activeadmin/activeadmin/blob/master/docs/2-resource-customization.md#setting-up-strong-parameters
#
# permit_params :list, :of, :attributes, :on, :model
#
# or
#
# permit_params do
#   permitted = [:permitted, :attributes]
#   permitted << :other if params[:action] == 'create' && current_user.admin?
#   permitted
# end
  permit_params :user_id, :produit_id, :date_debut, :date_fin

  index do
    selectable_column
    id_column
    column :user
    column :produit
    column :date_debut
    column :date_fin
    actions
  end

  filter :user
  filter :produit
  filter :description
  filter :date_debut
  filter :date_fin

  form do |f|
    f.inputs "Produits Details" do
      f.input :user
      f.input :produit
      f.input :date_debut
      f.input :date_fin
    end
    f.actions
  end

end
