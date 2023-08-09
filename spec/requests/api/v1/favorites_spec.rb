require 'rails_helper'

RSpec.describe "Api::V1::Favorites", type: :request do
  describe "POST /api/v1/favorites" do
    it "creates a new favorite" do
    user = create(:user)
      params = { 
        api_key: user.api_key, 
        country: "thailand",
        recipe_link: "https://www.tastingtable.com/recipe",
        recipe_title: "Crab Fried Rice (Khaao Pad Bpu)"
      }

      post "/api/v1/favorites", params: params


      body = JSON.parse(response.body, symbolize_names: true)
      expect(response).to be_successful
      expect(response.status).to eq(201)
      expect(body).to be_a(Hash)
      expect(body).to have_key(:success)

      expect(body[:success]).to eq("Favorite added successfully")
    end
  end

  describe "sad path" do
    it "returns error if api_key is invalid" do
      user = create(:user)
      params = { 
        api_key: "12345", 
        country: "thailand",
        recipe_link: "https://www.tastingtable.com/recipe",
        recipe_title: "Crab Fried Rice (Khaao Pad Bpu)"
      }

      post "/api/v1/favorites", params: params
      
      expect(response).to_not be_successful
      expect(response.status).to eq(400)
      
      body = JSON.parse(response.body, symbolize_names: true)
      
      expect(body).to be_a(Hash)
      expect(body).to have_key(:error)
      expect(body[:error]).to eq("Invalid api_key")
    end
  end
end





