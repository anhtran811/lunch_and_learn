class CountriesService

  def self.get_random_country
    response = conn.get("/v3.1/all?fields=name")
    JSON.parse(response.body, symbolize_names: true).sample
  end
  
  def self.get_country_capital(country)
    response = conn.get("/v3.1/name/#{country}")
    JSON.parse(response.body, symbolize_names: true)[0]
  end

private

  def self.conn 
    Faraday.new("https://restcountries.com")
  end
end