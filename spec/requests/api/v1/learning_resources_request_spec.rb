require 'rails_helper'

describe 'GET /learning_resources' do
  context 'when the videos and photos return data' do
    it "can return the country's learning resources", :vcr do
      country = "thailand"
      get "/api/v1/learning_resources?country=#{country}"

      expect(response).to be_successful

      resources_response = JSON.parse(response.body, symbolize_names: true)

      expect(resources_response).to be_a(Hash)

      expect(resources_response).to have_key(:data)
      expect(resources_response[:data]).to be_an(Hash)
      expect(resources_response[:data]).to have_key(:id) 
      expect(resources_response[:id]).to be_nil

      expect(resources_response[:data]).to have_key(:type)  
      expect(resources_response[:data][:type]).to eq("learning_resources") 

      expect(resources_response[:data]).to have_key(:attributes)
      expect(resources_response[:data][:attributes]).to be_a(Hash)

      resources = resources_response[:data][:attributes]

      expect(resources).to have_key(:country)
      expect(resources[:country]).to be_a(String)

      expect(resources).to have_key(:video)
      expect(resources[:video]).to be_a(Hash)

      expect(resources).to have_key(:images)
      expect(resources[:images]).to be_an(Array)
    end
  end

  context 'when no photo or image is found' do
    xit 'returns an empty hash for video and empty array for images', vcr: { record: :new_episodes } do
      get "/api/v1/learning_resources?country=thisisfake"

      expect(response).to be_successful

      resources_response = JSON.parse(response.body, symbolize_names: true)

      expect(resources_response).to have_key(:data)
      expect(resources_response[:data]).to have_key(:type)
      expect(resources_response[:data][:type]).to eq("learning_resources") 
      expect(resources_response[:data]).to have_key(:attributes)
      expect(resources_response[:data][:attributes]).to have_key(:country)
      expect(resources_response[:data][:attributes][:country]).to eq("thisisfake")
      expect(resources_response[:data][:attributes][:video]).to eq({})
      expect(resources_response[:data][:attributes][:images]).to eq([])

    end
  end
end