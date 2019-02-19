# frozen_string_literal: true

require_relative './services_helper'

describe InvitationLinksGenerator do
  describe '#call' do
    it 'returns an array' do
      links = described_class.call(3, user_registration_url)
      expect(links.length).to eq 3
    end

    it 'returns an array of links' do
      links = described_class.call(3, user_registration_url)
      Invitation.all.each do |invitation|
        link = "#{user_registration_url}/#{invitation.token}"
        expect(links).to include link
      end
    end
  end
end
