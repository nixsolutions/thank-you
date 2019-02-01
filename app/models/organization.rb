# frozen_string_literal: true

class Organization < ApplicationRecord
  belongs_to :user
  validates :name, :description, :user, presence: true
end
