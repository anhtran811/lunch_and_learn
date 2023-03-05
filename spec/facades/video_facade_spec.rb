require 'rails_helper'

RSpec.describe VideoFacade do
  describe "#find_video" do
    it 'can return video poro for a country' do
      video = VideoFacade.get_video("Thailand") 

      expect(video[0]).to be_a(Video)
    end 
  end
end