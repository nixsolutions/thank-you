# frozen_string_literal: true

describe Contact, type: :model do
  it { is_expected.to belong_to(:organization).required }
  it { is_expected.to belong_to(:contact_type).required }
  it { is_expected.to validate_presence_of(:organization) }
  it { is_expected.to validate_presence_of :contact_type }
  it { is_expected.to validate_presence_of :data }

  describe 'validates that :data' do
    let(:valid_contact) { build(:contact) }
    let(:invalid_contact) { build(:contact, data: 'invalid') }

    it 'is valid with expected format' do
      expect(valid_contact).to be_valid
    end

    it 'is invalid with unexpected format' do
      expect(invalid_contact).not_to be_valid
    end
  end
end
