require 'rails_helper'

RSpec.describe Food, type: :model do
  describe 'validations' do
    let(:user) { User.new(name: 'John Doe') }
    let(:food) do
      Food.new(
        user:, # Associate the user with the food
        name: 'Delicious Dish',
        measurement_unit: 'Ounce',
        price: 12.99,
        quantity: 5
      )
    end

    it 'is valid with valid attributes' do
      expect(food).to be_valid
    end

    it 'is not valid without a name' do
      food.name = nil
      expect(food).not_to be_valid
    end

    it 'is not valid without a measurement_unit' do
      food.measurement_unit = nil
      expect(food).not_to be_valid
    end

    it 'is not valid without a price' do
      food.price = nil
      expect(food).not_to be_valid
    end

    it 'is not valid without a quantity' do
      food.quantity = nil
      expect(food).not_to be_valid
    end
  end
end
