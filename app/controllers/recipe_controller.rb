class RecipeController < ApplicationController
  def index
    @user = current_user
    @recipes = @user.recipes.all
  end

  def new
    @user = current_user
    @recipe = Recipe.new
  end

  def show
    @user = current_user
    @recipe = Recipe.includes(recipe_foods: :food).find(params[:id])
    @recipe_foods = @recipe.recipe_foods
  end

  def create
    @user = current_user
    @recipe = current_user.recipes.build(recipe_params)

    respond_to do |format|
      format.html do
        if @recipe.save
          redirect_to recipe_index_path, notice: 'Recipe created successfully.'
        else
          render :new
          flash.now[:alert] = 'recipe could not be added. Please try again.'
        end
      end
    end
  end

  def toggle_public
    @recipe = Recipe.find(params[:id])
    return unless @recipe.user == current_user

    @recipe.update_column(:public, !@recipe.public)
    redirect_to @recipe, notice: 'Recipe status updated.'
  end

  def destroy
    @user = current_user
    @recipe = Recipe.find(params[:id])
    @recipe.destroy
    redirect_to recipe_index_path, notice: 'Recipe deleted successfully.'
  end

  private

  def recipe_params
    params.require(:recipe).permit(:name, :preparation_time, :cooking_time, :description, :public)
  end
end
