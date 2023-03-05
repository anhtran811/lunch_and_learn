class LearningResourcesFacade
  def self.country_resources(country)
    video_info = YoutubeService.get_video_by_country(country)[:items][0]
    LearningResource.new(country, video_info)
  end
end