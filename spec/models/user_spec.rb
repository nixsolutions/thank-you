# frozen_string_literal: true

describe User, type: :model do
  it { is_expected.to have_many(:organizations).dependent(:destroy) }
end
