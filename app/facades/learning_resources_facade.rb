class LearningResourcesFacade
  def self.country_resources(country)
    video = VideoFacade.get_video(country)
    photos = PhotoFacade.get_photos(country)
    LearningResource.new(country, video, photos)
  end
end