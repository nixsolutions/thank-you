# frozen_string_literal: true

class InvitationLinksGenerator
  def self.call(count, url_helper)
    links = []
    count.times do
      invitation = Invitation.create
      links << url_helper.call(token: invitation.token)
    end
    links
  end
end
