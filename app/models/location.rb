class Location < ActiveRecord::Base
  belongs_to :user
  belongs_to :admin_user
  has_one    :produit
end
