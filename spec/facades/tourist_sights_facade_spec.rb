require 'rails_helper'

RSpec.describe TouristSightsFacade do
  it 'can return a poro with tourist sight information', :vcr do
    capital = "Paris"
    long = 2.33
    lat = 48.87

    tourist_sights = TouristSightsFacade.tourist_sights(capital, long, lat)

    expect(tourist_sights[0]).to be_a(TouristSight)
  end
end