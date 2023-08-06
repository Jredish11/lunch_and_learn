require "rails_helper"

describe  do
  describe "instance methods" do
    describe "#get_recipe" do
      it "returns recipes based on search query params" do
        country = "mexico"

        get "/api/v1/recipes", params: { country: country }

        recipes_data = JSON.parse(response.body, symbolize_names: true)
        expect(response).to be_successful
        expect(response.status).to eq(200)
        recipes_data.each do |recipes|
          
          expect(recipes).to be_a(Hash)
          expect(recipes).to have_key(:data)
          expect(recipes[:data]).to be_a(Hash)

          expect(recipes[:data]).to have_key(:id)
          expect(recipes[:data][:id]).to eq(nil)
          
          expect(recipes[:data]).to have_key(:type)
          expect(recipes[:data][:type]).to eq("recipe")
          
          expect(recipes[:data]).to have_key(:attributes)
          expect(recipes[:data][:attributes]).to be_a(Hash)
          
          expect(recipes[:data][:attributes]).to have_key(:title)
          expect(recipes[:data][:attributes][:title]).to be_a(String)
          
          expect(recipes[:data][:attributes]).to have_key(:url)
          expect(recipes[:data][:attributes][:url]).to be_a(String)

          expect(recipes[:data][:attributes]).to have_key(:country)
          expect(recipes[:data][:attributes][:country]).to be_a(String)

          expect(recipes[:data][:attributes]).to have_key(:image)
          expect(recipes[:data][:attributes][:image]).to be_a(String)

          expect(recipes[:data][:attributes]).not_to have_key(:image_url)
          expect(recipes[:data][:attributes]).not_to have_key(:name)
        end
      end

      it "returns empty array if country parameter is empty string" do
        country = ""
  
        get "/api/v1/recipes", params: { country: country }
  
        recipes_data = JSON.parse(response.body, symbolize_names: true)
        expect(response).to be_successful
        expect(response.status).to eq(200)
  
        expect(recipes_data[:data]).to be_a(Array)
      end
      
      it "returns empty array if value doesn't return recipes" do
        country = "Sammy Sosa"
  
        get "/api/v1/recipes", params: { country: country }
  
        recipes_data = JSON.parse(response.body, symbolize_names: true)
        expect(response).to be_successful
        expect(response.status).to eq(200)
  
        expect(recipes_data[:data]).to be_a(Array)
      end
    end
  end
end