class GeoapifyService
  def self.get_tourist_sights(capital, long, lat)
    response = conn.get("/v2/places?categories=tourism.sights&filter=circle:#{long},#{lat},2000&bias=proximity:#{long},#{lat}&apiKey=#{ENV['GEOAPIFY_API_KEY']}")
    JSON.parse(response.body, symbolize_names: true)
  end

  private

  def self.conn
    Faraday.new(
      url: "https://api.geoapify.com",
      params: { apiKey: ENV['GEOAPIFY_API_KEY']}
    )
  end
end