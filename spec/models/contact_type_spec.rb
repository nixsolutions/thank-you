# frozen_string_literal: true

describe ContactType, type: :model do
  it { is_expected.to have_many(:contacts).dependent(:destroy) }
  it { is_expected.to validate_presence_of :main_type }
  it { is_expected.to validate_presence_of :subtype }
  it { is_expected.to validate_inclusion_of(:main_type).in_array(described_class::CONTACT_TYPES) }
  it { is_expected.to validate_uniqueness_of(:main_type).scoped_to(:subtype) }
end
