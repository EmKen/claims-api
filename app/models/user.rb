class User < ApplicationRecord
  before_save :generate_private_token
  has_many :claims

  def self.authenticate!(email, password)
    user = User.find_by(email: email)
    return false if user.nil? || (user.password != password)
    return user
  end

  def generate_private_token
    self.private_token = SecureRandom.hex(10) if private_token.blank?
  end
end
