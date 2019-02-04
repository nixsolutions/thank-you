# frozen_string_literal: true

class Contact < ApplicationRecord
  belongs_to :organization
  belongs_to :contact_type

  validates :contact_type, :data, :organization, presence: true
  validate :format_of_data

  private

  def format_of_data
    return unless data && contact_type

    error_message = I18n.t('activerecord.errors.models.contact.attributes.data.informat')
    errors.add(:data, error_message) unless data =~ contact_type.regex
  end
end
