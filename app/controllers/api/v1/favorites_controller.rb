class Api::V1::FavoritesController < ApplicationController

  def index
    user = User.find_by(api_key: params[:api_key])
    if user.nil?
      render json: { error: "Invalid api_key" }, status: :bad_request 
    else
      favs = user.favorites
      render json: FavoriteSerializer.new(favs)
    end
  end

  def create
    user = User.find_by(api_key: params[:api_key])

    if user.nil?
      render json: { error: "Invalid api_key" }, status: :bad_request
    else
      user.favorites.create(favorite_params)
      render json: { success: "Favorite added successfully" }, status: :created
    end
  end


  private

  def favorite_params
    params.permit(:country, :recipe_link, :recipe_title)
  end
end
