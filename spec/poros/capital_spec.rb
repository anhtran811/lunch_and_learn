require 'rails_helper'

RSpec.describe Capital do
  it 'exists and has attributes', :vcr do
    country = "France"
    capital = CountryFacade.get_capital(country)

    expect(capital).to be_a(Capital)
    expect(capital.name).to be_a(String)
    expect(capital.longitude).to be_an(Float)
    expect(capital.latitude).to be_an(Float)

    attributes = { 
                    capital: ['Paris'],
                    capitalInfo: 
                    {
                      "latlng": 
                        [
                          48.87,
                          2.33
                        ]
                    }
                  }

   capital_attributes = Capital.new(attributes)

    expect(capital_attributes.name).to eq('Paris')
    expect(capital_attributes.longitude).to eq(2.33)
    expect(capital_attributes.latitude).to eq(48.87)
  end
end