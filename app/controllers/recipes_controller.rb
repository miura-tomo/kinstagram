class RecipesController < ApplicationController
  before_action :authenticate_user!


  def index
    @recipes = Recipe.page(params[:page]).per(12).order('updated_at DESC')
    @recipe = Recipe.new
  end

   def create
    Recipe.create(recipe_params)
    @recipes = Recipe.page(params[:page]).per(12).order('updated_at DESC')
  end

  def show
    @recipe = Recipe.find(params[:id])
  end

  def recipe_params
    params.require(:recipe).permit(:title, :body, :user_id)
  end
end
