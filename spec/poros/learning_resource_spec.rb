require 'rails_helper'

RSpec.describe LearningResource do
  it 'exists and has attributes' do
    country = "Thailand"

    video = {
              id: { videoId: "uw8hjVqxMXw" },
              snippet: { title: "A Super Quick History of Laos" }
            }

    video_resource = LearningResource.new(country, video)

    expect(video_resource).to be_a(LearningResource)
    expect(video_resource.video).to be_a(Hash)
    expect(video_resource.video).to eq(({  
                                          title: "A Super Quick History of Laos", 
                                          youtube_vid_id: "uw8hjVqxMXw" 
                                        }))
  end

  describe "#video_info" do
    it 'can return a hash of video info' do
      country = "Thailand"

      video = {
                id: { videoId: "uw8hjVqxMXw" },
                snippet: { title: "A Super Quick History of Laos" }
              }

      video_resource = LearningResource.new(country, video)
      
      expect(video_resource.video_info(video)).to be_a(Hash)
      expect(video_resource.video_info(video)).to eq({  
                                                      title: "A Super Quick History of Laos", 
                                                      youtube_vid_id: "uw8hjVqxMXw" 
                                                      })
    end
  end
end