require "rails_helper"

describe AirQualityService do
  describe "instance methods" do
    describe "#get_air_quailty(country)" do
      it "get recipe by country" do
        country = "United States"

        aq = AirQualityService.new.get_air_quality(country)

        expect(aq).to be_a(Hash)
        expect(aq).to have_key(:CO)
        expect(aq[:CO][:concentration]).to be_a(Float)
        
        
        expect(aq).to have_key(:"PM2.5")
        expect(aq[:"PM2.5"][:concentration]).to be_a(Float)
        
        expect(aq).to have_key(:overall_aqi)
        expect(aq[:overall_aqi]).to be_a(Integer)
      end
    end
  end
end