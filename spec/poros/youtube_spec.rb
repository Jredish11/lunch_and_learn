require "rails_helper"

RSpec.describe Youtube do
  describe "existance" do
    it "exits and has attributes" do
      country = "laos"

      video = YoutubeFacade.new(country).videos.first


      expect(video.country).to be_a(String)
      expect(video.id).to eq(nil)
      expect(video.type).to eq("learning_resource")
      expect(video.title).to be_a(String)
      expect(video.youtube_video_id).to be_a(String)
    end
  end
end