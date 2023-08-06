require "rails_helper"

describe RecipeService do
  describe "instance methods" do
    describe "#get_recipe(country)" do
      it "get recipe by random country no input by user" do

        country = CountryFacade.random_country

        recipes = RecipeService.get_recipe(country)
        recipes[:hits].each do |hit|
          expect(hit).to be_a(Hash)
          expect(hit).to have_key(:recipe)
          expect(hit[:recipe]).to be_a(Hash)
          expect(hit[:recipe]).to have_key(:uri)
          expect(hit[:recipe][:uri]).to be_a(String)
          expect(hit[:recipe]).to have_key(:label)
          expect(hit[:recipe][:label]).to be_a(String)
          expect(hit[:recipe]).to have_key(:image)
          expect(hit[:recipe][:image]).to be_a(String)
        end
      end
    end
  end
end
