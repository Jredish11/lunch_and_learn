require "rails_helper"

describe AirQualityService do
  describe "instance methods" do
    describe "#get_air_quailty(country)" do
      it "get recipe by country" do
        country = "United States"

        aq = AirQualityService.new.get_air_quality(country)

        require 'pry'; binding.pry
      end
    end
  end
end