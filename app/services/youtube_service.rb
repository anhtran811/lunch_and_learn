class YoutubeService
  def self.get_video_by_country(country)
    response = conn.get("/youtube/v3/search?channelId=UCluQ5yInbeAkkeCndNnUhpw&part=snippet&maxResults=1&q=#{country}&key=#{ENV['YOUTUBE_API_KEY']}")
    JSON.parse(response.body, symbolize_names: true)
  end

  private 
  def self.conn
    Faraday.new(
      url: "https://www.googleapis.com",
      params: { key: ENV['YOUTUBE_API_KEY'] }
    )
  end
end