# frozen_string_literal: true

class Invitation < ApplicationRecord
  EXPIRE_TIME_LIMIT = 15.minutes

  validates :token, uniqueness: true

  before_create :set_token

  def expires_at
    created_at + EXPIRE_TIME_LIMIT
  end

  class << self
    def verify_token?(token)
      invitation = Invitation.find_by(token: token)
      invitation.present? && invitation.verify_expiring?
    end
  end

  def verify_expiring?
    expired? ? destroy && false : true
  end

  def expired?
    expires_at <= Time.current
  end

  private

  def set_token
    self.token = loop do
      random_token = SecureRandom.urlsafe_base64(nil, false)
      break random_token unless Invitation.exists?(token: random_token)
    end
  end
end
