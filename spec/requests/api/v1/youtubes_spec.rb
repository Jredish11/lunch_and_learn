require 'rails_helper'

RSpec.describe "Api::V1::Youtubes", type: :request do
  describe "GET " do
    xit "returns http success" do
      country = "singapore"
      get "/api/v1/youtubes", params: { query: country }
      
      youtubes_data = JSON.parse(response.body, symbolize_names: true)
      expect(response).to be_successful
      expect(response.status).to eq(200)

      youtubes_data[:data].each do |yt|
        expect(youtubes_data[:data]).to be_a(Array)
        expect(yt).to be_a(Hash)
        
        expect(yt).to have_key(:id)
        expect(yt[:id]).to eq(nil)
        
        expect(yt).to have_key(:type)
        expect(yt[:type]).to be_a(String)
        
        expect(yt).to have_key(:attributes)
        expect(yt[:attributes]).to be_a(Hash)

        expect(yt[:attributes]).to have_key(:country)
        expect(yt[:attributes][:country]).to be_a(String)
        
        expect(yt[:attributes]).to have_key(:video)
        expect(yt[:attributes][:video]).to be_a(Hash)
        
        expect(yt[:attributes][:video]).to have_key(:title)
        expect(yt[:attributes][:video][:title]).to be_a(String)
        
        expect(yt[:attributes][:video]).to have_key(:youtube_video_id)
        expect(yt[:attributes][:video][:youtube_video_id]).to be_nil.or be_a(String)
        
                        
        expect(yt[:attributes]).to have_key(:images)
        expect(yt[:attributes][:images]).to be_a(Hash)
        
        # expect(yt[:attributes][:video][:images]).to have_key(:alt_tag)
        # expect(yt[:attributes][:video][:images][:alt_tag]).to eq(nil)

        # expect(yt[:attributes][:video][:images]).to have_key(:url)
        # expect(yt[:attributes][:video][:images][:url]).to be_a(String)
      end
    end
  end
end
