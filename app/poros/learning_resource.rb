class LearningResource
  attr_reader :country,
              :video

  def initialize(country, video)
    @country = country
    @video = video_info(video)
  end

  def video_info(video)
    youtube_video = {
                      title: video[:snippet][:title],
                      youtube_vid_id: video[:id][:videoId]
                    }
  end
end