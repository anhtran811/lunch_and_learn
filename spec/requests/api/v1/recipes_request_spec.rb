require 'rails_helper'

describe 'GET /recipes' do
  context 'when the country is inputted' do
    it 'can return a response with recipes from that country', :vcr do
      country = "thailand"
      get "/api/v1/recipes?country=#{country}"

      expect(response).to be_successful

      recipe_response = JSON.parse(response.body, symbolize_names: true)

      expect(recipe_response).to be_a(Hash)

      expect(recipe_response).to have_key(:data)
      expect(recipe_response[:data]).to be_an(Array)

      data = recipe_response[:data][0]

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

  context 'if the country is not inputted by user' do
    it 'can return recipes for a random country', vcr: { record: :new_episodes } do
      get "/api/v1/recipes"

      expect(response).to be_successful

      recipe_response = JSON.parse(response.body, symbolize_names: true)
      expect(recipe_response).to be_a(Hash)

      expect(recipe_response).to have_key(:data)
      expect(recipe_response[:data]).to be_an(Array)

      data = recipe_response[:data][0]

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

  context 'sad path testing' do
    it 'returns an empty array if the user leaves the country parameter empty', :vcr do
      get "/api/v1/recipes?country="

      expect(response).to be_successful

      recipe_response = JSON.parse(response.body, symbolize_names: true)

      expect(recipe_response).to have_key(:data)
      expect(recipe_response[:data]).to eq([])
    end
  
    it 'returns an empty array if the user inputs a country that does not exist', :vcr do
      get "/api/v1/recipes?country=thiscountryisfake"
    
      expect(response).to be_successful
    
      recipe_response = JSON.parse(response.body, symbolize_names: true)
    
      expect(recipe_response).to have_key(:data)
      expect(recipe_response[:data]).to eq([])
    end
  
    it 'returns an empty array if the user inputs an empty string as a country', :vcr do
      get "/api/v1/recipes?country="" "
    
      expect(response).to be_successful
    
      recipe_response = JSON.parse(response.body, symbolize_names: true)
    
      expect(recipe_response).to have_key(:data)
      expect(recipe_response[:data]).to eq([])
    end
  end
end