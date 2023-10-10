
class User < ApplicationRecord
<<<<<<< HEAD
  # Define the "name" and "email" attributes
  validates :name, presence: true, length: { maximum: 255 }
  validates :email, presence: true, length: { maximum: 255 }, uniqueness: { case_sensitive: false },
                    format: { with: /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i }

  # Other attributes and associations can be defined here as well
end
=======
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :foods, foreign_key: :user_id
  has_many :recipes, foreign_key: :user_id
end

>>>>>>> caefad50e9aa3983c3c21af5d81919d852300eed
