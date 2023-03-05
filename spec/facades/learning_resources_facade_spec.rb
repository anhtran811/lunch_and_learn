require 'rails_helper'

RSpec.describe LearningResourcesFacade do
  describe "#country_resources" do
    it 'can return a video poro' do
      country = 'Thailand'
      response = LearningResourcesFacade.country_resources(country)

      expect(response).to be_a(LearningResource)
      expect(country).to eq('Thailand')
    end
  end
end