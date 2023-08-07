require "rails_helper"

RSpec.describe Recipe do
  describe "existance" do
    it "exits and has attributes" do
     
      country = "Cuba"
      recipe = RecipeFacade.new(country).recipes

      expect(recipe.first).to be_a(Recipe)
      expect(recipe.first.id).to eq(nil)
      expect(recipe.first.type).to eq("recipe")
      expect(recipe.first.title).to be_a(String)
      expect(recipe.first.url).to be_a(String)
      expect(recipe.first.country).to be_a(String)
      expect(recipe.first.image).to be_a(String)
    end
  end
end