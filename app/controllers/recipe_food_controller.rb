class RecipeFoodController < ApplicationController
  def index
    @user = current_user
    @recipes = @user.recipes.all
  end

  def new
    @user = current_user
    @recipe = Recipe.find(params[:recipe_id]) 
    @recipe_food = @recipe.recipe_foods.build 
    @foods = Food.all
  end
  

  def show
    @user = current_user
    @recipe = Recipe.find(params[:id])
    @recipe_foods = @recipe.recipe_foods
  end

  def create
    @user = current_user
    @recipe = Recipe.find(params[:recipe_id])
    @recipe_food = @recipe.recipe_foods.build(ref_params.merge(recipe_id: @recipe.id))
    @recipe_food.user_id = @user.id

    respond_to do |format|
      format.html do
        if @recipe_food.save
          redirect_to recipe_path(@recipe), notice: 'ingredient was successfully added.'
        else
          render :new
          flash.now[:alert] = 'Ingredient could not be added. Please try again.'
        end
      end
    end
  end

  def destroy
    @user = current_user
    @recipe = RecipeFood.find_by(id: params[:id])# Get the associated Recipe using the recipe_id parameter
  
    if @recipe.destroy
      redirect_to recipe_path(@recipe), notice: 'Food was successfully deleted from the recipe.'
    else
      redirect_to recipe_path(@recipe), alert: 'Failed to delete food from the recipe.'
    end
  end
  

  private

  def ref_params
    params.require(:recipe_food).permit(:quantity, :food_id, :recipe_id, :user_id)
  end
end
