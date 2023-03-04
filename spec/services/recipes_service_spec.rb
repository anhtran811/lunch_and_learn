require 'rails_helper'

RSpec.describe RecipesService do
  describe '#get_recipes_by_country' do
    it 'can return recipes for a specified country' do
      recipes = RecipesService.get_recipes_by_country("Thailand")

      expect(recipes).to be_a(Hash)
      expect(recipes).to have_key(:hits)
      expect(recipes[:hits]).to be_an(Array)

      expect(recipes[:hits][0]).to have_key(:recipe)
      expect(recipes[:hits][0][:recipe]).to be_a(Hash)

      recipe_details = recipes[:hits][0][:recipe]

      expect(recipe_details).to have_key(:uri)
      expect(recipe_details[:url]).to be_a(String)
      
      expect(recipe_details).to have_key(:label)
      expect(recipe_details[:label]).to be_a(String)
      
      expect(recipe_details).to have_key(:image)
      expect(recipe_details[:image]).to be_a(String)
    end
  end
end