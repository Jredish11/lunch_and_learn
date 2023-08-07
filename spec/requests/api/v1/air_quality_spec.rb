require 'rails_helper'

RSpec.describe "Air Quality API", type: :request do
  describe "GET /api/v1/air_quality" do
    it "returns air quality information for inputed country" do
      country = "Spain"

      get "/api/v1/air_quality", params: { country: country }

      aq_data = JSON.parse(response.body, symbolize_names: true)
      expect(response).to be_successful
      expect(response.status).to eq(200)
      require 'pry'; binding.pry
    end
    
  end
end
