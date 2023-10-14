RSpec.describe 'Recipes index', type: :feature do
  before :each do
    Food.delete_all
    Recipe.delete_all

    @user = User.first
    @user ||= User.create!(name: 'Tjay',
                           email: 'tjaypod@gmail.com',
                           password: '123456',
                           password_confirmation: '123456',
                           confirmed_at: Time.now)
    @recipe1 = Recipe.create(user: @user,
                             name: 'Biryani',
                             description: 'Delicious Chicken biryani',
                             preparation_time: 10,
                             cooking_time: 75)
    @food1 = Food.create(user: @user,
                         name: 'Steak',
                         measurement_unit: 'grams',
                         price: 20.0,
                         quantity: 10)
    @food2 = Food.create(user: @user,
                         name: 'Macaroni',
                         measurement_unit: 'units',
                         price: 50.0,
                         quantity: 3)
    @user.skip_confirmation!
    @user.save
    login_as(@user, scope: :user)
  end

  it 'displays the total value of food needed' do
    visit general_shopping_list_index_path(recipe_id: @recipe1.id)
    expect(page).to have_content('Total value of food needed: 0')
  end

  it 'displays the total number of food items to buy' do
    visit general_shopping_list_index_path(recipe_id: @recipe1.id)
    expect(page).to have_content('Amount of food items to buy: 0')
  end
end
