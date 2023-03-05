require 'rails_helper'

RSpec.describe UnsplashService do
  describe "#get_photos_by_country" do
    it 'can return photos based off country' do
      country = "Thailand"
      photos_info = UnsplashService.get_photos_by_country(country)

      expect(photos_info).to be_an(Array)
      
      photos_info.each do |photo|
        expect(photo).to have_key(:alt_description)
        expect(photo[:alt_description]).to be_a(String)
        
        expect(photo).to have_key(:urls)
        expect(photo[:urls][:raw]).to be_a(String)
      end
    end
  end
end