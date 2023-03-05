require 'rails_helper'

RSpec.describe LearningResourcesFacade do
  describe "#country_resources" do
    it 'can return a video poro' do
      country = 'Thailand'
      response = LearningResourcesFacade.country_resources(country)

      expect(response).to be_a(LearningResource)
      expect(response.country).to eq('Thailand')

      response.video.each do |video_info|
        expect(video_info.title).to eq('A Super Quick History of Laos')
        expect(video_info.youtube_video_id).to eq('uw8hjVqxMXw')
      end
    end
  end
end