#food_spec.rb
require 'rails_helper'RSpec.describe Food, type: :model do
    user = User.new(name: 'John Doe')
    food = Food.new(
      user:,
      name: 'Delicious Dish',
      measurement_unit: 'Ounce',
      price: 12.99,
      quantity: 5
    )  describe 'validations' do
      it 'is valid with valid attributes' do
        expect(food).to be_valid
      end    it 'is not valid without a name' do
        food.name = nil
        expect(food).to_not be_valid
      end    it 'is not valid without a measurement_unit' do
        food.measurement_unit = nil
        expect(food).to_not be_valid
      end    it 'is not valid without a price' do
        food.price = nil
        expect(food).to_not be_valid
      end    it 'is not valid without a quantity' do
        food.quantity = nil
        expect(food).to_not be_valid
      end
    end
  end