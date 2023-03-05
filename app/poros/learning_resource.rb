class LearningResource
  attr_reader :country,
              :video

  def initialize(country, video)
    @country = country
    @video = video
  end
end