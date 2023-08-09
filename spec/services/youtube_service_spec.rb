require "rails_helper"

describe YoutubeService do
  describe "class methods" do
    describe "#get_data_by_country(country, channel_id)" do
      it "get recipe by country", :vcr do
        country = "laos"
        

        service = YoutubeService.get_data_by_country(country)
        videos = service[:items].first
        
        expect(videos).to be_a(Hash)
        
        expect(videos[:id]).to have_key(:videoId)
        expect(videos[:id][:videoId]).to be_a(String)
        
        expect(videos[:snippet]).to have_key(:title)
        expect(videos[:snippet][:title]).to be_a(String)        
      end
    end
  end
end