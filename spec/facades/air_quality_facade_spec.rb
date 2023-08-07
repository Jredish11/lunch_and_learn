require "rails_helper"

RSpec.describe AirQualityFacade do
  describe "class methods" do
    describe "#air_quality(country)" do
      it "pulls up air quality for an inputed country name" do
        country = "Nigeria"

        aq = AirQualityFacade.air_quality(country)

        expect(aq).to be_a(AirQuality)
        expect(aq.aqi).to be_a(Integer)
        expect(aq.co_concentration).to be_a(Float)
        expect(aq.city).to be_a(String)
        expect(aq.pm25_concentration).to be_a(Float)        
      end
    end
  end
end