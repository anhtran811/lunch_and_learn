require 'rails_helper'

RSpec.describe VideoFacade do
  describe "#find_video" do
    it 'can return video poro for a country', :vcr do
      video = VideoFacade.get_video("Thailand") 

      expect(video).to be_a(Video)
    end 
  end
end