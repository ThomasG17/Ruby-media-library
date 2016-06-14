class Comment < ActiveRecord::Base
  belongs_to :produit
  has_one :user
  validates :body, :presence => true

end
