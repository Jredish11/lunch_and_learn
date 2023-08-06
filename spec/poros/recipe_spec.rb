require "rails_helper"

RSpec.describe Recipe do
  describe "existance" do
    it "exits and has attributes" do
      country = 'thailand'

      recipes = RecipeService.get_recipe(country)
      


    end
  end
end