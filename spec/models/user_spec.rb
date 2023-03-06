require 'rails_helper'

RSpec.describe User, type: :model do
  it { should validate_presence_of(:name) }
  it { should validate_presence_of(:email) }
  it { should validate_uniqueness_of(:api_key) }

  describe 'instance methods' do
    it 'should generate an api key' do
      user = User.new(name: "Athena Dao", email: "athenadao@bestgirlever.com")

      user.save
 
      expect(user.api_key).to be_a(String)
      expect(user.api_key).to_not be_nil
    end
  end
end