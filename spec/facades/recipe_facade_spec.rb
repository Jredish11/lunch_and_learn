require "rails_helper"

RSpec.describe RecipeFacade do
  describe "instance methods" do
    describe "#recipes" do
      xit "pulls up list recipe objects based on a country input", :vcr do
        country = "thailand"
        
        recipes = RecipeFacade.new(country).recipes
        recipes.each do |recipe|
          expect(recipe).to be_a(Recipe)
          expect(recipe.id).to eq(nil)
          expect(recipe.type).to eq("recipe")
          expect(recipe.title).to be_a(String)
          expect(recipe.url).to be_a(String)
          expect(recipe.country).to be_a(String)
          expect(recipe.image).to be_a(String)
        end
      end
    end
  end
end