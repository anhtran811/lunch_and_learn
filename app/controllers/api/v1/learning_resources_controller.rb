class Api::V1::LearningResourcesController < ApplicationController
  def index
    if params[:country]
      render json: LearningResourcesSerializer.new(LearningResourcesFacade.country_resources(params[:country]))
    else

    end
  end
end