# app/models/user.rb
class User < ApplicationRecord
  # Define the "name" and "email" attributes
  validates :name, presence: true, length: { maximum: 255 }
  validates :email, presence: true, length: { maximum: 255 }, uniqueness: { case_sensitive: false },
                    format: { with: /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i }

  # Other attributes and associations can be defined here as well
end
