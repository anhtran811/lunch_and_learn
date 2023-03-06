require 'rails_helper'

RSpec.describe TouristSight do
  it 'exists and has attributes', :vcr do
    capital = "Paris"
    long = 2.33
    lat = 48.87

    tourist_sights = TouristSightsFacade.tourist_sights(capital, long, lat)

    expect(tourist_sights[0]).to be_a(TouristSight)
    expect(tourist_sights).to be_an(Array)

    expect(tourist_sights[0].name).to eq("Crédit Foncier de France")
    expect(tourist_sights[0].formatted_address).to eq("Crédit Foncier de France, Rue des Capucines, Paris, France")
    expect(tourist_sights[0].place_id).to eq("51d03648d27fa0024059d4741e11536f4840f00103f9013aa86933010000009203194372c3a964697420466f6e63696572206465204672616e6365")
  end
end