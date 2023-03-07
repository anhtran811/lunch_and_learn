class VideoFacade
  def self.get_video(country)
    video_info = YoutubeService.get_video_by_country(country)
    if video_info[:items].empty?
      return {}
    else
      Video.new(video_info[:items][0])
    end
  end
end