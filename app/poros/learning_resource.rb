class LearningResource
  attr_reader :country,
              :video,
              :photos

  def initialize(country, video, photos)
    @country = country
    @video = video
    @photos = photos
  end
end