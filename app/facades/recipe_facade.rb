class RecipeFacade
  def self.country_recipe(country)
    recipes = RecipesService.get_recipes_by_country(country)
    recipes[:hits].map do |recipe|
      Recipe.new(country, recipe[:recipe])
    end
  end
end