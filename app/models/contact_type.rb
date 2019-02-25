# frozen_string_literal: true

class ContactType < ApplicationRecord
  CONTACT_TYPES = %w[phone email url messenger].freeze

  has_many :contacts, dependent: :destroy

  validates :main_type, :subtype, presence: true
  validates :main_type, inclusion: { in: CONTACT_TYPES }
  validates :main_type, uniqueness: { scope: :subtype }
end
