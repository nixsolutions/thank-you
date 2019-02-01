# frozen_string_literal: true

class ContactType < ApplicationRecord
  has_many :contacts, dependent: :destroy

  validates :title, :subtype, presence: true
  validates :title, inclusion: { in: CONTACT_TYPES }
  validates :subtype, inclusion: { in: ->(obj) { CONTACT_SUBTYPES[obj.title.to_sym] || [] } }, if: :title
  validates :title, uniqueness: { scope: :subtype }

  def regex
    "#{title.upcase}_#{subtype.upcase}_REGEX".constantize
  rescue NameError
    "#{title.upcase}_REGEX".constantize
  end
end
