require "rails_helper"

RSpec.describe "Api::V1::Fetch_Favorites", type: :request do
  describe "GET /api/v1/fetch_favorites" do
    it "gets a list of a user's favorites" do
      user = create(:user)

      fav1 = create(:favorite, user_id: user.id)
      fav2 = create(:favorite, user_id: user.id)
      fav3 = create(:favorite, user_id: user.id)

      get "/api/v1/fetch_favorites", params: { api_key: user.api_key }

      body = JSON.parse(response.body, symbolize_names: true)
      require 'pry'; binding.pry
      expect(response.status).to eq(200)

    end
  end
end
    
