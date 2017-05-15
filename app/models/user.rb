class User < ApplicationRecord
  before_save :generate_private_token
  has_many :claims

  def generate_private_token
    self.private_token = SecureRandom.hex(10) if private_token.blank?
  end
end
