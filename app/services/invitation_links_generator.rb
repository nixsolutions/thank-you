# frozen_string_literal: true

class InvitationLinksGenerator
  include Routeable

  def initialize(count)
    @count = count
    @links = []
  end

  def self.call(count)
    new(count).call
  end

  def call
    count.times do
      invitation = Invitation.create
      links << new_user_registration_url(token: invitation.token)
    end
    links
  end

  private

  attr_accessor :links
  attr_reader :count
end
