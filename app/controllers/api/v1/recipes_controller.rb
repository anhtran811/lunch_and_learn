class Api::V1::RecipesController < ApplicationController
  def index
    render json: RecipeSerializer.new(RecipeFacade.country_recipe(params[:country]))
  end
end