class Comment < ActiveRecord::Base
  belongs_to :produit
  has_one :user
  validates :user, :presence => true
  validates :body, :presence => true

end
