require 'rails_helper'

RSpec.describe "Api::V1::Favorites", type: :request do
  describe "POST /api/v1/favorites" do
    it "creates a new favorite" do
      user = User.create(name: "jim", email: "jim@example.com", password: "password", password_confirmation: "password", api_key: "klkdi33hy48thw9begh98h4539h4")

      params = { 
        api_key: "klkdi33hy48thw9berd98h4539h4",
        country: "thailand",
        recipe_link: "https://www.tastingtable.com/recipe",
        recipe_title: "Crab Fried Rice (Khaao Pad Bpu)"
      }

      post "/api/v1/favorites", params: params

      expect(response).to be_successful
      expect(response.status).to eq(201)
      
      body = JSON.parse(response.body, symbolize_names: true)
    end
  end
end





