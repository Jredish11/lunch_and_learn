require "rails_helper"

RSpec.describe AirQuality do
  describe "existance" do
    it "exits and has attributes" do
     
      country = "japan"

      aq = AirQualityFacade.air_quality(country)

      expect(aq).to be_a(AirQuality)
      expect(aq.id).to eq(nil)
      expect(aq.type).to eq("air_quality")
      expect(aq.aqi).to be_a(Integer)
      expect(aq.co_concentration).to be_a(Float)
      expect(aq.city).to be_a(String)
      expect(aq.pm25_concentration).to be_a(Float) 
    end
  end
end