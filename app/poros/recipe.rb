class Recipe
  attr_reader :country,
              :title,
              :url,
              :image

  def initialize(country, attributes)
    @country = country.capitalize
    @title = attributes[:label]
    @url = attributes[:url]
    @image = attributes[:image]
  end
end