ActiveAdmin.register Produit do

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
  permit_params :nom, :disponibilite, :description, :ean, :product_image, :type_id

  index do
    selectable_column
    id_column
    column :nom
    column :disponibilite
    column :description
    column :ean
    column :product_image
    column :type
    column :created_at
    actions
  end

  filter :nom
  filter :disponibilite
  filter :description
  filter :ean
  filter :product_image
  filter :type
  filter :created_at

  form do |f|
    f.inputs "Type Details" do
      f.input :nom
      f.input :disponibilite
      f.input :description
      f.input :ean
      f.input :product_image
      f.input :type
    end
    f.actions
  end

end
