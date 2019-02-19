# frozen_string_literal: true

module InvitationLinksGenerator
  def self.call(count, url)
    links = []
    count.times do
      invitation = Invitation.create
      links << "#{url}/#{invitation.token}"
    end
    links
  end
end
