# frozen_string_literal: true

# Models constants
## Contact types and subtypes
CONTACT_TYPES = %w[phone email url messenger].freeze
CONTACT_SUBTYPES = {
  phone: %w[home work fax mobile etc],
  email: %w[home work etc],
  url: %w[landing facebook etc],
  messenger: %w[skype viber telegram etc]
}.freeze

## Contacts validation regexps
### Validation by Contact Type
PHONE_REGEX = /\A(\+?\d)?[\d]+\z/i.freeze
EMAIL_REGEX = /\A[a-z][a-z\d\_\-\.]+@[a-z\d\-]+(\.[a-z\d\-]+)*\.[a-z]+\z/i.freeze
URL_REGEX = /\Ahttps?:\z/i.freeze
MESSENGER_REGEX = /\A[a-z][a-z\-_]{5,15}\z/i.freeze

### Validation by Contact Subtype
MESSENGER_SKYPE_REGEX = /\A[a-z][a-z\d\-_]{5,31}\z/i.freeze
