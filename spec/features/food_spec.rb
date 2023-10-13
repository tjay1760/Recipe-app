require 'rails_helper'

RSpec.describe 'Food new', type: :feature do
  before :each do
    @user = User.create(name: 'Tjay', email: 'mcjthiongo@gmail.com', password: '123456')
    @food = Food.create(name: 'potato', measurement_unit: 'gram', price: 1, quantity: 1, user_id: @user.id)
    @user.skip_confirmation!
    @user.save
    login_as(@user, scope: :user)
    visit new_food_path
  end

  it 'see the title' do
    expect(page).to have_content('Add a new food')
  end

  it 'see the Create Food button' do
    expect(page).to have_button('Create Food')
  end
end
