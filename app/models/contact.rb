# frozen_string_literal: true

class Contact < ApplicationRecord
  belongs_to :organization
  belongs_to :contact_type

  validates :contact_type, :data, :organization, presence: true
  validates :data, contact_data: true
end
