# frozen_string_literal: true

FactoryBot.define do
  factory :contact_type do
    factory :phone do
      main_type { 'phone' }
      subtype { 'cell' }
    end
  end
end
