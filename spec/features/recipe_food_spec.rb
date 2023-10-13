RSpec.describe 'Recipes index', type: :feature do
  before :each do
    Food.delete_all
    Recipe.delete_all

    @user = User.first
    @user ||= User.create!(name: 'Tjay',
                           email: 'mcjthiongo@gmail.com',
                           password: '123456',
                           password_confirmation: '123456',
                           confirmed_at: Time.now)
    @recipe1 = Recipe.create(user: @user,
                             name: 'biryani',
                             description: 'Delicious Chicken biryani',
                             preparation_time: 10,
                             cooking_time: 75)
    @food1 = Food.create(user: @user,
                         name: 'Noodles',
                         measurement_unit: 'grams',
                         price: 20.0,
                         quantity: 10)
    @food2 = Food.create(user: @user,
                         name: 'Steak',
                         measurement_unit: 'units',
                         price: 50.0,
                         quantity: 3)
    @user.skip_confirmation!
    @user.save
    login_as(@user, scope: :user)
  end
  scenario 'User creates a new recipe food' do
    visit new_recipe_recipe_food_path(@recipe1)

    select @food1.name, from: 'recipe_food[food_id]'
    fill_in 'Quantity', with: 10

    click_button 'Create food'

    expect(page).to have_content(@food1.name)
    expect(page).to have_content(10)
  end
end
