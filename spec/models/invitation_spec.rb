# frozen_string_literal: true

RSpec.describe Invitation, type: :model do
  it { is_expected.to validate_uniqueness_of(:token) }

  it 'sets token on creation' do
    expect(described_class.create.token).not_to be nil
  end
end
