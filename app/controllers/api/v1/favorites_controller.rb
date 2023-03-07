class Api::V1::FavoritesController < ApplicationController
  before_action :find_user, only: [:index, :create]
  
  def create
    if @user
      user = User.find_by(api_key: params[:api_key])
      user.favorites.create!(favorite_params)
      render json: { "success": "Favorite added successfully" }, status: 201
    else
      render json: { "error": "Unable to save favorite recipe" }, status: 400
    end
  end

  def index
    if @user
      user = User.find_by(api_key: params[:api_key])
      favorites = @user.favorites
      render json: FavoritesSerializer.new(favorites), status: 200
    else
      render json: { "error": "Unable to find user"}, status: 400
    end
  end

  private

  def find_user
    @user = User.find_by(api_key: params[:api_key])
  end

  def favorite_params
    params.permit(:country, :recipe_link, :recipe_title)
  end
end