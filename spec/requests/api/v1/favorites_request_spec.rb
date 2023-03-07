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

      post '/api/v1/favorites', headers: headers, params: JSON.generate(favorite_params)
      
      new_favorite = Favorite.last 

      expect(response).to be_successful
      expect(response.status).to eq(201)
      expect(response.body).to eq("{\"success\":\"Favorite added successfully\"}")
    end
  end

  context 'sad path testing' do
    it 'returns an error message if the user does not exist' do
      user = create(:user)

      favorite_params = ({
                          api_key: "12345",
                          country: "thailand",
                          recipe_link: "www.recipe-link.com",
                          recipe_title: "Crab Fried Rice (Khaao Pad Bpu)"
                        })

      headers = { "CONTENT_TYPE" => "application/json" }

      post '/api/v1/favorites', headers: headers, params: JSON.generate(favorite_params)
      
      expect(response).to_not be_successful
      expect(response.status).to eq(400)
      expect(response.body).to eq("{\"error\":\"Unable to save favorite recipe\"}")
    end

    it 'returns an error message if the country is left blank' do
      user = create(:user)

      favorite_params = ({
                          api_key: user.api_key,
                          country: "",
                          recipe_link: "www.recipe-link.com",
                          recipe_title: "Crab Fried Rice (Khaao Pad Bpu)"
                        })

      headers = { "CONTENT_TYPE" => "application/json" }

      post '/api/v1/favorites', headers: headers, params: JSON.generate(favorite_params)
      
      expect(response).to_not be_successful
      expect(response.status).to eq(400)
      expect(response.body).to eq("{\"error\":[{\"title\":\"Validation failed: Country can't be blank\",\"status\":\"400\"}]}")
    end

    it 'returns an error message if the recipe link is left blank' do
      user = create(:user)

      favorite_params = ({
                          api_key: user.api_key,
                          country: "thailand",
                          recipe_link: "",
                          recipe_title: "Crab Fried Rice (Khaao Pad Bpu)"
                        })

      headers = { "CONTENT_TYPE" => "application/json" }

      post '/api/v1/favorites', headers: headers, params: JSON.generate(favorite_params)
      
      expect(response).to_not be_successful
      expect(response.status).to eq(400)
      expect(response.body).to eq("{\"error\":[{\"title\":\"Validation failed: Recipe link can't be blank\",\"status\":\"400\"}]}")
    end
    
    it 'returns an error message if the recipe title is left blank' do
      user = create(:user)

      favorite_params = ({
                          api_key: user.api_key,
                          country: "thailand",
                          recipe_link: "www.recipe-link.com",
                          recipe_title: ""
                        })

      headers = { "CONTENT_TYPE" => "application/json" }

      post '/api/v1/favorites', headers: headers, params: JSON.generate(favorite_params)
      
      expect(response).to_not be_successful
      expect(response.status).to eq(400)
      expect(response.body).to eq("{\"error\":[{\"title\":\"Validation failed: Recipe title can't be blank\",\"status\":\"400\"}]}")
    end
  end
end
