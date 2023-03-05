class UnsplashService
  def self.get_photos_by_country(country)
    response = conn.get("/photos/random/?query=#{country}&count=10&client_id=#{ENV['UNSPLASH_ACCESS_KEY']}")
    JSON.parse(response.body, symbolize_names: true)
  end

  private

  def self.conn
    Faraday.new(
      url: "https://api.unsplash.com",
      params: { client_id: ENV['UNSPLASH_ACCESS_KEY']}
    )
  end
end