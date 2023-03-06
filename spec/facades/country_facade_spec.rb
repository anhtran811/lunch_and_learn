require 'rails_helper'

RSpec.describe CountryFacade do
  describe "#random_country" do
    it 'can return a random country name poro', :vcr do
      country = CountryFacade.random_country

      expect(country).to be_a(Country)
    end
  end

  describe "#country_capital" do
    it 'can return a poro with capital information', :vcr do
      country = "France"

      capital = CountryFacade.get_capital(country)

      expect(capital).to be_a(Capital)
    end
  end
end