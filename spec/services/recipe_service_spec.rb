require "rails_helper"

describe RecipeService do
  describe "instance methods" do
    describe "#get_recipe(country)" do
      it "get recipe by random country no input by user" do

        country = "thailand"

        recipes = RecipeService.get_recipe(country)
        recipes.each do |hit|
          expect(hit).to be_a(Hash)
          expect(hit).to have_key(:uri)
          expect(hit[:uri]).to be_a(String)
          expect(hit).to have_key(:label)
          expect(hit[:label]).to be_a(String)
          expect(hit).to have_key(:image)
          expect(hit[:image]).to be_a(String)
        end
      end
    end
  end
end
