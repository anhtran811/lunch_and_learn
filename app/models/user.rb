class User < ApplicationRecord
  has_many :favorites

  validates :name, presence: true
  validates :email, presence: true, uniqueness: true
  # validates :api_key, presence: true, uniqueness: true
  # validates :api_key, presence: true
  
  before_validation :generate_api_key, on: :create

  private

  def generate_api_key
    self.api_key = SecureRandom.hex 
  end
end