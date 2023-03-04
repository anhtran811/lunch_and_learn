class RecipesService

def self.get_recipes_by_country(country)
  response = conn.get("/api/recipes/v2?type=public&q=#{country}&app_id=#{ENV['EDAMAM_APP_ID']}&app_key=#{ENV['EDAMAM_APP_KEY']}")
  JSON.parse(response.body, symbolize_names: true)
end

private
  def self.conn
    Faraday.new("https://api.edamam.com")
  end
end