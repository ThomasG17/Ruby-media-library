class Produit < ActiveRecord::Base
  has_many :locations
  belongs_to :type
  has_attached_file :product_image
  validates_attachment_content_type :product_image, content_type: /\Aimage\/.*\Z/
end
