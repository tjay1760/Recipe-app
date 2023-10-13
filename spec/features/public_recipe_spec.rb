require 'rails_helper'

RSpec.describe 'Public Recipes Index' do
  before :each do
    @user = User.create(name: 'Tjay', email: 'mcjthiongo@gmail.com', password: '123456')
    @food = Food.create(name: 'potato', measurement_unit: 'gram', price: 1, quantity: 1, user_id: @user.id)
    @user.skip_confirmation!
    @user.save
    login_as(@user, scope: :user)
    visit public_recipe_index_path
  end

  it 'see the title' do
    expect(page).to have_content('Public Recipes')
  end

  it 'see the navbar' do
    expect(page).to have_content('Public Recipes')
  end
end
