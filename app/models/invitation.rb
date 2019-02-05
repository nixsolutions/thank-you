# frozen_string_literal: true

class Invitation < ApplicationRecord
  EXPIRE_TIME_LIMIT = 15.minutes

  validates :token, uniqueness: true

  before_create :set_token

  private

  def set_token
    self.token = loop do
      random_token = SecureRandom.urlsafe_base64(nil, false)
      break random_token unless Invitation.exists?(token: random_token)
    end
  end
end
