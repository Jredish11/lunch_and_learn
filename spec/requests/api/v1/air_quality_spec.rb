require 'rails_helper'

RSpec.describe "Air Quality API", type: :request do
  describe "GET /api/v1/air_quality" do
    it "returns air quality information for inputed country" do
      country = "France"

      get "/api/v1/air_quality", params: { country: country }

      aq_data = JSON.parse(response.body, symbolize_names: true)
      require 'pry'; binding.pry
      expect(response).to be_successful
      expect(response.status).to eq(200)

      expect(aq_data).to be_a(Hash)

      expect(aq_data).to have_key(:data)
      expect(aq_data[:data]).to be_a(Hash)

      expect(aq_data[:data]).to have_key(:id)
      expect(aq_data[:data][:id]).to be_a(NilClass)
      
      expect(aq_data[:data]).to have_key(:type)
      expect(aq_data[:data][:type]).to be_a(String)
      
      expect(aq_data[:data]).to have_key(:attributes)
      expect(aq_data[:data][:attributes]).to be_a(Hash)
      
      expect(aq_data[:data][:attributes]).to have_key(:city)
      expect(aq_data[:data][:attributes][:city]).to be_a(String)
      
      expect(aq_data[:data][:attributes]).to have_key(:aqi)
      expect(aq_data[:data][:attributes][:aqi]).to be_a(Integer)
      
      expect(aq_data[:data][:attributes]).to have_key(:pm25_concentration)
      expect(aq_data[:data][:attributes][:pm25_concentration]).to be_a(Float)
      
      expect(aq_data[:data][:attributes]).to have_key(:co_concentration)
      expect(aq_data[:data][:attributes][:co_concentration]).to be_a(Float)
    end
  end
end
