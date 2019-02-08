# frozen_string_literal: true

require_relative './services_helper'

describe InvitationLinksGenerator do
  describe '#call' do
    it 'returns an array' do
      links = described_class.call(3, user_registration_url_method)
      expect(links.length).to eq 3
    end

    it 'returns an array of links' do
      links = described_class.call(3, user_registration_url_method)
      Invitation.all.each do |invitation|
        link = user_registration_url_method.call(token: invitation.token)
        expect(links).to include link
      end
    end
  end
end
