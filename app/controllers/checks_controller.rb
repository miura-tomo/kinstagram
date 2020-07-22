class ChecksController < ApplicationController
  before_action :recipe_params
  def create
    check = current_user.checks.new(recipe_id: @recipe.id)
    check.save
  end

  def destroy
    @check = Check.find_by(user_id: current_user.id, recipe_id: @recipe.id).destroy
  end

  private

  def recipe_params
    @recipe = Recipe.find(params[:recipe_id])
  end
end
