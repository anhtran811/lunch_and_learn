class Api::V1::UsersController < ApplicationController
  def create
    user = User.new(user_params)
    if user.save
      render json: UserSerializer.new(user), status: :created
    elsif User.find_by(email: params[:user][:email])
      render json: { errors: "Email is not unique" }, status: 400
    else
      render json: { errors: "User was not created" }, status: 400
    end
  end

  private

  def user_params
    params.require(:user).permit(:name, :email)
  end
end