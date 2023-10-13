class GeneralShoppingListController < ApplicationController
  def index
    @user = current_user
    @recipe = Recipe.includes(:recipe_foods).find(params[:recipe_id])

    @user_foods_ids = @user.foods.pluck(:id)
    @recipe_foods_ids = @recipe.recipe_foods.pluck(:food_id)

    # Calculate missing food ids
    missing_food_ids = @recipe_foods_ids - @user_foods_ids

    # Fetch missing food records in one query
    @missing_food_records = Food.where(id: missing_food_ids)

    @food_prices = {}
    @sum = 0

    # Calculate food prices and the total sum
    @missing_food_records.each do |food|
      recipe_food = @recipe.recipe_foods.find_by(food_id: food.id)
      price = recipe_food ? food.price * recipe_food.quantity.to_i : 0
      @food_prices[food.id] = price
      @sum += price
    end

    @recipe_foods = @recipe.recipe_foods
  end
end
