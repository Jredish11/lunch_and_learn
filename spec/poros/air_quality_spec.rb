require "rails_helper"

RSpec.describe AirQuality do
  describe "existance" do
    it "exits and has attributes" do
     
      country = "mexico"

      aq = AirQualityFacade.air_quality(country)

    end
  end
end