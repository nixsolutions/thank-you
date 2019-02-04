# frozen_string_literal: true

describe ContactType, type: :model do
  it { is_expected.to have_many(:contacts).dependent(:destroy) }
  it { is_expected.to validate_presence_of :title }
  it { is_expected.to validate_presence_of :subtype }
  it { is_expected.to validate_inclusion_of(:title).in_array(CONTACT_TYPES) }
  it { is_expected.to validate_uniqueness_of(:title).scoped_to(:subtype) }

  context 'when title present' do
    let(:contact_type) { create(:phone) }

    it 'validate if valid' do
      expect(contact_type).to be_valid
    end

    it 'validate if invalid' do
      contact_type.subtype = 'not_included'
      expect(contact_type).not_to be_valid
    end
  end
end
