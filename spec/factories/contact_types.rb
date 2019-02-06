# frozen_string_literal: true

FactoryBot.define do
  factory :contact_type do
    factory :phone do
      title { 'phone' }
      subtype { 'cell' }
    end
  end
end
