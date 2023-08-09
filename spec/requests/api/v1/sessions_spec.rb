require 'rails_helper'

RSpec.describe "Api::V1::Sessions", type: :request do
  describe "POST /api/v1/sessions" do
    it "returns user data and API key if user is successful login" do
      user = User.create(name: "jim", email: "jim@example.com", password: "password", password_confirmation: "password")

      login = {
        email: user.email,
        password: "password"
      }

      post "/api/v1/sessions", params: login

      expect(response).to be_successful
      expect(response.status).to eq(201)

      body = JSON.parse(response.body, symbolize_names: true)
      
      expect(body).to be_a(Hash)
      expect(body).to have_key(:data)

      expect(body[:data].keys).to include(:id, :type, :attributes)

      expect(body[:data][:id]).to be_a(String)
      expect(body[:data][:type]).to be_a(String)
      expect(body[:data][:attributes]).to be_a(Hash)
      
      expect(body[:data][:attributes].keys).to include(:name, :email, :api_key)
      expect(body[:data][:attributes]).to be_a(Hash)
      expect(body[:data][:attributes][:name]).to be_a(String)
      expect(body[:data][:attributes][:email]).to be_a(String)
      expect(body[:data][:attributes][:api_key]).to be_a(String)
    end
  end

  describe "sad paths" do
    it "returns an error if the passwords don't match" do
      user = User.create(name: "jim", email: "jim@example.com", password: "password", password_confirmation: "password")

      login = {
        email: user.email,
        password: "email"
      }

      post "/api/v1/sessions", params: login

      expect(response).to_not be_successful
      expect(response.status).to eq(401)

      body = JSON.parse(response.body, symbolize_names: true)

      expect(body).to be_a(Hash)
      expect(body).to have_key(:errors)
      expect(body[:errors]).to eq(["Invalid credentials"])
    end
  end
end
