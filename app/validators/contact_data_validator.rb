# frozen_string_literal: true

class ContactDataValidator < ActiveModel::EachValidator
  PHONE_REGEX = /\A(\+?\d)?[\d]+\z/i.freeze
  EMAIL_REGEX = /\A[a-z][a-z\d\_\-\.]+@[a-z\d\-]+(\.[a-z\d\-]+)*\.[a-z]+\z/i.freeze
  URL_REGEX = /\Ahttps?:\z/i.freeze
  MESSENGER_REGEX = /\A[a-z][a-z\-_]{5,15}\z/i.freeze

  MESSENGER_SKYPE_SUBREGEX = /\A[a-z][a-z0-9_\-,.]{5,31}\z/i.freeze

  def validate_each(record, _attribute, value)
    return unless value && record.contact_type

    error_message = options[:message] || I18n.t('activerecord.errors.models.contact.attributes.data.informat')
    record.errors.add(:data, error_message) unless value =~ regex(record.contact_type)
  end

  private

  def regex(contact_type)
    regex_name = "#{contact_type.main_type.upcase}_#{contact_type.subtype.upcase}_SUBREGEX"
    ContactDataValidator.const_get(regex_name)
  rescue NameError
    regex_name = "#{contact_type.main_type.upcase}_REGEX"
    ContactDataValidator.const_get(regex_name)
  end
end
