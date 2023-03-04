require 'rails_helper' 

RSpec.describe CountriesService do
  describe "#get_random_country" do
    it 'can return a random country' do
      countries_search = CountriesService.get_random_country

      expect(countries_search).to be_an(Hash)

      expect(countries_search).to have_key(:name)
      expect(countries_search[:name]).to have_key(:common)
      expect(countries_search[:name][:common]).to be_a(String)
    end
  end
end