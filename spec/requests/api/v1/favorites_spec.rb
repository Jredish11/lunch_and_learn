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
      
    end
  end
end





