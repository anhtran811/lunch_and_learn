require 'rails_helper'

describe 'POST /users' do
  context 'when a user is successfully created' do
    it 'can create a user' do
      user_params = ({ 
                      name: "Athena Dao",
                      email: "athenadao@bestgirlever.com"
                    })

      headers = {"CONTENT_TYPE" => "application/json" }
      
      post '/api/v1/users', headers: headers, params: JSON.generate(user: user_params)

      new_user = User.last
  
      expect(response).to be_successful
      expect(response.status).to eq(201)
      expect(new_user.name).to eq("Athena Dao")
      expect(new_user.email).to eq("athenadao@bestgirlever.com")
      expect(new_user.api_key).to_not eq(nil)
    end
  end

  context 'when a user is not created' do
    it 'returns an error message when name is left blank' do
      user_params = ({ 
                      name: "",
                      email: "athenadao@bestgirlever.com"
                    })

      headers = {"CONTENT_TYPE" => "application/json" }
      
      post '/api/v1/users', headers: headers, params: JSON.generate(user: user_params)
      response_body = JSON.parse(response.body, symbolize_names: true)
      expect(response).to_not be_successful
      expect(response.status).to eq(400)
      expect(response_body[:errors]).to eq("User was not created")
    end

    it 'returns an error message when email is left blank' do
      user_params = ({ 
                      name: "Athena Dao",
                      email: ""
                    })

      headers = {"CONTENT_TYPE" => "application/json" }
      
      post '/api/v1/users', headers: headers, params: JSON.generate(user: user_params)
      response_body = JSON.parse(response.body, symbolize_names: true)
      expect(response).to_not be_successful
      expect(response.status).to eq(400)
      expect(response_body[:errors]).to eq("User was not created")
    end

    it 'returns an error message when email is not unique' do
      user = create(:user, email: "athenadao@bestgirlever.com") 

      user_params = ({ 
                      name: "Athena Dao",
                      email: "athenadao@bestgirlever.com"
                    })

      headers = {"CONTENT_TYPE" => "application/json" }
      
      post '/api/v1/users', headers: headers, params: JSON.generate(user: user_params)
      response_body = JSON.parse(response.body, symbolize_names: true)
      expect(response).to_not be_successful
      expect(response.status).to eq(400)
      expect(response_body[:errors]).to eq("Email is not unique")
    end
  end
end