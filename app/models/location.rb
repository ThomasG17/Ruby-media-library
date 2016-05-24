class Location < ActiveRecord::Base
  belongs_to :user
  belongs_to :admin_user
  belongs_to :produit
end
