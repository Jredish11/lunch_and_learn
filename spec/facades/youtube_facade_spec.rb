require "rails_helper"

RSpec.describe YoutubeFacade do
  describe "instance methods" do
    describe "#videos" do
      it "pulls up videos based on a country input", :vcr do
        country = "laos"

        videos = YoutubeFacade.new(country).videos
        require 'pry'; binding.pry

      end
    end
  end
end