class Api::V1::UsersController < ApplicationController
  def create
    user = User.new(user_params)
    user.generate_api_key
    require 'pry'; binding.pry
    if user.save 
      render json: user, status: :created
    else
      render json: { errors: user.errors.full_messages}, status: :unprocessable_entity
    end
  end

  private
  
  def user_params
    params.permit(:name, :email, :password, :password_confirmation)
  end
end
