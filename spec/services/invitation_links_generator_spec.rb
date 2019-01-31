# frozen_string_literal: true

describe InvitationLinksGenerator do
  include Rails.application.routes.url_helpers

  default_url_options[:host] = 'localhost'
  default_url_options[:port] = '3000'

  describe '#call' do
    it 'returns an array' do
      links = described_class.call(new_user_registration_url, 3)
      expect(links.length).to eq 3
    end
    it 'returns an array of links' do
      links = described_class.call(new_user_registration_url, 3)
      expect(links).to all(include "#{new_user_registration_url}?token=")
    end
  end
end
