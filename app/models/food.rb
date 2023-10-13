class Food < ApplicationRecord
  belongs_to :user, class_name: 'User'
  has_many :recipe_foods, dependent: :destroy

  validates :name, :measurement_unit, :price, :quantity, presence: true
end
