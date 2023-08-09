class User < ApplicationRecord
  validates :name, presence: true
  validates :email, presence: true, uniqueness: true
  validates :password, presence: true
  has_secure_password

  before_create :generate_api_key

  has_many :favorites

  def generate_api_key
    self.api_key = SecureRandom.hex(16)
  end
end
