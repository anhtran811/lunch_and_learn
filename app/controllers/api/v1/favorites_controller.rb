class Api::V1::FavoritesController < ApplicationController
  def create
    if user = User.find_by(api_key: params[:favorite][:api_key])
      user.favorites.create!(favorite_params)
      render json: { "success": "Favorite added successfully" }, status: 201
    else
      render json: { "error": "Unable to save favorite recipe" }, status: 400
    end
  end

  def index
    user = User.find_by(api_key: params[:api_key])
    favorites = user.favorites
    render json: FavoritesSerializer.new(favorites), status: 200
  end

  private

  def favorite_params
    params.require(:favorite).permit(:country, :recipe_link, :recipe_title)
  end
end