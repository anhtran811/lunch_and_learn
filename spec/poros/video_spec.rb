require 'rails_helper'

RSpec.describe Video do
  it 'exists and has attributes', :vcr do
    country = "Thailand"
    video_info = VideoFacade.get_video(country)

    expect(video_info.title).to eq('A Super Quick History of Laos')
    expect(video_info.youtube_video_id).to eq('uw8hjVqxMXw')
  end
end