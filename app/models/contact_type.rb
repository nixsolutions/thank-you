# frozen_string_literal: true

class ContactType < ApplicationRecord
  # Contact Types
  CONTACT_TYPES = %w[phone email url messenger].freeze

  # Contact Subtypes
  CONTACT_SUBTYPES = {
    phone: %w[cell mobile fax],
    email: %w[main],
    url: %w[landing facebook],
    messenger: %w[skype viber telegram]
  }.freeze

  has_many :contacts, dependent: :destroy

  validates :title, :subtype, presence: true
  validates :title, inclusion: { in: CONTACT_TYPES }
  validates :subtype, inclusion: { in: ->(obj) { Array(CONTACT_SUBTYPES[obj.title.to_sym]) } }, if: :title
  validates :title, uniqueness: { scope: :subtype }
end
