# frozen_string_literal: true

require 'rails_helper'

RSpec.configure do |config|
  config.include Services
  config.include Services::Routeable
end
