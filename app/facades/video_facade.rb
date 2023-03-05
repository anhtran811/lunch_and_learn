class VideoFacade
  def self.get_video(country)
    video_info = YoutubeService.get_video_by_country(country)
    video_info[:items].map do |video|
      Video.new(video)
    end
  end
end