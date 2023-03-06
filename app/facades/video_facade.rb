class VideoFacade
  def self.get_video(country)
    video_info = YoutubeService.get_video_by_country(country)
    if !video_info[:items].empty?
      Video.new(video_info[:items][0])
    else
      error = {}
      return error
    end
  end
end