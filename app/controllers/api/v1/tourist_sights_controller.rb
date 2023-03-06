class Api::V1::TouristSightsController < ApplicationController
  def index
    capital = CountryFacade.get_capital(params[:country])
    render json: TouristSightsSerializer.new(TouristSightsFacade.tourist_sights(capital.name, capital.longitude, capital.latitude))
  end
end