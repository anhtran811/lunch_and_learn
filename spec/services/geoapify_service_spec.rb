require 'rails_helper'

RSpec.describe GeoapifyService do
  describe "#get_tourist_sights" do
    it 'can return tourist sights based off capital city radius', :vcr do
      capital = "Paris"
      long = 2.33
      lat = 48.87

      tourist_search = GeoapifyService.get_tourist_sights(capital, long, lat)

      expect(tourist_search).to be_a(Hash)

      expect(tourist_search).to have_key(:features)
      expect(tourist_search[:features]).to be_an(Array)

      tourist_info = tourist_search[:features][0]

      expect(tourist_info).to have_key(:properties)
      expect(tourist_info[:properties]).to be_a(Hash)
  
      expect(tourist_info[:properties]).to have_key(:name)
      expect(tourist_info[:properties][:name]).to be_a(String)

      expect(tourist_info[:properties]).to have_key(:formatted)
      expect(tourist_info[:properties][:formatted]).to be_a(String)

      expect(tourist_info[:properties]).to have_key(:place_id)
      expect(tourist_info[:properties][:place_id]).to be_a(String)
    end
  end
end