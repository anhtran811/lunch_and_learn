class LearningResourcesFacade

  def self.country_resources(country)
    video = VideoFacade.get_video(country)
    LearningResource.new(country, video)
  end
end