require 'rails_helper'

RSpec.describe "Api::V1::Users", type: :request do
  describe "Post api/v1/users" do
    let(:params) do 
      { 
        user: {
          name: "Gertie",
          email: "gertie@example.com",
          password: "password",
          password_confirmation: "password"
        }
      }
    end
    it "creates a new user" do
        post "/api/v1/users", params: params

        user_data = JSON.parse(response.body, symbolize_names: true)
        expect(response).to be_successful
      
    end
  end
end
