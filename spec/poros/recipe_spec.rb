require 'rails_helper'

RSpec.describe Recipe do
  it 'exists and has attributes', :vcr do
    country = "Thailand"
    recipes = RecipeFacade.country_recipe(country)

    attributes = {
                  label: "Andy Ricker's Naam Cheuam Naam Taan Piip (Palm Sugar Simple Syrup)",
                  url: "www.recipe-url.com",
                  image: "www.image-url.com"
                }

    recipe = Recipe.new(country, attributes)

    expect(recipe.title).to eq("Andy Ricker's Naam Cheuam Naam Taan Piip (Palm Sugar Simple Syrup)")
    expect(recipe.url).to eq("www.recipe-url.com")
    expect(recipe.image).to eq("www.image-url.com")
    expect(recipe.country).to eq("Thailand")
  end
end