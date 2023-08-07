require "rails_helper"

RSpec.describe CountryFacade do
  describe "instance methods" do
    describe "#random_country" do
      it "takes the names of the list of countries and chooses a random country" do
        country = CountryFacade.random_country 

        expect(country).to be_a(String)
      end
    end

    describe "#get_capital" do
      it "take the name of a country and gets the capital" do
        country = "Cuba"
        cap = CountryFacade.get_capital(country)

        expect(cap).to be_a(String)
        expect(cap).to eq("Havana")
      end
      
      it "take the name of another country and gets the capital" do
        country = "France"
        cap = CountryFacade.get_capital(country)

        expect(cap).to be_a(String)
        expect(cap).to eq("Paris")
        expect(cap).to_not eq("Havana")

        country2 = "Nigeria"
        cap2 = CountryFacade.get_capital(country2)

        expect(cap2).to be_a(String)
        expect(cap2).to eq("Abuja")
        expect(cap2).to_not eq("Cairo")
      end
    end
  end
end