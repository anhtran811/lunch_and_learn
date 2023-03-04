class CountriesService

  def self.get_random_country
    response = conn.get("/v3.1/all?fields=name")
    JSON.parse(response.body, symbolize_names: true).sample
  end

private

  def self.conn 
    Faraday.new("https://restcountries.com")
  end
end