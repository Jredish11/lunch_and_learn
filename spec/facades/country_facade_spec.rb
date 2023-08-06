require "rails_helper"

RSpec.describe CountryFacade do
  describe "instance methods" do
    describe "#random_country" do
      it "takes the names of the list of countries and chooses a random country" do
        country = CountryFacade.random_country 
      end
    end
  end
end