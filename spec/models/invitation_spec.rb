# frozen_string_literal: true

RSpec.describe Invitation, type: :model do
  it { is_expected.to validate_uniqueness_of(:token) }

  it 'sets token on creation' do
    expect(described_class.create.token).not_to be nil
  end

  describe '#expires_at' do
    it "returns time after #{described_class::EXPIRE_TIME_LIMIT} invitation has been created" do
      invitation = create(:invitation)
      expected_result = invitation.created_at + described_class::EXPIRE_TIME_LIMIT
      expect(invitation.expires_at).to eq expected_result
    end
  end

  describe '#expired?' do
    context 'when expired' do
      it 'returns true' do
        invitation = create(:expired_invitation)
        expect(invitation.expired?).to eq true
      end
    end

    context 'when not expired' do
      it 'returns false' do
        invitation = create(:invitation)
        expect(invitation.expired?).to eq false
      end
    end
  end

  describe '.verify_token?' do
    context 'when token exists and token has not been expired' do
      it 'returns true' do
        invitation = create(:invitation)
        expect(described_class.verify_token?(invitation.token)).to eq true
      end
    end

    context 'when token exists and token has been expired' do
      let!(:invitation) { create(:expired_invitation) }

      it 'destroys invitation with expired token' do
        expect { described_class.verify_token?(invitation.token) }.to change(described_class, :count).by(-1)
      end
      it 'returns false' do
        expect(described_class.verify_token?(invitation.token)).to eq false
      end
    end

    context 'when token does not exist' do
      it 'returns false' do
        expect(described_class.verify_token?('invalid_token')).to eq false
      end
    end
  end
end
