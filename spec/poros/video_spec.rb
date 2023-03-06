require 'rails_helper'

RSpec.describe Video do
  it 'exists and has attributes', :vcr do
    country = "Thailand"
    video_info = VideoFacade.get_video(country)

    attributes = {
      id: { videoId: "uw8hjVqxMXw" },
      snippet: { title: "A Super Quick History of Laos" }
    }

    video = Video.new(attributes)

    expect(video.title).to eq('A Super Quick History of Laos')
    expect(video.youtube_video_id).to eq('uw8hjVqxMXw')
  end
end