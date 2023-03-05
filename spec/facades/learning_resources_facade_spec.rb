require 'rails_helper'

RSpec.describe LearningResourcesFacade do
  describe "#country_resources" do
    it 'can return a learning resource with country, video, and photos', :vcr do
      country = 'Thailand'
      response = LearningResourcesFacade.country_resources(country)

      expect(response).to be_a(LearningResource)
      expect(response.country).to eq('Thailand')
      expect(response.photos).to be_an(Array)
      expect(response.video).to be_an(Array)
      # expect(response.photos[0].url).to eq("bird's eye view of islands")
      # expect(response.photos[0].alt_tag).to eq("www.image-url.com")

      # response.video.each do |video_info|
      #   expect(video_info.title).to eq('A Super Quick History of Laos')
      #   expect(video_info.youtube_video_id).to eq('uw8hjVqxMXw')
      # end
    end
  end
end