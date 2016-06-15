class User < ActiveRecord::Base
  belongs_to :ability
  has_many :locations
  has_many :comments

  after_create :set_cart
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  validates :email, uniqueness: :true

  def set_cart
    Cart.create(user_id: self.id)
  end
end
