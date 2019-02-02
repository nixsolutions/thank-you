# frozen_string_literal: true

describe InvitationLinksGenerator do
  describe '#call' do
    it 'returns an array' do
      links = described_class.call(3)
      expect(links.length).to eq 3
    end
    it 'returns an array of links' do
      links = described_class.call(3)
      Invitation.all.each do |invitation|
        expect(links).to include "#{sign_up_url}?token=#{invitation.token}"
      end
    end
  end
end
