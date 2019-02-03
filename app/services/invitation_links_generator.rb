# frozen_string_literal: true

class InvitationLinksGenerator
  include Routeable

  def initialize(count)
    @count = count
  end

  def self.call(count)
    new(count).call
  end

  def call
    links = []
    @count.times do
      invitation = Invitation.create
      links << new_user_registration_url(token: invitation.token)
    end
    links
  end
end
