require 'rails_helper'

RSpec.describe Video do
  it 'exists and has attributes', :vcr do
    country = "Thailand"
    video_info = VideoFacade.get_video(country)

    video_info.each do |video| 
      expect(video.title).to eq('A Super Quick History of Laos')
      expect(video.youtube_video_id).to eq('uw8hjVqxMXw')
    end
  end
end