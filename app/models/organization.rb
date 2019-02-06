# frozen_string_literal: true

class Organization < ApplicationRecord
  belongs_to :user
  has_many :contacts, dependent: :destroy

  validates :name, :description, :user, presence: true
end
