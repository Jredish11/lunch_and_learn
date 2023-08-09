require 'rails_helper'

RSpec.describe "Api::V1::Users", type: :request do
  describe "Post api/v1/users" do

    it "creates a new user" do
      params = {
          name: "Gertie",
          email: "gertie@example.com",
          password: "password",
          password_confirmation: "password"
        }
          post "/api/v1/users", params: params

          user_data = JSON.parse(response.body, symbolize_names: true)

        expect(response).to be_successful
        expect(response.status).to eq(201)

        expect(user_data).to be_a(Hash)
        expect(user_data).to have_key(:data)
        
        expect(user_data[:data]).to have_key(:id)
        expect(user_data[:data][:id]).to be_a(String)
        
        expect(user_data[:data]).to have_key(:type)
        expect(user_data[:data][:type]).to be_a(String)
        
        expect(user_data[:data]).to have_key(:attributes)
        expect(user_data[:data][:attributes]).to be_a(Hash)
        expect(user_data[:data][:attributes]).to have_key(:name)
        expect(user_data[:data][:attributes][:name]).to be_a(String)
        expect(user_data[:data][:attributes]).to have_key(:email)
        expect(user_data[:data][:attributes][:email]).to be_a(String)
        expect(user_data[:data][:attributes]).to_not have_key(:password_digest)
        expect(user_data[:data][:attributes]).to have_key(:api_key)
        expect(user_data[:data][:attributes][:api_key]).to be_a(String)
    end
  end

  describe "sad paths" do
    it "returns an error if the passwords don't match" do
        params = {
            name: "Gertie",
            email: "gertie@example.com",
            password: "password",
            password_confirmation: "password1"
          }
            post "/api/v1/users", params: params

            expect(response).to_not be_successful
            expect(response.status).to eq(422)

            error_body = JSON.parse(response.body, symbolize_names: true)
            expect(error_body).to be_a(Hash)
            expect(error_body).to have_key(:errors)
            expect(error_body[:errors]).to eq(["Password confirmation doesn't match Password"])
    end

    it "returns an error if the email exists already" do
      params1 = {
        name: "Gertie",
        email: "gertie@example.com",
        password: "password",
        password_confirmation: "password"
      }

      post "/api/v1/users", params: params1
      params2 = {
        name: "Gertrude",
        email: "gertie@example.com",
        password: "woo",
        password_confirmation: "woo"
      }
      
      post "/api/v1/users", params: params2 

      expect(response).to_not be_successful
      error_body = JSON.parse(response.body, symbolize_names: true)
      expect(error_body).to be_a(Hash)
      expect(error_body).to have_key(:errors)
      expect(error_body[:errors]).to eq(["Email has already been taken"])
    end
  end
end
