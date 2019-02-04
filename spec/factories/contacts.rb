# frozen_string_literal: true

FactoryBot.define do
  factory :contact do
    organization
    association :contact_type, factory: :phone
    data { '+380505555555' }
  end
end
