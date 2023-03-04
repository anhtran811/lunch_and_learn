require 'rails_helper'

RSpec.describe Country do
  it 'exists and has attributes', :vcr do
    country = CountryFacade.random_country

    
    expect(country.name).to be_a(String)
    expect(country).to be_a(Country)

    attributes = { 
                    common: 'Canada'
                  }

    country_attributes = Country.new(attributes)

    expect(country_attributes.name).to eq('Canada')
  end
end