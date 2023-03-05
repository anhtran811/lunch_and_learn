class VideoFacade
  def self.get_video(country)
    video_info = YoutubeService.get_video_by_country(country)
    if video_info
      Video.new(video_info[:items][0])
      # video_info[:items].map do |video|
      #   Video.new(video)
      # end
    else
      error = {}
      Video.new(error)
    end
  end
end