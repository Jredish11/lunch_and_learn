require "rails_helper"

RSpec.describe "Api::V1::Fetch_Favorites", type: :request do
  describe "GET /api/v1/fetch_favorites" do
    it "gets a list of a user's favorites" do
      user = create(:user)

      fav1 = create(:favorite, user_id: user.id)
      fav2 = create(:favorite, user_id: user.id)
      fav3 = create(:favorite, user_id: user.id)

      get "/api/v1/favorites?api_key=#{user.api_key}"
      
      body = JSON.parse(response.body, symbolize_names: true)
 
      
      expect(body).to be_a(Hash)
      expect(body).to have_key(:data)
      expect(body[:data]).to be_a(Array)

      data = body[:data].first



      expect(data).to have_key(:id)
      expect(data[:id]).to be_a(String)
      expect(data).to have_key(:type)
      expect(data[:type]).to be_a(String)
      expect(data).to have_key(:attributes)
      expect(data[:attributes]).to be_a(Hash)

      expect(data[:attributes]).to have_key(:country)
      expect(data[:attributes][:country]).to be_a(String)
      expect(data[:attributes]).to have_key(:recipe_link)
      expect(data[:attributes][:recipe_link]).to be_a(String)
      expect(data[:attributes]).to have_key(:recipe_title)
      expect(data[:attributes][:recipe_title]).to be_a(String)
      expect(data[:attributes]).to have_key(:created_at)
      expect(data[:attributes][:created_at]).to be_a(String)
    end
  end

  describe "sad paths" do
    it "gets an error if the api key is invalid" do
      user = create(:user)

      fav1 = create(:favorite, user_id: user.id)
      fav2 = create(:favorite, user_id: user.id)
      fav3 = create(:favorite, user_id: user.id)

      get "/api/v1/favorites?api_key=asdkhjahsdk"

      expect(response).to_not be_successful
      expect(response.status).to eq(400)
      
      body = JSON.parse(response.body, symbolize_names: true)
      
      expect(body).to be_a(Hash)
      expect(body).to have_key(:error)
      expect(body[:error]).to eq("Invalid api_key")
    end
  end
end
    
