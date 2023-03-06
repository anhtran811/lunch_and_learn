class CountryFacade 
  def self.random_country
    random_country = CountriesService.get_random_country[:name]
    Country.new(random_country)
  end

  def self.get_capital(country)
    capital = CountriesService.get_country_capital(country)
    Capital.new(capital)
  end
end