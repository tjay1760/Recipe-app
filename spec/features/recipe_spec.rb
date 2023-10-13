require 'rails_helper'

RSpec.describe 'Recipes index', type: :feature do
  before :each do
    @user = User.create(name: 'Tjay', email: 'mcjthiongo@gmail.com', password: '123456')
    @food = Food.create(name: 'potato', measurement_unit: 'gram', price: 1, quantity: 1, user_id: @user.id)
    @user.skip_confirmation!
    @user.save
    login_as(@user, scope: :user)
    visit recipe_index_path
  end

  it 'sees the title' do
    expect(page).to have_content('My Recipe')
  end

  it 'sees the navbar' do
    expect(page).to have_content('Your Recipe')
  end

  it 'sees the add new recipe link' do
    expect(page).to have_link('Add Recipe')
  end

  it 'when click add recipe go to the add recipe page' do
    click_on 'Add Recipe'
    expect(page).to have_content('New Recipe')
  end
end
