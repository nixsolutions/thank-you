# frozen_string_literal: true

FactoryBot.define do
  sequence :token do |n|
    "secret_token_#{n}"
  end

  factory :invitation do
  end

  factory :expired_invitation, class: 'Invitation' do
    created_at { Time.current - 20.minutes }
  end
end
