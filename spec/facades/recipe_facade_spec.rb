require 'rails_helper'

RSpec.describe RecipeFacade do
  describe "#country_recipe" do
    it 'can return a recipe poro for a country', :vcr do
      recipe = RecipeFacade.country_recipe("Thailand") 

      expect(recipe[0]).to be_a(Recipe)
    end 
  end
end