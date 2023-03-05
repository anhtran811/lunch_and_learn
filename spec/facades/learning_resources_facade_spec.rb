require 'rails_helper'

RSpec.describe LearningResourcesFacade do
  describe "#country_resources" do
    it 'can return a learning resource with country, video, and photos', :vcr do
      country = 'Thailand'
      response = LearningResourcesFacade.country_resources(country)

      expect(response).to be_a(LearningResource)
      expect(response.country).to eq('Thailand')
      expect(response.images).to be_an(Array)
      expect(response.video).to be_an(Hash)
    end
  end
end