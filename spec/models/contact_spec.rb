# frozen_string_literal: true

describe Contact, type: :model do
  it { is_expected.to belong_to(:organization).required }
  it { is_expected.to belong_to(:contact_type).required }
  it { is_expected.to validate_presence_of(:organization) }
  it { is_expected.to validate_presence_of :contact_type }
  it { is_expected.to validate_presence_of :data }

  context 'when contact_type present' do
    let(:contact) { create(:contact) }

    it 'validate if valid' do
      expect(contact).to be_valid
    end

    it 'validate if invalid' do
      contact.data = ''
      expect(contact).not_to be_valid
    end
  end
end
