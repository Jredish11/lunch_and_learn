require "rails_helper"

describe CountryService do
  describe "instance methods" do
    describe "#get_country" do
      it "returns all the countries names" do

        countries = CountryService.get_country

        countries.each do |country|
          expect(country).to be_a(Hash)
          expect(country).to have_key(:name)

          expect(country[:name]).to be_a(Hash)
          expect(country[:name]).to have_key(:common)

          expect(country[:name][:common]).to be_a(String)
        end
      end
    end
  end
end