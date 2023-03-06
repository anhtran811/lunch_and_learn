class User < ApplicationRecord
  after_initialize :generate_api_key

  validates :name, presence: true
  validates :email, :api_key, presence: true, uniqueness: true

  def generate_api_key
    self.api_key = SecureRandom.hex
  end
end