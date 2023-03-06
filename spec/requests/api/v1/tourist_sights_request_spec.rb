require 'rails_helper'

describe 'GET /tourist_sights' do
  it "can return tourist sights based off a country's capital city", :vcr do
    country = "France"

    get "/api/v1/tourist_sights?country=#{country}"

    expect(response).to be_successful

    tourist_response = JSON.parse(response.body, symbolize_names: true)

    expect(tourist_response).to be_a(Hash)

    expect(tourist_response).to have_key(:data)
    expect(tourist_response[:data]).to be_an(Array)

    tourist_data = tourist_response[:data][0]

    expect(tourist_data).to have_key(:id)
    expect(tourist_data[:data]).to be_nil

    expect(tourist_data).to have_key(:type)
    expect(tourist_data[:type]).to eq("tourist_sights")

    expect(tourist_data).to have_key(:attributes)
    expect(tourist_data[:attributes]).to be_a(Hash)

    expect(tourist_data[:attributes]).to have_key(:name)
    expect(tourist_data[:attributes][:name]).to be_a(String)

    expect(tourist_data[:attributes]).to have_key(:address)
    expect(tourist_data[:attributes][:address]).to be_a(String)

    expect(tourist_data[:attributes]).to have_key(:place_id)
    expect(tourist_data[:attributes][:place_id]).to be_a(String)    
  end
end