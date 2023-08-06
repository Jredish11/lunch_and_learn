class Api::V1::RecipesController < ApplicationController
  def index
    if params[:country].nil?
      country = CountryFacade.random_country
    else
      country = params[:country]
    end

    @recipes = RecipeFacade.new(country).recipes
    if @recipes.empty?
      render json: { data: [] }
    else
      render json: RecipeSerializer.new(@recipes) 
    end
  end
end