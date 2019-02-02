# frozen_string_literal: true

class InvitationLinksGenerator
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
      links << link_url(invitation.token)
    end
    links
  end

  private

  attr_accessor :links
  attr_reader :count, :endpoint

  def link_url(token)
    "#{ENV['LOCALHOST']}/users/sign_up?token=#{token}"
  end
end
