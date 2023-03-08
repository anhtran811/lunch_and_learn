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
      
      response_body = JSON.parse(response.body, symbolize_names: true)

      new_favorite = Favorite.last 

      expect(response).to be_successful
      expect(response.status).to eq(201)
      expect(response_body[:success]).to eq("Favorite added successfully")
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
      
      response_body = JSON.parse(response.body, symbolize_names: true)

      expect(response).to_not be_successful
      expect(response.status).to eq(400)
      expect(response_body[:error]).to eq("Unable to save favorite recipe")
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

      response_body = JSON.parse(response.body, symbolize_names: true)
      
      expect(response).to_not be_successful
      expect(response.status).to eq(400)
      expect(response_body[:error][0][:title]).to eq("Validation failed: Country can't be blank")
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

      response_body = JSON.parse(response.body, symbolize_names: true)
      
      expect(response).to_not be_successful
      expect(response.status).to eq(400)
      expect(response_body[:error][0][:title]).to eq("Validation failed: Recipe link can't be blank") 
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

      response_body = JSON.parse(response.body, symbolize_names: true)
      
      expect(response).to_not be_successful
      expect(response.status).to eq(400)
      expect(response_body[:error][0][:title]).to eq("Validation failed: Recipe title can't be blank")     
    end
  end
end
