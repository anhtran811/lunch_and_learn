require 'rails_helper'

RSpec.describe User, type: :model do
  describe 'relationships' do
    it { should have_many(:favorites) }
  end

  describe 'validations' do
    it { should validate_presence_of(:name) }
    it { should validate_presence_of(:email) }
    it { should validate_uniqueness_of(:email) }
    # it { should validate_presence_of(:api_key) }
    # it { should validate_uniqueness_of(:api_key).ignoring_case_sensitivity}
  end

  describe 'instance methods' do
    it 'should generate an api key' do
      user = User.new(name: "Athena Dao", email: "athenadao@bestgirlever.com")

      user.save
 
      expect(user.api_key).to be_a(String)
      expect(user.api_key).to_not be_nil
    end
  end
end