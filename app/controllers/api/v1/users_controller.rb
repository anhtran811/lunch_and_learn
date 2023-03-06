class Api::V1::UsersController < ApplicationController
  def create
    user = User.new(user_params)
    user.save!
    render json: UserSerializer.new(user), status: :created
  end

  private

  def user_params
    params.require(:user).permit(:name, :email)
  end
end