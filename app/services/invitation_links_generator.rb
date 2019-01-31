# frozen_string_literal: true

class InvitationLinksGenerator
  def initialize(endpoint, count)
    @endpoint = endpoint
    @count = count
    @links = []
  end

  def self.call(endpoint, count)
    new(endpoint, count).call
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
    "#{endpoint}?token=#{token}"
  end
end
