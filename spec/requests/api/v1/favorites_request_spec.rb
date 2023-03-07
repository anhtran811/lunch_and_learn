require 'rails_helper'

describe 'POST /favorites' do
  context 'when a favorite recipe is successfully added' do
    it 'can create a favorite recipe' do
      user = create(:user)

      favorite_params = ({
                          api_key: user.api_key,
                          country: "thailand",
                          recipe_link: "www.recipe-link.com",
                          recipe_title: "Crab Fried Rice (Khaao Pad Bpu)"
                        })

      headers = { "CONTENT_TYPE" => "application/json" }

      post '/api/v1/favorites', headers: headers, params: JSON.generate(favorite: favorite_params)
      
      new_favorite = Favorite.last 

      expect(response).to be_successful
      expect(response.status).to eq(201)
      expect(response.body).to eq("{\"success\":\"Favorite added successfully\"}")
    end
  end
end
