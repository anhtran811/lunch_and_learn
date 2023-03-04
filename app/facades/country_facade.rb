class CountryFacade 
  def self.random_country
    random_country = CountriesService.get_random_country[:name]
    Country.new(random_country)
  end
end