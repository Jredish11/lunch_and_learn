class RecipeController < ApplicationController
  def index
    @facade = RecipeFacade.new(params[:q])
  end
end