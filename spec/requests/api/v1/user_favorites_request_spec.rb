require 'rails_helper'

describe 'GET /favorites?api_key' do
  context 'when the api key exists' do
    it "returns a user's favorite recipes" do
      user = create(:user)
      favorites = create_list(:favorite, 5, user_id: user.id)

      get "/api/v1/favorites?api_key=#{user.api_key}" 

      expect(response).to be_successful

      favorites_response = JSON.parse(response.body, symbolize_names: true)

      expect(favorites_response).to be_a(Hash)
      expect(favorites_response).to have_key(:data)
      expect(favorites_response[:data]).to be_an(Array)

      data = favorites_response[:data][0]

      expect(data).to have_key(:id)
      expect(data[:id]).to_not be_nil
      
      expect(data).to have_key(:type)
      expect(data[:type]).to eq("favorites")

      expect(data).to have_key(:attributes)
      expect(data[:attributes]).to be_a(Hash)

      expect(data[:attributes]).to have_key(:recipe_title)
      expect(data[:attributes][:recipe_title]).to be_a(String)

      expect(data[:attributes]).to have_key(:recipe_link)
      expect(data[:attributes][:recipe_link]).to be_a(String)

      expect(data[:attributes]).to have_key(:country)
      expect(data[:attributes][:country]).to be_a(String)

      expect(data[:attributes]).to have_key(:created_at)
      expect(data[:attributes][:created_at]).to be_a(String)
    end

    it "returns an empty array if the user does not have favorites" do
      user = create(:user)
      
      get "/api/v1/favorites?api_key=#{user.api_key}" 

      expect(response).to be_successful

      favorites_response = JSON.parse(response.body, symbolize_names: true)

      expect(favorites_response).to be_a(Hash)
      expect(favorites_response).to have_key(:data)
      expect(favorites_response[:data]).to be_an(Array)
      expect(favorites_response[:data]).to eq([])
    end
  end

  context "when the user's api key does not exist" do
    it 'returns an error message' do
      user = create(:user)
      
      get "/api/v1/favorites?api_key=12345" 

      expect(response).to_not be_successful
      expect(response.status).to eq(400)
      expect(response.body).to eq("{\"error\":\"Unable to find user\"}")
    end
  end
end