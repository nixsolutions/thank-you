# frozen_string_literal: true

FactoryBot.define do
  sequence :token do |n|
    "secret_token_#{n}"
  end

  factory :invitation do
    token
  end

  factory :expired_invitation, class: 'Invitation' do
    token
    created_at { Time.current - 20.minutes }
  end
end
