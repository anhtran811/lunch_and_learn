class Api::V1::RecipesController < ApplicationController
  def index
    # if params[:country] == "" 
    # or if no recipes returned
    #   render json: ErrorSerializer.new
    if params[:country]
      render json: RecipeSerializer.new(RecipeFacade.country_recipe(params[:country]))
    else
      country = CountryFacade.random_country
      render json: RecipeSerializer.new(RecipeFacade.country_recipe(country.name))
    end
  end
end