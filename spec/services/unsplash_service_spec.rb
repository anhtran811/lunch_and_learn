require 'rails_helper'

RSpec.describe UnsplashService do
  describe "#get_photos_by_country" do
    it 'can return photos based off country', :vcr do
      country = "Thailand"
      photos_info = UnsplashService.get_photos_by_country(country)

      expect(photos_info).to be_an(Array)
      
      expect(photos_info[0]).to have_key(:alt_description)
      expect(photos_info[0][:alt_description]).to be_a(String)
      
      expect(photos_info[0]).to have_key(:urls)
      expect(photos_info[0][:urls][:regular]).to be_a(String)

    end
  end
end