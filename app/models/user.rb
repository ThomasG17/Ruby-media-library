class User < ActiveRecord::Base
  belongs_to :ability
  has_many :locations
  has_many :comments

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  validates :firstname, :lastname, uniqueness: :false
  validates :email, uniqueness: :true
end
