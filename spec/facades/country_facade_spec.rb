require 'rails_helper'

RSpec.describe CountryFacade do
  describe "#random_country" do
    it 'can return a random country name poro', :vcr do
      country = CountryFacade.random_country

      expect(country).to be_a(Country)
    end
  end
end