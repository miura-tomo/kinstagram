class RecipesController < ApplicationController


  def index
    @recipes = Recipe.page(params[:page]).per(5).order('updated_at DESC')
    @recipe = Recipe.new
  end

   def create
    Recipe.create(recipe_params)
    @recipes = Recipe.all
  end

  def show
    @recipe = Recipe.find(params[:id])
  end


  private

  def recipe_params
    params.require(:recipe).permit(:title, :body, :user_id)
  end
end
