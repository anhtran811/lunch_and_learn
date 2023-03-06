require 'rails_helper'

RSpec.describe YoutubeService do
  describe "#get_video_by_country" do
    it 'returns a video based off country', :vcr do
      country = 'thailand'
      video_info = YoutubeService.get_video_by_country(country)

      expect(video_info).to be_a(Hash)
      expect(video_info).to have_key(:kind)
      expect(video_info[:kind]).to be_a(String)

      expect(video_info).to have_key(:items)
      expect(video_info[:items]).to be_an(Array)
      
     video_info[:items].each do |video|
        expect(video).to have_key(:kind)
        expect(video).to have_key(:id)

        expect(video[:id]).to have_key(:videoId)
        expect(video[:id][:videoId]).to be_a(String)

        expect(video[:snippet]).to have_key(:title)
        expect(video[:snippet][:title]).to be_a(String)
      end
    end
  end
end