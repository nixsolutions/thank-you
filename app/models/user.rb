# frozen_string_literal: true

class User < ApplicationRecord
  has_many :organizations, dependent: :destroy
end
