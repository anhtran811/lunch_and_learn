class LearningResourcesFacade
  def self.country_resources(country)
    video = YoutubeService.get_video_by_country(country)[:items][0]
    photos = UnsplashService.get_photos_by_country(country)
    LearningResource.new(country, video, photos)
  end
end