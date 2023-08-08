require "rails_helper"

RSpec.describe YoutubeFacade do
  describe "instance methods" do
    describe "#videos" do
      xit "pulls up videos based on a country input", :vcr do
        country = "laos"

        videos = YoutubeFacade.new(country).videos
        expect(videos.count).to eq(5)
        
        videos.each do |video|
          expect(video).to be_a(Youtube)
          expect(video.id).to eq(nil)
          expect(video.type).to eq("learning_resource")
          expect(video.title).to be_a(String)
          expect(video.country).to be_a(String)
          if video.youtube_video_id.nil?
            expect(video.youtube_video_id).to be_nil
          else
            expect(video.youtube_video_id).to be_a(String)
          end                  
        end
      end
    end
  end
end