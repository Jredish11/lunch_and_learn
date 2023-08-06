require "rails_helper"

describe  do
  describe "instance methods" do
    describe "#get_recipe" do
      it "returns recipes based on search query params" do
        params = {
          q: CountryFacade.random_country
        } 

      end
    end
  end
end