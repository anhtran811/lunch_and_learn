require 'rails_helper'

describe 'GET /recipes' do
  context 'when the country is inputted' do
    it 'can return a response with recipes from that country' do
      country = "thailand"
      get "/api/v1/recipes?country=#{country}"

      expect(response).to be_successful

      country_response = JSON.parse(response.body, symbolize_names: true)

      expect(response).to be_successful

      expect(country_response).to be_a(Hash)

      expect(country_response).to have_key(:data)
      expect(country_response[:data]).to be_an(Array)

      data = country_response[:data][0]

      expect(data).to have_key(:id)
      expect(data[:id]).to be_nil
      
      expect(data).to have_key(:type)
      expect(data[:type]).to eq("recipe")

      expect(data).to have_key(:attributes)
      expect(data[:attributes]).to be_a(Hash)

      expect(data[:attributes]).to have_key(:title)
      expect(data[:attributes][:title]).to be_a(String)

      expect(data[:attributes]).to have_key(:url)
      expect(data[:attributes][:url]).to be_a(String)

      expect(data[:attributes]).to have_key(:country)
      expect(data[:attributes][:country]).to be_a(String)

      expect(data[:attributes]).to have_key(:image)
      expect(data[:attributes][:image]).to be_a(String)

      expect(data[:attributes]).to_not have_key(:uri)
      expect(data[:attributes]).to_not have_key(:source)
      expect(data[:attributes]).to_not have_key(:healthLabels)
    end
  end
end