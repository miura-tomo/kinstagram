class RecipesController < ApplicationController
  def new
    @recipe = Recipe.new
  end

  def create
    @recipe = Recipe.new(recipe_params)
    if @recipe.save
      @recipes = Recipe.order(created_at: :desc).limit(7)
      render :create
    else
      render :new
    end
  end

  def index
    @recipes = Recipe.order(created_at: :desc).limit(7)
  end

  def show
    @recipe = Recipe.find(params[:id])
  end

  private

  def recipe_params
    params.require(:recipe).permit(:title, :body, :user_id)
  end
end
