require "rails_helper"

RSpec.describe CountryFacade do
  describe "instance methods" do
    describe "#random_country" do
      it "takes the names of the list of countries and chooses a random country" do
        country = CountryFacade.random_country 

        expect(country).to be_a(String)
      end
    end
  end
end