require 'rails_helper'

RSpec.describe TouristSight do
  it 'exists and has attributes', :vcr do
    capital = "Paris"
    long = 2.33
    lat = 48.87

    tourist_sights = TouristSightsFacade.tourist_sights(capital, long, lat)

    expect(tourist_sights[0]).to be_a(TouristSight)
    expect(tourist_sights).to be_an(Array)

    attributes = { 
                    properties: 
                              {
                                name: "Crédit Foncier de France",
                                formatted: "Crédit Foncier de France, Rue des Capucines, Paris, France",
                                place_id: "1235rgn93tq34i"
                            }
                  }

    sight = TouristSight.new(attributes)

    expect(sight.name).to eq("Crédit Foncier de France")
    expect(sight.address).to eq("Crédit Foncier de France, Rue des Capucines, Paris, France")
    expect(sight.place_id).to eq("1235rgn93tq34i")
  end
end